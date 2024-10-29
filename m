Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477B4D3A66E
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 16:15:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.589.1730218554909451269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 09:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD29E497
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:16:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 851CE3F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:15:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/package: cleanup objdump invocation when scanning for library dependencies
Date: Tue, 29 Oct 2024 16:15:48 +0000
Message-Id: <20241029161548.2662190-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 16:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206506

Instead of using os.popen() directly, and passing a string then having
to quote the arguments, use subprocess.run() and pass a list of arguments=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 16359232ecd..f935b684de0 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1625,11 +1625,11 @@ def process_shlibs(pkgfiles, d):
         sonames =3D set()
         renames =3D []
         ldir =3D os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
-        cmd =3D d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + " 2>/=
dev/null"
-        fd =3D os.popen(cmd)
-        lines =3D fd.readlines()
-        fd.close()
         rpath =3D tuple()
+        cmd =3D [d.getVar("OBJDUMP"), "-p", file]
+        proc =3D subprocess.run(cmd, capture_output=3DTrue, text=3DTrue)
+        # Ignore errors silently as not all matching files will be parse=
d successfully
+        lines =3D proc.stdout.splitlines()
         for l in lines:
             m =3D re.match(r"\s+RPATH\s+([^\s]*)", l)
             if m:
--=20
2.34.1


