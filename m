Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D53CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.25446.1694526828305515420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LJRLSIfT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c39bc0439bso20600895ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526827; x=1695131627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/N/udGn6sNecScK3cObMOu0ZKZhmOhVngaykRJTIcY=;
        b=LJRLSIfTMw6F5/8mIH7SsturnnlwsFdZSZ7Nq6OpCWsly9eGQVNDHAmY1rsksloBaR
         47EP56G/UzaZI7e+ELa5GxpXj+g98TztYo7QOL77novp7uI4m+nYh5duCrXZebPDlzuj
         ztQgipOL3KR0evx33D9s+Q6ePpP1aJ32Yd5lKfXwUPHPWNuMn1GgjQdpVvchYcHny1rF
         zjaebh6ovnjj9mN7dEVhvtm6IoXhwG/cJnY1dPdkTsPXxC7l+nW/m97uQqgrpByq23/X
         rpTqkw575fkYm+PMqsCjl5TwfaaTKBVbvOfiyQ0gqmiWdCVi+MeiKjSGXfQVqXiu3lYF
         Dr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526827; x=1695131627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/N/udGn6sNecScK3cObMOu0ZKZhmOhVngaykRJTIcY=;
        b=Xp/DbG8ORWskfrmCODKiJ1gJzx0SUNztyuKEUugV0guq34zVGTq9tIy7ypazQcATmq
         mhWvaipE2f9FehygXKxAq3g/8+IX0IXM5+55C/0tLkdYtYMEH0ZfqhbIv3iU/+a/TQDD
         TUOYj1sD0+lLzt8BTwFNIM2AAIQyKW5lXLqNjXdxP4XZbBiU+F6xeB71/vG0OFkWBzj/
         X2hLHpmKsHjymJe95nkGmOn9PsD229RaHPc7XRZO6YRk2DofT9Kbf45F9yVlI2hmI2ZP
         +xSnrGV8zEEgCJ/yBS5v6+cgZ1RVwo3EhmxAvrsYur0j33sEn2U/RWysLTAFtvkHSUiK
         LP3Q==
X-Gm-Message-State: AOJu0YyA5T9Shc8Ti1j0TWv0MqztXbZ1DyV4D6rbreymvBKCD143Rkiw
	OQUHczVAfuniyzFAL0/QolDWKnlTyEpdW9pJfAg=
X-Google-Smtp-Source: AGHT+IE3bB1XiO2xRCL0U3JT0LoKJLG4wl40jZgcTH+wI07d30L2vB7sesO3FyzbW7/kEHwrDT+u5w==
X-Received: by 2002:a17:902:da8e:b0:1bc:1e17:6d70 with SMTP id j14-20020a170902da8e00b001bc1e176d70mr3758440plx.24.1694526827339;
        Tue, 12 Sep 2023 06:53:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] yocto-uninative: Update to 4.3
Date: Tue, 12 Sep 2023 03:53:15 -1000
Message-Id: <2850119bce7aa9788ab8b163311d42ea273ca1df.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187521

From: Michael Halstead <mhalstead@linuxfoundation.org>

Add in stable updates to glibc 2.38 to fix malloc bugs

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39f987fcb20ad7c0e45425b9f508d463c50ce0c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 6596c0f4a2..eaa3e9b31c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.2"
+UNINATIVE_VERSION = "4.3"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
-UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
-UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
+UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
+UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
+UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
-- 
2.34.1


