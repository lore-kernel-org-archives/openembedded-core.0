Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 73BAF6C4DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 09:07:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z1so103893657wru.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Drv6jhfmOUOeOaNWULeQIHIr4Fbvsihwnd49Qmqow2E=;
	b=nTr0cJsKSeuNN2J9xKNZtfofyeGaLhMHrE6/sqm2BoSO+fzfLy6lT6J46mCkjKDhqm
	nSMo//9aM9MvwKaxVoS77NVIRLVy7RP6ChQbUQb06TBUq9QYHvKAmH4XRx3ZLrij6qGP
	p0UJByvteitblZoL1fNciMs6H2e2jClUlUkpjGek6spiOZ8npN1KgwLgN3RB33o6PiCT
	4yDxG0mPSXQkW80I2x8FC8ZseYKYNmGdmVhCMCotCJPc4IxSPMLYSVnarMbCFVzSXBTf
	y3x7AUusIbJ56xL4KDSHc69DA5v9frU9NOm4AEuvK477j/ZAvwGBw+8zF7SDdFQztrnh
	yxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Drv6jhfmOUOeOaNWULeQIHIr4Fbvsihwnd49Qmqow2E=;
	b=NlgiizxK+W3+EDCVsQ1deN/slWTynA1MeK8P6T2rbOC3ii9hfINxxZuKE1GVRY//oE
	4t2AuKuilqf5+qMv9kLEOtxkPaHFCEIwXu4V6VvNyXYMhOFvZhKZPh2JDijCHAYBAxaD
	UiuHLj/jVwo7bu5szl/MvnxlJ+9gSTOo1dfVyjLrMiJ1iAyFYL/c9vef11iyOB/pHBO1
	S7XKNptoT5jjDQoFgmGOdaGdIRcj4b9rd5v1KLu+WfR9Fpy4X2F/gtdiiCFjZlAuIyP4
	W4h7i09KgjU6OtEswSa3wREm2tfmVayt9XSUMqQNe/A0HY2lDphteRQc8nxMPKQFwkuH
	1QtQ==
X-Gm-Message-State: APjAAAU/JFEICQ5XBLxGaiho73RiSnboajK/FDewvN9+tR1RqHEow41a
	xvEsYEekWYwxqUAHHYJGoeLIiVuU
X-Google-Smtp-Source: APXvYqzZccV32CSmhzElsUGd6m/F3puEO+fq0vtl93dwAwKEKApTvtNLU9ThQdYzbj9YmkJCGVuIsg==
X-Received: by 2002:a5d:50cb:: with SMTP id f11mr17763217wrt.277.1565600844787;
	Mon, 12 Aug 2019 02:07:24 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c8sm1431800wrn.50.2019.08.12.02.07.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 02:07:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 09:07:19 +0000
Message-Id: <20190812090720.815-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] powertop: import a fix from buildroot
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
X-List-Received-Date: Mon, 12 Aug 2019 09:07:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-wakeup_xxx.h-include-limits.h.patch  | 55 +++++++++++++++++++
 meta/recipes-kernel/powertop/powertop_2.10.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
new file mode 100644
index 0000000000..f1a05fcd75
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limits.h.patch
@@ -0,0 +1,55 @@
+From 4c24fdd8e0a42359df7308155b2d43c28a5e02fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 May 2019 20:25:00 +0200
+Subject: [PATCH] wakeup_xxx.h: include limits.h
+
+limits.h must be included to define PATH_MAX otherwise build will fail
+on:
+
+In file included from wakeup/wakeup_ethernet.cpp:45:0:
+wakeup/wakeup_ethernet.h:35:16: error: 'PATH_MAX' was not declared in this scope
+  char eth_path[PATH_MAX];
+
+In file included from wakeup/wakeup_usb.cpp:45:0:
+wakeup/wakeup_usb.h:35:16: error: 'PATH_MAX' was not declared in this scope
+  char usb_path[PATH_MAX];
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a0b3337cf4a827e6566f8b15b6bb180f0dcef7a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Submitted https://lists.01.org/pipermail/powertop/2019-May/002052.html]
+---
+ src/wakeup/wakeup_ethernet.h | 1 +
+ src/wakeup/wakeup_usb.h      | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/wakeup/wakeup_ethernet.h b/src/wakeup/wakeup_ethernet.h
+index 682bf95..e0fa628 100644
+--- a/src/wakeup/wakeup_ethernet.h
++++ b/src/wakeup/wakeup_ethernet.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_ETHERNET_WAKEUP_H
+ #define _INCLUDE_GUARD_ETHERNET_WAKEUP_H
+ 
++#include <limits.h>
+ #include <vector>
+ 
+ #include "wakeup.h"
+diff --git a/src/wakeup/wakeup_usb.h b/src/wakeup/wakeup_usb.h
+index f7a1f7e..15898e3 100644
+--- a/src/wakeup/wakeup_usb.h
++++ b/src/wakeup/wakeup_usb.h
+@@ -25,6 +25,7 @@
+ #ifndef _INCLUDE_GUARD_USB_WAKEUP_H
+ #define _INCLUDE_GUARD_USB_WAKEUP_H
+ 
++#include <limits.h>
+ #include <vector>
+ 
+ #include "wakeup.h"
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index d943ba9f6e..5be8d23111 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -7,6 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
+    file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
 
 SRC_URI[md5sum] = "a69bd55901cf919cc564187402ea2c9c"
-- 
2.17.1


