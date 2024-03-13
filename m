Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8EEC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2098.1710351234444307853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AokdNK1d;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-413e99afcc8so890715e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351233; x=1710956033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU/tjDVQSz4deDPF4kUu+IAFzJkUX7m1VbHzFy0/juY=;
        b=AokdNK1dRyWCp1HmZvibZIMYahfND6y+f5arx5LLDXvufk3jt5bDhxNRcdJTtlRf7/
         rgA1zNscj+vcpudkFN2+icpwW7UEVNzbz65L6nYxaig/LLgN1tX08jS+Zw+rOuVkYRnJ
         7DQ9VbnCJ0XPg56HjQTnPdJWBN9GgNcnzMW0DGjsMBeaVFhTOxofuYpeKdOaArrw3RYN
         S9ZwlRyeRicxj6Y9OZd4H1XjdxJR7UkochZkXLn++c+ufOybd6W3ifrKW2C7g257Ofpk
         ZgQ8ZpUGPPAELozsI9s0LVJ4m/QfSCbVwFGmoMFInQVGfV0SVhZexsr31IHwRN2vvYTP
         mThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351233; x=1710956033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QU/tjDVQSz4deDPF4kUu+IAFzJkUX7m1VbHzFy0/juY=;
        b=Hr7FqQk6R1FzcbQA6mcxHv7Yq+89BcfqvS0FIJAc/KyvNi4ZVGzBHta21dd/0FaVpW
         VVGES+nQhzTr5F8dPK9MwMcRQuUao3VKTsn1f9w7UmfWk/2AXcRVyKpRXD7WySPVw2kI
         OFcNlRBhrTKR2ESJw38zXkLYgeXR6Xn5EBssWFXGZ9cdxc3fmxbi1NIDmxYTpypI052t
         XxvXlK30e7AqT3cLn95MwPyBbUKbtbUeY/UDbaKNUuTBbTzSRKXM6ipC1zdX1rB3xtCH
         CWqeH/lPtZMNJLKfuSw1bBuCL57xxBqYcijceXsR8XswLO69scnU+AtBmIQnCJEjkxsB
         qrJg==
X-Gm-Message-State: AOJu0YwZ7eLGMzTqKgbtIxGOHV70YsP+VnpEN4dg4t2AnBHWvk9Wp0hO
	SMylMctsfyMlb9VvnHvd1Nr6Bn+B9poK3mRjXpj94sFwxTG4reFpAJyVJv1T
X-Google-Smtp-Source: AGHT+IEatskxjv82qMEXyIpartPhLjaGaKgBlvxqcg7FvQcmajW6gucPtwk7EnakZR2u7WdLy/yopw==
X-Received: by 2002:a05:600c:35c6:b0:412:9b49:11f with SMTP id r6-20020a05600c35c600b004129b49011fmr495005wmq.2.1710351232890;
        Wed, 13 Mar 2024 10:33:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/21] man-pages: use env from coreutils-native
Date: Wed, 13 Mar 2024 18:33:36 +0100
Message-Id: <20240313173336.3900178-21-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197073

This is the outcome of investigating the selftest-armhost fail:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3028/steps/15/logs/stdio

When man-pages recipe builds on ubuntu 18.04, /usr/bin/env on that is too
old to support -S option, and the outcome is that man-pages quietly
installs nothing, and no packages get created, and the test
that expects the package to exist fails.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-GNUmakefile-use-env-from-PATH.patch  | 31 +++++++++++++++++++
 .../man-pages/man-pages_6.06.bb               |  4 +++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch

diff --git a/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch b/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch
new file mode 100644
index 00000000000..a644d24328a
--- /dev/null
+++ b/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch
@@ -0,0 +1,31 @@
+From fbf0544138af02be4d6dd3085e7ecf98ad060bb4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Mar 2024 17:30:02 +0100
+Subject: [PATCH] GNUmakefile: use env from PATH
+
+This allows using env from coreutils-native (rather than host env),
+which resolves the problem of missing -S option on distributions
+with much older coreutils such as Ubuntu 18.04.
+
+Once all autobuilder distros are newer than that, this patch
+can be dropped, together with corutils-native dependency.
+
+Upstream-Status: Inappropriate [made for obsolete host distros]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ GNUmakefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index 1234194..65ba327 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -21,7 +21,7 @@
+ ########################################################################
+ 
+ 
+-SHELL := /usr/bin/env
++SHELL := env
+ .SHELLFLAGS := -S bash -Eeuo pipefail -c
+ 
+ 
diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb b/meta/recipes-extended/man-pages/man-pages_6.06.bb
index fa2e6b266e3..0f091bbd7d7 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.06.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.06.bb
@@ -19,12 +19,16 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            file://0001-man.ml-do-not-use-dev-stdin.patch \
+           file://0001-GNUmakefile-use-env-from-PATH.patch \
            "
 
 SRC_URI[sha256sum] = "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568"
 
 inherit manpages
 
+# can be dropped when ubuntu 18.04 is not in use anymore
+DEPENDS += "coreutils-native"
+
 MAN_PKG = "${PN}"
 
 PACKAGECONFIG ??= ""
-- 
2.39.2


