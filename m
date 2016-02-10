Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 345066FF80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:06:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 10 Feb 2016 04:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="881164645"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2016 04:07:00 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A48016A4002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:54:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:10:10 +0200
Message-Id: <1455106210-10313-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
Subject: [PATCH v2] iproute2: update to version 4.4.0
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
X-List-Received-Date: Wed, 10 Feb 2016 12:07:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.3.0 -> 4.4.0

a) Added iproute2-fix-building-with-musl.patch to fix build with
musl.
b) Include below listed utilities that are not yet enabled/packaged
in the iproute2 recipe:
1. lnstat
2. ifstat
3. genl
4. rtacct
5. nstat
6. ss

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc    | 10 +++++++--
 .../iproute2/iproute2-fix-building-with-musl.patch | 24 ++++++++++++++++++++++
 .../{iproute2_4.3.0.bb => iproute2_4.4.0.bb}       |  5 +++--
 3 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.3.0.bb => iproute2_4.4.0.bb} (63%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 9ce157b..86e9310 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables elfutils"
 
 inherit update-alternatives
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
@@ -32,9 +32,15 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "${PN}-tc"
+PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
+FILES_${PN}-lnstat = "${base_sbindir}/lnstat ${base_sbindir}/ctstat ${base_sbindir}/rtstat"
+FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
+FILES_${PN}-genl = "${base_sbindir}/genl"
+FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
+FILES_${PN}-nstat = "${base_sbindir}/nstat"
+FILES_${PN}-ss = "${base_sbindir}/ss"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
diff --git a/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
new file mode 100644
index 0000000..c83a243
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/iproute2-fix-building-with-musl.patch
@@ -0,0 +1,24 @@
+iproute2: fix building with musl
+
+We need limits.h for PATH_MAX, fixes:
+
+rt_names.c:364:13: error: ‘PATH_MAX’ undeclared (first use in this
+function)
+
+Upstream-Status: Backport
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff --git a/lib/rt_names.c b/lib/rt_names.c
+index f6d17c0..b665d3e 100644
+--- a/lib/rt_names.c
++++ b/lib/rt_names.c
+@@ -18,6 +18,7 @@
+ #include <sys/time.h>
+ #include <sys/socket.h>
+ #include <dirent.h>
++#include <limits.h>
+ 
+ #include <asm/types.h>
+ #include <linux/rtnetlink.h>
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
similarity index 63%
rename from meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
index 60f0a8d..7979e8b 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.4.0.bb
@@ -4,9 +4,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
            file://iproute2-4.3.0-musl.patch \
+           file://iproute2-fix-building-with-musl.patch \
           "
-SRC_URI[md5sum] = "1a2bbb80cfc7ab3f3e987e18b3207c2f"
-SRC_URI[sha256sum] = "f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995"
+SRC_URI[md5sum] = "d762653ec3e1ab0d4a9689e169ca184f"
+SRC_URI[sha256sum] = "bc91c367288a19f78ef800cd6840363be1f22da8436fbae88e1a7250490d6514"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.4.0


