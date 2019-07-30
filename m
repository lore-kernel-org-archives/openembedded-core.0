Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F145F7F31A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 16:47:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so57308404wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q8YzBmXTVwIV8amLPJ3+/Ynv3QXgNWxSNAxZiLPW70c=;
	b=uqUoUSHUHIs1pEqKZchTm/DBGMXRkrFY2jRPDzJFyTeObY4VoAYnGLFagC5od2XUcF
	tiJMiWxZqewQYOgGcairfxmCJcq5GgGfKXyvGI1eebcRHaleOxR6gL6YJuYpF4LBtKtQ
	2HySzNKl+D7/CExnpETLeFBRtosfWjErODwmKcWFNebyt8E2SkfT6Xuq+5GN1Ry5VwLu
	j9ihj0jz3/MdL25K/Q6KiUrW3/lW/0gl+qje8pt0HySRCJs0exwxSywRrdY6brkuA4sV
	nzC/E9PBTGOfXbOvvJwZ6HK06QIjIMuHVsMG8vB7gU0DaEouR92ptlHQb+YRMVPGCZCL
	7w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q8YzBmXTVwIV8amLPJ3+/Ynv3QXgNWxSNAxZiLPW70c=;
	b=pEaEnv0yruP0XQInY5x/LeWTISqyTGn1VHbWKzqwIovAVRL4FxylaSm/YowBC2XhqF
	1dkM+omdwVvRxgl1ovcW87A+M/MFyYVM77lnLbRsXyDrHXBh6fgnDUNba4WIGx28mZeK
	dPCWEPQbKBJtgrERHtFK+b0Sv0T9tU4/5RO1WdcwU3kKOYn9BEC8H3pu6DRcNyIwfGVJ
	6st8AWzJUE1ovS6Ly91HOjtGMxVq4zqsD83EpMWjvotdiyllUUbeh0Kvhw4vxhXl1MNr
	SxScj8FHWBouXr1RXiTvcBzTSMQvT2+B5ZQctqPqhmMhQp1xUi/bGLxmqZVjs5ors7Oo
	H23g==
X-Gm-Message-State: APjAAAXJiFdlvpfomYusD25zyRZZSxPh5hGXDWxqR2PECzYk+f5Blnyo
	saJ7O/6pL4PkGxmEAX0LYfGRFMsNBMU=
X-Google-Smtp-Source: APXvYqwZD7loYW1FSMJrGcYk66bQgwSw8ggjK25c+zo4olmB0sPevXup6kn5sUBNN7Mr+pC/78DSnQ==
X-Received: by 2002:a1c:c5c2:: with SMTP id
	v185mr112240066wmf.161.1564505269222; 
	Tue, 30 Jul 2019 09:47:49 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	m7sm52895409wrx.65.2019.07.30.09.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 09:47:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 18:47:42 +0200
Message-Id: <20190730164742.21782-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] stress-ng: add a recipe that replaces the original stress
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
X-List-Received-Date: Tue, 30 Jul 2019 16:47:49 -0000

The original stress is no longer maintained and the homepage
went down. This commit replaces it with a maintained
re-implementation by Ubuntu.

Stress-ng preserves command line option compatibility
(for the options that are used in rt-tests), so adjustment
is simply changing the name of the executable. Rt-tests is the only
user of stress(-ng) in oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 ...ownership-when-installing-example-jo.patch | 23 ++++++
 .../stress-ng/stress-ng_0.10.00.bb            | 20 +++++
 .../stress/files/texinfo.patch                | 80 -------------------
 meta/recipes-extended/stress/stress_1.0.4.bb  | 15 ----
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb      |  2 +-
 7 files changed, 46 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
 delete mode 100644 meta/recipes-extended/stress/files/texinfo.patch
 delete mode 100644 meta/recipes-extended/stress/stress_1.0.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3d5ab9dcd6c..77af8b6dad8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -661,7 +661,7 @@ RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-startup-notification = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-strace = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-stress = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-stress-ng = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-subversion = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-sudo = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-swig = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
new file mode 100644
index 00000000000..c860c717ac4
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
@@ -0,0 +1,23 @@
+From bbc85a439672120fa1d36be79e959b28fe840919 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 30 Jul 2019 18:38:03 +0200
+Subject: [PATCH] Do not preserve ownership when installing example jobs
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f36e57e..20488af 100644
+--- a/Makefile
++++ b/Makefile
+@@ -452,6 +452,6 @@ install: stress-ng stress-ng.1.gz
+ 	mkdir -p ${DESTDIR}${MANDIR}
+ 	cp stress-ng.1.gz ${DESTDIR}${MANDIR}
+ 	mkdir -p ${DESTDIR}${JOBDIR}
+-	cp -rp example-jobs/*.job ${DESTDIR}${JOBDIR}
++	cp -r example-jobs/*.job ${DESTDIR}${JOBDIR}
+ 	mkdir -p ${DESTDIR}${BASHDIR}
+ 	cp bash-completion/stress-ng ${DESTDIR}${BASHDIR}
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
new file mode 100644
index 00000000000..f7faf97e681
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
@@ -0,0 +1,20 @@
+SUMMARY = "System load testing utility"
+DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
+imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
+HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+           file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           "
+SRC_URI[md5sum] = "46aa41d37690324ceab4febfcc549018"
+SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa5213c074"
+
+DEPENDS = "coreutils-native"
+
+inherit bash-completion
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
diff --git a/meta/recipes-extended/stress/files/texinfo.patch b/meta/recipes-extended/stress/files/texinfo.patch
deleted file mode 100644
index f23a1f69c40..00000000000
--- a/meta/recipes-extended/stress/files/texinfo.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Upstream-Status: Pending
---- a/doc/stress.texi
-+++ b/doc/stress.texi
-@@ -62,47 +62,47 @@
- 
- @table @samp
- @item -?
--@itemx --help
-+@item --help
- Show help information.
- 
--@itemx --version
-+@item --version
- Show version information.
- 
- @item -v
--@itemx --verbose
-+@item --verbose
- Turn up verbosity.
- 
- @item -q
--@itemx --quiet
-+@item --quiet
- Turn down verbosity.
- 
- @item -n
--@itemx --dry-run
-+@item --dry-run
- Show what would have been done.
- 
- @item -t @var{secs}
--@itemx --timeout @var{secs}
-+@item --timeout @var{secs}
- Time out after @var{secs} seconds.
- 
--@itemx --backoff @var{usecs}
-+@item --backoff @var{usecs}
- Wait for factor of @var{usecs} microseconds before starting work.
- 
- @item -c @var{forks}
--@itemx --cpu @var{forks}
-+@item --cpu @var{forks}
- Spawn @var{forks} processes each spinning on @samp{sqrt()}.
- 
- @item -i @var{forks}
--@itemx --io @var{forks}
-+@item --io @var{forks}
- Spawn @var{forks} processes each spinning on @samp{sync()}.
- 
- @item -m @var{forks}
--@itemx --vm @var{forks}
-+@item --vm @var{forks}
- Spawn @var{forks} processes each spinning on @samp{malloc()}.
- 
--@itemx --vm-bytes @var{bytes}
-+@item --vm-bytes @var{bytes}
- Allocate @var{bytes} number of bytes.  The default is 1.
- 
--@itemx --vm-hang
-+@item --vm-hang
- Instruct each vm hog process to go to sleep after allocating memory.  This
- contrasts with their normal behavior, which is to free the memory and
- reallocate @emph{ad infinitum}.  This is useful for simulating low memory
-@@ -114,13 +114,13 @@
- @end example
- 
- @item -d @var{forks}
--@itemx --hdd @var{forks}
-+@item --hdd @var{forks}
- Spawn @var{forks} processes each spinning on @samp{write()}.
- 
--@itemx --hdd-bytes @var{bytes}
-+@item --hdd-bytes @var{bytes}
- Write @var{bytes} number of bytes.  The default is 1GB.
- 
--@itemx --hdd-noclean
-+@item --hdd-noclean
- Do not unlink file(s) to which random ASCII data is written.
- 
- @end table
diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
deleted file mode 100644
index e9179d3e19e..00000000000
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "System load testing utility"
-DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
-imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
-HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://people.seas.harvard.edu/~apw/${BPN}/${BP}.tar.gz \
-           file://texinfo.patch \
-           "
-
-SRC_URI[md5sum] = "890a4236dd1656792f3ef9a190cf99ef"
-SRC_URI[sha256sum] = "057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b"
-
-inherit autotools
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 080a6558935..57b39b52a1e 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -130,7 +130,7 @@ def log_test_header(seq_no, nr_of_tests, name):
 #-------------------------------------------------------------------------------
 
 def start_stress(*args):
-        stress_cmd         = [ "stress" ]
+        stress_cmd         = [ "stress-ng" ]
         added_stress_types = []
         req_stress_types   = set(args)
         cpu_cnt            = str(multiprocessing.cpu_count())
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
index 496f04fdbae..b673cd784ff 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
@@ -26,6 +26,6 @@ do_install_ptest() {
         cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
 }
 
-RDEPENDS_${PN}-ptest += " stress python3 python3-multiprocessing python3-datetime python3-misc"
+RDEPENDS_${PN}-ptest += " stress-ng python3 python3-multiprocessing python3-datetime python3-misc"
 
 FILES_${PN} += "${prefix}/src/backfire"
-- 
2.17.1


