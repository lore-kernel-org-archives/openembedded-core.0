Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7664F71A19
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 11:46:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 08 May 2017 04:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="965772521"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2017 04:46:10 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id B6C8C6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 04:45:55 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 14:46:57 +0300
Message-Id: <1494244017-3933-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] connman: upgrade to 1.34
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
X-List-Received-Date: Mon, 08 May 2017 11:46:09 -0000

1.33 -> 1.34

1. Refreshed 0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
2. Removed upstreamed patch:
     0003-stats-Fix-bad-file-descriptor-initialisation.patch
3. Provided PACKAGECONFIGs for nftables and iptables support
4. Add new patch to fix build with nftables:
     0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |   5 +-
 ...x-compile-on-musl-with-kernel-4.9-headers.patch |  37 ++++++--
 ...ll-nftables-fix-build-with-libnftnl-1.0.7.patch |  72 +++++++++++++++
 ...ts-Fix-bad-file-descriptor-initialisation.patch | 102 ---------------------
 .../connman/{connman_1.33.bb => connman_1.34.bb}   |   6 +-
 5 files changed, 106 insertions(+), 116 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
 rename meta/recipes-connectivity/connman/{connman_1.33.bb => connman_1.34.bb} (70%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 64a5418..cc2d469 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d bluetooth
 
-DEPENDS  = "dbus glib-2.0 ppp iptables readline"
+DEPENDS  = "dbus glib-2.0 ppp readline"
 
 INC_PR = "r20"
 
@@ -33,6 +33,7 @@ EXTRA_OECONF += "\
 PACKAGECONFIG ??= "wispr \
                    ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+                   iptables \
 "
 
 # If you want ConnMan to support VPN, add following statement into
@@ -50,6 +51,8 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
+PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
diff --git a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch b/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
index bf3b86d..da5756e 100644
--- a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
@@ -1,4 +1,4 @@
-From c8bfad4ee9d2c505c00ccbb8b2139543b5ad6fcb Mon Sep 17 00:00:00 2001
+From 594b67df7ca923d13265906a71fbbf748273a5f5 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 23 Jan 2017 17:41:39 +0200
 Subject: [PATCH] Fix compile on musl with kernel 4.9 headers
@@ -7,12 +7,15 @@ Kernel headers break when musl defines IFF_LOWER_UP. While
 waiting for more proper fix in musl, add a hack to connman.
 
 Upstream-Status: Inappropriate [Workaround]
+
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- src/6to4.c     | 4 ++++
- src/firewall.c | 4 ++++
- src/iptables.c | 4 ++++
- 3 files changed, 12 insertions(+)
+ src/6to4.c              | 4 ++++
+ src/firewall-iptables.c | 4 ++++
+ src/firewall-nftables.c | 3 +++
+ src/iptables.c          | 4 ++++
+ 4 files changed, 15 insertions(+)
 
 diff --git a/src/6to4.c b/src/6to4.c
 index 71a2882..1938afb 100644
@@ -29,10 +32,10 @@ index 71a2882..1938afb 100644
  #include <errno.h>
  #include <stdio.h>
  #include <stdlib.h>
-diff --git a/src/firewall.c b/src/firewall.c
-index c440df6..c83def9 100644
---- a/src/firewall.c
-+++ b/src/firewall.c
+diff --git a/src/firewall-iptables.c b/src/firewall-iptables.c
+index 45943a8..e04bb91 100644
+--- a/src/firewall-iptables.c
++++ b/src/firewall-iptables.c
 @@ -23,6 +23,10 @@
  #include <config.h>
  #endif
@@ -44,6 +47,20 @@ index c440df6..c83def9 100644
  #include <errno.h>
  
  #include <xtables.h>
+diff --git a/src/firewall-nftables.c b/src/firewall-nftables.c
+index 2503ee2..583d1c4 100644
+--- a/src/firewall-nftables.c
++++ b/src/firewall-nftables.c
+@@ -30,6 +30,9 @@
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++/* hack to make sure kernel headers understand that libc (musl)
++   does define IFF_LOWER_UP et al. */
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
+
+ #include <stdlib.h>
+ #include <time.h>
 diff --git a/src/iptables.c b/src/iptables.c
 index 82e3ac4..46ad9e2 100644
 --- a/src/iptables.c
@@ -60,5 +77,5 @@ index 82e3ac4..46ad9e2 100644
  #include <stdlib.h>
  #include <stdio.h>
 -- 
-2.1.4
+2.4.0
 
diff --git a/meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch b/meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
new file mode 100644
index 0000000..cfafbd1
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch
@@ -0,0 +1,72 @@
+From 4058ce3186a99fd5f03350fc11a7fc8d38b6a381 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 8 May 2017 10:53:18 +0300
+Subject: [PATCH] firewall-nftables: fix build with libnftnl-1.0.7
+
+We need these updates to accommodate the changes caused by the following
+commit in libnftnl-1.0.7
+
+commit 907a9f8e5a93f5bcd449643eb3916a656d634758
+Author: Pablo Neira Ayuso <pablo@netfilter.org>
+Date:   Tue Dec 20 13:47:11 2016 +0100
+
+src: get rid of aliases and compat
+
+This machinery was introduced to avoid sudden compilation breakage of
+old nftables releases. With the upcoming release of 0.7 (and 0.6 which
+is now 6 months old) this is not required anymore.
+
+Moreover, users gain nothing from older releases since they are
+half-boiled and buggy.
+
+So let's get rid of aliases now. Bump LIBVERSION and update map file.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ src/firewall-nftables.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/firewall-nftables.c b/src/firewall-nftables.c
+index 583d1c4..83b137b 100644
+--- a/src/firewall-nftables.c
++++ b/src/firewall-nftables.c
+@@ -387,9 +387,9 @@ static int add_cmp(struct nftnl_rule *rule, uint32_t sreg, uint32_t op,
+         if (!expr)
+                 return -ENOMEM;
+ 
+-        nftnl_expr_set_u32(expr, NFT_EXPR_CMP_SREG, sreg);
+-        nftnl_expr_set_u32(expr, NFT_EXPR_CMP_OP, op);
+-        nftnl_expr_set(expr, NFT_EXPR_CMP_DATA, data, data_len);
++        nftnl_expr_set_u32(expr, NFTNL_EXPR_CMP_SREG, sreg);
++        nftnl_expr_set_u32(expr, NFTNL_EXPR_CMP_OP, op);
++        nftnl_expr_set(expr, NFTNL_EXPR_CMP_DATA, data, data_len);
+ 
+         nftnl_rule_add_expr(rule, expr);
+ 
+@@ -575,8 +575,8 @@ static int build_rule_nat(const char *address, unsigned char prefixlen,
+ 	expr = nftnl_expr_alloc("meta");
+ 	if (!expr)
+ 		goto err;
+-	nftnl_expr_set_u32(expr, NFT_EXPR_META_KEY, NFT_META_OIFNAME);
+-	nftnl_expr_set_u32(expr, NFT_EXPR_META_DREG, NFT_REG_1);
++	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_KEY, NFT_META_OIFNAME);
++	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_DREG, NFT_REG_1);
+ 	nftnl_rule_add_expr(rule, expr);
+ 	err = add_cmp(rule, NFT_REG_1, NFT_CMP_EQ, interface,
+ 			strlen(interface) + 1);
+@@ -677,8 +677,8 @@ static int build_rule_snat(int index, const char *address,
+ 	expr = nftnl_expr_alloc("meta");
+ 	if (!expr)
+ 		goto err;
+-	nftnl_expr_set_u32(expr, NFT_EXPR_META_KEY, NFT_META_OIF);
+-	nftnl_expr_set_u32(expr, NFT_EXPR_META_DREG, NFT_REG_1);
++	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_KEY, NFT_META_OIF);
++	nftnl_expr_set_u32(expr, NFTNL_EXPR_META_DREG, NFT_REG_1);
+ 	nftnl_rule_add_expr(rule, expr);
+ 	err = add_cmp(rule, NFT_REG_1, NFT_CMP_EQ, &index, sizeof(index));
+ 	if (err < 0)
+-- 
+2.4.0
+
diff --git a/meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch b/meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
deleted file mode 100644
index c545811..0000000
--- a/meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From c7f4151fb053b0d0691d8f10d7e3690265d28889 Mon Sep 17 00:00:00 2001
-From: Lukasz Nowak <lnowak@tycoint.com>
-Date: Wed, 26 Oct 2016 18:13:02 +0100
-Subject: [PATCH] stats: Fix bad file descriptor initialisation
-
-Stats file code initialises its file descriptor field to 0.  But 0 is
-a valid fd value. -1 should be used instead.  This causes problems
-when an error happens before a stats file is open (e.g. mkdir
-fails). The clean-up procedure, stats_free() calls close(fd).  When fd
-is 0, this first closes stdin, and then any files/sockets which
-received fd=0, re-used by the OS.
-
-Fixed several instances of bad file descriptor field handling, in case
-of errors.
-
-The bug results with connman freezing if there is no read/write storage
-directory available, and there are multiple active interfaces
-(fd=0 gets re-used for sockets in that case).
-
-The patch was imported from the Connman git repository
-(git://git.kernel.org/pub/scm/network/connman) as of commit id
-c7f4151fb053b0d0691d8f10d7e3690265d28889. 
-
-Upstream-Status: Accepted
-Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
----
- src/stats.c | 15 +++++++++++++++
- src/util.c  |  4 ++--
- 2 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/src/stats.c b/src/stats.c
-index 26343b1..c3ca738 100644
---- a/src/stats.c
-+++ b/src/stats.c
-@@ -378,6 +378,7 @@ static int stats_file_setup(struct stats_file *file)
- 			strerror(errno), file->name);
- 
- 		TFR(close(file->fd));
-+		file->fd = -1;
- 		g_free(file->name);
- 		file->name = NULL;
- 
-@@ -393,6 +394,7 @@ static int stats_file_setup(struct stats_file *file)
- 	err = stats_file_remap(file, size);
- 	if (err < 0) {
- 		TFR(close(file->fd));
-+		file->fd = -1;
- 		g_free(file->name);
- 		file->name = NULL;
- 
-@@ -649,6 +651,13 @@ static int stats_file_history_update(struct stats_file *data_file)
- 	bzero(history_file, sizeof(struct stats_file));
- 	bzero(temp_file, sizeof(struct stats_file));
- 
-+	/*
-+	 * 0 is a valid file descriptor - fd needs to be initialized
-+	 * to -1 to handle errors correctly
-+	 */
-+	history_file->fd = -1;
-+	temp_file->fd = -1;
-+
- 	err = stats_open(history_file, data_file->history_name);
- 	if (err < 0)
- 		return err;
-@@ -682,6 +691,12 @@ int __connman_stats_service_register(struct connman_service *service)
- 		if (!file)
- 			return -ENOMEM;
- 
-+		/*
-+		 * 0 is a valid file descriptor - fd needs to be initialized
-+		 * to -1 to handle errors correctly
-+		 */
-+		file->fd = -1;
-+
- 		g_hash_table_insert(stats_hash, service, file);
- 	} else {
- 		return -EALREADY;
-diff --git a/src/util.c b/src/util.c
-index e6532c8..732d451 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -63,7 +63,7 @@ int __connman_util_init(void)
- {
- 	int r = 0;
- 
--	if (f > 0)
-+	if (f >= 0)
- 		return 0;
- 
- 	f = open(URANDOM, O_RDONLY);
-@@ -86,7 +86,7 @@ int __connman_util_init(void)
- 
- void __connman_util_cleanup(void)
- {
--	if (f > 0)
-+	if (f >= 0)
- 		close(f);
- 
- 	f = -1;
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.34.bb
similarity index 70%
rename from meta/recipes-connectivity/connman/connman_1.33.bb
rename to meta/recipes-connectivity/connman/connman_1.34.bb
index 4129b05..5d0f242 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.34.bb
@@ -2,15 +2,15 @@ require connman.inc
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+            file://0001-firewall-nftables-fix-build-with-libnftnl-1.0.7.patch \
             file://connman \
             file://no-version-scripts.patch \
             file://includes.patch \
-            file://0003-stats-Fix-bad-file-descriptor-initialisation.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
 
-SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
-SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
+SRC_URI[md5sum] = "e200028702c831d5f535d20d61e608ef"
+SRC_URI[sha256sum] = "a9a0808c729c1f348fc36d8cecb52d19b72bc34cb411c502608cb0e0190fc71e"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
2.4.0


