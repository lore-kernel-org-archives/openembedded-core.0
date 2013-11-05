Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADDF6CEB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 10:39:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA5AdXKg005621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 02:39:33 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.203) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 5 Nov 2013 02:39:33 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2013 18:39:26 +0800
Message-ID: <1383647966-9903-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ppp: Fix compilation errors in Makefile
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
X-List-Received-Date: Tue, 05 Nov 2013 10:39:33 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

This patch fixes below issues:

1. Make can't exit while compilation error occurs in subdir for plugins building.

2. If build ppp with newer kernel (3.10.10), it will pick 'if_pppox.h' from sysroot-dir and
   'if_pppol2tp.h' from its own source dir, this cause below build errors:

        bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:84:26:
        error: field 'pppol2tp' has incomplete type
          struct pppol2tpin6_addr pppol2tp;
                                  ^
        bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:99:28:
        error: field 'pppol2tp' has incomplete type
          struct pppol2tpv3in6_addr pppol2tp;
                                    ^

The 'sysroot-dir/if_pppox.h' enabled ipv6 support but the 'source-dir/if_pppol2tp.h' lost
related structure definitions, we should use both header files from sysroots to fix this
build failure.

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 ...01-ppp-Fix-compilation-errors-in-Makefile.patch |   75 ++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    4 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch
new file mode 100644
index 0000000..8aa2d2e
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch
@@ -0,0 +1,75 @@
+From ba0f6058d1f25b2b60fc31ab2656bf12a71ffdab Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Tue, 5 Nov 2013 17:32:56 +0800
+Subject: [PATCH] ppp: Fix compilation errors in Makefile
+
+This patch fixes below issues:
+
+1. Make can't exit while compilation error occurs in subdir for plugins building.
+
+2. If build ppp with newer kernel (3.10.10), it will pick 'if_pppox.h' from sysroot-dir and
+   'if_pppol2tp.h' from its own source dir, this cause below build errors:
+
+        bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:84:26:
+        error: field 'pppol2tp' has incomplete type
+          struct pppol2tpin6_addr pppol2tp;
+                                  ^
+        bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:99:28:
+        error: field 'pppol2tp' has incomplete type
+          struct pppol2tpv3in6_addr pppol2tp;
+                                    ^
+
+The 'sysroot-dir/if_pppox.h' enabled ipv6 support but the 'source-dir/if_pppol2tp.h' lost
+related structure definitions, we should use both header files from sysroots to fix this
+build failure.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+---
+ pppd/plugins/Makefile.linux          |    2 +-
+ pppd/plugins/pppol2tp/Makefile.linux |    2 +-
+ pppd/plugins/rp-pppoe/Makefile.linux |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pppd/plugins/Makefile.linux b/pppd/plugins/Makefile.linux
+index 0a7ec7b..2a2c15a 100644
+--- a/pppd/plugins/Makefile.linux
++++ b/pppd/plugins/Makefile.linux
+@@ -20,7 +20,7 @@ include .depend
+ endif
+ 
+ all:	$(PLUGINS)
+-	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all; done
++	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all || exit 1; done
+ 
+ %.so: %.c
+ 	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^
+diff --git a/pppd/plugins/pppol2tp/Makefile.linux b/pppd/plugins/pppol2tp/Makefile.linux
+index 19eff67..feb2f52 100644
+--- a/pppd/plugins/pppol2tp/Makefile.linux
++++ b/pppd/plugins/pppol2tp/Makefile.linux
+@@ -1,6 +1,6 @@
+ #CC	= gcc
+ COPTS	= -O2 -g
+-CFLAGS	= $(COPTS) -I. -I../.. -I../../../include -fPIC
++CFLAGS	= $(COPTS) -I. -I../.. -fPIC
+ LDFLAGS	= -shared
+ INSTALL	= install
+ 
+diff --git a/pppd/plugins/rp-pppoe/Makefile.linux b/pppd/plugins/rp-pppoe/Makefile.linux
+index f078991..15b9118 100644
+--- a/pppd/plugins/rp-pppoe/Makefile.linux
++++ b/pppd/plugins/rp-pppoe/Makefile.linux
+@@ -26,7 +26,7 @@ INSTALL	= install
+ RP_VERSION=3.8p
+ 
+ COPTS=-O2 -g
+-CFLAGS=$(COPTS) -I../../../include '-DRP_VERSION="$(RP_VERSION)"'
++CFLAGS=$(COPTS) '-DRP_VERSION="$(RP_VERSION)"'
+ all: rp-pppoe.so pppoe-discovery
+ 
+ pppoe-discovery: pppoe-discovery.o debug.o
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 39354ef..f89e4b9 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -29,7 +29,9 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://copts.patch \
            file://pap \
            file://ppp_on_boot \
-           file://provider "
+           file://provider \
+           file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
+"
 
 SRC_URI[md5sum] = "4621bc56167b6953ec4071043fe0ec57"
 SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230003505"
-- 
1.7.9.5


