Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 64F9E77E87
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 19:27:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2018 11:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,452,1515484800"; d="scan'208";a="37655624"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2018 11:27:29 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2018 11:27:29 -0800
Message-Id: <1520710049-85318-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] openssl_1.0.2n: improve reproducibility
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
X-List-Received-Date: Sat, 10 Mar 2018 19:27:28 -0000

Improve reproducible build of:

openssl-staticdev
openssl-dbg
libcrypto

There are two main causes that prevent reproducible build, both related to
the generated file "buildinf.h":

1. "buildinf.h" contains build host CFLAGS, containing various build
   host references.  We need to pass sanitized CFLAGS to the script
   generating this file ("mkbuildinf.pl". )

2. We also need to modify the script "mkbuildinf.pl" itsel in order to
   generate a build timestamp based on SOURCE_DATE_EPOCH, if present in
   the environment.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../openssl-1.0.2n/reproducible-cflags.patch        | 20 ++++++++++++++++++++
 .../openssl-1.0.2n/reproducible-mkbuildinf.patch    | 21 +++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl10.inc     |  3 +++
 meta/recipes-connectivity/openssl/openssl_1.0.2n.bb |  5 +++++
 4 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch
new file mode 100644
index 0000000..2803cb0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch
@@ -0,0 +1,20 @@
+Allow passing custom c-flags to mkbuildinf.pl in order to pass
+flags without any build host references
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+--- Makefile	2018-03-06 14:50:18.342138147 -0800
++++ Makefile	2018-03-06 15:24:04.794239071 -0800
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -55,7 +55,7 @@
+ all: shared
+ 
+ buildinf.h: ../Makefile
+-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
++	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC_INFO)" "$(PLATFORM)" >buildinf.h
+ 
+ x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
+ 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch
new file mode 100644
index 0000000..b556731
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch
@@ -0,0 +1,21 @@
+If SOURCE_DATE_EPOCH is present in the environment, use it as build date.
+Also make sure to use UTC time.
+
+Upstream-Status: Backport [ https://github.com/openssl/openssl/blob/master/util/mkbuildinf.pl ]
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+--- mkbuildinf.pl	2018-03-06 14:20:09.438048058 -0800
++++ mkbuildinf.pl	2018-03-06 14:19:20.722045632 -0800
+--- a/util/mkbuildinf.pl
++++ b/util/mkbuildinf.pl
+@@ -3,7 +3,8 @@
+ my ($cflags, $platform) = @ARGV;
+ 
+ $cflags = "compiler: $cflags";
+-$date = localtime();
++my $date = gmtime($ENV{'SOURCE_DATE_EPOCH'} || time()) . " UTC";
++
+ print <<"END_OUTPUT";
+ #ifndef MK1MF_BUILD
+     /* auto-generated by util/mkbuildinf.pl for crypto/cversion.c */
diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 02a0e16..0598195 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -162,6 +162,9 @@ do_configure () {
 
 do_compile_prepend_class-target () {
     sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
+    oe_runmake depend
+	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
+	oe_runmake CC_INFO="${cc_sanitized}"
 }
 
 do_compile () {
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
index 32444c6..f07289d 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
@@ -43,6 +43,11 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            "
+
+SRC_URI_append_class-target = "\
+           file://reproducible-cflags.patch \
+           file://reproducible-mkbuildinf.patch \
+           "
 SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
 SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
 
-- 
2.7.4


