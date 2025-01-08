Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F2EE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:35:02 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.22010.1736350492538674258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FL7ocv38;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b9ad0e84e6so1699037385a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 07:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736350491; x=1736955291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CpvcByd6UGOkRwZTQusI08qclBR+hUwqSMuMBwnO768=;
        b=FL7ocv381o+uYBeEtf9eeZuo9ZYFZ7EGVGKd2k4EMKeQ7CAZ8pw+Ewima/MuLgW8oV
         hNuJOjZcFEGf2kziabM162WMde+QhjiTeDg+hqYfRhUYRqXq/7H1DucEj9sVPMdN04EA
         okg3JV2YyvLxiT3h8n1baHO+ob+mEbNTt0lwWx9/E7JKRiXKsDenlBehBnTqcdoGx5NZ
         nTyj4PGrX6yXvM2uq15s6Gqedj/A9AxhfDiTdhQpQ0ixJgiseRwCTi7rmAO67hKAXBxS
         diSBmK8nDK242B+ZOFLGNX3Bjp3gqhbI5EO+MB+KdVlMLfpKTI/Vt+2qA0sR+RHRmDyE
         Nphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736350491; x=1736955291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpvcByd6UGOkRwZTQusI08qclBR+hUwqSMuMBwnO768=;
        b=OnKAFzl4SKkhUHZ32ONSfV8iYmXxETbbhgwtD0wQt6B2u7pTx9OlLKQV6DIOzHVYil
         MGUSHfNAT7B2jomqhVNERaTNwhLSOpwWfVETsGtl+gxZYV5YSP+IxG2gXQ3TwLdokBTE
         JwWnGpaV5PqPf5VFRKgoTY7G1SkdysDot0TA/lVpBVl016XqBIK1yr7ELhWISewesnWt
         NWMA0KBkl7ebUursNgM1AWY760oakpR1lj7ecnBWT/EOBpPrEPUxq20iQj8AIKS0AMxC
         R6ZZnpaqiHKiSWOBrsfydtmq5oDeWRYA4i7ddafoze1Z9E7Lq3kGmQU9imM6ljnoTiMM
         eVVQ==
X-Gm-Message-State: AOJu0Yy5gcgJ9/6rlBL5IQQppyLQdhwTGj8MOGZpp41IfKySErqcAv4j
	URPvi5TFSQlP+UFaqqddcr+xhuOpyRfBHJgjdDyXkBnBdEoe+Yt7
X-Gm-Gg: ASbGnctzYUu68jrC36DUge0NVh8dQo+PBloioNTdOtdOt8VSrDozQwgm2chak7AeJUo
	SB33qqmKDrI+10gzQ2/pZbFZ0vtZrmoJH2120fp7w/AeEyyDGDxi+m+xg3ApFCua9cQEdqNdIW+
	RFPVXOeHb36/5XddF6r8f7Gfdor14J0Ize4Ho2VokVRDoj2tjjSbbJ4ferJmhlcmKLYa2FHpoa9
	v4k7sGO4aOfT1FM30vEvyYlp8EzhZQr7kkrbFLhhJMPciXKW9RNXZE4np9LUvim8FGVRZtO9o5v
	gxIdm6uqN0UEEIbj7Eb7Ql6KOooDPEMWh8YxFedO5QwF/vnGxERReQZBWw==
X-Google-Smtp-Source: AGHT+IGdvE0nyUFwWK/dOa70ftJiOIGS2l4bjjgTUmhiiSMw7j1CWiQUfZbYoEdw20lQwTBRwh29Bg==
X-Received: by 2002:a05:620a:4092:b0:7b6:ee6d:fc09 with SMTP id af79cd13be357-7bcd97a6f98mr447385885a.43.1736350490776;
        Wed, 08 Jan 2025 07:34:50 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d9esm1691867485a.77.2025.01.08.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 07:34:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: update to v6.13
Date: Wed,  8 Jan 2025 10:34:49 -0500
Message-Id: <20250108153449.280903-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209567

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Some tightly coupled packages still need updating (we are
waiting on upstream), but there's no reason to hold the dev
kernel update on those packages (core-image-minimal is working)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index c2d960d163..8a70a7afc8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.12/standard/base"
+KBRANCH = "v6.13/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.12"
+LINUX_VERSION ?= "6.13"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


