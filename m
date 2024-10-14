Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09F8D1813C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 18:38:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2380.1728931101455270048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 11:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EB31007
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:38:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C4CE3F71E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:38:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: avoid race condition when DEBIAN/CONTROL entries are removed
Date: Mon, 14 Oct 2024 19:38:15 +0100
Message-Id: <20241014183815.537177-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 18:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205792

There is a race condition when iterating directories which are being
altered whilst iterating, which is something that can and does happen
when do_package_qa runs at the same time as eg do_package_write_ipkg
(the opkg metadata is written inside the build tree). The race is that
naive code will list a directory contents and then stat() each name to
determine if its a directory or file.  The classic failure that we see
is that CONTROL/ is found on a listdir but deleted by the time the stat
happens, so is incorrectly listed as a file (because it is not a
directory).

Since Python 3.5, os.walk() uses scandir() instead of listdir() which
mitigates this race by returning the file type alongside the name, so
a stat is no longer needed to identify the type.

However, cachedpath.walk() was copied from Python before this, so it
uses listdir() and has this race condition. Since I changed insane to
use cachedpath.walk()[1] I inadvertently reintroduced this race.

I believe there's actually no need to use cachedpath.walk() and a
logical fix is to simply use os.walk():

With os.walk() each directory is listed and categorised in a single
os.scandir() as the underlying syscall, getdents64, returns the type.

However, cachedpath.walk() uses os.listdir() which ignores the type
field returned and has to do a stat() on every file to determine the
type.

Thus, we should switch users of cachedpath.walk() to os.walk(): there's
no real gain in what is effectively just a prefetch for the stat cache,
but depending on what the calling code does may result in more stat()
calls than needed.

In the future we may want to redesign cachedpath to reimplement walk so
that it can also cache the DirEntry instances as returned by scandir()
as that will avoid needing to call stat() at all in many cases. However
I believe we should instead use a caching pathlib.Path instance instead.

[1] cad3c8 insane: use oe.cachedpath.CachedPath instead of os.path

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 36b139a20d0..4344a52560d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1133,7 +1133,7 @@ python do_package_qa () {
     for pkg in packages:
         pkgdir =3D os.path.join(pkgdest, pkg)
         pkgfiles[pkg] =3D []
-        for walkroot, dirs, files in cpath.walk(pkgdir):
+        for walkroot, dirs, files in os.walk(pkgdir):
             # Don't walk into top-level CONTROL or DEBIAN directories as=
 these
             # are temporary directories created by do_package.
             if walkroot =3D=3D pkgdir:
--=20
2.34.1


