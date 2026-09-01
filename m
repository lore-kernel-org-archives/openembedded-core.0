Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6FEC624D6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 16:43:20 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.882.1788280991254037229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 09:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=QNdv4XK0;
 dkim=pass header.i=@valla.it header.s=default header.b=DpM2INeq;
 spf=pass (domain: valla.it, ip: 185.56.87.3, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-pm7p.prod.antispam.mailspamprotection.com; s=arckey; t=1788280991;
	 b=F733g5V1jaApN3WpTWJIHIYnNJv+dpRK7hCHKw2GERq9YZZ0bda/9ivtlj+FnZ0o+jkP2OuTEK
	  IsajM4FZHgSQILHFIvo3Lm1TLCMpG+D/lLPrHwjXYioVILj1HtkmoNVoJK/XItauDCHoQ/c2Rt
	  lNr0cFAE7z1HPatYCjabumcEW1BUHYH2CNF7iIDdNkRJSSL6cGoYcAM4GWZSUgtjCRvoQOlbRg
	  +No7Qtjw/m7HEuvVx/TetVQlgZKCOLdoJumNZFIOGmS4HwrERAst0hafaE0L5BNeO13i6Kj5da
	  VoJIA2F4JQ8FIwrGf43sGcoRk0gvogzE/OP8wg8ORBJG1Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-pm7p.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-pm7p.prod.antispam.mailspamprotection.com; s=arckey; t=1788280991;
	bh=dKCbUT4r/ag+AcdT+YsRbjQx8lf5dPKe551XPrYq7lw=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=nbaYYBCM2ceg1ty6bPm7nTkfeD3s6tKxpGYZQp+u8rPvDxkS41wdbmjzbBdG27mW2U6E5o5/2l
	  lP5rlU2+8uJn3X8alnKEg6CKuRNAJHQQxs/c1lNulfQXKmHtytneq2V1ov8KAIp4/vVUq3Qslj
	  12HjsEmbMuEQRqHWIaRWrvqgGFkztvMyHKJ22lZgt9oibiSFArzjzxh36PNmLcse1CQqJp1BWc
	  YnqMe61zSXIfzG4QDui2O+6oTsjjG8YgCaQwPHWoE5H+/kqMglekpP2fGAlXmssVBdXI+IACEi
	  G1cK91soluNDmu9KfIsI7SbVkf07FdSKt/5qbBdVj+yYsQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=hH7s2h5fG2uE9WQLJd2jv/mAh7q6PAemC1AcmVOMh3s=; b=QNdv4XK0dSdCM7hvqWCvvAJw+2
	R0ol5uMqARxkib53URGGHThkp9vveZUBkYR4ntNmiyo0vrcnDGaavoOIrmMuzpnz/vOfDauFT8n8F
	Zyusrd0H3TkS4Q8zSaeIP76tiXjkCObop2tJy3suUIFt6MkIDVcGzQU+KTbDaHyJWJPw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-pm7p.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x1RZj-00000004MZp-1lFF
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Sep 2026 16:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=hH7s2h5fG2uE9WQLJd2jv/mAh7q6PAemC1AcmVOMh3s=; b=DpM2INeqIc3E/3OBe9kk9RnuJx
	2Roi+nRjRFyq8A7HRjEHTlkwWl77VYSN3h4Fi3caFUNECPMy0aAfS4I71B7apN6zrYUWs6PkjzycZ
	N6lJorPGsIjgUbXuhZZuJkjXXPiuDrLL4NeR1UFjrwyUHvc9o1vLLlXWjZpfOBmd5Lu8=;
Received: from [87.5.139.196] (port=64545 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x1RZf-00000000NKz-0U5O;
	Tue, 01 Sep 2026 16:43:03 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 01 Sep 2026 18:42:42 +0200
Subject: [PATCH 1/2] classes-recipe: uboot: update comments on
 kernel-fitimage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-kernel-fitimage-cleanup-v1-1-0bbcacf4099c@valla.it>
References: <20260901-kernel-fitimage-cleanup-v1-0-0bbcacf4099c@valla.it>
In-Reply-To: <20260901-kernel-fitimage-cleanup-v1-0-0bbcacf4099c@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921; i=francesco@valla.it;
 h=from:subject:message-id; bh=dKCbUT4r/ag+AcdT+YsRbjQx8lf5dPKe551XPrYq7lw=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnTGaZdEUkJLEkK5BKq27LfKLRIcr/IKYHfZkXrWKelB
 B+uXxvRUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAEzk6mJGhi2+z7ZvPL/zaY+o
 n6DMz+S33edlzutu7b14f9tUwW9ngpsZGU7ax2Qo38uI51ZMXKEiGP+XsfGvpcg531On96TO+S1
 zgh8A
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 9d8e75ca833105a6e1f9ff08878d0f0d
X-AntiAbuse: ID - 9d8e75ca833105a6e1f9ff08878d0f0d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x1RZj-00000004MZp-1lFF-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-pm7p.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 16:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244834

The FIT image geneation method has been reworked and is now based on
the kernel-fit-extra-artifacts.bbclass, with the fitImage image type
not being suppoorted anymore. Moreover, the kernel-fitimage.bbclass
has been renamed to kernel-fit-image.bbclass.

Update the comments in uboot classes to reflect these changes.

No functional changes.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/classes-recipe/uboot-config.bbclass | 2 +-
 meta/classes-recipe/uboot-sign.bbclass   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index 412b2c7c57e7..5459430dee57 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -247,7 +247,7 @@ python () {
             bb.debug(1, "Appending '%s' to UBOOT_CONFIG_FRAGMENTS." % fragments)
             d.appendVar('UBOOT_CONFIG_FRAGMENTS', fragments + " ? ")
 
-        # This recipe might be inherited e.g. by the kernel recipe via kernel-fitimage.bbclass
+        # This recipe might be inherited e.g. by the kernel recipe via kernel-fit-image.bbclass
         # Ensure the uboot specific menuconfig settings do not leak into other recipes
         if 'u-boot' in recipename:
             if len(ubootconfig) == 1:
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 4da5d4c9f188..236d19925ef1 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -17,8 +17,7 @@
 #
 # As verified boot depends on fitImage generation, following is also required:
 #
-#   KERNEL_CLASSES ?= " kernel-fitimage "
-#   KERNEL_IMAGETYPE ?= "fitImage"
+#   KERNEL_CLASSES += "kernel-fit-extra-artifacts"
 #
 # The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
 #

-- 
2.55.0


