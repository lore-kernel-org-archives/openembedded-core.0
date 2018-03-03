Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEFA78531
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 02:47:12 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id 93-v6so6738307plc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 18:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+1H33gnGI37SiQcdS/HPwU0GTsgEPv5MebyzC284R9k=;
	b=cvxi2P0hwlkmjXt6YalH58nW/mB4sa3DnizSMACUnAo0Fl4ldFNwwM/ZPNk/2BWoQ/
	Pplqb7Mey4NA5vAcVmqJyGTZ2ZAnALoj1cv4VmZqN1I/Ex5zemlUipMZnZ5WALaG6xuA
	CSJtgjvNvTI5ywqfngE04cdO69xRxZjKpO4rE08fi22PfHMTWrAf7uHyh4GGwrazKLBq
	+K3KI3dvQqeoMC+M8RWyMSrxBq+K6guXuz5SmPrjULm7RSAch/7PF8UducPz3mWW075X
	BHXshb1FgXutrB6y7ThbWzu6yKk+h5TtONpTKn5Lc7YmaCpcC8NZQPYDBqw3hMMfMDdZ
	7m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+1H33gnGI37SiQcdS/HPwU0GTsgEPv5MebyzC284R9k=;
	b=AUN1hymLN6Lun8MP7VK4vKViDOcUEdoY6RNkBMf82JSGhGTX6w+S5Nsi2gz6I39TyB
	U/8xKnSXJ9mEZKV895KWG2M5LBGE3IIKCt7SyROydvy+rcMh1eLs8d0ka4gywLnwqiBc
	deekeiIW58eKnl/hPr6+ZkIyiLL8njA+TqjRPyBxN897ROhElczI4RlPxizDz6mGnnzk
	P1pVHu58O0U6wz49ygk2/885rVObYNrvN3pW8ic8atIWaQzEwNpolpBuKOncF6EPMFlx
	rxLsYjLNDphubC1hunidRvaiCQqc5VzY2zLz9BnM964dDsF+pEDD2JjxuFO9DHh6UGPB
	sULg==
X-Gm-Message-State: APf1xPBb4Uv/bNfkVYPdMUfiXwLvX4/376T6JFnFcugXlUOq10g8bQYH
	9BPYogRQHpw+EnyPEeHg+bAoPQ==
X-Google-Smtp-Source: AG47ELuTC8KSdiZn4l8GHM/7R1hLcGwO/PynlTFi5egfjENocveYBzGLNC4gW0I3l1VrbWPSuKJpcw==
X-Received: by 2002:a17:902:6716:: with SMTP id
	f22-v6mr7099540plk.180.1520045234158; 
	Fri, 02 Mar 2018 18:47:14 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a28sm14320814pfe.70.2018.03.02.18.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 18:47:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 18:47:05 -0800
Message-Id: <20180303024705.1391-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] systemd: Explicitly add hidden attribute to __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
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
X-List-Received-Date: Sat, 03 Mar 2018 02:47:13 -0000

These symbols appear in dynsyms of libsystemd.so and musl loader
doesnt like it

Error relocating /mnt/a/oe/build/tmp/work/i586-bec-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0: __start_BUS_ERROR_MAP: symbol not found
Error relocating /mnt/a/oe/build/tmp/work/i586-bec-linux-musl/avahi/0.7-r0/recipe-sysroot//lib/libsystemd.so.0: __stop_BUS_ERROR_MAP: symbol not found

[YOCTO #12577]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rt_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch | 34 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
new file mode 100644
index 0000000000..2cffc426ed
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -0,0 +1,34 @@
+From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Mar 2018 18:00:17 -0800
+Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
+
+for currently unknown reasons they get exported to the shared libries
+even without being listed in the sym file
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+Upstream-Status: Pending [ Conditional on master needing this, 234 does need it ]
+
+ src/libsystemd/sd-bus/bus-error.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
+index 378f7a377..49d797abd 100644
+--- a/src/libsystemd/sd-bus/bus-error.c
++++ b/src/libsystemd/sd-bus/bus-error.c
+@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
+ };
+ 
+ /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
+-extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
+-extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
++extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
++extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
+ 
+ /* Additional maps registered with sd_bus_error_add_map() are in this
+  * NULL terminated array */
+-- 
+2.16.2
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index d12e94f463..b15e5a41db 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0001-meson-update-header-file-to-detect-memfd_create.patch \
            file://0002-configure.ac-Check-if-memfd_create-is-already-define.patch \
            file://0003-fileio-include-sys-mman.h.patch \
+           file://0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.16.2


