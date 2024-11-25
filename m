Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B1ED58087
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17210.1732536099906635616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MxR/uv5I;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso39599135e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536098; x=1733140898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijEZ5fy90zJFSDltcoXZVe2ZYNcBLMWrhXdsZ/vxlFE=;
        b=MxR/uv5I8tLLaK2FV1Kd/IBAP65a2Q2t0Fr/5N1+8jOlJ/sm2SHIUG7apO6m+eekyu
         064mbh0FuyDPYHyEuRY33D6nonBw7WL51R+l5NtWXnjnn69u8BSUrcCE1MwesEgkj+Ht
         nv/vNynPVeLAxN40CjH53MQLno/CPqjjH9KeVEgcSzXJckDjx5oL9I5Sx9Obb2b41xsy
         mNiR+/woY8UMPexy9OQAl8pEAPapYi4pd46ARK8NMUfIAEL9+Xk8OlGYzXh/FTPQ/23C
         niZy00zegfKjD1r8ou2aR7LAcdEGPCmf/uuGWlcdVAVzWkE2l6jirP0cJDAEwLgJHlBB
         tbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536098; x=1733140898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijEZ5fy90zJFSDltcoXZVe2ZYNcBLMWrhXdsZ/vxlFE=;
        b=wBZ+O+5TFpi2UhY6ILilcCC2IaRPLAXEwf357P1NZNCWcnhGctjgA2MuPskhhmFngO
         6qXa+uQrRmmIc/LyMyi0QiMAb7j408kzOn8fyV2Kt+lbb7aKaQiRg5kc2EZKGC6h4wII
         gPhQ4oqfI2qZ8KRImKiQf0fj8Gu/gm9JrIVirU/BjTombEoFrtHYtNTbzz6Rssb3Jsod
         EzfRAl/Qh4H+/PqB/07af4JXlrzJXZaOEEvA6anYTP7begCYGXJ0aJQj4DAIBvAndB9N
         UuuyCWjUTtQIHiMyWWbuWdD4LeS3131qS89NPLFGY7AVpmGWL1eAXy8REo8P0Go22NJt
         fmeA==
X-Gm-Message-State: AOJu0YyXdj4BVdO+3Z+KMfptP6cAwWgJo8g0Ps8XheWSUYOKhTtxZ5aB
	nl4YJdyra7OMw7KoknOx4J+CRpdSORheGtWApxipXPXeW/Jhh4jRMb2CUw==
X-Gm-Gg: ASbGncviGVvlxJua0rWqi3omPALkf91UAdp/NV2h+Tf2iCixTShEYBnEK44ZHEALtUm
	Q8uQMb/KSWZ2AuHVtdRMCMBV/YKx3PzlWaA0BsWjAE+3pkau2s8BqrNW7517JmShT0Fim4gBOKh
	7RHXAcSsDHyVJX9JTRW7wL7IcbouFKXZH9tg1vS8i/V73mM8NFi5FiPlS+QejrcITofDy+fhF/K
	TKHxGENZjaOiaBcYNIPfXCzql8nJ1v4wevh8YPKSkGG3LwDeq8CQ8jPhGSbUyt2GwQ6intZexpM
	Wz7u/gHDWgQ=
X-Google-Smtp-Source: AGHT+IHRE3LjKzK4JWEMvemjc6mg7qyAp0TeDLhKt1Xe5O0Ph4NvlULbTxWBUKGyMvntB/5JBv00Sw==
X-Received: by 2002:a05:600c:4ed0:b0:431:5a27:839c with SMTP id 5b1f17b1804b1-433ce413d7amr102096475e9.5.1732536096679;
        Mon, 25 Nov 2024 04:01:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/35] libdnf: upgrade 0.73.3 -> 0.73.4
Date: Mon, 25 Nov 2024 13:01:02 +0100
Message-Id: <20241125120127.2205232-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207757

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch | 2 +-
 ...1-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch | 2 +-
 .../libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch       | 2 +-
 ...4-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 2 +-
 meta/recipes-devtools/libdnf/libdnf/armarch.patch               | 2 +-
 .../libdnf/libdnf/enable_test_data_dir_set.patch                | 2 +-
 .../libdnf/{libdnf_0.73.3.bb => libdnf_0.73.4.bb}               | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.3.bb => libdnf_0.73.4.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 52e74263719..0bd5eeb1dae 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,4 +1,4 @@
-From 09ff4670e0717ea1a79430c14e108f93fb6f5f34 Mon Sep 17 00:00:00 2001
+From 45d06c71976823c610a4719731b68dcd6096888e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
 Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 3f70b855c82..54b1262672d 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From 15de1b4266b85ffdf17fad374a43e0ed315b9f22 Mon Sep 17 00:00:00 2001
+From cd8a24156cefab80b673af233f66ff44c1b7c458 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index 5d77bcb41a1..850a8629796 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From 2a4a5f2da7d1b578619a8d0886f6db00bacefdc2 Mon Sep 17 00:00:00 2001
+From 5150fd9be924d2e9e74b2db664229423a4a00238 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 25d61095252..f55870802f6 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From 9fb0e6130ef5d9fa68240c279d235eee8658c0fa Mon Sep 17 00:00:00 2001
+From a921a92f334a2a30741b906c206e041cef2d904d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 54df0aab99d..8a36f872275 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From 8159808516543237fb110d0883e702385a1a866c Mon Sep 17 00:00:00 2001
+From baf4fc9f157e4c08c67d1a577b0f1e10f213a642 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index 986b71c4e6a..5620b51d4cd 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 3d77c2ff41b1a65d0f4852ed21d7a8ec41b368a8 Mon Sep 17 00:00:00 2001
+From 05fff53c13fc5969e17f1e887b0b59bf0a088a6e Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
index e4a34f8ff6a..0817da7ca69 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "fbd34472e5edea0a3ed88ae14a47666e23538e4a"
+SRCREV = "79ed383cd5a822e6d8d9d549835383f5c5106204"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.5


