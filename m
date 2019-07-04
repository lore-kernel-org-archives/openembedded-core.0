Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E66DD7EB43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 14:39:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x64Edr7T004082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 07:39:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 4 Jul 2019 07:39:53 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 4 Jul 2019 21:45:19 +0800
Message-ID: <20190704134520.16320-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190704134520.16320-1-kai.kang@windriver.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Thu, 04 Jul 2019 14:39:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a new variable INIT_MANAGER and create 3 init-manager-*.inc
files to configure init manager settings. Available values of
INIT_MANAGER are sysvinit, systemd and mdev-busybox. 'sysvinit' is set
by default for compatibility.

[YOCTO #13031]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/distro/defaultsetup.conf                     | 3 +++
 meta/conf/distro/include/init-manager-mdev-busybox.inc | 7 +++++++
 meta/conf/distro/include/init-manager-systemd.inc      | 6 ++++++
 meta/conf/distro/include/init-manager-sysvinit.inc     | 6 ++++++
 4 files changed, 22 insertions(+)
 create mode 100644 meta/conf/distro/include/init-manager-mdev-busybox.inc
 create mode 100644 meta/conf/distro/include/init-manager-systemd.inc
 create mode 100644 meta/conf/distro/include/init-manager-sysvinit.inc

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 20e61232e9..057e2f761f 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -23,3 +23,6 @@ PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
+
+INIT_MANAGER ??= "sysvinit"
+require conf/distro/include/init-manager-${INIT_MANAGER}.inc
diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
new file mode 100644
index 0000000000..b07d9de5b4
--- /dev/null
+++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
@@ -0,0 +1,7 @@
+# enable mdev/busybox for init
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd sysvinit"
+VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+VIRTUAL-RUNTIME_init_manager = "busybox"
+VIRTUAL-RUNTIME_initscripts = "initscripts"
+VIRTUAL-RUNTIME_keymaps = "keymaps"
+VIRTUAL-RUNTIME_login_manager = "busybox"
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
new file mode 100644
index 0000000000..6542e29cfd
--- /dev/null
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -0,0 +1,6 @@
+# Use systemd for system initialization
+DISTRO_FEATURES_append = " systemd"
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+VIRTUAL-RUNTIME_login_manager = "shadow-base"
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
new file mode 100644
index 0000000000..7725b30e1e
--- /dev/null
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -0,0 +1,6 @@
+# Use sysvinit for system initialization
+DISTRO_FEATURES_append = " sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
+VIRTUAL-RUNTIME_init_manager = "sysvinit"
+VIRTUAL-RUNTIME_initscripts = "initscripts"
+VIRTUAL-RUNTIME_login_manager = "busybox"
-- 
2.18.0


