Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119B7CD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105031.1781424199433967290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HZt13LSt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1990496f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424198; x=1782028998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n78g0HQ7WFTEmxC5PcbFThotwyAabH5DkUhQB4HrJDE=;
        b=HZt13LStTjsrawCfA4FDRcZ7C3MmjMZEqfEcz6YQnvNqTsYBA2mg+m/VwlOTMeis7B
         zAosfqEorVZ84giv76HYF6whrSAb3XrcvW40/mOxUBDIK4GbAZVDyDfKCBudTDXHNzRF
         6U8BuTVH+AA2E4iZv6iTRs8ObpP8nFSca50kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424198; x=1782028998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n78g0HQ7WFTEmxC5PcbFThotwyAabH5DkUhQB4HrJDE=;
        b=QgfZ5YdEbb/4tDd2RdDn/lg9Z3Y1jZHNyz3I+w4F7EGnDVIsa6p0OIoGxIVCU934yI
         cE3jSR2Rt+5bE9zIFhsLuDKa9xHR8OC9KDC8wFgEeQ6InXXzX08/I7zHm7bRaXpGbARD
         y+7FOtK1CwNNbrPdelS2adFpw+UUNrMs0NaTmqpAj+ptU3NXjsIXWNlAgE1AOFqnoR9t
         6jkfP+5N43zl+KVckW3Lj6y2fKSedB5Om40oHMGtQ+Bfn2qbHD7bI0yIMfcIF2Xhhyj0
         +cS2q/LsKzRUSHqN+m5cDsy5zjVyv1ZZbILm4fxRCbsiq7dbCHwp9rfQTXj3Ls9NZabl
         HgnQ==
X-Gm-Message-State: AOJu0YyOseHCWVF/9kDE9QDWlQOE6zHh+gbpdNbhJWT37XLb4NRsNJK0
	WRa352nN+y0FL8VAJCL8W1Jvq1sJ2ZjRkyCTRmBwnHSuKwR+tZNMIVMl+uQxUG+mfFRZSqjjidW
	dlAlb
X-Gm-Gg: Acq92OGD4gIyhdDgz4q0nBoIk3y9wdqy1V9F8s6e0jNN0keSS+H3Km6CUxwgOK3K2qs
	cYdmur5dT7mOpsbFLiHWYbYV/1j8Cyvss27Ce0WWiFRioQvMg34RtquWK3G3SNo9FeEUYAt+W+H
	TejURJ/YjYQ08QjpGeqXrNMV2kVLhvF2ovfzeXuWqtFxeTPw6KfUp2kolKuJDnd5gQg5nQ3zLQY
	rAMm7jCVd9/UVhi92wlO0vphW949Awa+W0PLHogQmCfKVOyf3ek/NZvJVChXaOwG6LxOfoIJd3i
	W5sCsJ1rpIZVW8QBWUlHf6XBxT97J/oRjutC6X8dQA8VnFlg+YKcApqlc7sYl/g1PY2sV4fsAVP
	Ll9hEgOs0wXoP48tEC8VWcjPbSSwTpOEbvymspofgcBYtdrUponjy+Ar265xFIEu61/vKwMvl+q
	0+uHKWstuEh/Hx20BvEhYXl3knD0dfh197mqq7cVHO+OD0+W02Q5O+
X-Received: by 2002:a05:600c:1d89:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490ec4d786emr92449225e9.9.1781424197550;
        Sun, 14 Jun 2026 01:03:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/56] gstreamer1.0: upgrade 1.28.2 -> 1.28.4
Date: Sun, 14 Jun 2026 09:02:16 +0100
Message-ID: <20260614080307.4017177-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238689

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch      | 6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch     | 2 +-
 ...tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.4.bb}      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index e1d870b0405..de255bf7918 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
+From 4e6aae8cbddb4567388f8f19919c2c17e36e0356 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 720a6f0c97e..957356c2ba6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
+From 34d24b8d66088d92ca306a488028dee82a6f6982 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 8adc055..b5c9e5b 100644
+index abd0ad6..93cd692 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -667,6 +667,10 @@ if bashcomp_dep.found()
+@@ -661,6 +661,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 1236290e2b6..bc6dfe353a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
+From f34bc3040b1564a3d39de4a4426326866c437dae Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index df382a4445d..8eb4bc2a816 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
+From ee4f5bd19394e055109486d88ff8e876c5c2572f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
index b727783746d..59f4e99c705 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ce5cd44d4ffeafdcc3dddaa072b2179c0b7cb1abf4e6c5d18d4375f8a39fe491"
+SRC_URI[sha256sum] = "f5adc7e8f448c10260b3b25aa101c9d540674c8d9a54c2b77a86d04f2b3b50dd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \

