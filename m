Return-Path: <yocto@nkent.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03CECD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 10:29:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16457.1781778540445125831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 03:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@otiv.ai header.s=google header.b=KhnRPFon;
 spf=pass (domain: otiv.ai, ip: 209.85.221.44, mailfrom: nathan@otiv.ai)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-460166910e6so505828f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=otiv.ai; s=google; t=1781778539; x=1782383339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zN2PyQtlxc8Ju+NRChw7Tb3q9m2WV+bIT7kK4uaOr74=;
        b=KhnRPFonrLawBX/jpsXMkOTf63MfeKl+Zr2GPUeye7Ko45TVjKA3E2GoVZKItlXLaF
         5W7K1J30CdLNnTK+wxM5KdAqyOeCcnopV9B6swJszkXaaQmJPXSi1+EmuNyXIdDRBMrK
         IIDuRRF3zVE1hy67mB1dS8LAsaibYJs3Au7FZXgg28d/FlcH+waQiqjVZ+g54qrb3g+3
         OUgh8U2/wGTWS+lRL6JtmWUZ3e20bN3rqSVkxvMzIcw93Pl2eIzqtTurSEKMRew32dbQ
         6NE7U0mn9s6Gu838lIj/k6QuU5cnLQLWDJlkHap9E443UBU6HKskkz+KxH0vuaF4/T6Q
         /DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778539; x=1782383339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN2PyQtlxc8Ju+NRChw7Tb3q9m2WV+bIT7kK4uaOr74=;
        b=JZ3H20JFgW+nMoFeW93GOduP0p/Og/+e01fdEIH4/MnGQLFGYIgSgJSWpdhS+0vYGE
         xOVLW/CNfIhOoMlurVxdqJrEhVQ9r9eKB9jTT5BA4pGkQZmNVw2nAO5K2Cro1T9HaGUX
         o3n98pRR9RU7NjA++HuD46fubipMaxSEoHEG5eVCvQ/V0EsuC4g42lewZLqnAQ2hPuI1
         pgp0+6nHf08S2Ejj0xzQlxQs5vs1yuK20ar2MGyPh0rbn6bQhRdHJ+s3WVpiJH+S/EZV
         +BwyXDuyiOhpDqqZj8is/coC3eifDjukBykC4ugnDQlAtevCWmqDrDnWW2l39niig3iT
         ClDA==
X-Gm-Message-State: AOJu0YyYO04qJah+Q6ljit2yJu5PlIJ/W3rjs/3q6MQxIbQA6fPz4Y2d
	7x5BFTV4qEA8jPZrfKuyRLAt//S4XrSGdXm/PdeGx5dA1OSJ7XPwrcQj5xJrIDVnKUrYNpAXAcs
	wkHx3
X-Gm-Gg: AfdE7cmelesgIAbSlxxeeno6h7TrAlkssvf9K33YOzMib5wP1ODQUhumnHxKMr4h1WC
	bs3tnIc0vG/RiDZzkPQgiQL4Km6juDikZ9emD19Jc7ubs+TjFPJcUgonvKni3eY4nO+VNICOzdx
	9F0+EbxkoJhUkkfQFHgymsYn3+ITLZYj7Jpil0y9VVV9HPkksahTGNbfsEihHjMLiPryeq22JUe
	Uvsi1siI5F9owD+Lrg/WnA76ZoMRaGv8cE32u4Mwn+0BDEEmCWm5wZyUDtM0nq/9/iXgLZ1NzG6
	y21oIV7K/5F6MRhQFekFyCUW5pUvmZk5vazzTLsUu6ufSFQE0kG+cEHCdyrAq1bLic4+nVj/jfW
	JiBldNfCcnM8+ocnZRedDtF1AzZt/MdxtTzozBk2SiBA8olek/ng85BXkLYkQ8nDqHL4tBNfntl
	EggcUBikgnsjPCG/rUbJVXvIpXtq5J+CoDNsFnddSSXxyBaX0Eh6WAQRC8na/XABgzu2GP7cd17
	L54/PmFoOB6bg==
X-Received: by 2002:a05:6000:1869:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-463ad6ca6efmr5258059f8f.34.1781778538725;
        Thu, 18 Jun 2026 03:28:58 -0700 (PDT)
Received: from nkent02.otiv.ai (2a02-1811-e507-d800-de56-e30c-805-27e7.ip6.access.telenet.be. [2a02:1811:e507:d800:de56:e30c:805:27e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm34059668f8f.6.2026.06.18.03.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:28:58 -0700 (PDT)
From: Nate Kent <nathan@otiv.ai>
To: openembedded-core@lists.openembedded.org
Cc: Nate Kent <nathan@otiv.ai>
Subject: [PATCH] Update sed usage by 'pam-wheel' for sudoers
Date: Thu, 18 Jun 2026 12:28:39 +0200
Message-ID: <20260618102839.363123-1-nathan@otiv.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 10:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239072

Fixes Yocto Bug #16321

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Upstream-Status: Innappropriate [oe specific]
Signed-off-by: Nate Kent <nathan@otiv.ai>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 7dfa0cef6c..489c0db09d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -37,7 +37,7 @@ do_install:append () {
 		install -D -m 644 ${UNPACKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 

