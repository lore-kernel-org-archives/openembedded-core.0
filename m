Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D36DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:30:27 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.16862.1738168217259054108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBucfqF5;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so15929065ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738168216; x=1738773016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsPCtik8iV3bLrpghUn/FgMKQmbYallT9dQzzISiVyM=;
        b=MBucfqF58WZJB0e3buEkTK79bGVoggs4MCFc85B+GGxN+gFb3uNKAGkQzaUhKhFU0G
         IMJFrnqZaLc7AYxirR1KZDiP3xQpK/Ht2Hn/IYb4VpADbExZDistrYdfv4NJo1PcMYjE
         16wsk3XOrChj+VCMm75mWWH+1tu19aJZudgjx5DxEqETBgmRY7CqTEpR42ezYN45BNBH
         b7PuG6qaz1im7HUyvDql52JIkzwsuZhnGu2BVRdQkdzwbM6r8uSdAh3uh4qsHkjL1XBD
         aM5hrMXJjAB0MZMwm8CiQ9Lfeos35zmpeG7mEIT9acnuweDUYAARG9oiBqN329UR7MZR
         EeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738168216; x=1738773016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsPCtik8iV3bLrpghUn/FgMKQmbYallT9dQzzISiVyM=;
        b=Cut2oNavw5D36e/YmhCdSbDysaHMGR74HPvXfnf5LCA7EeueCaA+GuYyrCI4VTqNRO
         WNvGFG1hnZTCfaL+JPBeq0X10D72H09HsWDMpGCcSUygheuDlko5aoMivOy6HjQtMF5b
         1KjM65y6cQ+3LLC6LFZ+n+iXcn+JYrxsBXHBQoPmt+0/M4tzpYlvZkm7XT4IoPRrSf/1
         qV5+ywuXvPCyFbBj9Pgtbr+PDs+ni3BdOeKNo82XGbSFJEva8xuD+EmVhvJwn0Kg6azr
         oTDwSfOnTgCERYkoVAzYc1LpiN/QjR+9AWnP8MbVv/cGbTiwj81AD2BWQmjgLD1NnilU
         sb3g==
X-Gm-Message-State: AOJu0Yw+/1MkRtiQExZTkLKJ6La32/wFKuhn2ChVQ948MwweXJPEABEO
	Bzz95m9PXIcT2I+9b8Y+/u/4AEPcYh6svHRcTmT5vZrFChOi/B6+ac53Bg==
X-Gm-Gg: ASbGncuGl7GqtIfXINSulLy03skSeOZkxDVMHKSOJPO08rxv4JLTGYcKug945a8/gJL
	3xhjCOe2RdH/kyUygT8atbw9KB+y6McRSOfJ9Yp2hNXZLmMs2yOHWXV20P53+A5G6EFoy02W6qo
	KIj7U13PRDFilFnf+FdNtAysNOzmq86KqpV7YGRZ8QeWIhGKF60CinRbT0mZyLzmxlEgjmqGUew
	VV98asurENcI6KQgbpDVtuvSHkE09K5iRWXfLcZQYRqDQONixj2AiGKWz29S4PCm3axx6DdzEbT
	0XGeavnfTn5eQ1TiMgkDN9393yZoZWGbUw/VUvV9JETevwo=
X-Google-Smtp-Source: AGHT+IGMWcxo+mBxFePb6YPcy9iQfHFmZ/odIMg83cpUGVpc+hIORuVeRTLYzv5TBVARcYhSe1Vnvg==
X-Received: by 2002:a05:6e02:1645:b0:3cf:c908:a1e with SMTP id e9e14a558f8ab-3cffe396c95mr33540955ab.1.1738168216262;
        Wed, 29 Jan 2025 08:30:16 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3cfc75050b0sm38459375ab.63.2025.01.29.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:30:15 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH v3] util-linux-libuuid: use util-linux's CVE_PRODUCT value
Date: Wed, 29 Jan 2025 10:29:38 -0600
Message-ID: <20250129162938.35197-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <181F354F7FEC52AE.31881@lists.openembedded.org>
References: <181F354F7FEC52AE.31881@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210392

From: Daniel McGregor <daniel.mcgregor@vecima.com>

util-linux and util-linux-libuuid should use the same CVE_PRODUCT
since they're the same product. They're just split off for package
dependency reasons.  Prior to this patch the libuuid recipe gave the
wrong CVE_PRODUCT value, causing some CVE check tools to fail on it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 56162ab1479..580ff488e42 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,3 +43,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            "
 
 SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+
+CVE_PRODUCT = "util-linux"
-- 
2.47.0


