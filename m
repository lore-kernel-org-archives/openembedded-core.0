Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0468C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2231.1743577842529165153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6msBm+f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so63344535e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577840; x=1744182640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K/nlqCGMyqohTzMHpMxrYYOcylyu9/mk7xKkbIH+gY=;
        b=b6msBm+f/q3XBUnbmy0NQuuFkYXV9inUH6jYCbyQD/AAmAcUJaeIbc1VEIkufAkRZQ
         DRzUNp9FmLO1czHG/O97yGGW3NoKN6LRbl0TpMyq/Dbzbm4U4NZ3k/cjQO47TLq9wLvn
         zQq1gcPb3CLsVERYqwe9hF+OvzfgC9tVrnrPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577840; x=1744182640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K/nlqCGMyqohTzMHpMxrYYOcylyu9/mk7xKkbIH+gY=;
        b=BbG3762eZTwGpElg8FLQa38SlX8axCNf4MrhtbeQWudwVFnTY6Mxr7mtKLbLEnfyxs
         orbw2nSvZmwiUEZIIrcd887nEuRJeBKcBdV8u7A+0ouO/cOfezPK01Iq1CqbKDO709vb
         WlJe+AGxgnOw/6jph2cLsJJ1d77Hi5hXoCNVQ1VcfBILoWWe34V9KOCYv+BKhwLBSEKG
         3eZnr6mI59fv8ctJXqy/zGugujhGFMKihy25wgFbHQzgBQJmvVcl2ScMP1ijyJfHPU6M
         f4C1tRhT4vnApa8om5v7bzMhXSlAfy+mcm0GpqSe69PA2r2WxPwOIRPtAqNIuxbWwP7Q
         YiJQ==
X-Gm-Message-State: AOJu0YwKkuU3dFcMavskvYxNnTfuqTNHlC+Jm0QUtMM0I9zn3iULbvC5
	wEgfjDp/RGQTQT5FK+DUQnL9q7L0mCtTOY9+ia4y1Es6HPpITkOh5SvFEtHvBfGKwrMSrwEKZcH
	c
X-Gm-Gg: ASbGncsj0qCIX9D3462qnZ7N+tmRibu7MgI4chgFf6ROiUFAky6CKEZVroVVJ4oSF99
	P1atWsaT4iE0W25TQRnHK4fThUwSxxitgNZKrf5L2cJlNadJ7I2/InR84gY8Iiz4ZNJXetOnap3
	6sipSdDxzbI8JzLjItR/nZ6VVZ2PJ2TQafMS9ud+QXTfpe4ttSZP20a6DbHAMLn5dTzBliR8lNN
	rifPCs9j1CmhYoaL3c6YYpBk9ygSlEj9IdnZgNFLN/jUI9FO5J8pJ/1k5jsePuQKn46j9JyY9Vd
	kZgFaC6yLoUygqvy2/EzTE/AMYfCzYgHwGNkF8ZZwWxyQjDEo80EtTWiTNk5Ov1Ln/nm1oHMPQ=
	=
X-Google-Smtp-Source: AGHT+IEKLEsoQbLWVpEJ3nuahtl1srzggAmyeKYfrhBpBnwKYFipTmTSYU6sovVhmE4QCHaTt16a7w==
X-Received: by 2002:a05:600c:8117:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43e8e3cf858mr150451335e9.16.1743577840377;
        Wed, 02 Apr 2025 00:10:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/48] createrepo-c: upgrade 1.2.0 -> 1.2.1
Date: Wed,  2 Apr 2025 08:09:37 +0100
Message-ID: <20250402071017.2157620-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214181

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 2 +-
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch           | 2 +-
 .../{createrepo-c_1.2.0.bb => createrepo-c_1.2.1.bb}          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.0.bb => createrepo-c_1.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 1d2e81f281d..ca3f0782a8a 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 5d974eddfd59291fbbf9bf9b352431d8565011d2 Mon Sep 17 00:00:00 2001
+From 20aec3f83a7ab6ebb89f40ee8c5df1af65eba32b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index e7f3d32e088..4f2f780a641 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From d1a474e4002b978a54c918d46423c35bfbadad8b Mon Sep 17 00:00:00 2001
+From aa508662cfa48f706bf68ace55ed311a9e820d3f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
 Subject: [PATCH] include rpm/rpmstring.h
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
index 60523d5318c..d12e3184a04 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https;tag=${PV} \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "7085e047dc9f58a1de6ee6f3faf733826e60b963"
+SRCREV = "8c6e6f88df86d1e34ca26d3835d77a2816326414"
 
 S = "${WORKDIR}/git"
 

