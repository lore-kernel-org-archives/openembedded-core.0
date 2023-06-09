Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B1EC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.199.1686329692171449295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PHVIcyoo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-652d1d3e040so1611598b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329691; x=1688921691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=PHVIcyoo6kBVXJq2CLqkBQQOu4hjE50Ei2uv8ujyndOaROeQLccl2XLUa+Fy9v/8Ip
         BWP4N+ln/5uQPsvHewawQoAMaLdMRzkISZhU4k59qgZOUe+jS5dgrBvyfdKSPJAOJZBE
         alEPPmKzpLkwqiTXW4sIHrBQbygRztyYgWMy8nNADgdLZ5br9ilIr+VJ644kLA8J/cr1
         PdsFzJ80QRga7gPIbju8kiMw5GFMom6KSRDZqzgRFyzzTySVKig8WIDd+aEwLLNa2l4Z
         eDCw7aIB4eLzTxdfcc8fNp+1oyvEyJqEAKIHer37dM+389oUNMP0RmSkE0Ahbditr469
         GpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329691; x=1688921691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=j4W8LRsHyIF7p4mIenr3IqawNf5U7z32yOWiEL5P3WqBcWJgPOjVhNLnGYnzdUKmoG
         gAHVP+0ZuXB91pOZ6wquktx3sFd0CGDJ/9HTz33Aqf4RTYntwIbimTeOUlALdI+MYHeU
         U0Llfk4hi87Vg97SR3BZUBlWWG6XuDku/mU7HkLaGZSY6yuRl1zXITKhE/tfpoqV5sVd
         bOWPf3tlJsShX/aquv4nuayC1gNAZ6E8XUODTfADcZv5meceOA+J7Yn/7nyRJx5Pq6K2
         pxPve0j8v/7pK5pwiCOK1MrkdM0VhZySh13Zmv1PeL5+A+HPI4+VQmsksG41fhOk27tq
         +lYw==
X-Gm-Message-State: AC+VfDzF3nlY9BOW2/9FP5OWXq/iDm5ekPGvzqxG24TdzCAT2QMUoJ1U
	KVV2N+5r/CNAIvy6Isi54ExFr005Qs+wH9F86pQ=
X-Google-Smtp-Source: ACHHUZ6pRXb2N/v6xLC/o5hHL0BkazxrYtTR/Pb0YiTkMhkm0ULAHJ3uFzIbg+XDbiyksAzOITzZHg==
X-Received: by 2002:a05:6a00:2d02:b0:659:f92d:904c with SMTP id fa2-20020a056a002d0200b00659f92d904cmr1702324pfb.3.1686329691195;
        Fri, 09 Jun 2023 09:54:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 29/30] uninative: Upgrade to 3.10 to support gcc 13
Date: Fri,  9 Jun 2023 06:53:56 -1000
Message-Id: <6d9e48a3322a9abdca7444dbfa2288af3c91113b.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182595

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f811bffb861b23238e8291394bd6e8407f013619)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 8a5cab5360..f3c05b7e20 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "3.9"
+UNINATIVE_VERSION = "3.10"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
-UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
-UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
+UNINATIVE_CHECKSUM[aarch64] ?= "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
+UNINATIVE_CHECKSUM[i686] ?= "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
+UNINATIVE_CHECKSUM[x86_64] ?= "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
-- 
2.34.1


