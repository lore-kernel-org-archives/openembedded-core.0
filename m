Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E87FEE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:57 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.13079.1692801414834436394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tbKb+7N3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c06f6f98c0so25231705ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801414; x=1693406214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23NeLciyWMSs0mANQXVWfRZf8zN8Jmtxql9mGq5ClTQ=;
        b=tbKb+7N3tnTSmPFoZDyWh5rE2jcKgG2mXDdsX/DLyaiZbyLWzNTO4v+ezq7/q526G3
         rGzhFLa1CZ70gCHiOrMwaV48TTsQX8kBA9YSmN5m/v4zgtpcEsxEx0vAiHws86kJXJqH
         6aZazSa/YDCdT2Ehn5TyM7M9/womr0ODUA2tljHs5lxnoCm2uudycKs6Lzp3b4V5X1lZ
         EodfXuYXC9iKHMKyG2Glh6nUKOPoZl2lumcPw7hZXA3cY3alzg8A7OFBORYqlNbeYLmj
         a4+2Lz6sS0UKez0lkG7jMKjWp/SCBBV6jTcLhvGPCguipImjqRoDsQSdTFtQQMGm+nbg
         CCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801414; x=1693406214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23NeLciyWMSs0mANQXVWfRZf8zN8Jmtxql9mGq5ClTQ=;
        b=ljC6oUmvDhf8bU0KgjCZ7Zr3p9YpY/VLV9oUx4SpUnMNN5+JK4aAivlSEPPCRAiBeb
         CGU1+SLiphCWeGfLb7j9Djd8VxfR1vp5zSr/ZMY0ZKJzYPCciXVr2B2ct72NjztjLgh7
         S6kQvW/CbndUz3ZOQjEOEqvy+hYYJymbkMX47ucBQkLUUjqJGS8vY+pEVxl7eBWsE5+7
         y2ZRekhVErZd9EXBsZfVa0R9kwFg2QnFcOLh5Usn7UGqiZBtm0hKN4kjWa9S047ybrLC
         BfJnP1oZ+DFdURMUsrWnBcZQh7iV+TNk2G/s3ckDrJnrQ2sw4r6jEwUv2KYrfa3ab+QQ
         Hqxw==
X-Gm-Message-State: AOJu0YzWtZn33iNwG2xLWEjsl8atigOIRtiTpDFFyKjv3odmc8jjKTqP
	3Gfj4Raj27dSiuo2HTpnNFH87n2HRtszkFv5zIA=
X-Google-Smtp-Source: AGHT+IFR55ZvZxA+Gj5iHpiD4fTw3KoxVyAr+aNbdz/IpAo2E+COTklVmZ6Cy5JkIlW8ScoKjMj9eA==
X-Received: by 2002:a17:903:4283:b0:1b8:954c:1f6 with SMTP id ju3-20020a170903428300b001b8954c01f6mr12509742plb.36.1692801413949;
        Wed, 23 Aug 2023 07:36:53 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/36] yocto-uninative: Update to 4.2 for glibc 2.38
Date: Wed, 23 Aug 2023 04:35:46 -1000
Message-Id: <135624fd57c3c9ba3786c5c10cd1f6c37ce82dad.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186597

From: Michael Halstead <mhalstead@linuxfoundation.org>

Uninative 4.2 adds glibc 2.38.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6654fab00a1b4e4bb05eec8b77c8c60e1f8a709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index b3bd7794fb..6596c0f4a2 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.1"
+UNINATIVE_MAXGLIBCVERSION = "2.38"
+UNINATIVE_VERSION = "4.2"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
-UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
-UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
+UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
+UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
-- 
2.34.1


