Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6A876DE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:54:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U7sJDj006591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:54:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 30 Sep 2015 00:54:19 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 15:47:17 +0800
Message-ID: <e825102bd4c1e677ae16158535941773881fef13.1443599169.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
In-Reply-To: <cover.1443599169.git.kai.kang@windriver.com>
References: <cover.1443599169.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] iptables: only check libnetfilter-conntrack when libnfnetlink is enabled
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
X-List-Received-Date: Wed, 30 Sep 2015 07:54:21 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Package libnetfilter-conntrack depends on package libnfnetlink. iptables
checks package libnetfilter-conntrack whatever its package config
libnfnetlink is enabled or not. When libnfnetlink is disabled but
package libnetfilter-conntrack exists, it fails randomly with:

| In file included from .../iptables/1.4.21-r0/iptables-1.4.21/extensions/libxt_connlabel.c:8:0:
| .../tmp/sysroots/qemumips/usr/include/libnetfilter_conntrack/libnetfilter_conntrack.h:14:42: fatal error: libnfnetlink/linux_nfnetlink.h: No such file or directory
| compilation terminated.
| GNUmakefile:96: recipe for target 'libxt_connlabel.oo' failed

Only check libnetfilter-conntrack when libnfnetlink is enabled to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...check-conntrack-when-libnfnetlink-enabled.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch

diff --git a/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch b/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
new file mode 100644
index 0000000..89ad8f6
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
@@ -0,0 +1,34 @@
+Package libnetfilter-conntrack depends on package libnfnetlink. iptables
+checks package libnetfilter-conntrack whatever its package config
+libnfnetlink is enabled or not. When libnfnetlink is disabled but
+package libnetfilter-conntrack exists, it fails randomly with:
+
+| In file included from .../iptables/1.4.21-r0/iptables-1.4.21/extensions/libxt_connlabel.c:8:0:
+| .../tmp/sysroots/qemumips/usr/include/libnetfilter_conntrack/libnetfilter_conntrack.h:14:42: fatal error: libnfnetlink/linux_nfnetlink.h: No such file or directory
+| compilation terminated.
+| GNUmakefile:96: recipe for target 'libxt_connlabel.oo' failed
+
+Only check libnetfilter-conntrack when libnfnetlink is enabled to fix it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index 5d7e62b..e331ee7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -88,8 +88,12 @@ if test "$ac_cv_header_linux_ip_vs_h" != "yes"; then
+ 	blacklist_modules="$blacklist_modules ipvs";
+ fi;
+ 
+-PKG_CHECK_MODULES([libnetfilter_conntrack], [libnetfilter_conntrack >= 1.0.4],
++nfconntrack=0
++AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
++  PKG_CHECK_MODULES([libnetfilter_conntrack], [libnetfilter_conntrack >= 1.0.4],
+ 	[nfconntrack=1], [nfconntrack=0])
++  ])
++
+ AM_CONDITIONAL([HAVE_LIBNETFILTER_CONNTRACK], [test "$nfconntrack" = 1])
+ 
+ if test "$nfconntrack" -ne 1; then
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index 31c017b..deea5e5 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0001-fix-build-with-musl.patch \
+           file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
           "
 
 SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
@@ -38,7 +39,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 # libnfnetlink recipe is in meta-networking layer
-PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libnfnetlink"
+PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libnfnetlink libnetfilter-conntrack"
 
 do_configure_prepend() {
 	# Remove some libtool m4 files
-- 
2.6.0.rc2.10.gf4d9753


