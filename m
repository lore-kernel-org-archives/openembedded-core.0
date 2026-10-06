Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ABDCA6006
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48864.1791301593129260177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OOi1zyMk;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0759so757472f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301591; x=1791906391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VYJCR6v7F75rR+8z7Yk+cS4NiHV4vcZcWVMQP1Z64fE=;
        b=OOi1zyMk1S6U1HUz9inHgZ852UcN7rWns+jso/cFbk6YjQG6+tpKlx+VyT9HHWldwB
         tH9ndCGVtdoGeH5Yti1/F+PRINALHwJt5cp/6w/0yKeY6u8p5uKK56iKH94w58anS7dD
         DZ644/i1UqXg/8i1R29TfhBqbWRsRl7qRJdwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301591; x=1791906391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VYJCR6v7F75rR+8z7Yk+cS4NiHV4vcZcWVMQP1Z64fE=;
        b=IwYui41IT6gp+hiTUdgebYusox5gwOI1HlVNwCXjgIj8SUoOrBJhADxGeag0pNzGND
         fUPyGuRTScujKw/ZhdozX0Wrqf2E0Q7HKKxIW6XiDEuEiMVheUQtHHKZdLKhjHM42Zcp
         KbDZdQRxIgepucWdQG0iuOqW/kM9n3QAi5fW6zYPrxmTwS3XR4yzmeQrdMvf05CMEoWa
         fl/JcjWmIXMnUh9d4zfJAbYkt8Nn2M6ukvrBSGFO5YKLjQWv4D8ykxF4Q8aHDargnQaT
         V/obHrM85UufbQo/psloUP/aIDBGVZsLAweAjjfkyG9rq4eQh/k7MECI+yBEfoieeQL6
         FeoQ==
X-Gm-Message-State: AFuF++kc3Ivj/AnTuR1S1ot+zSqVYohj6NSxYkzTTB/LDimD0Mnb3Pzy
	8QQn+M8RNy2fVIYOIg+mZskM4PQtEn8uA7t/wf0VOjomYTpCN6nNG7HtUhONTpTUKi7F+Knh7Y7
	TFV16rc0=
X-Gm-Gg: AYBFou35BcFnQy9c3IH+OMtThV9unpobLpNeQkaAuxTOGVRlh8oAL+3rq3dkEC/mPbq
	ILi/fTzCf9yCJqZl06jvMje3wxnHU7sqtkMoA1SFASVRjizOKrC5oFOlliekCx4GNKB3xMW5klN
	R/5Hv/nQR6pbHM/F0dx7htcqP1pHNdKjLhlxVLAPADyGL0wyxbjcRNobHuW1pzmrmxaacCSZjJc
	RfdFnS17Vyogyud89LiSYGcoaplebv2xmfxjjyyontOOSXHmLb5N5fVbGFtUJ3M3uu3UFWpDE67
	Bm3xaTRRlkalhHkA6c8o88ClR/jnEehObMzTD1V5v7BNL3+13t3n7TNeNrOj7DG17qvTSq/LL55
	8QRAQtB1xMSwG0LNlAWsFvjBCwO1EHHofWv/Jax48t8HO5Jkr5hBi1KhfASxbcIiOj3KbIgMOI8
	83XhOnHB7Bq6ZSp4qY+glJKBLO3OfZCT2CAEbDnP3nDIZpP8uS4lh1ACY2P7xavcYwJ5iTthADi
	Bup71qoIeBWJaDB9dTKkj5/NSo2U7+hWW9CZ9TCwrOIvJ+5JkidEbRIV81nXG+jOL0Oo0yaBLsJ
	8LliSO0qPzHwycUF
X-Received: by 2002:a05:600c:1914:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a17b52d449mr29812475e9.9.1791301591335;
        Tue, 06 Oct 2026 08:46:31 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 10/19] opkg: take the default architecture from the target CPU
Date: Tue,  6 Oct 2026 17:45:56 +0200
Message-ID: <9c0fc02f10491a4608da921b4e9ae4ed70ee5435.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247297

From: Sunil Dora <sunilkumar.dora@windriver.com>

opkg sets HOST_CPU_STR from the build machine's CPU, so libopkg built
for aarch64 contains "x86_64" on an x86_64 worker and "aarch64" on an
aarch64 worker. Carry the upstream fix, which uses
CMAKE_SYSTEM_PROCESSOR (HOST_ARCH via cmake.bbclass).

[YOCTO #15784]
[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97592b875b64db8490b5265a08577bf73a0e9c45)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...the-default-architecture-from-the-ta.patch | 45 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.10.0.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
new file mode 100644
index 00000000000..ee7d35e34c4
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
@@ -0,0 +1,45 @@
+From fd8b3359e9e26a6a81f5f7cb04346c7bf44de279 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 29 Sep 2026 23:55:32 -0700
+Subject: [PATCH] CMakeLists: take the default architecture from the target CPU
+
+HOST_CPU_STR is the default architecture opkg accepts when no "arch"
+lines are configured. It is set from CMAKE_HOST_SYSTEM_PROCESSOR, which
+is the CPU of the build machine, so a cross-compiled opkg gets the wrong
+default and libopkg differs depending on the machine it was built on.
+
+Use CMAKE_SYSTEM_PROCESSOR, which CMake sets for native builds and the
+toolchain file sets when cross-compiling, and stop with an error if a
+cross build doesn't set it.
+
+Fixes Bugzilla: #15784
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/218]
+
+Suggested-by: Alex Stewart <alex.stewart@emerson.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e6deba8..7da091d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -45,8 +45,11 @@ option(WITH_GPGME "Enable signature checking with gpgme" ON)
+ set(DATADIR "/share" CACHE STRING "datadir")
+ set(SYSCONFDIR "/etc" CACHE STRING "sysconfdir")
+ set(VARDIR "/var" CACHE STRING "vardir")
+-# This was ported from autoconf (it used to be "host_cpu"), but it should be target_cpu: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15784
+-set(HOST_CPU_STR ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Host CPU architecture")
++# Default architecture: the CPU opkg runs on, not the build machine
++if(CMAKE_CROSSCOMPILING AND NOT CMAKE_SYSTEM_PROCESSOR)
++    message(FATAL_ERROR "Cross-compiling requires CMAKE_SYSTEM_PROCESSOR")
++endif()
++set(HOST_CPU_STR "${CMAKE_SYSTEM_PROCESSOR}" CACHE STRING "Default package architecture")
+ 
+ configure_file(config.h.in config.h)
+ configure_file(libopkg.pc.in libopkg.pc @ONLY)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.10.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
index 0631868a30c..8563c85780c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.10.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0002-config.h.in-add-missing-WITH_SHA256-define.patch \
+           file://0003-CMakeLists-take-the-default-architecture-from-the-ta.patch \
            file://run-ptest \
            "
 

