Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 43B2370B3F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 16:07:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2014 09:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,837,1400050800"; d="scan'208";a="582844314"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO peggleto-mobl5.lan)
	([10.252.122.124])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2014 09:07:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:06:58 +0100
Message-Id: <4ca519f8257cc3ec922a2053d9f23d41fe8541cf.1407686784.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407686783.git.paul.eggleton@linux.intel.com>
References: <cover.1407686783.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407686783.git.paul.eggleton@linux.intel.com>
References: <cover.1407686783.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] openssl: upgrade to 1.0.1i
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
X-List-Received-Date: Sun, 10 Aug 2014 16:07:08 -0000

Removed one patch merged upstream.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/heartbeat-test-private-api.patch       | 45 ----------------------
 .../{openssl_1.0.1h.bb => openssl_1.0.1i.bb}       |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1h.bb => openssl_1.0.1i.bb} (90%)

diff --git a/meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch b/meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
deleted file mode 100644
index 3c77dfc..0000000
--- a/meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2e251ba8feaa696f9408a19336d1fbab148df55e Mon Sep 17 00:00:00 2001
-From: Kurt Roeckx <kurt@roeckx.be>
-Date: Sat, 7 Jun 2014 13:32:23 +0200
-Subject: [PATCH] Link heartbeat_test with the static version of the libraries
-
-It's using an internal API that that might not be available in the shared
-library.
-
-Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/125]
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- test/Makefile | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/test/Makefile b/test/Makefile
-index f1816ac..1dd7bb9 100644
---- a/test/Makefile
-+++ b/test/Makefile
-@@ -420,6 +420,13 @@ BUILD_CMD=shlib_target=; if [ -n "$(SHARED_LIBS)" ]; then \
- 		LIBDEPS="$(PEX_LIBS) $$LIBRARIES $(EX_LIBS)" \
- 		link_app.$${shlib_target}
- 
-+BUILD_CMD_STATIC=shlib_target=; \
-+	LIBRARIES="$(DLIBSSL) $(DLIBCRYPTO) $(LIBKRB5)"; \
-+	$(MAKE) -f $(TOP)/Makefile.shared -e \
-+		APPNAME=$$target$(EXE_EXT) OBJECTS="$$target.o" \
-+		LIBDEPS="$(PEX_LIBS) $$LIBRARIES $(EX_LIBS)" \
-+		link_app.$${shlib_target}
-+
- $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
- 	@target=$(RSATEST); $(BUILD_CMD)
- 
-@@ -618,7 +625,7 @@ $(V3NAMETEST)$(EXE_EXT): $(V3NAMETEST).o $(DLIBCRYPTO)
- 	@target=$(V3NAMETEST); $(BUILD_CMD)
- 
- $(HEARTBEATTEST)$(EXE_EXT): $(HEARTBEATTEST).o $(DLIBCRYPTO)
--	@target=$(HEARTBEATTEST); $(BUILD_CMD)
-+	@target=$(HEARTBEATTEST); $(BUILD_CMD_STATIC)
- 
- #$(AESTEST).o: $(AESTEST).c
- #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
--- 
-1.9.3
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1i.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1i.bb
index ddaaba8..4f88784 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1i.bb
@@ -34,13 +34,12 @@ SRC_URI += "file://configure-targets.patch \
             file://find.pl \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
-            file://heartbeat-test-private-api.patch \
             file://ptest-deps.patch \
             file://run-ptest \
            "
 
-SRC_URI[md5sum] = "8d6d684a9430d5cc98a62a5d8fbda8cf"
-SRC_URI[sha256sum] = "9d1c8a9836aa63e2c6adb684186cbd4371c9e9dcc01d6e3bb447abf2d4d3d093"
+SRC_URI[md5sum] = "c8dc151a671b9b92ff3e4c118b174972"
+SRC_URI[sha256sum] = "3c179f46ca77069a6a0bac70212a9b3b838b2f66129cb52d568837fc79d8fcc7"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.9.3


