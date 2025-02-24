Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CA3C021B6
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 21:35:19 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.102312.1740432917614472621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 13:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HwT/WAd+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.178, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220d28c215eso75715865ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 13:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740432916; x=1741037716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bhB12j3BFv6Ary+kBW3dmwW94hktcRvybY/LIIE6CWE=;
        b=HwT/WAd+N7/H5R/eqxvJ5UJbMTeBYOr+pmtmCT5s3GA+uHWbuUwHCmwHNTzS9rGPfU
         yAWmmcjlc4UpbGw/HUHAlNx77xlYKIVtlTCEEkvB416WhaucVbq5yieD6L734KYrFRbI
         zmdKuKUmRbwS0HjeBr3DcidReGYHwo/LpO4Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740432916; x=1741037716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhB12j3BFv6Ary+kBW3dmwW94hktcRvybY/LIIE6CWE=;
        b=dEqbsPBnaL45AJF60VfTf5y90bDxBXmcTz0b4dsiN2ezVfMc4J7vxX3p6216qnvQj7
         Zq6La/33oA9k8xdgzf2+HQ+Kq76JI/2NHz8n6zcHIelLv+42iN2xrd90qEhiXviXg4Uo
         D515D+DHHJoVNqz9aRtK7oJZzGTlqhsxHsJaLZvZBIIKoRAMs8CxXeWexGt5IBTxHZnq
         yIABa1ddgdBGCS/ISEJQf8TQSG0J/FB5Dce/u6js6Zn9Pvsm0NWuiMLavXroEUMLDmVX
         yvdG7cYzBN0paw+InZZH1vJyMB4jZaN5uZCkCEWIjIHC7dE4xQVb7SCI1ffA3my/c2ir
         k8IQ==
X-Gm-Message-State: AOJu0Ywjq3biTQ+TYY7YaGsAKAfUIDJpvo3P7dRe1W+rJLa8OWCDvtfI
	QyCSl3qJBmV/O+/vVSvuSgmwR4Q7nigfeZEHOy5THP72yQ7+n3cShl21F+mPZ44xlhwHVVH3s+f
	m
X-Gm-Gg: ASbGncsorUjFfJ2aHfsOsnukGPRImnjHQIQtHfqiW2sFoRS9toWbkxqfGUJ6pRnSTbu
	NMs7mpo8BV1tJv6//QiHyqgfhCpdBcAR1D9SW3zjL1kyjiUHtlYlHNtSY5rq2hDK/TzWp5t8vUI
	UvdoeIAgUjzGC/By2aDifo1FVDBPORvOGyOpv95KPoWMatEovrsKZa5QGkiRAOkqrmVdN7sxWBf
	rmIVyuGXOnzPKAwrPCgGXQ2i51us8wWSHpGmgmwNFd8cVSocQ/BOz37l5u1aRdFzrILMzrD1Lfz
	n9K9++K36ujCcWsgaag3+Mkxm5jPaoSI0hwN6pmaiDU=
X-Google-Smtp-Source: AGHT+IGz9ncw28j652ZT1QlGams8zG/IUMWTgvsWyerM6lr8KfcO/dp9YR2E40DJX7s1A9w5k3tWDA==
X-Received: by 2002:a05:6a00:3392:b0:730:9946:5973 with SMTP id d2e1a72fcca58-734790a2af5mr1125912b3a.5.1740432916313;
        Mon, 24 Feb 2025 13:35:16 -0800 (PST)
Received: from yct-lpt.lan ([2600:6c55:513f:720a:518b:7642:b3d8:cc3c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda87685d7sm78591a12.39.2025.02.24.13.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:35:15 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.7 for glibc 2.41
Date: Mon, 24 Feb 2025 13:35:07 -0800
Message-ID: <20250224213507.42388-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 21:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211852

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
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
2.48.1


