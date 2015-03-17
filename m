Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 841AC6AC43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 01:35:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2015 18:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,412,1422950400"; d="scan'208";a="666172433"
Received: from jayundt-mobl3.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.196.101])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 18:35:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 19:35:01 -0600
Message-Id: <1426556101-32053-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2] openssl: fix libssl.pc to use libcrypto
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
X-List-Received-Date: Tue, 17 Mar 2015 01:35:18 -0000

The 1.0.2 version of libssl requires that libcrypto be linked so don't
keep it private anymore.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../openssl/fix_Makefile_creation_of_libssl.patch        | 16 ++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.0.2.bb       |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
new file mode 100644
index 0000000..e76ab2e
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: openssl-1.0.2/Makefile.org
+===================================================================
+--- openssl-1.0.2.orig/Makefile.org
++++ openssl-1.0.2/Makefile.org
+@@ -381,7 +381,7 @@ libssl.pc: Makefile
+ 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires.private: libcrypto'; \
+-	    echo 'Libs: -L$${libdir} -lssl'; \
++	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
+ 	    echo 'Libs.private: $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
index 79537f9..a980855 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
             file://run-ptest \
+            file://fix_Makefile_creation_of_libssl.patch \
            "
 
 SRC_URI[md5sum] = "38373013fc85c790aabf8837969c5eba"
-- 
2.1.0


