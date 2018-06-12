Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id C084E78DB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:04:04 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id l10-v6so23618882wrn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=f+PhLjt/991K5+sGIy19fN8iXZeyRltkTeiN+z/H46I=;
	b=wZ6uRGkL9FE3NMNZsiGsKq1W74V9zBblUJ/CTBBHqTAEoaSGcYvejCKpVHNCIBiBjD
	qz3KZNMG0Gr6kIJs9jcEYJa0CcdS4paOUlCC8t0iT6sjSXp5XbnjNEapr+4ie0vQEKaB
	tYxYEoFtDILxn4TRWMGGDLnew1ctkW1DeqA508EMIL7pkMTvO35S88roTnQnRNYEaafg
	uy9W30mS1IL7v83R1nkzmEvR9fV81sur9bl8QjcTqc7B00rLI0vfdvWNMLLUrwkqyWbh
	es7EhWp5GJhYVv4SDnnVQEXAq6y4PYx3+g5kelLoFYL9qp+LZA69/LgORD02qqe++K/d
	0N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f+PhLjt/991K5+sGIy19fN8iXZeyRltkTeiN+z/H46I=;
	b=D+Johrzk5LtTM1TMOTjNferCkdxEWQgDCet+AKs4V+ebMX+tKfkgOwWOwE7BeOKG5q
	y0d3AorABZFXcLOhNDKHEls2qwSqC0AutAZ82bUpW0MJNkPaLPejP0iia+dky5DwtIsz
	BCa1rmrGvZOACw6tmJAOwr8QxtEMWA9MOXQuviobRjQHhTkOrkwFcPy/5BnQXJCaFxce
	i0g1emJrx8k9bgZ99soZJe/Yjqb3iWCyQMh41Jsz7CKhz3mFDbHIJlLxRMV94EJmqz9m
	sX3dp6CP7q8FiYjantCZjqfqHQ677vPPZxWeruMG5x5k46ic8z1wncGJQZJJE+fT3sAT
	glMA==
X-Gm-Message-State: APt69E35wl4Ri/9mAeUDTqVGEEy+Y3BBTOKchEE63bZF5TnL8FIXzsFK
	zzXOy2kgRTb/P7GsUk9D4EUcsuqw
X-Google-Smtp-Source: ADUXVKJAG5sEMF77/PoG6suxzroIV7xc6XHRGOl+imDkfZeZw3STty9KR8V+H3fWdeckyMGzvKuGGg==
X-Received: by 2002:adf:9acc:: with SMTP id
	a70-v6mr2217257wrc.180.1528801445150; 
	Tue, 12 Jun 2018 04:04:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n17-v6sm896644wrs.96.2018.06.12.04.04.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 04:04:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 12:04:02 +0100
Message-Id: <20180612110402.32107-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: fix build on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2018 11:04:05 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/files/missing-time-h.patch                | 29 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_18.1.1.bb          |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/missing-time-h.patch

diff --git a/meta/recipes-graphics/mesa/files/missing-time-h.patch b/meta/recipes-graphics/mesa/files/missing-time-h.patch
new file mode 100644
index 00000000000..5a4dcd9c4da
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/missing-time-h.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/mesa-dev/2018-June/197438.html]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From a138d929be540eee246f8aa6d64e8b6d23922f1b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 12 Jun 2018 11:57:58 +0100
+Subject: [PATCH] drivers/dri/i965: add missing #include
+
+brw_bufmgr.h uses time_t without include time.h, so the build fails under musl.
+---
+ src/mesa/drivers/dri/i965/brw_bufmgr.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/mesa/drivers/dri/i965/brw_bufmgr.h b/src/mesa/drivers/dri/i965/brw_bufmgr.h
+index 68f5e0c2c8..5c2702652b 100644
+--- a/src/mesa/drivers/dri/i965/brw_bufmgr.h
++++ b/src/mesa/drivers/dri/i965/brw_bufmgr.h
+@@ -37,6 +37,8 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
++#include <time.h>
++
+ #include "util/u_atomic.h"
+ #include "util/list.h"
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.1.bb b/meta/recipes-graphics/mesa/mesa_18.1.1.bb
index 7aeb28bda36..d9feb334e54 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-hardware-gloat.patch \
            file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
            file://0006-Use-Python-3-to-execute-the-scripts.patch \
+           file://missing-time-h.patch \
 "
 
 SRC_URI[md5sum] = "063468c930ff61d211ece0191874fa95"
-- 
2.11.0


