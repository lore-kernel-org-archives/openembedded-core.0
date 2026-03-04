Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE18EFCE51
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 23:04:36 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31619.1772665468337849507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 15:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=tG4jOtMN;
 dkim=pass header.i=@valla.it header.s=default header.b=b4VOZCJH;
 spf=pass (domain: valla.it, ip: 185.56.87.13, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-crb1.prod.antispam.mailspamprotection.com; s=arckey; t=1772665468;
	 b=M65JWl1rIjeF1ZZg1F0VcPvQjY9rnhkG0CQ35myhlXhKXg6xna/G3Hc5oQUns0iO+1qkXPiG9F
	  R52NuiEh+ZUPkpAP2XWjADGL4k3Pc6jTv5AOoyC/kZOejxAIke/2xMaXVtCXEaKxAVP2Q307FN
	  s4clIbf8H8724yCEgMs86kou8O0fCDD1y+4vNwDLvLpRc5RQEbdVr57C3OuaVTRrpVGAfC0O9Q
	  vsUvK301+rEKQEiMB2wCbcNAWUytQMNhr48aYpK7se7ye+m6wr1CpUDqX0Hwgjdhe20PUTojJ5
	  VKa2zbz47EZ4C9G3FVgNzlEgXwxLa+K8FrmLvZ4DM9sjbw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-crb1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-crb1.prod.antispam.mailspamprotection.com; s=arckey; t=1772665468;
	bh=3PNpyxAbQo3A5ARKi9QSnrGXPlcRcqkcmGsEdGqtxYY=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=TPCeUu8qdUzc1WRuVoGvfZLLuS6DJlA1coS3lkCN/U+L1O13qbPhh5YzexQ5F2IH6x7+86Lq7t
	  +vrYeegxQpoqJknunfJOUswJTXVLncwmcBcuZScM81+5AAMOMINxFBRIfImHivzhSRpNin+WXP
	  3A4vOHPd1gHu9z9gRGZPiEw7bajT0UZENDDBnnKV0eodGsZuTALYSUvF4lkeR9SZanOex+d2Rw
	  dCKE3UWT0a4RrIQoKQSxRXtBj1MQe8VHwWOEpKsFR2bqgcccP95qWavWSOhWhEbtGxQfxjTHNp
	  nV/UbaafojdoqGk6xvIBU849j8/fOqIjz9s2GaL6Q2XbHw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=6OY5pjzpmhkfEyJN/AMR3WlLNJ+PF/B0WK4Siz4dI3o=; b=tG4jOtMNt3Y5q10l8SrQI3VTQu
	3H+rMDe94TfTLXm7/22GBZNzw86N1q0ICa3pPIP4jfLEYRJZnGuk5NjE97UHkJA3Ps6K98ZYBiiud
	cBBlPywBzyG3Ub1dDSigtz9eoxtq9Ymq3H78wzZYoDkMeurGyZSlYwvA+h/4z7Xtw6tQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-crb1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vxvGS-00000003V6W-00Y2
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Mar 2026 23:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=6OY5pjzpmhkfEyJN/AMR3WlLNJ+PF/B0WK4Siz4dI3o=; b=b4VOZCJHpCletvYGNS/x+VX1GO
	1nw11ET2VxzuuYKu+daA41Py3c4Es39Ye5GdTe6oWCBgvUk3kjqF1FLGtSLS1235zsOuH6lKASpz+
	UfaZe2JRJ4uSC2Sv9AqDCjPsahc6YhCUAvcqLvbLp6dtufH0OI1aYciaDi7qeYCoU6HU=;
Received: from [82.57.88.19] (port=59145 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vxvGK-000000005tU-46rt;
	Wed, 04 Mar 2026 23:04:17 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 05 Mar 2026 00:04:05 +0100
Subject: [PATCH] uboot-config: fix KCONFIG_CONFIG_ROOTDIR path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-uboot_devtool_fix-v1-1-4eeba4bbe4c4@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TlCLgr4SIaVbLYQbWhKEf086z
 sDMCxEDYYSheiFgokjsC6i6ArvPfkNBrjBoqTvZyFbcC/NlHKaL+TArPUL1Umu1OtUvFkp3Biz
 6f45Tzh8wtifOYwAAAA==
X-Change-ID: 20260304-uboot_devtool_fix-170221fd17bc
To: openembedded-core@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=francesco@valla.it;
 h=from:subject:message-id; bh=3PNpyxAbQo3A5ARKi9QSnrGXPlcRcqkcmGsEdGqtxYY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJkrdqU1lrw9lvrM36Lly8IXZqt0tpaFbO16ZbH0gZHbt
 G0nvRandZSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQATEZzHyHDw/bMLpY+er2GT
 Z9q75aFypfNKhu/3u/nl6/QdnVOTQlgY/sdvfuzvmJRxpWuJ0JRzDP9WhEZJVe0SfB54q7dx05s
 HNzkB
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
X-SGantispam-id: 00b9afad595bac1383d35e52c5daab3f
X-AntiAbuse: ID - 00b9afad595bac1383d35e52c5daab3f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vxvGS-00000003V6W-00Y2-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-crb1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 23:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232441

Commit 22e96b3 ("u-boot: Make sure the build dir is unique for each
UBOOT_CONFIG") changed the u-boot build directory name to include the
UBOOT_CONFIG value the build is performed for. Align to the new pattern
also the KCONFIG_CONFIG_ROOTDIR variable, which is used by devtool to
create a config baseline in case the menuconfig task is enabled.

This fixes the following error, which can be seen when building u-boot
under devtool and UBOOT_CONFIG contains a single configuration:

  cp: cannot stat '<u-boot-builddir>/<u-boot-defconfig>/.config': No such file or directory

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/classes-recipe/uboot-config.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index 112fea2de44cd716fbe65598b275410a4fb90056..f7848396c17fdf4835053b9f5a45480ef8ce9f1f 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -251,7 +251,8 @@ python () {
             # Ensure the uboot specific menuconfig settings do not leak into other recipes
             if 'u-boot' in recipename:
                 if len(ubootconfig) == 1:
-                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", d.getVar("UBOOT_MACHINE").strip()))
+                    builddir = "%s-%s" % (d.getVar("UBOOT_MACHINE").strip(), config)
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", builddir))
                 else:
                     # Disable menuconfig for multiple configs
                     d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")

---
base-commit: d3e757f21403554e7064c5fa2b353080d14d2ce7
change-id: 20260304-uboot_devtool_fix-170221fd17bc

Best regards,
-- 
Francesco Valla <francesco@valla.it>


