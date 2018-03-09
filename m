Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BF1607897D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652062"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:10 +0200
Message-Id: <20180309185614.31113-32-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/36] cryptodev: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:37 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...pile-and-install-rules-for-cryptodev-test.patch | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
index 3f0298b0b0a..84fd27e681c 100644
--- a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
+++ b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
@@ -14,37 +14,37 @@ Upstream-Status: Pending
  tests/Makefile |    8 ++++++++
  2 files changed, 14 insertions(+), 0 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 31c4b3f..2ecf2a9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -34,6 +34,9 @@ modules_install:
- 	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
- 	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -35,6 +35,9 @@ modules_install:
+ 	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
+ 	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto/cryptodev.h
  
 +install_tests:
 +	make -C tests install DESTDIR=$(PREFIX)
 +
  clean:
- 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
+ 	$(MAKE) $(KERNEL_MAKE_OPTS) clean
  	rm -f $(hostprogs) *~
-@@ -42,6 +45,9 @@ clean:
+@@ -43,6 +46,9 @@ clean:
  check:
- 	CFLAGS=$(CRYPTODEV_CFLAGS) KERNEL_DIR=$(KERNEL_DIR) make -C tests check
+ 	CFLAGS=$(CRYPTODEV_CFLAGS) KERNEL_DIR=$(KERNEL_DIR) $(MAKE) -C tests check
  
 +testprogs:
 +	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
 +
  CPOPTS =
- ifneq (${SHOW_TYPES},)
+ ifneq ($(SHOW_TYPES),)
  CPOPTS += --show-types
-diff --git a/tests/Makefile b/tests/Makefile
-index c9f04e8..cd202af 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -19,6 +19,12 @@ example-async-hmac-objs := async_hmac.o
- example-async-speed-objs := async_speed.o
- example-hashcrypt-speed-objs := hashcrypt_speed.c
+Index: git/tests/Makefile
+===================================================================
+--- git.orig/tests/Makefile
++++ git/tests/Makefile
+@@ -23,6 +23,12 @@ bindir = $(execprefix)/bin
+ 
+ all: $(hostprogs)
  
 +install:
 +	install -d  $(DESTDIR)/usr/bin/tests_cryptodev
@@ -55,9 +55,9 @@ index c9f04e8..cd202af 100644
  check: $(hostprogs)
  	./cipher
  	./hmac
-@@ -28,6 +34,8 @@ check: $(hostprogs)
- 	./cipher-gcm
- 	./cipher-aead
+@@ -38,6 +44,8 @@ install:
+ 		install -m 755 $$prog $(DESTDIR)/$(bindir); \
+ 	done
  
 +testprogs: $(hostprogs)
 +
-- 
2.16.1


