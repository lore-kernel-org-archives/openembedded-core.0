Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id D61FF71AB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 13:14:23 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id i127so4469580oia.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mLv/7uPF5O+Dbn5jwLRf8LIBEtgcGOleEGHIq/G+NZM=;
	b=FxQGn5PjsV5Gs4fLS998c/wBKtQn97H8j8osB+wpGPypTF/LDjbrFqwcpjsZvxQiE1
	KZykakrxdZDWYBNVXfb1U5IlAqj4Zy4omvl5FMXuICzvdxrt3R+zf1G+HRGFzFn4aT60
	cYe7z6O+JqoIRVHWhHMysM4HdOxI/cI7rhUWjM2C27AXAXQjR09MUpI0J48WWR5Dd5zA
	Ei1JPMkqVcf19IJCKGxbEv6v1HkFSz3CDk9qmD7HEzRw0GPS2zhZAUtYqcvjXWL47MYQ
	IEbCKhvFbNjbFoifkFTkVwWsRpVEzNUt507vCWeGTwzSEPKqL9i5M8MHNOQ2LRxFgE/6
	d8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mLv/7uPF5O+Dbn5jwLRf8LIBEtgcGOleEGHIq/G+NZM=;
	b=XdSOPUZxcgPFuxvJC0clfPgB7VqREhMOYFiqvkgYsIkqHkbCT22LVOTEi2h/vCn72M
	1TvNRik7rl89aJ4A75796JGZwLvpNE8F8a+vvifYCuTfL3wfGf+GpXFOEJSHNhQPv71z
	fehTMW2AsxiDEkqSHZYRywxkOH26M7eRYj9YP+yOyHXgK+r4+2Rp4BhQjC82UEeaFCz7
	J5mRBPwJ1fXUsi2Q3BC6GQWcAKo3y3UAt/42BsnCm303vT3xcZfHJZe60ADpMIdaL46R
	6GZr1kpG/ECRl92HnPPl0u/ZkY8azBdy5K9nDk5TdjfxFL1fzvLQFs+1h/PnMcBdVt2U
	tAXw==
X-Gm-Message-State: ABUngvdoTp1rvfGWHfFRE/+7EQpmaoOB8cjO4F6SvqT4G8g/EW3N7quKnOzSiY07nh/qCQ==
X-Received: by 10.107.57.136 with SMTP id g130mr6348616ioa.178.1477574065170; 
	Thu, 27 Oct 2016 06:14:25 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id l62sm966470itc.12.2016.10.27.06.14.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Oct 2016 06:14:24 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2016 08:13:16 -0500
Message-Id: <1477573996-7860-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [master][morty][PATCH] uboot-sign: fix do_concat_dtb for .img, .rom
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2016 13:14:25 -0000

Now that out of tree building is enabled, ${B} must be used instead of
${S} as the path for UBOOT_BINARY.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 3c56db8..cef26b1 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -68,8 +68,8 @@ do_concat_dtb () {
 			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
 			cd ${B}
 			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
-			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
+			install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+			install ${B}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
 		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
 			cd ${DEPLOYDIR}
 			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
-- 
2.8.0


