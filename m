Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 847626C216
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2019 14:55:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x52EtpDU025850
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Jun 2019 07:55:51 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 2 Jun 2019 07:55:47 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 2 Jun 2019 10:55:29 -0400
Message-ID: <20190602145530.183521-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190602145530.183521-1-kai.kang@windriver.com>
References: <20190602145530.183521-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [meta-poky][PATCH v6 1/2] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Sun, 02 Jun 2019 14:55:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a new variable POKY_INIT_MANAGER and create 4 .inc files to
configure init manager settings. Var POKY_INIT_MANAGER accepts 4 values:
sysvinit, systemd, systemd-compat and mdev-busybox. Set systemd by
default for DISTRO poky.  And set mdev-busybox for DISTRO poky-tiny
which doesn't change its init manger settings.

[YOCTO #13031]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../conf/distro/include/init-template-mdev-busybox.inc    | 7 +++++++
 .../conf/distro/include/init-template-systemd-compat.inc  | 7 +++++++
 meta-poky/conf/distro/include/init-template-systemd.inc   | 5 +++++
 meta-poky/conf/distro/include/init-template-sysvinit.inc  | 6 ++++++
 meta-poky/conf/distro/poky-tiny.conf                      | 8 +-------
 meta-poky/conf/distro/poky.conf                           | 6 ++++++
 6 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta-poky/conf/distro/include/init-template-mdev-busybox.inc
 create mode 100644 meta-poky/conf/distro/include/init-template-systemd-compat.inc
 create mode 100644 meta-poky/conf/distro/include/init-template-systemd.inc
 create mode 100644 meta-poky/conf/distro/include/init-template-sysvinit.inc

diff --git a/meta-poky/conf/distro/include/init-template-mdev-busybox.inc b/meta-poky/conf/distro/include/init-template-mdev-busybox.inc
new file mode 100644
index 0000000000..b07d9de5b4
--- /dev/null
+++ b/meta-poky/conf/distro/include/init-template-mdev-busybox.inc
@@ -0,0 +1,7 @@
+# enable mdev/busybox for init
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd sysvinit"
+VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+VIRTUAL-RUNTIME_init_manager = "busybox"
+VIRTUAL-RUNTIME_initscripts = "initscripts"
+VIRTUAL-RUNTIME_keymaps = "keymaps"
+VIRTUAL-RUNTIME_login_manager = "busybox"
diff --git a/meta-poky/conf/distro/include/init-template-systemd-compat.inc b/meta-poky/conf/distro/include/init-template-systemd-compat.inc
new file mode 100644
index 0000000000..22151f8866
--- /dev/null
+++ b/meta-poky/conf/distro/include/init-template-systemd-compat.inc
@@ -0,0 +1,7 @@
+# Don't append sysvinit to DISTRO_FEATURES here because it has been set
+# in DISTRO_FEATURES_BACKFILL. And then this .inc file could be used by
+# init-template-systemd.inc
+DISTRO_FEATURES_append = " systemd"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+VIRTUAL-RUNTIME_login_manager = "shadow-base"
diff --git a/meta-poky/conf/distro/include/init-template-systemd.inc b/meta-poky/conf/distro/include/init-template-systemd.inc
new file mode 100644
index 0000000000..d04847028c
--- /dev/null
+++ b/meta-poky/conf/distro/include/init-template-systemd.inc
@@ -0,0 +1,5 @@
+# Use systemd for system initialization
+
+require init-template-systemd-compat.inc
+
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
diff --git a/meta-poky/conf/distro/include/init-template-sysvinit.inc b/meta-poky/conf/distro/include/init-template-sysvinit.inc
new file mode 100644
index 0000000000..7725b30e1e
--- /dev/null
+++ b/meta-poky/conf/distro/include/init-template-sysvinit.inc
@@ -0,0 +1,6 @@
+# Use sysvinit for system initialization
+DISTRO_FEATURES_append = " sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
+VIRTUAL-RUNTIME_init_manager = "sysvinit"
+VIRTUAL-RUNTIME_initscripts = "initscripts"
+VIRTUAL-RUNTIME_login_manager = "busybox"
diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 1f8b6e8ff3..8ba0b9a4bb 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -81,13 +81,7 @@ DISTRO_FEATURES_append_libc-musl = " largefile"
 DISTRO_FEATURES_class-native = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 DISTRO_FEATURES_class-nativesdk = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-# enable mdev/busybox for init
-VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
-VIRTUAL-RUNTIME_login_manager = "busybox"
-VIRTUAL-RUNTIME_init_manager = "busybox"
-VIRTUAL-RUNTIME_initscripts = "initscripts"
-VIRTUAL-RUNTIME_keymaps = "keymaps"
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+POKY_INIT_MANAGER ?= "mdev-busybox"
 
 # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
 # packagegroup-core-base to select modutils-initscripts or not.  Similar with "net" and
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 78621e6dbf..e544f7e52c 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -84,3 +84,9 @@ require conf/distro/include/no-static-libs.inc
 require conf/distro/include/yocto-uninative.inc
 require conf/distro/include/security_flags.inc
 INHERIT += "uninative"
+
+# Make systemd as default init manager for poky
+# and set sysvinit for musl consider security
+POKY_INIT_MANAGER ??= "systemd"
+POKY_INIT_MANAGER_libc-musl = "sysvinit"
+require conf/distro/include/init-template-${POKY_INIT_MANAGER}.inc
-- 
2.20.0


