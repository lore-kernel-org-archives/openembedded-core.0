Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.7962.1623852341852434297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=q9WdkLAM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso2527042otl.13
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zm8G/dKTrhj72gGNYQVA8FrHa87Es03vvIChoqdqak8=;
        b=q9WdkLAM2eyPJTBvWTYWTIr8D4zIh7jiYxKuj5WcTa+vPRpTXD5Rkd16zD0iwEvHFv
         Yc+ESHX51RfRCR5CllO1HmRQHTFsJFGbrp/zdtyfbrm5J6/eAnK7kE9nujO7KNQ1aBwF
         3s3ctnW4FjRvCEHJkhr2NHSdVvB8VOwt00Fp8Hn0tlL9W94mTsUPmMD8+hZ1K5ySOLRs
         cpwUgWsjg06+Ywdd4N68WVcOjYHsrLUPSyuS+VUP87zTBi11gXLqF16mWaAwXCGQyLGc
         Rg4XnnANNQ7yvp3WhPFUxqy35FtEeFd823lAKaAOiLfNMdfuryGn4mfqfMoRaAb1rSyF
         McZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zm8G/dKTrhj72gGNYQVA8FrHa87Es03vvIChoqdqak8=;
        b=ZvhisRo0xd8qgqAX1200t/WsWoCK/LHN2zLNsH8gijo1YlbQQdWXY/d1eudxBwjqUW
         bc1/Ty7neJ8aNliQjbtRSQoc3IC6OuWsKesw2TBXBomlIxGwsA5gOy4XtbOWWnjLE9Zq
         N3+ABVfAYmODpINoZqJJftdDwjzRUU8zR7s/7i3G8lraPokSiIlTy7NSNfqVGRAbHuf1
         +svnJh3LkBTbgF7jTLofwQO0dhbZszhiCtmgPqnj2mnPkRfI9TnfEAAHSu7kJUM5L7xI
         Pxy/ZWWiFA+BMFU6Lh4rcIoE4LMqZjFzqVIv1WPfjrEtA4VHPIaD3o5KsoYe/ZTR+HPV
         y2dg==
X-Gm-Message-State: AOAM532vucjCXm/pickY9Am+tfM121ZxheKtOOrfy1dMTTS80FSL/jLW
	SfUemwapsANC6wYD7DPmYA5mH4dTEGwgbPIKPpA=
X-Google-Smtp-Source: ABdhPJwQ3RK+gcoEU7EttdpwcVg+2s33XJibcSzi8OdaFB7S/GL+e2TzSvhAta3uak1PWD/afdjEkQ==
X-Received: by 2002:a9d:872:: with SMTP id 105mr14438oty.365.1623852340796;
        Wed, 16 Jun 2021 07:05:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm434637oif.44.2021.06.16.07.05.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:05:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] kernel.bbclass: fix do_sizecheck() comparison
Date: Wed, 16 Jun 2021 04:04:29 -1000
Message-Id: <f5fc716d744745d5c2ea83f0b1d63907cfe04c06.1623852080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623852080.git.steve@sakoman.com>
References: <cover.1623852080.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrea Adami <andrea.adami@gmail.com>

The routine do_sizecheck() was historically needed by legacy
devices with limited flash memory.
The lowest extreme is probably with Zaurus collie having exactly
1024*1024 = 1048576 bytes for the kernel partition.

In the years the KERNEL_IMAGE_MAXSIZE has been converted to kilobytes
thus rounded so we have now KERNEL_IMAGE_MAXSIZE_collie = "1024".

The effect is that now the check fails because we hit curiously this
 | WARNING: This kernel zImage (size=1024(K) > 1024(K)) is too big for...
even though zImage is 1047288 bytes (kernel + kexecboot-klibc-initramfs).

Fix this case using test -gt (greater) instead of -ge (greater or equal).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 254ca956d63b4ce6aa294213b60bb943f9f3a9e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 518aaef724..85c6594c27 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -680,7 +680,7 @@ do_sizecheck() {
 		at_least_one_fits=
 		for imageType in ${KERNEL_IMAGETYPES} ; do
 			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}'`
-			if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+			if [ $size -gt ${KERNEL_IMAGE_MAXSIZE} ]; then
 				bbwarn "This kernel $imageType (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
 			else
 				at_least_one_fits=y
-- 
2.25.1

