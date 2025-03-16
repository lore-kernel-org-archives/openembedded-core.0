Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0257EC35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.31808.1742141579471699531
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=icBHfr/L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf257158fso8121495e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141577; x=1742746377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qElHCbxWda5VVfGi3ax9OgTGvLu6Ctd/PhMUjlDsUR0=;
        b=icBHfr/LUdxDx80foHwaw9Gy5IMnUCnr1Jsr9Q52ozud9/KtM0rwG7691/n+1oTSc0
         TroHfNa5qgnWyKEI7hsKlRei/NQofwt7OJ1L9n0ZRXzRhLGkqHOGgjpyCuHrmo491XD+
         x167gHHop3UPj853G92JTyyn6aWrEfDT+T6uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141577; x=1742746377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qElHCbxWda5VVfGi3ax9OgTGvLu6Ctd/PhMUjlDsUR0=;
        b=L3nsToKtDuJJ1v5Em/lzxNRUq35o1SnZaRaMvlyrIV9PRQO86ae6N6bIreFKeFDd8T
         4sQAqR7CH8TiYdDJNzEhrjs4X98Bd22CLXv4JOu6ezEIu2BijEUnav0U3E2vHxFTalCi
         H5CIYpI6CVGLvp5NcvMe6yfggdgeovp6ygOv2TJ/1C5Q4Zo/UVQFR4YsI36CDkQNR2iC
         l7eONWMX8UywYuKmiq7hN0s3nrjqnb0kIgELdVJ5UKeNutYYAOnnppjMKuxrQc21NMlV
         v9071C4t5DCnGMXgSuur//MqCVqCVLkfhsFcvffNjTd99uIWiUSy4GKl4EgypkIP8Mbm
         AJxA==
X-Gm-Message-State: AOJu0Yxi/2hfT9xI9kWQwLkY38+HOhhD0xl+A9VoCzg9EWZtrHgIGZaQ
	KAgMi3I5tg9W2AVAvTNYK6i6/39or4RQVpO68Cc7bQNMyVScNDUrY7If01Ee7MmjqyOizVXkZ1Z
	r
X-Gm-Gg: ASbGnct7DFeQLqa3Wa3aaiOqQEfG8mB79zhTizrxwYPzlao4vJj3BkFY9ctwR0YDDX7
	xsDh1/ACDDtqBiLqGzMyPjfcWe+PWy5buuMRJ+RccIGnQ4GU6HNBi+y4+nnPlwEMyOBMW5O3Jqn
	ZkMk4bsDD8+gvK5WpD9BoUWnGb0Rp6W8xuwKibz9sTyaZdVFSamZH8TQ2mON5OgFx6hvHlHZ8+l
	fhg15qJIbx6aWpJm9/ztXVwWYe08sBD3KwPVv+tt2bAwXQuFcMlJANC6xHIC1PYFakYdmDuRvgB
	MJ4TTk2mMAY15rrpvPix/C9RCzGCi0vpFuxeYsTZ8YP8nhMxz1uFaU5Vgvbpb2Btq/XagotM4g=
	=
X-Google-Smtp-Source: AGHT+IGgskoMFZTnqK0m2mtd07tYgN8IkseKSo20szYdeNWkUpT3f42vQP0hNjE2BKXLnsgssdPfCw==
X-Received: by 2002:a05:600c:3b25:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-43d1ecc767dmr109521625e9.16.1742141577511;
        Sun, 16 Mar 2025 09:12:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/43] sysvinit: upgrade 3.13 -> 3.14
Date: Sun, 16 Mar 2025 16:11:58 +0000
Message-ID: <20250316161209.3629986-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213035

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch           | 4 ++--
 .../sysvinit/{sysvinit_3.13.bb => sysvinit_3.14.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.13.bb => sysvinit_3.14.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index ece870c2693..1ac54fb6675 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,4 +1,4 @@
-From 19a8777c81bc451d65a4071528e4715e19941e0a Mon Sep 17 00:00:00 2001
+From f040b04c50d13755b2063c4db0e0be0647cf5d14 Mon Sep 17 00:00:00 2001
 From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
 Date: Wed, 14 Jul 2010 14:35:52 -0400
 Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 2 insertions(+), 10 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 4ce4889..1611c1c 100644
+index 6d9f01c..b12a233 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -97,16 +97,8 @@ else
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.13.bb b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.13.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.14.bb
index d935b0edfd4..521eda0bfba 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.13.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86"
+SRC_URI[sha256sum] = "c90874b8c054a35991fb8c4d30c443ed1e9b1815ff6165c7b483f558be4e4b53"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 

