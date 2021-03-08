Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.1470.1615247997137487478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 15:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D8M4n7pi;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d23so2450419plq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 15:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HEhPyYwNIie8LHiOYcAi6bGAmT5jEfijR7OecsQc8zg=;
        b=D8M4n7piBr2rWi6hl0F9IFwsKx/46UXRnWibZf6G4VmP/1yKA5DxC+IBnfAb6tqIJc
         t8yvtIjsOPMlzeqF86wJ1fTVhU9TkOrKX8FwNsf0e5UyYT1Zlw7qdUbA0i5F5NVjGF2+
         cmfvSWdSObCmo9QMhf2OPIMg9W9rKFlpAYQzFNhSNBscBGblIhmShowJFzj3ZI4nA3pa
         MIt6rkxKvnn1KCCyqLN14+GGgeW5Ymu0058wD+neKmjpBRHyhAuyvuGBQ9UntN/xbUql
         h9V0DJfitBbb/XJbryV3mv11LjQEVt6KHQiy2WnUSRN2hMPx2X3vkNk/mZYiV3X5U7no
         KAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HEhPyYwNIie8LHiOYcAi6bGAmT5jEfijR7OecsQc8zg=;
        b=rxiWGS2YBcls0QHneWdVOl8MV2ULND8Oc4J0g2rFvdMt+atmJUvXrbn0/x6AbLslXs
         7nQ+Cp7GrORDM5tzyZ58QDSvNALGY72e6279dkmWAvf6+OIIKBFQg2DE+q4b7nb1K8cJ
         uS9hStWF/Ye18iK11+NAWNsGkSJoWJfD6OLKTTNTfSRjPQNnHr5jh3QZ7dtBowXwZk0O
         qxhpECAOqQ3ksZ3e8TpShrOPMrJOiPsGZj30kp3jnfezSFgfjuwDFpWoapWsE1Y9OLOH
         viZPVBtdUHm++ZB9kcX87eI4Mb9NZPjBwJTNEsvtB1tNUSB5CgcmGicNt/kmjxuMXgva
         LjKA==
X-Gm-Message-State: AOAM532Eu7KIiMVk5qwAbE/1TwKBrdC7IC2GB5uDTY/9JRArs2Xm3LKX
	duk9SeZof92fGENjrr7F4HnyGkuvJP9/MA==
X-Google-Smtp-Source: ABdhPJwj0sQUmjQNoFnosLwY5V6JeWonP6aFU2dr5k6psLekJkswDcVgy51BED2IEZZvezEapUjtSQ==
X-Received: by 2002:a17:90a:ff05:: with SMTP id ce5mr1476746pjb.156.1615247996244;
        Mon, 08 Mar 2021 15:59:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id d14sm472307pji.22.2021.03.08.15.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 15:59:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Use linker options to reduce memory overhead during linking
Date: Mon,  8 Mar 2021 15:59:53 -0800
Message-Id: <20210308235953.2230531-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helps builds on machines with less RAM ( 8G )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/reduce-memory-overheads.patch   | 22 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
new file mode 100644
index 0000000000..0493150a91
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
@@ -0,0 +1,22 @@
+From: Alberto Garcia <berto@igalia.com>
+Subject: Reduce memory usage when not using the Gold linker
+Bug-Debian: https://bugs.debian.org/949621
+Forwarded: no
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/cmake/OptionsCommon.cmake
++++ b/Source/cmake/OptionsCommon.cmake
+@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP
+   "Produce debug line information for offlineasm-generated code"
+   ${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})
+ 
++# Pass --reduce-memory-overheads to the bfd linker in order to save memory
++if (NOT USE_LD_GOLD)
++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduce-memory-overheads")
++    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduce-memory-overheads")
++endif ()
++
+ # Enable the usage of OpenMP.
+ #  - At this moment, OpenMP is only used as an alternative implementation
+ #    to native threads for the parallelization of the SVG filters.
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index 2928b8e55b..a1dd76ce81 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            file://include_xutil.patch \
+           file://reduce-memory-overheads.patch \
            "
 SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
 
-- 
2.30.1

