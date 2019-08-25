Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DE4717F648
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 17:21:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46GhkQ49C6z5c
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 19:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566753678;
	bh=N4TcuTRJMtEGkIZcZC/EPlQaLgoxH8SJy6NVEnLX1rU=;
	h=From:To:Subject:Date:From;
	b=Sdqk4hqlmod90G9E2IJlOFs+Zk7613tSgEjic8czPvG5jQZzVEjpny4cmUV0ifpS9
	jhH3Mt9naIXHsCc8+LkOjvGmHwUuz5E/AMX7VlSuRBOJnP9CmhQZ8+I7IA28ygKhpH
	N2KUQq3PQ4YLaPtRI8DYS+ZWvCl3WZvvFhcD5CgL013WJIXkB3I9jQxBDyj6merdyy
	0vYKnE60NX1wLEpN0GbVhgRDFPSRFbSgqHg4RHQT9ZiQntCfwlDZLqfIm9FaeyUM9t
	EHDi/ucfXtSv5mHrauKuSAAweIby5nlJahd+Qk/WC1wk605lLYLd62nnM3d5gznr/Y
	wc4oXh8SbAYybBk+KyK9u6EYrzVGctzzQqo//H5u23ecryHhAd4StRVen0GJnNBkBT
	bP59mS8U9EqrbjU+dJNcCWV33YdABf2Kpi4PEvNKJzNn9Jg79oDliJI6H3C7W3X9xW
	TT/y6uw0RVCZE17G8clk1QVq6XGieDy19AVl+5gUihq3DcG7jqPb4MeXr9vJy0CqDR
	aMpJuctEEck/MgdMiGr0o7wz0MWS+KInlYyh1zhLXyB8gbwKpanHDWBt3cGuohiPci
	3R3FRA7FNfyangfxjMk312V0MTLDfZ7Ba9VmPKz550ycrtUhFAUPPEMRjk/corr+A4
	332okRadoTIyUUfDWDpvTkwc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2019 20:21:16 +0300
Message-Id: <20190825172116.23759-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove LSB support bits
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
X-List-Received-Date: Sun, 25 Aug 2019 17:21:18 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../distro/include/poky-distro-alt-test-config.inc  |  2 +-
 meta-poky/conf/distro/poky-lsb.conf                 | 13 -------------
 meta-poky/conf/distro/poky-tiny.conf                |  3 ---
 meta-poky/conf/local.conf.sample.extended           |  2 +-
 4 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta-poky/conf/distro/poky-lsb.conf

diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
index 081584f397..dff5804530 100644
--- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
+++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
@@ -1,2 +1,2 @@
 DISTRO_FEATURES_append = " pam"
-PREFERRED_VERSION_linux-yocto_linuxstdbase ?= "4.19%"
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
diff --git a/meta-poky/conf/distro/poky-lsb.conf b/meta-poky/conf/distro/poky-lsb.conf
deleted file mode 100644
index 9b36c87c48..0000000000
--- a/meta-poky/conf/distro/poky-lsb.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-
-require conf/distro/poky.conf
-
-DISTRO = "poky-lsb"
-DISTROOVERRIDES = "poky:linuxstdbase"
-
-DISTRO_FEATURES_append = " pam"
-
-# Ensure the kernel nfs server is enabled
-KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-
-# Use the LTSI Kernel for LSB Testing
-PREFERRED_VERSION_linux-yocto_linuxstdbase ?= "4.19%"
diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 1f8b6e8ff3..8236b6f273 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -117,9 +117,6 @@ PNBLACKLIST[build-appliance-image] = "not buildable with poky-tiny"
 PNBLACKLIST[core-image-base] = "not buildable with poky-tiny"
 PNBLACKLIST[core-image-clutter] = "not buildable with poky-tiny"
 PNBLACKLIST[core-image-full-cmdline] = "not buildable with poky-tiny"
-PNBLACKLIST[core-image-lsb] = "not buildable with poky-tiny"
-PNBLACKLIST[core-image-lsb-dev] = "not buildable with poky-tiny"
-PNBLACKLIST[core-image-lsb-sdk] = "not buildable with poky-tiny"
 PNBLACKLIST[core-image-rt] = "not buildable with poky-tiny"
 PNBLACKLIST[core-image-rt-sdk] = "not buildable with poky-tiny"
 PNBLACKLIST[core-image-sato] = "not buildable with poky-tiny"
diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index 77e8be26fa..dc92a16f6c 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -270,7 +270,7 @@ DISTRO_FEATURES_remove = "x11"
 #
 # By including the security_flags include file you enable flags
 # to the compiler and linker that cause them to generate more secure
-# code, this is enabled by default in the poky-lsb distro.
+# code.
 # This does affect compile speed slightly.
 #
 # Use the following line to enable the security compiler and linker flags to your build
-- 
2.17.1


