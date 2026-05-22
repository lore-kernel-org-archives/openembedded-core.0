Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475DCCD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 10:47:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14425.1779446828113823439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 03:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=I60kP83M;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E1B4F4E42D24
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:47:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5BD36003C;
	Fri, 22 May 2026 10:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD141081099D;
	Fri, 22 May 2026 12:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779446825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aKWHykbRIw1KcmsDiO7PCdkFNqIY9pTF7Ms/OCx8dVU=;
	b=I60kP83MKHwG0nt11pVUKG3AWHv1r5DskniVeRq/c2czbGsYbE98qGFKCXD5o85bxYFep9
	ZG1/eslzLkkGQDvk3vzS+8Cfbs3qPl0dgRDm9jK+tc+2D6y+3nXYxWXcnZaQ7HrTODr7c3
	I7JlDeXc7619d7Q3cj17A4PCKMCFjOJ8BGstZWtsh+7kCEy3IzZHDDRFpy8ZBIPh5HQR0X
	WCIierZyDWVD4qfI22PCeLKwUPjR6nmUVKzSffI2RkHn93108sAouCoaV5EHujzVJW22/F
	hdRKthRQNpB4uGg6pq/wNXwSPoZ2b+6vFq/enAp5CPyDWu3TnRfCEpNHkjgBLg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [scarthgap][PATCH 1/1] meta/lib/oe/package.py: fix path to kernel sources in save_debugsources_info
Date: Fri, 22 May 2026 12:46:44 +0200
Message-ID: <20260522104644.788606-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260522104644.788606-1-joaomarcos.costa@bootlin.com>
References: <20260522104644.788606-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237540

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

This is no more than a backport of the current (i.e., from 'master')
version of this same chunk in save_debugsources_info(), where BP is used
instead of PF to form the path to the kernel sources.

This replacement in package.py is followed by a similar change in
meta/classes/create-spdx-2.2.bbclass, so that 'BP' is also used in
spdx_get_src() and we don't face any regressions in SPDX v2.2. As a
matter of fact, SPDX3 also uses 'BP' in get_patched_src() (from
spdx_common.py).

Overall, this backport ensures a coherence between Scarthgap and master,
namely regarding the how the kernel sources are provided by package.py
and consumed by SPDX v2.2 and 3.0.

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootl=
in.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 meta/lib/oe/package.py               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index 037193bb4b..61bad66ae0 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -933,7 +933,7 @@ def spdx_get_src(d):
             share_src =3D d.getVar('WORKDIR')
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
-            src_dir =3D spdx_workdir + "/" + d.getVar('PN')+ "-" + d.get=
Var('PV') + "-" + d.getVar('PR')
+            src_dir =3D spdx_workdir + "/" + d.getVar('BP')
             bb.utils.mkdirhier(src_dir)
             if bb.data.inherits_class('kernel',d):
                 share_src =3D d.getVar('STAGING_KERNEL_DIR')
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ba0d326781..fc5185ced4 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1055,13 +1055,13 @@ def save_debugsources_info(debugsrcdir, sources_r=
aw, d):
         # we format the sources as expected by spdx by replacing /usr/sr=
c/kernel/
         # into BP/
         kernel_src =3D d.getVar('KERNEL_SRC_PATH')
-        pf =3D d.getVar('PF')
+        bp =3D d.getVar('BP')
         sources_dict =3D {}
         for file, src_files in sources_raw:
             file_clean =3D file.replace(f"{workdir}/package/","")
             sources_clean =3D [
                 src.replace(f"{debugsrcdir}/{pn}/", "")
-                if not kernel_src else src.replace(f"{kernel_src}/", f"{=
pf}/")
+                if not kernel_src else src.replace(f"{kernel_src}/", f"{=
bp}/")
                 for src in src_files
                 if not any(keyword in src for keyword in ("<internal>", =
"<built-in>")) and not src.endswith("/")
             ]
--=20
2.47.0


