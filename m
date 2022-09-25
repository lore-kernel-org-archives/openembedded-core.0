Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EB8C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.20267.1664133493767765434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=705w+3A1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so10492131pja.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=8C6siZlukGiRzD3nyZrAZrKAhtT8cFB9ovzQriKIZWI=;
        b=705w+3A1cpE9tNxgw+OamfDS1bV4cB2hjy1UHYfCwYN3yFAl50YYifDgFnwdPNiyCo
         ExNFsJxgfpLfmn+joZf3mcNxc9m6PnyCACEiYXDsScxSJhlPSrViL2xw4a4FSTWb+riw
         YCdgtm4hMa3ybEA0dUfuIzuDB7sxyAinF9aHbydr1NVRnnJR9xUQZnXChAHkssTGV4Yr
         NN6/8h0WgLdqNZ2Cllr8H4/o+6T9mS/0808MtpMgumCy9Znb3QD1IEg6dr4BWsDgvxe5
         kp1vEUzkV53+CUEg7EcTNsINwD7DRNXv5FwgZvsNgGSIICI9mch4L2MMyJBmRzvzObR/
         cJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8C6siZlukGiRzD3nyZrAZrKAhtT8cFB9ovzQriKIZWI=;
        b=8BlNE+sJr8KiDJ85cQCv56+aacwF+aUI6wacym77QQkSUrJC7pGLcn0WbHgr4rA7be
         5RP4H+WSt6IDt+DJ0wJhu8LWozCRYtKo+2NNQhR62PlagIEy/gHJ25yi8ihZopwuwUTN
         vFz4F5y0uJ6+hGJKLSBf2z7XikXLUjiqeo8SQdPDmNQ56GM06QR4gFqfmSkRdooIc+P5
         h7/NK/sgOwhCU5JUOD9fjVLNyZEH/vymvZcT06k04X8FH+23yfQVKMg6EvDQYJyZ2A61
         fzKzavnwB5sozISNMJFvBTuUayP49oP2779jPD06J4D1rDOaoPdkTuzfuEMuPaqkHSG2
         fr6g==
X-Gm-Message-State: ACrzQf3o8Gs8RIoMn/vZjxg23TkTqoZJ2yMK7GP0NgPGJxBjIOZgXJwp
	27IT/NUNuHWzr3oWR34aV5kXoUHV9lEnQvml
X-Google-Smtp-Source: 
 AMsMyM7Qiz+b8+cHXivWefng5lcAbCvmRQYzyAK6iUtdg5J+3XbVCWihs+x2jZ/Phj1fhb9sDkRzNg==
X-Received: by 2002:a17:903:240b:b0:178:a475:6644 with SMTP id
 e11-20020a170903240b00b00178a4756644mr18912796plo.96.1664133521355;
        Sun, 25 Sep 2022 12:18:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/33] u-boot: switch from append to += in
 SRC_URI
Date: Sun, 25 Sep 2022 09:17:33 -1000
Message-Id: 
 <aa0e319fe07c0ac807a6963ac47fe5e70a0b6fff.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171036

From: Mikko Rapeli <mikko.rapeli@linaro.org>

+= allows custom layers to change the SRC_URI e.g. when
updating the whole recipe to newer u-boot version.
With :append, there is no way to change the variable
from a bbappend.

(From OE-Core rev: be96b384ce964ff14536d3bc40c89851a12dfb60)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be267f61698d149ed2f65190f362fc556af1f54e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 54033698be..c4cfcbca19 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -1,7 +1,7 @@
 require u-boot-common.inc
 require u-boot.inc
 
-SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
+SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
                    file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
-- 
2.25.1


