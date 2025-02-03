Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC24C0219D
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.92647.1738600903582354662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Do89ioHi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2061674f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600901; x=1739205701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e60A5XpOeHHWMOeMjsIH4BCSMkMNt5ik0o3YkRIupNs=;
        b=Do89ioHiPu39uMYg/vBfwzDLOrOMhG9h+8i1DBY4oZqgUzrJd/IVXkDd28VLDC7U6m
         EGSqH0QCYg56D+d1LFx4lnkxRvDtCfx+UOFJ63IJ/Qo7/b9f18p0Sy28Xn9ifU0AhcTj
         P2KzEVLubN0e0+KJJ6ptZy4E1iHQd+ACSXe/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600901; x=1739205701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e60A5XpOeHHWMOeMjsIH4BCSMkMNt5ik0o3YkRIupNs=;
        b=ejb8TN+uFtmM/c0bhIBkSdFyviCe0LA81VIfO5i9BAFxcjubptu8AzFbG5U+SeUOMu
         KOpUkRjjmF6Hczw7dpXew2CPWFwVM1ESrajhMSdgteStY9WRHFTfgCah2ArcCQjoS2JV
         SQg4Xy6CCP+7d+yc/+asS0wWrl5ypavw2vbQPZJ5mok91F40el29/3qNXG4pgLOOozbj
         tKWNGdylHc/UQuYCaht5A0E80qFNY3u/524CqB7VRGhAYM/Pzk4CZ1DtJ6pcsi/22MRo
         p4DYhejgmiZTVeI2S/Iwf9S/6Hsmoag4yPh1i6zT6CrAnWBbS7nwts+R0AtAa4j59Tqp
         7ong==
X-Gm-Message-State: AOJu0YybSDzen0Q3Uj8KrMAY2TmD0q+1ZhaNxaUTIQbybTgwqEM+uvC5
	WqdHdd1OLOX3xUHDZ7rEBeZNXKJBy5Wr8FIsXLcrzOyzkaBiqabgbTdjWdbCV580+a7xrU+EfvP
	f
X-Gm-Gg: ASbGncuQEpkEajmbXqKOis9SXZer7fPYemDP/HKW05+DeN+0RahyuIoWbZB5A3nXGxn
	eFuPfu53YpLYfgdo9/FGf0AJMrdWb21otOoVR8GwrKfBqn5MsTJ8pNgiD4X/eaTcKQvfnlXM4gQ
	vt0k/lndU5jFDlUcXEssGunOitj5U8TN0F5Ob+hjkG97dC4tiOm38joQ1X+Gd9B160RaTG8RYu7
	nA6OOg1LErumh0Wcnyk+hulAxrMy9yUlJs8c28A7DHWHBKNVCRIK/fyxHkAKmxGPCZrS1tbJ4+/
	PuVsOUBq4ImHkQSzh51S4m6kAXCznYOdy8Wd7IFkGB+r
X-Google-Smtp-Source: AGHT+IGp95JhfGxRi5Gas2JqrO7DqswQj0mmj1l+27RguvPEtvzLoMavQhakAyJ1g1l8gMtgWD6VTA==
X-Received: by 2002:a05:6000:2c5:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38c51930b44mr17666622f8f.8.1738600901436;
        Mon, 03 Feb 2025 08:41:41 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/46] gstreamer1.0: upgrade 1.24.10 -> 1.24.12
Date: Mon,  3 Feb 2025 16:40:55 +0000
Message-ID: <20250203164130.3403325-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210684

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 4 ++--
 .../{gstreamer1.0_1.24.10.bb => gstreamer1.0_1.24.12.bb}      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.10.bb => gstreamer1.0_1.24.12.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e696eaaaff1..0dd96bef017 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From bcf818265ae8b2eb668fffbbedb19c1162032c2a Mon Sep 17 00:00:00 2001
+From a9d99eea162dfb6dcd5cb90adb7dd9261ec676bc Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 32e1e85b770..01d9535eb8e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 0efdfdf9e5055944a463eea43e5539aa7ea7206a Mon Sep 17 00:00:00 2001
+From f0076c5801bd847c464e31ab11fdb06f1ad0fccd Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 830a601..3f9fdce 100644
+index dc9dbe2..55e85b3 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -645,6 +645,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index f40969042b6..861046d2dbc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 21b89d16e2ca79db212587bfea4aa18470984c90 Mon Sep 17 00:00:00 2001
+From f9544b0e2d35bf9f9a89cff42bb741bc16e37cc8 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 24f336c1057..cb47f7244fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 9bffd7eb9113f6535d8b82ca316e6f133241bd8d Mon Sep 17 00:00:00 2001
+From 39764bd2b9f9da4a07079f76a2f68baf40c143b9 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
@@ -47,7 +47,7 @@ index 6bb346a..fe57935 100644
      test(test_name, exe, env: env, timeout : 3 * 60)
 diff --git a/tests/check/template.sh.in b/tests/check/template.sh.in
 new file mode 100755
-index 0000000..cf7d31b
+index 0000000..f1318fa
 --- /dev/null
 +++ b/tests/check/template.sh.in
 @@ -0,0 +1,9 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
index 326a2f26a9e..d224b80eb30 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "9fc45b1a332e8f812f09e95c281cd75969f6d1682d062a815db0e7bc047518fd"
+SRC_URI[sha256sum] = "b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f5804df15b634bd22b1036f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \

