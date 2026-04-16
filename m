Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF35F8DFF9
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28258.1776378793698757432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IoAwkVIS;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso430375e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378792; x=1776983592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=IoAwkVISWJT+I7ZD4uQdtUz9O4ntOyNNMNF9rHWSsagNlAo5xt2/fyoPKkewKJHjsg
         6f2JSYOq8dCs1dCmyr6tDG0EXRNRU7fJyt4Lqa7WqM6KPPEJV8s1hoMwR4aPNZ8YMAfa
         SgvLizrVWmBMyf58aNtqZRMhlPqt3+5sHMeJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378792; x=1776983592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNnr8zCuK9rJCkrulyG7Tv1QtQHZbFJT4AbUSi4SIIA=;
        b=lFuGV7pN1aGRuDBq+lm8iXmsTCqakAurU8eLG4oAMGy24YhiHP0YJa5GnDToQXo85I
         5v3n9YXGMebrP9eX91oEFvVZeMs57eta//GPJpidM6IR/2J26Rdxdt1W7KEBfffDwjpq
         kDkjeVw8RCx9NSP6tPdI07vnI7oP/c2A9oVLnXysx2wJ6uQ3EefcpkVjyDYch6hpF22d
         /RByAMfU8IaDp8SG5SR0KViscLQSGyBjE9HbGLwTZfJX/c/rm6PSJz4k3VEP1O+qvT5N
         3Z8iNdxOFhgTqBMKIWQ+D1T47nho/Megc3mnHNjd/0LPCiOgVB9xXjTQ/gFIEQwMKJBE
         cUEw==
X-Gm-Message-State: AOJu0Yx8tlOKyE3+opAl3u8KVgvZWEJ3Qu6Tcq65Gqilb9Wm14V1zMLs
	U+VvtI4QyZjAey7M4rEY8yrZVMkiWXZqLIq7+LygqKomZDE74mVfmkPfvTyBGEL0zikj1OqL8wZ
	3/cbUOXel8S3b
X-Gm-Gg: AeBDiesfws7IYDsjleQ1MWyS/thIv4aElQF5LKLY6bjfhAJzQBKQJ8JEUneCKWQF6ZF
	+63A17CYyndYvXEz4GAnoh/T0MPNKU9ITWEBUWPsdEw/Fcub68L90+wL+ekGUHJnHMBCViqglB7
	gaHYj4iFSLxSo7NVpQA1LQv6xaOc/GCIwnuQzbc6qyojLlGWCohjYp0271BHPf9kxSHMQvCV1Mu
	PWachT+fGK0swJCfuOEnY19GSVhPUYQZOsOT0vfPeJOQFggDDZ6ybxl7h6TytENyTbP3odWGhT5
	tLy09cFtWT1s/QQKFXRoyTg4r7P79Ve0PAo6v7JntW1BfnYJkdXPCXBsIFQIQ1ir3VHJriWU4Rj
	n26ny0TJySEdHYalQZEVjLixC+I/zxbEuiXJY4y38c7Sni5fJ4qRmb+V5ox5JWGp2LKispj1VqF
	Quj86N/76kSK3WlWRq4Ku3IHL7W98L/tMu7CLWmf3oBpi/CVldLofiQHEVlKDdXmVenFxrmMhl5
	NVTFvbJLlDL2dfvtWqGiFBalwFpMxGrhSpA/xdeqWmDUl3D
X-Received: by 2002:a05:600c:5295:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488fb77facemr4961605e9.21.1776378791760;
        Thu, 16 Apr 2026 15:33:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 20/51] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Fri, 17 Apr 2026 00:30:03 +0200
Message-ID: <11ce247a4e165fde70992a6899d9a55b691a4dcd.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235449

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1fb515f2a88fa0a0e95529afc07a99db001af0e)
[YC: fix duplicated line in commit message]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c86408..d97c96f631f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"

