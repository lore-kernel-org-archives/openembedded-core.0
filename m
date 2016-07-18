Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 015D170149
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 17:58:41 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id l9so16759064oih.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oHLcVYzVJflrdLyc/PmdHUAvKGRzLPTLFsdDAZKka18=;
	b=PsTfGX8S+KcXmkGWVaojPz/SPAha5M9/BtgyCcufgu6yEbH+Msk860++2kGD7Lvm6t
	8NHfAnEVMpqdt0cXWY3hKxnnyvfu6iW59luDkNF8Z76TxS+Q9mH2JOTaKmnsQVNOl1/n
	700xnRLTOjCxbwEO8BZ85HH95/pHsT+KY8x5AGLW05CzTXAAiPbnfDAYD6ZnmUJ0T7UF
	INjKfSDwfNYu7Vg5sNH2dTdrr+5IBhlcXLPWqv5wGTriotZwAaJOt1cdmJNNQu+VnWqX
	lZN2Pm0aBoEFjmSbpr8mEDJWTR5ixTL7+XpuoaMje0OAevhmgVscHdqtkCS8UWash6ji
	hPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oHLcVYzVJflrdLyc/PmdHUAvKGRzLPTLFsdDAZKka18=;
	b=cHIiT6xWLKl9aB4YjU9oV9gCIPXWkjPC7AignwZYlQiF3f/0L0kMRXzLLTxKCv3eeA
	XufcecpOFAigGbQs8gm1DMeLlqZGgfLn5fEjtN2qlbR64uEuw9RSjykYnIx6ByOy3rmR
	vUj/4WVgkNlzEudQU2i925O4vrpa7aZ1huRPpcY5QADP7ei+MqhNCtQbw3tyexhQtMh4
	wm8qv7n+idn5lb5ZdRIc3fUK4wNxrOkPbojB6RLZKUM4DtG41b3RFWzESL/ofn4DMuHh
	/FgtSDZFbDPiUjkDGJjkhU8Yy9LYdT6uRAGWBbDRV4JNYIt/AI7Eidp7EszCEa586pxz
	/Fxw==
X-Gm-Message-State: ALyK8tLXfG3SxTI7GulgK1aDAxvfNNAoOkj7X3IE/fua4lXKz+5BAxx0MdMQetYBiH/tUQ==
X-Received: by 10.202.219.213 with SMTP id s204mr16762531oig.151.1468864722355;
	Mon, 18 Jul 2016 10:58:42 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	s20sm9402275ota.25.2016.07.18.10.58.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jul 2016 10:58:41 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 12:57:57 -0500
Message-Id: <79c64bfd7932e78cae2876ac14b19737d5a4d578.1468862824.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
References: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1468862824.git.george.mccollister@gmail.com>
References: <cover.1468862824.git.george.mccollister@gmail.com>
Cc: marex@denx.de
Subject: [PATCH 3/3] uboot-sign: Handle .rom signing the same as .img
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
X-List-Received-Date: Mon, 18 Jul 2016 17:58:42 -0000

Handle u-boot.rom signing (U-Boot as x86 BIOS replacement) the same way
that u-boot.img signing is handled.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 57d4903..d56ad8e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -64,7 +64,8 @@ do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
 			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
 			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-- 
2.8.0


