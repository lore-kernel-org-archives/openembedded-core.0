Return-Path: <stefan.seefeld@gmail.com>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 04B8860071
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 01:10:00 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id gh4so6041319qeb.16
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=Tvwx7O3vPuMNIXH69DPNvlKVLyHKNIxGC1rKBGvWaK8=;
	b=qQr8sPzNUh8XiTSUmMeMqauEq9e5hrePDSEyWQXsgTNNAZ6FHeeiQGKE7zmkb/SRTE
	EYOpcvKvI0sZnYDXhWAuEk63WNfKl/HGBKXye07wO9iKVr2RQ+33DpAyc5vWgwpn1DNP
	BAuV3gO+2/3408yGv6kbKCNjuO4KTHHrFdYac9ElwtOUdgNg3+OT5zs4EI2CNv5RRkNA
	5ZvB8jQGjmNf+4m2VI22r7oP1aOshWdeln5VvYm8ZHk4P7c/h3Gdo4mvIp3YWbQYP5QF
	AEcXZGshGyeDduaJ3Wl8F0Apw3RauZlM0U0GiaHK7G1LKigJ2Qmd1Un//rvIBEaAT2jF
	7bpQ==
X-Received: by 10.49.71.78 with SMTP id s14mr8556564qeu.82.1378948202710;
	Wed, 11 Sep 2013 18:10:02 -0700 (PDT)
Received: from quasimodo.mgc.mentorg.com
	(bas2-montreal29-1177924826.dsl.bell.ca. [70.53.180.218])
	by mx.google.com with ESMTPSA id fy7sm2038291qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 18:10:02 -0700 (PDT)
Sender: Stefan Seefeld <stefan.seefeld@gmail.com>
From: Stefan Seefeld <stefan@seefeld.name>
To: Openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:09:50 -0400
Message-Id: <1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
Subject: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 01:10:01 -0000

Signed-off-by: Stefan Seefeld <stefan_seefeld@mentor.com>
---
 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |  4 ++
 .../recipes-kernel/lttng/lttng-tools/runtest.patch | 52 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb     |  8 +++-
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-kernel/lttng/lttng-tools/run-ptest
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
new file mode 100755
index 0000000..e758815
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+make -C tests installcheck
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/runtest.patch b/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
new file mode 100644
index 0000000..545a5dc
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
@@ -0,0 +1,52 @@
+diff --git a/Makefile.am b/Makefile.am
+index 584f59b..c2bcabd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -12,3 +12,9 @@ dist_doc_DATA = LICENSE \
+ dist_noinst_DATA = CodingStyle
+ 
+ EXTRA_DIST = extras/lttng-bash_completion gpl-2.0.txt lgpl-2.1.txt
++
++install-ptest:
++	cp -r $(srcdir)/tests $(DESTDIR)
++	for m in $$(find $(DESTDIR)/tests -name Makefile); do \
++          sed -i -e 's|^Makefile:|_Makefile:|' $$m; \
++        done
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 6d5b00d..3774f9d 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,14 +1,17 @@
+ SUBDIRS = utils regression unit stress
+ 
+-if USE_PYTHON
+-check-am:
++installcheck-am:
+ 	./run.sh unit_tests
+ 	./run.sh fast_regression
++if USE_PYTHON
+ 	./run.sh with_bindings_regression
+-else
++endif
++
+ check-am:
+ 	./run.sh unit_tests
+ 	./run.sh fast_regression
++if USE_PYTHON
++	./run.sh with_bindings_regression
+ endif
+ 
+ dist_noinst_SCRIPTS = run.sh unit_tests fast_regression long_regression root_regression with_bindings_regression
+diff --git a/tests/run.sh b/tests/run.sh
+index c6c50fd..6455359 100755
+--- a/tests/run.sh
++++ b/tests/run.sh
+@@ -19,4 +19,7 @@
+ 
+ [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist to run." && exit 1
+ 
+-prove --merge --exec '' - < $1
++prove --merge -v --exec '' - < $1 | sed \
++  -e 's|^ok \(.*\)|PASS: \1|' \
++  -e 's|^not ok \(.*\)|FAIL: \1|' \
++  | egrep -h 'PASS|FAIL'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
index 2e0ee15..4322027 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
@@ -10,15 +10,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust"
+RDEPENDS_${PN}-ptest += "make"
 
 SRCREV = "c9dc1289e040c542f96fbfd558267786816d5703"
 PV = "v2.3.0"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git"
+SRC_URI = "git://git.lttng.org/lttng-tools.git \
+           file://runtest.patch \
+           file://run-ptest \
+	  "
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools ptest
 
 export KERNELDIR="${STAGING_KERNEL_DIR}"
 
-- 
1.8.3.1


