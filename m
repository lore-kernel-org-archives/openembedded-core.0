Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE15EA854D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 11:57:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12489.1773057416784278034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 04:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GTusybil;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4B8971A2DA3
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 11:56:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218CD5FFB8;
	Mon,  9 Mar 2026 11:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA23D10369B9E;
	Mon,  9 Mar 2026 12:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773057414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SQlxseyaGbHFdvs8o9DVV5NAZ3NUuwDy4xtxwQ+FTjA=;
	b=GTusybil8r94FGVX4+f5w6bMI3hXDZH6S7PS3rTgkDgMA8h/C4hXBpeIn2TDTMG1Et2X0S
	SfK8Sf5L5OUSET7d2tstVx84lTgKxWxxaAN4CCtjprXDRT50YiKwZkfi7wFuRt8pnXUlx8
	2knOF7v9eztpp8q+buJQZRPA2uu0YJj5dEiPzCulvsY9sNpMmBWL8ucUAuD0OieYS0IzZo
	ZtmGvLPEvnCc35xTQSIGuxoEMi+akQGBPlPD/1JbhEFwfxtGh2PLuYgUa27xWpOmEVPxak
	567PtnEhao7ju3n/6cf1p9jRvwYDWWujjIYGUKzyfLNDdpwrSlMIfZ9K1AtHuw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 09 Mar 2026 12:56:43 +0100
Subject: [PATCH RFC 2/2] sbom-cve-check: VEX class is no longer mandatory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-add-sbom-cve-check-p2-v1-2-72a0771e1f12@bootlin.com>
References: <20260309-add-sbom-cve-check-p2-v1-0-72a0771e1f12@bootlin.com>
In-Reply-To: <20260309-add-sbom-cve-check-p2-v1-0-72a0771e1f12@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232698

Execute `sbom-cve-check` with the generated VEX manifest only if
enabled and if `SPDX_INCLUDE_VEX` is set to a value other than "all".
When `SPDX_INCLUDE_VEX=all`, the SPDX 3.0 file already contains all
the necessary information for CVE analysis, making the VEX manifest
redundant.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 2ab29001008a..3709fa98d97e 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -41,8 +41,6 @@ python do_sbom_cve_check() {
     import bb
     from oe.cve_check import update_symlinks
 
-    if not bb.data.inherits_class("vex", d):
-        bb.fatal("Cannot execute sbom-cve-check missing vex inherit.")
     if not bb.data.inherits_class("create-spdx-3.0", d):
         bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 inherit.")
 
@@ -68,10 +66,14 @@ python do_sbom_cve_check() {
         d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
         "--sbom-path",
         sbom_path,
-        "--yocto-vex-manifest",
-        vex_manifest_path,
     ]
 
+    # Assume that SPDX_INCLUDE_VEX is set globally to "all", and not only for the
+    # image recipe, which is very unlikely. This is not an issue to include the
+    # VEX manifest even if not needed.
+    if bb.data.inherits_class("vex", d) and d.getVar("SPDX_INCLUDE_VEX") != "all":
+        cmd_args.extend(["--yocto-vex-manifest", vex_manifest_path])
+
     for export_file in export_files:
         cmd_args.extend(
             ["--export-type", export_file[0], "--export-path", export_file[1]]

-- 
2.53.0


