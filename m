Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB64BC41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.9699.1718288472354349085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rDZtcUAB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f44b45d6abso9011495ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288472; x=1718893272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P6XvgOi1TYuoDce/PrilLLiYx+f3lS8ltolGJCycF4=;
        b=rDZtcUABLiaHC/xuSDgqc2MNWu4JaQRaBHl2+ydXrGLGze3kKbtOks8gl5WTBDAOXG
         js575+QRE2adEmBFe8vz+iv9vsQoHuIwhDnwZRJ0o9bLBOaRLpU1s/60Bg8LPZLDlU/x
         gIg7lUnoR4WGf9zn6GwIoZOOijTNaksMre8smIiPRvUAdP2dcNqaKNFd5ySNyFpMSPY4
         /k3uLPEtrNA4EKm+Wn6PWgPBAcSoNFpJOWkT7Ru2GGyvXWA04fs+VjCDtG3dIFAbzEao
         jlEBSR+L+TqBbtfSIXVT5Z3+VdafAqIq7aFBGcDU6z7Ba750Lh9V7GdbtgJm4RGm9dWq
         bYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288472; x=1718893272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P6XvgOi1TYuoDce/PrilLLiYx+f3lS8ltolGJCycF4=;
        b=K1Ief8CV0IZuZXr0bnf/PJYQT68ygchltgSYPRNoiBeQpBfEoSBbfw4TwpANV6Anrx
         yj5NKPu6AAaQyaFOjgENXJkGN8ajEh1lJj7VM/3ckTq7XpthIwtuWan57P3zxj8g4gtg
         JiUh6qYAQLk1iTybeb1h1UvXxWncVc+XcyZt/4TUDBy/bu4ukpM6TN1Mr2ylGSc9e0Ko
         72muOlsrrwcJ0O8kQn4L7Fgc9bL3xyPUL3KrT1ceLUyf8YkYm2q5ZHqicqU7SOZVYh+5
         3xPf/2GYU8rIj4/HAoqekE1YTkM0BuBpxYAVgRW5Ra1H18deKswJVDwkHrptPHvZiebE
         +Qrg==
X-Gm-Message-State: AOJu0YzjRlzc1tIRdzsB102PeMdoyjODGOrZwBxgC4QuBTt/isXeE8/0
	paNK2K+8cNbcakEP6YL6ji8QKJs+3Dxb1FMRq6YDD2hwsycWWdCCv4QAl/aDPhY4WCRcp9Vg6SW
	O
X-Google-Smtp-Source: AGHT+IEV+e0d9Pv4ucZ0IFEYAt7IlbTb6xV2pdKobVhFxUGolp+7XhP92HDNyw7VHGuVTH18a483kQ==
X-Received: by 2002:a17:902:f54f:b0:1f7:82b:903c with SMTP id d9443c01a7336-1f83b6f650emr58043925ad.32.1718288471627;
        Thu, 13 Jun 2024 07:21:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/29] kernel.bbclass: check, if directory exists before removing empty module directory
Date: Thu, 13 Jun 2024 07:20:28 -0700
Message-Id: <63856721cab409ae0598cfbff4fcf55c90bfd7e7.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200626

From: Heiko <heiko.thole@entwicklung.eq-3.de>

If the kernel folder does not exist, find will result in an error.
This can occur if the kernel has no modules but, for example, custom modules are created.

Add check before deleting.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ef767d84d56b25498e45db83bb8f9d9caebeaf9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index b084d6d69d..c0a2056fec 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -463,7 +463,7 @@ kernel_do_install() {
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
-		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
+		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
-- 
2.34.1


