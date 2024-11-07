Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396D6D5D66D
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:18:06 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.77467.1730999449828729666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZiqIphbx;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a4e5e57678so7367645ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 09:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730999449; x=1731604249; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN6GwmJfX/cwZpDhmu/rLPKp65zjcLf4VMr+O6PchY8=;
        b=ZiqIphbxziPObYk6F04mlVT50kdrNPTLw/8gkl23TcJG1pTjLYxR7Hno/B7Wa38Yd0
         Hqc4LODA7GPoAo3igsSp2iamrd9k1miiWM/OZ95E6ROXcvT12RcZLRXzil+Nl5JZXSrx
         41J/NY7uq7Q2Kuh7DhcFPrYAmp9taOkEnRT48imaBu3az8QR0QXmQHZQ9ibSp0Pfziqt
         QPWNvNf8wc0r6INh3mX9k4qv6e6cZXpK7WoIHHNHelYLWSm/O3Rvx2NMxZzA/YAUpGZg
         lJeWED56Tb5O79VI383DtkdVDwLWWdz6gzgpkE8wIbndHlkXqkKPxL/Tz9RSFeIcw7Y4
         G4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730999449; x=1731604249;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eN6GwmJfX/cwZpDhmu/rLPKp65zjcLf4VMr+O6PchY8=;
        b=xPR/eSvrUsqc+iI/C72jOm1Y6tfFzaJ2/6xrEL3tPcbII7cwkTNm3hteQCypUgZRoZ
         Day6/28/TTi3ZoySV1ETxVmIVwHBbExAvtY7rOpwi5x6+hSD9pSut58iy8oNRb0I1rbO
         ZtybSSp5bhdrzEbYGwMzFzFv9MFVfCXIjH0NdayBNt/dt3HmNeDOcJRGaH4nOjdMJT7D
         Uq1pjWHEJFZlfWyHdTvSk0cGnxycELEyy/PS8bhXgohsU1tr1M9Gknhnjlk9IYd79Eq4
         jqlSiPftkIupCaTaLH1lvqZcir4fJkGsOL9h+BIUYMUMpTfCwsZSRP+N5WESGMP6vKGs
         Wavw==
X-Gm-Message-State: AOJu0YxLJSCe1Otj/JHfUizJVVhG3SSoDC759MaaVXGrrL8Ma68xlFcO
	fMkvdVssGLEt1gNQ6RFKFbXkgvQFzAqTkkucVo7mgIgDRFmQY7vA3hRTqA==
X-Google-Smtp-Source: AGHT+IHhzMKH13pg97XQr28POcHiGT71mNyfqUIeymSn3s1wmKRTbxOJpVlgvGr2pWJ+Gzldw8+yww==
X-Received: by 2002:a92:7308:0:b0:3a6:c6d1:8c4b with SMTP id e9e14a558f8ab-3a6f114b1e0mr3506365ab.3.1730999448607;
        Thu, 07 Nov 2024 09:10:48 -0800 (PST)
Received: from [172.26.252.3] (174-29-219-139.hlrn.qwest.net. [174.29.219.139])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de5f8f7030sm374062173.151.2024.11.07.09.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 09:10:48 -0800 (PST)
Message-ID: <b676cb1d-53f0-403d-969f-e0bfdaedc4cc@gmail.com>
Date: Thu, 7 Nov 2024 10:10:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, yoann.congal@smile.fr
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [PATCH] uboot-sign: fix concat_dtb arguments
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206841

Fixes [YOCTO #15642]

Ensure empty argument passed from do_uboot_assemble_fitimage is passed to
concat_dtb

Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
Sponsor: 21SoftWare LLC

 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3e5f5dcf66..a17be745ce 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -338,7 +338,7 @@ uboot_assemble_fitimage_helper() {
 	binary="$2"
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		concat_dtb $type $binary
+		concat_dtb "$type" "$binary"
 	fi
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then
-- 
2.34.1


