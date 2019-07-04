Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5BB7EB43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 14:39:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x64EdttK018774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 07:39:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 4 Jul 2019 07:39:55 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 4 Jul 2019 21:45:20 +0800
Message-ID: <20190704134520.16320-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190704134520.16320-1-kai.kang@windriver.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [meta-poky][PATCH 2/2] poky.conf: make systemd as default init manager
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

Make systemd as default init manager for distro poky. And set sysvinit
as default value for musl considering security.

Update poky-tiny.conf to use new introduced variable INIT_MANGER.

[YOCTO #13031]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 8 ++------
 meta-poky/conf/distro/poky.conf      | 5 +++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 1f8b6e8ff3..e847c59676 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -82,12 +82,8 @@ DISTRO_FEATURES_class-native = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO
 DISTRO_FEATURES_class-nativesdk = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
 # enable mdev/busybox for init
-VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
-VIRTUAL-RUNTIME_login_manager = "busybox"
-VIRTUAL-RUNTIME_init_manager = "busybox"
-VIRTUAL-RUNTIME_initscripts = "initscripts"
-VIRTUAL-RUNTIME_keymaps = "keymaps"
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+# because poky-tiny uses musl, set with override libc-musl
+INIT_MANAGER_libc-musl = "mdev-busybox"
 
 # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
 # packagegroup-core-base to select modutils-initscripts or not.  Similar with "net" and
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 78621e6dbf..20ea5637d3 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -84,3 +84,8 @@ require conf/distro/include/no-static-libs.inc
 require conf/distro/include/yocto-uninative.inc
 require conf/distro/include/security_flags.inc
 INHERIT += "uninative"
+
+# Make systemd as default init manager for poky
+# and set sysvinit for musl consider security
+INIT_MANAGER ?= "systemd"
+INIT_MANAGER_libc-musl ?= "sysvinit"
-- 
2.18.0


