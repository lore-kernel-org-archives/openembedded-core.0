Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BBBC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 20:57:57 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.29287.1721681868658665227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 13:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nk4ypR2f;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a0403a84aso1302966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 13:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721681867; x=1722286667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulno/S6SvqBbgFV5vaCb35Ny1HYBuUnzRBsnSFPsd2k=;
        b=nk4ypR2fpmtfZyBg5ZJN8EgX1T6309TVH412+bu54H1XxdY6jB45pwG766ISlr4zun
         zWhKrc0wz7IH9k3D83gJTd6wr9WL2uxtNT5QGhrvde7LRQttx3SW+R6UeGWpZ9kY+i9V
         vEGK+JhCcNR+5yF93wbn3MwLS1+QQY44qSpYUnHSDrOXasajnmbyY6zrJ/gRDY10FK/5
         wwmuUZut5+zztqkLf/48mEFUt798sNVSmd5HFBT8LVppj/G4a3l31BQEucM87Rcy5nmQ
         DiiZIl5n4YZLL3VDW1a2wqtMxoLwkpT3kEpO3MokT0krYAhHkGp/SNDGT0ZTv0AUqcBk
         ec9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721681867; x=1722286667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ulno/S6SvqBbgFV5vaCb35Ny1HYBuUnzRBsnSFPsd2k=;
        b=F+aHx/0HNf8deoAjhJzmwtfYU+ny6BMFlq6d9Mx7FVhi0MJ18D5rQMpk9Mz8ypB/pJ
         a7RDGkaBPv30zj1OB1yVfRPtvsY0KpmTUNJfkPo2srSjnHzprt1iC7eKYxSAxLxg4Y17
         zDGZ73Cl8e4GvyaYG8nZTd9DQfpDXsxKfx0fHszdpMNnD0eECaTyCWUtWW3UOdJFvKey
         eGAfOFNUzoxxzR7rdbQF9c1Kzsjt/s9mR/mkLhmKFgcHF3qpJEtH/r/TsPbbRTSqOrx3
         iY3hxWHBAYsAsVFQkTg7QwdDkDRl0DV16AYjR0t3d5BYPCEHTA8GbRkLfXOTDeuK7OXE
         P/Ew==
X-Gm-Message-State: AOJu0YxZK5DeXcUW5YUZ/O+emNL+jgBNI63MKg21RGIQlkN3KBKZ8Ys+
	SVbo8/oVYJAAUd3diAqSiLMo9lYOWXv5NpZ7GSuo7p1Qi+guRNtcIPPjIA==
X-Google-Smtp-Source: AGHT+IHVd2gujjaGIV/AmlcjW1l3wmpQPW2kx3dNMip3DBqgpsRKV7+NTOpE/VQGMk5oME7tMpYkYA==
X-Received: by 2002:a17:907:2d8e:b0:a7a:87b3:722f with SMTP id a640c23a62f3a-a7a87b374ddmr42611166b.3.1721681866314;
        Mon, 22 Jul 2024 13:57:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5af7df.dynamic.kabel-deutschland.de. [95.90.247.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a83b0a0cfsm48258266b.132.2024.07.22.13.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 13:57:46 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] ethtool: upgrade 6.7 -> 6.9
Date: Mon, 22 Jul 2024 20:57:02 +0000
Message-Id: <20240722205702.46709-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 20:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202323

Release notes:
* Feature: support for rx-flow-hash gtp (-N)
* Feature: support for RSS input transformation (-X)
* Fix: typo in coalescing output (-c)
* Fix: document all debugging flags in man page

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch | 2 +-
 .../recipes-extended/ethtool/{ethtool_6.7.bb => ethtool_6.9.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.7.bb => ethtool_6.9.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 69df8632f2..ad4aabaa96 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -18,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index c871558..8ea1eaa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.7, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.9, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.7.bb b/meta/recipes-extended/ethtool/ethtool_6.9.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.7.bb
rename to meta/recipes-extended/ethtool/ethtool_6.9.bb
index 33df0e0e80..1837b1ed1e 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.7.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "ace0e95a03b38208af4ebacb415244568ace44c5d5a279ea434844f900179c75"
+SRC_URI[sha256sum] = "0011fb1b20101879f2d01d39cd2bc1d9646990d07d64de893415404a3afc53ef"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.34.1


