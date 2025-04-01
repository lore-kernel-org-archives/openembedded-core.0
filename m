Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65044C3601B
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.77.1743546992924462852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a37xWnJA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso120182935ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546992; x=1744151792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX0uupXd89EWWiA4ifnfMUkiyM5f1EYReZBVpDWeOlQ=;
        b=a37xWnJAprq4ePg8B/8CQA05aH+s0xC9eVLdNjbsio8tyjPOPOoLNKCW2VBqBu5pD5
         zetL/7Gr/I61OwHzNMTVPRIqrCtV++x687/oyMk24ro6j6cJ8JCRfoqHL6jsyDRHrx1f
         eRLjmIsuLL6gvTUphydgaPkow+K/9Q9VAnqZfm1BArTGYiow/3qPvZfpN+6m5nj/zjPc
         2iZl4BX1brQxM1nICHjahvixyjSvEzEqxwRzfX6a179IJFKxRIUsvjsP4+wEU34LgMSk
         NdKeK2mhgMuKSlsMtbHwDUH9cEmxGCYZ8gBJ6qAEp4UjpMuumxwICF60Md7sI3C1CxTi
         5bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546992; x=1744151792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX0uupXd89EWWiA4ifnfMUkiyM5f1EYReZBVpDWeOlQ=;
        b=tFhpJbwNP7+WxMWSxLCfW4+yBO9/MFgdxexb/87LAdiodnFFFRQNAeCn5bnkYp8KAT
         t9U6MhDVzwuahQjvaiM07COpoR0jNMa0rCWnzGHjFE9UnAWndg2uuMNYUrjG8DR8ehpn
         Rfuj3Bay+qrnh7aUi9iol3I2XFD/SVcHq4pyOQLsGTQJaG0H83lQs+SyHMoA/3lazi+B
         p5qPb559p8P4Hv3thj8A9KnI5ScV2dXZy1W1/5fRfnGQrDQqfTLkaNRAZORwRcTj157d
         5kzo//ItCiu+ma+iPSyr7ATMhgPiCgiyKbpGq4HM743xeeMLSJgV3QWnKS/P0jz6a67i
         eK0g==
X-Gm-Message-State: AOJu0YyL4LWmZRAHrCVT3gx0AlGZ9AkhZIb2uNzPEcVcgzKkxVYehnN1
	tIMdQ5QDOd7TjrwdLGLHxSAxdsrWXh6bXsG6+l7f+tUYJztA+G30TmVgObtJf6EAwN9CULKKASC
	0
X-Gm-Gg: ASbGncusKKGyUdT+HWGzHXBqF4Ra5qwboKEkCTMmVrbx+4t1EYT7ZhghRqzpwd7jMIN
	7VoGeZYnR7nmK0DhTZbtiz11Fy27cnt8OXA9IGssCmIq1bNFJp2ll5Cnx3ekC67Lp7u/kbdvNWk
	nCVMgsuZW8Hj3fLC2OToEee/f6ne+98ZBVXL22LOJlYc+VOO4FiURzieNJZNEb7SZZ9uB5+qTq2
	h/mKmoPjZI2dnUbosceGD5awmTxT/UYt5FpE69T1i7haps1qMGPLzsmN+ebXE03I5v1mBUXicVV
	GIcbDGbFBz3SmaCFm/tYvOToRGhy3/Et7djHI1tLYut9hO4=
X-Google-Smtp-Source: AGHT+IHnRxcUFoQMg6SZ5auCs08e3T5ACXKGyloBNdxBjVPYPk8GVWZex9bOxRMNav6sVvt00W1aQA==
X-Received: by 2002:a17:903:230d:b0:227:e82b:b585 with SMTP id d9443c01a7336-2296c6620c7mr2360355ad.20.1743546992191;
        Tue, 01 Apr 2025 15:36:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] yocto-uninative: Update to 4.7 for glibc 2.41
Date: Tue,  1 Apr 2025 15:36:13 -0700
Message-ID: <eb89509bfb976cfb62369b05f55534615afaf886.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214158

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a6f7107dfe..3d0f1fdccd 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.40"
-UNINATIVE_VERSION = "4.6"
+UNINATIVE_MAXGLIBCVERSION = "2.41"
+UNINATIVE_VERSION = "4.7"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "c2d36338272eba101580f648dd8dff5352cdb4c1809db7dedf8fc4d7e7df716c"
-UNINATIVE_CHECKSUM[i686] ?= "0041584678109c18deca48fb59eaf14cf725cf024a170ab537b354b63240c504"
-UNINATIVE_CHECKSUM[x86_64] ?= "6bf00154c5a7bc48adbf63fd17684bb87eb07f4814fbb482a3fbd817c1ccf4c5"
+UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
+UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
+UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
-- 
2.43.0


