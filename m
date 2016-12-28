Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A098D71A22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 14:45:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 28 Dec 2016 06:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="47468184"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Dec 2016 06:45:49 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A1BF36A4006;
	Wed, 28 Dec 2016 06:44:57 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 16:45:44 +0200
Message-Id: <e2afc0ede07972eba63e90507a25c381ff89b3b8.1482936066.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482936066.git.jussi.kukkonen@intel.com>
References: <cover.1482936066.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] ppp: Partly remove patch that doesn't make sense any more
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
X-List-Received-Date: Wed, 28 Dec 2016 14:45:48 -0000

ppp no longer provides the duplicate if_pppox.h header so no need to patch that
out of the Makefile.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...01-ppp-Fix-compilation-errors-in-Makefile.patch | 51 ++--------------------
 1 file changed, 3 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
index 8aa2d2e..ea4969b 100644
--- a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
+++ b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
@@ -3,34 +3,14 @@ From: Lu Chong <Chong.Lu@windriver.com>
 Date: Tue, 5 Nov 2013 17:32:56 +0800
 Subject: [PATCH] ppp: Fix compilation errors in Makefile
 
-This patch fixes below issues:
-
-1. Make can't exit while compilation error occurs in subdir for plugins building.
-
-2. If build ppp with newer kernel (3.10.10), it will pick 'if_pppox.h' from sysroot-dir and
-   'if_pppol2tp.h' from its own source dir, this cause below build errors:
-
-        bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:84:26:
-        error: field 'pppol2tp' has incomplete type
-          struct pppol2tpin6_addr pppol2tp;
-                                  ^
-        bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:99:28:
-        error: field 'pppol2tp' has incomplete type
-          struct pppol2tpv3in6_addr pppol2tp;
-                                    ^
-
-The 'sysroot-dir/if_pppox.h' enabled ipv6 support but the 'source-dir/if_pppol2tp.h' lost
-related structure definitions, we should use both header files from sysroots to fix this
-build failure.
+Make can't exit while compilation error occurs in subdir for plugins building.
 
 Upstream-Status: Pending
 
 Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
 ---
- pppd/plugins/Makefile.linux          |    2 +-
- pppd/plugins/pppol2tp/Makefile.linux |    2 +-
- pppd/plugins/rp-pppoe/Makefile.linux |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ pppd/plugins/Makefile.linux          |    1 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/pppd/plugins/Makefile.linux b/pppd/plugins/Makefile.linux
 index 0a7ec7b..2a2c15a 100644
@@ -45,31 +25,6 @@ index 0a7ec7b..2a2c15a 100644
  
  %.so: %.c
  	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^
-diff --git a/pppd/plugins/pppol2tp/Makefile.linux b/pppd/plugins/pppol2tp/Makefile.linux
-index 19eff67..feb2f52 100644
---- a/pppd/plugins/pppol2tp/Makefile.linux
-+++ b/pppd/plugins/pppol2tp/Makefile.linux
-@@ -1,6 +1,6 @@
- #CC	= gcc
- COPTS	= -O2 -g
--CFLAGS	= $(COPTS) -I. -I../.. -I../../../include -fPIC
-+CFLAGS	= $(COPTS) -I. -I../.. -fPIC
- LDFLAGS	= -shared
- INSTALL	= install
- 
-diff --git a/pppd/plugins/rp-pppoe/Makefile.linux b/pppd/plugins/rp-pppoe/Makefile.linux
-index f078991..15b9118 100644
---- a/pppd/plugins/rp-pppoe/Makefile.linux
-+++ b/pppd/plugins/rp-pppoe/Makefile.linux
-@@ -26,7 +26,7 @@ INSTALL	= install
- RP_VERSION=3.8p
- 
- COPTS=-O2 -g
--CFLAGS=$(COPTS) -I../../../include '-DRP_VERSION="$(RP_VERSION)"'
-+CFLAGS=$(COPTS) '-DRP_VERSION="$(RP_VERSION)"'
- all: rp-pppoe.so pppoe-discovery
- 
- pppoe-discovery: pppoe-discovery.o debug.o
 -- 
 1.7.9.5
 
-- 
2.1.4


