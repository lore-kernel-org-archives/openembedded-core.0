Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9DBCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:03:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5554.1761743002544591953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359A41AC1
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 06:03:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A99493F673
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 06:03:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/base: prefer gnu-prefixed HOSTTOOLS
Date: Wed, 29 Oct 2025 13:03:10 +0000
Message-ID: <20251029130310.2882818-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225455

Ubuntu 25.10 has changed the default coreutils implementation from GNU
coreutils to uutils/coreutils. Unfortunately this causes build problems:

  couldn't allocate absolute path for 'null'.
  tail: cannot open 'standard input' for reading: No such file or directo=
ry
  install: failed to chown '...': Invalid argument (os error 22)

Clear build failures happen in 'install' and 'tail', but there may be
further breakage.

Luckily, Ubuntu also installs GNU coreutils with a binary prefix of
'gnu', so whilst these issues are root-caused and fixed in either pseudo
or uutils we can prefer the gnu-prefixed binaries where they are present.

[ YOCTO #16028 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/base.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index 6de17d1bb5d..cf303c237a5 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -127,7 +127,11 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DT=
rue):
             # clean up dead symlink
             if os.path.islink(desttool):
                 os.unlink(desttool)
-            srctool =3D bb.utils.which(path, tool, executable=3DTrue)
+
+            # Prefer gnu-prefixed binaries, if available
+            srctool =3D (bb.utils.which(path, "gnu" + tool, executable=3D=
True) or
+                       bb.utils.which(path, tool, executable=3DTrue))
+
             # gcc/g++ may link to ccache on some hosts, e.g.,
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(g=
cc)
             # would return /usr/local/bin/ccache/gcc, but what we need i=
s
--=20
2.43.0


