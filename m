Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4036C44509
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155315.1783358252463939411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dPOb/LdG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so36382125e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358251; x=1783963051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3OKlcYsIYdjEbqc6UwMfkiqnT1OxgvV64Dts+AmENk=;
        b=dPOb/LdGG8c2vRdS99owYxHaRbKRF72NkCTQajec/hgwI137yqef6ruZxnhmd7Rg9+
         ON/bV/hPQm9f5pplcLQz9tp/ZJWyprOHNftkoK0jWqgr2JVImu3yLzA6flNM0raL08cQ
         AI7CFOs3XxxGda6KRQQ/oaRmXs/WKBumG9ARHTloDN3dRG2wykV4tUqjVRMFbKOtEIs2
         sppzDauW4F7JfLgwPvnYRFB7Qi98VlfVWIRRxDHEADzwzJMTFGdNIssIY8royfe74TYN
         fnXqalqPyuXipVhIdji2dULyaQMQBm/5AbYxdyOvJdzAUl/6oBwYd2tstH+/AErNDqRz
         hUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358251; x=1783963051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3OKlcYsIYdjEbqc6UwMfkiqnT1OxgvV64Dts+AmENk=;
        b=j3ziVPoDlwzvc0hcG0xXka78sKNre3dCIeIx9pXWCfIwaXAwNHvxq8l3+jcXiKEEY1
         BoczlEX306Wp2u26b7ws3QcBhuce1bl7IvyY3QQ7q3NuARF3ITyMBqRuc1slM9Usb4g2
         ZFctqHN+xzCEVwRl8IqFd2NCtrNGHufomtR6oT744spL3LFabgkk9qI5ipaq3uIk8uvF
         Wh7Iopm+nSZAdZFiLEwZ4Ru0Lxji/nWMyXpxSN5v/Yc16GsMeUcSdGZ8MBFgJUI8T5ej
         IcmWD4mLy9w2gYzpOGQJyyl1QexwLk5H5cP9f8xHwFRaq6Gv5kCr+5ost4ZV1y7HNKYN
         dYKw==
X-Gm-Message-State: AOJu0YwfRUMDIhkdj5CVeCY6zalhV4+H+ONBVea/cSEOcBy197im3E3p
	Z73iTi3X/PEgUJ5fKsAMRAiZsGKlPVmLQb6F4f4sGbU71hNpii0IInXMina5qg==
X-Gm-Gg: AfdE7clAPmvuLv8KaMkbMaDmEZPW4M6A236PygDPfdpSPvSZ9We0gz0G31H4nS0c7rS
	lt8BMYMWLoK7LxJemggdNSlfT6m74lR353/bcv3YRPDRqrsN+QKfbDl26rWxT6fb9tVcU5m/Bnf
	D80Km24mMRcQt0K3CFwH/wKAxvsS/YhmJ2l4plj7pzeO0e7Z5o/beIeL9+MV5/gvJUZGENoPENg
	RM5EFuFz9CZu7Vr/KNTDyKzTtbT/qFPE1dYtzKmnvbkKXwty6dZt/ZTv0kACBNIC5TC0pWDPJnK
	kknkPX4Hhzl6wiYhx/SAXtTc0MCWtjQ6haSjiPRJU3hO0/wZb6iE9sIRUNgX3aPf1EhBlYaGECd
	89bttKZUVHF8T+1cjPOt7ADR9Ras3xlggZCn4YCaqI84wRi6Bb9eu/R2FEi8tIPlINLOS0PqXsk
	bh5DSdkyCiBYPTnZOg+dPJk4VAPw9eqA9/bbC6q+UMXr03JJY+
X-Received: by 2002:a05:600c:19c8:b0:490:b724:507d with SMTP id 5b1f17b1804b1-493df041be3mr17646215e9.11.1783358250607;
        Mon, 06 Jul 2026 10:17:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/45] python3-pytest: upgrade 9.1.0 -> 9.1.1
Date: Mon,  6 Jul 2026 19:16:43 +0200
Message-ID: <20260706171701.70536-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240315

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pytest_9.1.0.bb => python3-pytest_9.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.1.0.bb => python3-pytest_9.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.1.0.bb b/meta/recipes-devtools/python/python3-pytest_9.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.1.0.bb
rename to meta/recipes-devtools/python/python3-pytest_9.1.1.bb
index b61e86cd00..8c97596ccc 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.1.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "41dd9148c08072446394cefd3d79701701335a9f4cae69ba92e39f6c7f5c061c"
+SRC_URI[sha256sum] = "1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.3


