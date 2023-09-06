Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C74DEE14C3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.4106.1694019406751751673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FQxoOoPP;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9a2a4a5472dso253874466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019405; x=1694624205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEnfuPK36vrk/tCKShdCZ3N9HmiNTXYKsXowpVNgNVU=;
        b=FQxoOoPP/NXxNhfsaluB3yG1LCg6L5gkq6eZVT8Z2OhQ9kTz8h3yeua9cgBSIh8A+M
         /dp6ZM9IDsE/KAbb8c9BdV+fHnicoTzXaAFlr6VyfVF6M1KCZMmsiEf3xuNA/BD67TzU
         OR1uPFq0QBE/4KV2cKNnv1Hf6lvtRK+k3y2XpKIUbenQfRTLnJQZFLWWpJKHDyeIsXgY
         IoEa5l+zvh3oCyQvDiiR+HLcdlpwXo3+TInDIGmumb+GZ6n0RbU4z3J4/Pz9kEsr0MBt
         j9zab4khYQ5oshc88WUFnRwSwGWBAwHKryIs1C1qB/csds/Z6Nbnv0F/5OV1mzI/bQu0
         lkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019405; x=1694624205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEnfuPK36vrk/tCKShdCZ3N9HmiNTXYKsXowpVNgNVU=;
        b=Qu/xa54pWuqeh8mHckReHfN1H6kVyw4tVHEqcIhwwtz7JG7obBM/ycnDU/95slFh7R
         k3t4CMEQQOoAbC4zou2jdnWgfnz9FBztNFeysGvFqODhT8HeZHkB5YJWOB+7TxT1TlFc
         6SnEzezeqrOYVvHVq6oYykUYNwsjjuuJJ5+cq3sfOSzhuj5ljJEbtkgCyLAP3e632rnT
         ffxM6PduRc4La+V0e1VpCHCKTePX5VS/fkvtXablc73uhkeMpG3PeZXxsHoi0JmG2wlE
         cD9Gb/b4co8V5BQHYlJLdbKsF6rdyQqnNAk3EY+D4v9MDu9FCkKCEglOussJ4UJPsDzE
         lmKA==
X-Gm-Message-State: AOJu0Ywr7ww2O57uwC9vMViPPziJjn63+acCxwMGFvv706gaGtWMnBXP
	oWm4HY4rMJUE+L/aTMPTQi/FoDs5L3s=
X-Google-Smtp-Source: AGHT+IGPtrwQUobeHdkTdz6qTNbo2/IVgIuGy1cxvXQOxYjARBK8dC7utxyESBkwIPOLBVHX5LKnZQ==
X-Received: by 2002:a17:907:2d92:b0:9a1:fed1:9b42 with SMTP id gt18-20020a1709072d9200b009a1fed19b42mr230218ejc.23.1694019405244;
        Wed, 06 Sep 2023 09:56:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/17] libpthread-stubs: update 0.4 -> 0.5
Date: Wed,  6 Sep 2023 18:56:25 +0200
Message-Id: <20230906165633.2382629-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187331

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libpthread-stubs_0.4.bb => libpthread-stubs_0.5.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpthread-stubs_0.4.bb => libpthread-stubs_0.5.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
rename to meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
index 7bf702076d7..62384e6d2ec 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
@@ -7,9 +7,8 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
-SRC_URI[md5sum] = "48c1544854a94db0e51499cc3afd797f"
-SRC_URI[sha256sum] = "e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
+SRC_URI[sha256sum] = "59da566decceba7c2a7970a4a03b48d9905f1262ff94410a649224e33d2442bc"
 
 inherit autotools
 
-- 
2.30.2


