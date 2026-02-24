Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3148AF3C9A5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:54:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23420.1771948445564958781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wzLVQU6f;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15CE81A12F1;
	Tue, 24 Feb 2026 15:54:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEFB35FD9D;
	Tue, 24 Feb 2026 15:54:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 827FA103691C9;
	Tue, 24 Feb 2026 16:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771948443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KyJHjzthKZ9iOEsd+fQ82VhFfc4TgSgnvXc+D6A/qBA=;
	b=wzLVQU6fZIeZ+jXfX3MkxSrOs/JKP53rTHozcKisjg4l3g6PnsMUbppiL18JvCX5TqCKfV
	iK7QQlVb/lOUOWdbetgMj44KLu4uyT5PEoxGgdYFPkWf3CxbFBETTDhhWvz1HXFSWD2Nyg
	nxva32c9gkqQsmNXJDVHBNtw+Ptg2IiZjwptZAP111TsL04WbXS/+BRWyxbfsg3sy0Th/Q
	X39ZYTCB5S0lOw39dlOrHEAACgoMEWRDLYP96yhoTEtZVoAjrtgcdEL8CEgRbqMd/Cx+3S
	N8VJ+Wd51q+3khk5t6bGR2JCvOb2wCz348TtUpciLQ9dE/SKLzQTjWpT1qoEkA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 24 Feb 2026 16:53:46 +0100
Subject: [PATCH 4/5] sbom-cve-check: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-add-sbom-cve-check-v1-4-1c76fbd7f01b@bootlin.com>
References: <20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com>
In-Reply-To: <20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231872

Provide sbom-cve-check (native) executable.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../python/python3-sbom-cve-check_1.1.0.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb b/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
new file mode 100644
index 000000000000..3d1c581e9f86
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sbom-cve-check_1.1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Lightweight SBOM CVE analysis tool"
+HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
+SECTION = "devel/python"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
+
+PYPI_PACKAGE = "sbom_cve_check"
+SRC_URI[sha256sum] = "953256ac99851ba59bc8649b8023303007ff2981edbc4ee395011bd91c118095"
+
+inherit pypi python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-spdx-python-model \
+    python3-pyyaml \
+"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


