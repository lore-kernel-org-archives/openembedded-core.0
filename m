Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF347CE8E99
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 17:25:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2184.1729790714166250773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 10:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4965C339
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:25:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45D843F71E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:25:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/package: scan B first when populating -src package
Date: Thu, 24 Oct 2024 18:25:06 +0100
Message-Id: <20241024172506.473232-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 17:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206301

There's an interesting reproducibility problem triggered when a recipe
has a file in $S that is manipulated and then written into $B.  As a
concrete example, zlib has zconf.h in the source tree which is then
processed by configure to create zconf.h in the build tree.

When we populate the zlib-src package we have to work from the mapped
source paths in the binaries (of the form /usr/src/BP) and try to
identify where the file came from. To do this we iterate through the
mapping paths looking for files, and using cpio in a loop we end up with
the newest file with the name we're after in the -src package, which
tends to be the right thing to do.

However, when building zlib from scratch we create the -src package by
hard linking files from the source and build trees. Then as the final
act of do_package the sstate archive is created, and this clamps the
file timestamps to SOURCE_DATE_EPOCH (see fixtimestamp in sstate.bbclass)=
.

The fundamental problem is that we clamp the mtimes in sstate_package in
a way that changes the source files. There are several paths through the
code:

1. Full build from clean
In this case B/zconf.h is freshly generated and has a current timestamp,
and the final zlib-src package in sstate has the correct file.

2. Repackage from existing tree
If we need to repackage but there is an existing build tree then we've
previously clamped the timestamp of zconf.h. When iterating the map paths
for files we first copy from $S and then $B, but as the file in $M has
an identical timestamp it isn't used. This results in the wrong file in
the final zlib-src package in sstate.

3. Repackage from sstate
Depending on whether the sstate has the correct or incorrect file, the
output will have the same contents.

The long-term fix to this is to not clamp the actual files but instead
to clamp then when writing the tarballs, but this isn't trivial as you
need to handle the sstate and non-sstate paths separately.  What I think
is an acceptable workaround is to reorder the prefix map list and move
${B} to the front, on the assumption that generated files should be
preferred over non-generated. This results in ${B}/zconf.h having priorit=
y
over ${S}/zconf.h when they both have identical timestamps.

[ YOCTO #15491 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c213a9a3ca6..8ec00b96b69 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1010,7 +1010,15 @@ def copydebugsources(debugsrcdir, sources, d):
         bb.utils.mkdirhier(basepath)
         cpath.updatecache(basepath)
=20
-        for pmap in prefixmap:
+        # Re-order the prefix list so that we sweep ${B} first, as the s=
state creation will
+        # clamp mtimes of hardlinks in the -src package, and that will c=
hange the source.
+        # (see #15491)
+        b =3D d.getVar("B")
+        prefixmap_keys =3D list(prefixmap)
+        prefixmap_keys.remove(b)
+        prefixmap_keys.insert(0, b)
+
+        for pmap in prefixmap_keys:
             # Ignore files from the recipe sysroots (target and native)
             cmd =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<int=
ernal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
             # We need to ignore files that are not actually ours
--=20
2.34.1


