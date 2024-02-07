Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7003BC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 07:51:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.15779.1707292299795050022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 23:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRSRFju5;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29593a27fcaso93924a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707292298; x=1707897098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQtEH2gEI/sqTZDWNLq2hR+6i04qVOVYqQYhAHZ71lw=;
        b=BRSRFju5F0DoXIgT7noFuv3wG4x2qDOcDfwMs61gze6uVTzqWHZVtLD7lCXP2CuzAG
         NKUmFaZQ3LC9Fc8jj/3lbM0VlCHXuxPFYB0XNTKiEcRckROEFov/mwtpKFi2BJiISIjS
         0J3Kl2dqDUnLpgfXb375CmQ3yxru0/uAlyEA5afIEUtaQY1FBR/tDh1g8BxZRci4ns19
         MQPoDAf/klPvyRB8VdprUg1d/5DIUgthZHqqjg4FhBB+NA++FYyB+V8Ii9qI/yhl9Wtp
         TeBxAnVXa8An0yQnYbY5nnwCsP9TFncFXgUwRZ3/4A2XaZOn2AUy6egX5cznncO7Xyf+
         Rxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707292298; x=1707897098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQtEH2gEI/sqTZDWNLq2hR+6i04qVOVYqQYhAHZ71lw=;
        b=DaigntgIO83jjhOOe2hkmkc8wE87uUcBxYprOVnJUsuA9qV9gu8YWU9zg2ZFRO8yw2
         fXUJh+93u4S7HceYi+//AAgvj+BZyDHBy/hS37p9I0WS30ZVsVyQIUOw1aP9o1r5rRxA
         gWu4YIkVR96QHvYOemFxG5+ozC4EqNEo8aONbVaI5A6qHm09dlG8ncmOcoyQAWh+l0Ed
         95n6shGi8+OgN5ND7oSRHOb5o527lMkd9s46jVP+BFdlqS4riiTdwy9Pz3/QUVuigcV9
         mkcOaSDfmVtRYECpDIfzcPiuSIY/2iwndS7w55YBwxISDZ6m/RdAM8/ql3rmhxBCNvZD
         UHXA==
X-Gm-Message-State: AOJu0YxrEwSrtpe4obwdvDtLAP9SIcjupMCAncNGpNd/hoHoPlq8Rwm6
	hGWM2/FlPAs3YR4P4L5JYEdkVwjTcchUQPG+5bukEkE4AcNc9sBSoZeuJ0li
X-Google-Smtp-Source: AGHT+IE/lbmkiZ+KilVHEUp4Fg264vLEOGZpKppsoku88lA8WH7Qa8muHKmzLn427vj21bjJRF0B2w==
X-Received: by 2002:a17:90b:1b0f:b0:292:e812:19e8 with SMTP id nu15-20020a17090b1b0f00b00292e81219e8mr5074259pjb.0.1707292298207;
        Tue, 06 Feb 2024 23:51:38 -0800 (PST)
Received: from L-18010.kpit.com ([203.192.205.78])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902c1d400b001d8ee2884c6sm776125plc.218.2024.02.06.23.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 23:51:37 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akash hadke <akash.hadke@kpit.com>
Subject: [oe-core][master][PATCH] busybox: Use ISO 13400 timings in zcip
Date: Wed,  7 Feb 2024 13:21:27 +0530
Message-Id: <20240207075127.1247940-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 07:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195039

From: akash hadke <akash.hadke@kpit.com>

Add below patch to support DoIP/ISO 13400 timings busybox zcip

0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch

DoIP requires fast IP assignment, faster than what RFC 3927 can
guarantee, and so it defines its' own AutoIP timing parameters

Add a compile-time option to use DoIP timing parameters instead of
default RFC 3927 parameters. This option is useful for use of zcip in
automotive use-cases. In pratice, it decreases AutoIP allocation time
from ~10s to ~2s, at the expense of less resilience to collisions

Signed-off-by: akash hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 ...d-support-for-DoIP-ISO-13400-timings.patch | 189 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch
new file mode 100644
index 0000000000..4625ed8b2b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch
@@ -0,0 +1,189 @@
+From 0fd26ed084f08911ec692f0007542d926d657a66 Mon Sep 17 00:00:00 2001
+From: akash hadke <akash.hadke@kpit.com>
+Date: Mon, 5 Feb 2024 14:43:55 +0530
+Subject: [PATCH] zcip: add support for DoIP/ISO 13400 timings
+
+DoIP requires fast IP assignment, faster than what RFC 3927 can
+guarantee, and so it defines its' own AutoIP timing parameters
+
+Add a compile-time option to use DoIP timing parameters instead of
+default RFC 3927 parameters. This option is helpful for the use of zcip in
+automotive use cases. In practice, it decreases AutoIP allocation time
+from ~10s to ~2s, at the expense of less resilience to collisions
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-February/090611.html]
+
+Signed-off-by: Ricardo Leite <ricardo.leite at criticaltechworks.com>
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
+---
+ configs/TEST_nommu_defconfig    |  1 +
+ configs/TEST_noprintf_defconfig |  1 +
+ configs/TEST_rh9_defconfig      |  1 +
+ configs/android2_defconfig      |  1 +
+ configs/android_502_defconfig   |  1 +
+ configs/android_defconfig       |  1 +
+ configs/android_ndk_defconfig   |  1 +
+ configs/cygwin_defconfig        |  1 +
+ configs/freebsd_defconfig       |  1 +
+ networking/zcip.c               | 23 +++++++++++++++++++++++
+ 10 files changed, 32 insertions(+)
+
+diff --git a/configs/TEST_nommu_defconfig b/configs/TEST_nommu_defconfig
+index 415f5a802..3f8ca40d7 100644
+--- a/configs/TEST_nommu_defconfig
++++ b/configs/TEST_nommu_defconfig
+@@ -769,6 +769,7 @@ CONFIG_FEATURE_WGET_STATUSBAR=y
+ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_ZCIP=y
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ CONFIG_TCPSVD=y
+ CONFIG_TUNCTL=y
+ CONFIG_FEATURE_TUNCTL_UG=y
+diff --git a/configs/TEST_noprintf_defconfig b/configs/TEST_noprintf_defconfig
+index 9b378fd55..5cfd5b3d7 100644
+--- a/configs/TEST_noprintf_defconfig
++++ b/configs/TEST_noprintf_defconfig
+@@ -781,6 +781,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
+ # CONFIG_FEATURE_WGET_AUTHENTICATION is not set
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/TEST_rh9_defconfig b/configs/TEST_rh9_defconfig
+index 4ac62b9da..1fe074e79 100644
+--- a/configs/TEST_rh9_defconfig
++++ b/configs/TEST_rh9_defconfig
+@@ -791,6 +791,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ CONFIG_ZCIP=y
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android2_defconfig b/configs/android2_defconfig
+index d4b8f1616..eceabbc20 100644
+--- a/configs/android2_defconfig
++++ b/configs/android2_defconfig
+@@ -828,6 +828,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android_502_defconfig b/configs/android_502_defconfig
+index 104e70f23..0ed60ae61 100644
+--- a/configs/android_502_defconfig
++++ b/configs/android_502_defconfig
+@@ -968,6 +968,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+ CONFIG_UDPSVD=y
+ CONFIG_VCONFIG=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android_defconfig b/configs/android_defconfig
+index 92a66048a..c1d38328b 100644
+--- a/configs/android_defconfig
++++ b/configs/android_defconfig
+@@ -858,6 +858,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/android_ndk_defconfig b/configs/android_ndk_defconfig
+index 425593454..384304d46 100644
+--- a/configs/android_ndk_defconfig
++++ b/configs/android_ndk_defconfig
+@@ -884,6 +884,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/cygwin_defconfig b/configs/cygwin_defconfig
+index 61e2c2463..6ed414b76 100644
+--- a/configs/cygwin_defconfig
++++ b/configs/cygwin_defconfig
+@@ -831,6 +831,7 @@
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/configs/freebsd_defconfig b/configs/freebsd_defconfig
+index 6cbd54895..c09197be3 100644
+--- a/configs/freebsd_defconfig
++++ b/configs/freebsd_defconfig
+@@ -810,6 +810,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=y
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+ CONFIG_FEATURE_WGET_TIMEOUT=y
+ # CONFIG_ZCIP is not set
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
+ 
+ #
+ # Print Utilities
+diff --git a/networking/zcip.c b/networking/zcip.c
+index 137d46e13..b955d6433 100644
+--- a/networking/zcip.c
++++ b/networking/zcip.c
+@@ -24,6 +24,15 @@
+ //config:
+ //config:	See http://www.zeroconf.org for further details, and "zcip.script"
+ //config:	in the busybox examples.
++//config:
++//config:config ZCIP_USE_ISO_13400_TIMINGS
++//config:	bool "Use ISO 13400 (DoIP) timings"
++//config:	default y
++//config:	depends on ZCIP
++//config:	help
++//config:	Use timings from ISO 13400-2 (for DoIP) instead of RFC 3927,
++//config:	which dramatically speeds up AutoIP allocation time at the cost
++//config:	of less resilience to collisions.
+ 
+ //applet:IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))
+ 
+@@ -73,12 +82,26 @@ struct arp_packet {
+ enum {
+ 	/* 0-1 seconds before sending 1st probe */
+ 	PROBE_WAIT = 1,
++
++#if ENABLE_ZCIP_USE_ISO_13400_TIMINGS
++	/**
++	 * DoIP-specific timings, see ISO 13400-2, Section 9.1.2.2, Table 15
++	 */
++	/* 0-1 seconds between probes */
++	PROBE_MIN = 0,
++	PROBE_MAX = 1,
++	PROBE_NUM = 1,		/* total probes to send */
++	ANNOUNCE_INTERVAL = 1,  /* 1 seconds between announces */
++	ANNOUNCE_NUM = 1,	/* announces to send */
++#else
+ 	/* 1-2 seconds between probes */
+ 	PROBE_MIN = 1,
+ 	PROBE_MAX = 2,
+ 	PROBE_NUM = 3,		/* total probes to send */
+ 	ANNOUNCE_INTERVAL = 2,  /* 2 seconds between announces */
+ 	ANNOUNCE_NUM = 3,	/* announces to send */
++#endif
++
+ 	/* if probe/announce sees a conflict, multiply RANDOM(NUM_CONFLICT) by... */
+ 	CONFLICT_MULTIPLIER = 2,
+ 	/* if we monitor and see a conflict, how long is defend state? */
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 06eb9eb999..3cc4796e05 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://start-stop-false.patch \
+           file://0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.25.1


