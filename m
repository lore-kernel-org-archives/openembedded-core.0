Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (unknown [209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 023136A42A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 20:30:39 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id b6so2213895yha.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:organization; bh=GpVHlzM0W9yuxm/88qSwwCOj9dvVk9FM6Exw/rXu6wI=;
	b=qU9Szoym0KbW/WS1TUh2ENmpjdPxY9MPs1K1Zi2Z5d79L1rDbV6l1BOFTR4pRqFDLE
	ydUyWI3XJpw7BOJaXh5nuJsySeb3EO7aIWHkHj3GXtFSBGF8rNNdDwV0ckemYqy7VzLF
	AnaP+BqxJYRtRePGCwbtLrMKfSOfIXmfcuuoy5sB1+zAaIffRr6SQDyC9y+goJEudPjZ
	+oD/dGkFudtrPqd8uWB4YQ5lX+MH2VC52mCht+GUgAoRNknJl2KFhwYJkizbxHhVB2Pf
	UbZzfAfOi56QYBagZfumDmme78P71rUx9v+nrEJP+Dbd/zT2tnpC3+vSVsV5WMYK65QU
	mBRg==
X-Received: by 10.236.104.234 with SMTP id i70mr8522324yhg.125.1400099440316; 
	Wed, 14 May 2014 13:30:40 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id x37sm4113750yhn.39.2014.05.14.13.30.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 13:30:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 23A5D1ACE5DA6; Wed, 14 May 2014 17:30:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2014 17:30:34 -0300
Message-Id: <1400099434-22527-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
In-Reply-To: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
References: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [daisy][PATCH 4/4] cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
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
X-List-Received-Date: Wed, 14 May 2014 20:30:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

(From OE-Core rev: c54fa061da6195081cd29817a351a36377b58e53)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cryptodev/cryptodev-tests_1.6.bb               | 23 ++++++++
 ...pile-and-install-rules-for-cryptodev-test.patch | 69 ++++++++++++++++++++++
 ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch | 29 +++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
new file mode 100644
index 0000000..efc41ae
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
@@ -0,0 +1,23 @@
+require cryptodev_${PV}.inc
+
+SUMMARY = "A test suite for /dev/crypto device driver"
+
+DEPENDS += "openssl"
+
+SRC_URI += " \
+file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
+file://0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch \
+"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+do_compile() {
+	oe_runmake testprogs
+}
+
+do_install() {
+	oe_runmake install_tests
+}
+
+FILES_${PN}-dbg += "${bindir}/tests_cryptodev/.debug"
+FILES_${PN} = "${bindir}/tests_cryptodev/*"
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
new file mode 100644
index 0000000..cb871f6
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
@@ -0,0 +1,69 @@
+From 1980a8f4779a955e73285e7a0d86549b69bea5c8 Mon Sep 17 00:00:00 2001
+From: Yu Zongchun <b40527@freescale.com>
+Date: Sun, 28 Apr 2013 14:39:22 +0800
+Subject: [PATCH] Add the compile and install rules for cryptodev tests folder
+
+This is required to install the cryptodev tests folder to rootfs
+
+Signed-off-by: Yu Zongchun <b40527@freescale.com>
+
+Upstream-Status: Pending
+
+---
+ Makefile       |    6 ++++++
+ tests/Makefile |    8 ++++++++
+ 2 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2be8825..4cbb865 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,6 +17,9 @@ install:
+ 	@echo "Installing cryptodev.h in /usr/include/crypto ..."
+ 	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
+ 
++install_tests:
++	make -C tests install DESTDIR=$(PREFIX)
++
+ clean:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
+ 	rm -f $(hostprogs) *~
+@@ -25,6 +28,9 @@ clean:
+ check:
+ 	KERNEL_DIR=$(KERNEL_DIR) make -C tests check
+ 
++testprogs:
++	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
++
+ FILEBASE = cryptodev-linux-$(VERSION)
+ TMPDIR ?= /tmp
+ OUTPUT = $(FILEBASE).tar.gz
+diff --git a/tests/Makefile b/tests/Makefile
+index 87ca3c7..0488cf6 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -19,6 +19,12 @@ example-async-hmac-objs := async_hmac.o
+ example-async-speed-objs := async_speed.o
+ example-hashcrypt-speed-objs := hashcrypt_speed.c
+ 
++install:
++	install -d  $(DESTDIR)/usr/bin/tests_cryptodev
++	for bin in $(hostprogs); do \
++		install -m 755 $${bin} $(DESTDIR)/usr/bin/tests_cryptodev/; \
++	done
++
+ check: $(hostprogs)
+ 	./cipher
+ 	./hmac
+@@ -28,6 +34,8 @@ check: $(hostprogs)
+ 	./cipher-gcm
+ 	./cipher-aead
+ 
++testprogs: $(hostprogs)
++
+ clean:
+ 	rm -f *.o *~ $(hostprogs)
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch b/meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
new file mode 100644
index 0000000..f5ab8b4
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
@@ -0,0 +1,29 @@
+From 47ff1eb9bb4f872c1d731b93d334ee5865bf3439 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 6 Apr 2014 22:16:30 -0400
+Subject: [PATCH] Fix tests Makefile usage of LDLIBS vs. LDFLAGS
+
+Libraries must come after objects, as link order matters, especially
+when using linker flags like -Wl,--as-needed.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
+Upstream-Status: Pending
+---
+ tests/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index cd202af..67c3c83 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -39,5 +39,5 @@ testprogs: $(hostprogs)
+ clean:
+ 	rm -f *.o *~ $(hostprogs)
+ 
+-${comp_progs}: LDFLAGS += -lssl -lcrypto
++${comp_progs}: LDLIBS += -lssl -lcrypto
+ ${comp_progs}: %: %.o openssl_wrapper.o
+-- 
+1.9.1
+
-- 
2.0.0.rc2


