Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495B9C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 14:08:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21886.1782828486589460513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MR+9HYLH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A79B72ED2
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:08:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A680F3F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782828486; bh=WbMnK8kU762USM7DvNVbYnC/VAzcKzA3LOBX8G29FCc=;
	h=From:To:Subject:Date:From;
	b=MR+9HYLHpUVsBff5LwYo8aEmoBEQ+1SmQvMPNbnIbE47iWg+GQCg9KLTv1s1sv4NL
	 7HDxY9zXb3iQOUCZkWFvKU1OvgYKmoafVBdh4tCoP5nVZyWemnlhLN/2C6pxl5JInW
	 LG1aSv2wKMfL6T79LXIk7Oueem7WEGZxm6YD5UTo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] classes/insane: increase shebang size limit
Date: Tue, 30 Jun 2026 15:07:58 +0100
Message-ID: <20260630140800.4018491-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239899

Since Linux 5.1 the shebang buffer has been 256 bytes[1], so update the
check to match.

Also rewrite the test, create a variable for the magic number (that has
the same name as the kernel #define), don't pointlessly try to decode
the bytes as UTF-8, and consolidate the test logic to entirely inside
the try block.

[1] linux 6eb3c3d0a52dc ("exec: increase BINPRM_BUF_SIZE to 256")
---
 meta/classes-global/insane.bbclass | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 4250331af12..08bff7dca45 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -83,25 +83,22 @@ QAPATHTEST[shebang-size] =3D "package_qa_check_sheban=
g_size"
 def package_qa_check_shebang_size(path, name, d, elf):
     global cpath
=20
+    # From kernel 5.1 onwards (specifically linux 6eb3c3d0a52dc ("exec: =
increase
+    # BINPRM_BUF_SIZE to 256")) the shebang buffer is was increased from=
 128 bytes
+    # to 256 bytes.
+    BINPRM_BUF_SIZE =3D 256
+
     if elf or cpath.islink(path) or not cpath.isfile(path):
         return
=20
     try:
         with open(path, 'rb') as f:
-            stanza =3D f.readline(130)
+            stanza =3D f.readline(BINPRM_BUF_SIZE)
+            if stanza.startswith(b'#!') and len(stanza) > BINPRM_BUF_SIZ=
E:
+                oe.qa.handle_error("shebang-size", "%s: %s maximum sheba=
ng size exceeded, the maximum size is %d" % (name, package_qa_clean_path(=
path, d, name), BINPRM_BUF_SIZE), d)
+                return
     except IOError:
-        return
-
-    if stanza.startswith(b'#!'):
-        try:
-            stanza.decode("utf-8")
-        except UnicodeDecodeError:
-            #If it is not a text file, it is not a script
-            return
-
-        if len(stanza) > 129:
-            oe.qa.handle_error("shebang-size", "%s: %s maximum shebang s=
ize exceeded, the maximum size is 128." % (name, package_qa_clean_path(pa=
th, d, name)), d)
-            return
+        pass
=20
 QAPATHTEST[libexec] =3D "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf):
--=20
2.43.0


