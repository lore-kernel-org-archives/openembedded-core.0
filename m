Return-Path: <jean-michel.hautbois@vodalys.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A35C272479
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 15:17:39 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so14995054wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 07:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WGS2EtycAmOqHn+yT9hXBbYTYeA40H/BkXRZnYRAbBY=;
	b=mqGnz1+EnoQwvv/dpySr+HRG85hIgMfvKc7Mv1DD6hp1+mWF0dJMV80a8JeR/SaFPP
	Nh6XBJV0G7og/vpKDWjx8rjv1jp91O6YR/FEFXWnv7jl3G58W2ZuRczoDiCj0QKx2UAW
	RHcjNuBlk0s7KfUxXoBwnK5ooAfTkam5NIIGVMZOzz6BSBCUP+L2Xnxq7Aacxy0JcoMX
	JP0p+6O7wJrrW3IRU0zARk6kACHzifQADxTgr3+LiYrA3AwR3Bz6cg5bJr+x95LnzYz6
	jAH6NvRu0+jIjvRq9Y5CqqWHj09mfua1MRAHPVkVfeA5wVuK9UV89tpgKIjQi/XZXBIZ
	UPIQ==
X-Gm-Message-State: ALoCoQkx5zyLaUu1a9m3fCUpK1xkVR6zHA8EL9P8okpeONMzVq9s1TMIDM70wY4Mu4MhA+mNe05s
X-Received: by 10.180.82.98 with SMTP id h2mr32545117wiy.7.1418656660161;
	Mon, 15 Dec 2014 07:17:40 -0800 (PST)
Received: from tatooine.vodalys.lan
	(LDijon-156-64-30-180.w80-15.abo.wanadoo.fr. [80.15.95.180])
	by mx.google.com with ESMTPSA id u18sm7258971wjq.42.2014.12.15.07.17.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 07:17:39 -0800 (PST)
From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2014 16:17:27 +0100
Message-Id: <1418656647-26273-1-git-send-email-jean-michel.hautbois@vodalys.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-oe][PATCH] hostapd: Remove include from drivers makefiles
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
X-List-Received-Date: Mon, 15 Dec 2014 15:17:48 -0000

When compiling (tested on Arch) QA fails saying that it uses host
include files.

Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
---
 ...apd-Don-t-include-libnl-include-directory.patch | 43 ++++++++++++++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.2.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd-2.2/0001-hostapd-Don-t-include-libnl-include-directory.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/0001-hostapd-Don-t-include-libnl-include-directory.patch b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/0001-hostapd-Don-t-include-libnl-include-directory.patch
new file mode 100644
index 0000000..f28429e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/0001-hostapd-Don-t-include-libnl-include-directory.patch
@@ -0,0 +1,43 @@
+From f4a132167c62f607f248a28ef292252ba6b42a59 Mon Sep 17 00:00:00 2001
+From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
+Date: Mon, 15 Dec 2014 15:46:53 +0100
+Subject: [PATCH] hostapd: Don't include libnl include directory
+
+Remove hostapd include directories for libnl, as these can be in conflict
+with the host includes.
+
+Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
+---
+ src/drivers/drivers.mak | 2 +-
+ src/drivers/drivers.mk  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
+index 7e175f4..950701f 100644
+--- a/src/drivers/drivers.mak
++++ b/src/drivers/drivers.mak
+@@ -35,7 +35,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20
+ else
+   ifdef CONFIG_LIBNL_TINY
+     DRV_LIBS += -lnl-tiny
+diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
+index db8561a..c93e88d 100644
+--- a/src/drivers/drivers.mk
++++ b/src/drivers/drivers.mk
+@@ -30,7 +30,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20
+ else
+   ifdef CONFIG_LIBNL_TINY
+     DRV_LIBS += -lnl-tiny
+-- 
+2.1.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
index b75f2b9..9ef8f7e 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://0001-hostapd-Don-t-include-libnl-include-directory.patch;patchdir=.. \
 "
 
 S = "${WORKDIR}/hostapd-${PV}/hostapd"
-- 
2.1.2


