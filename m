Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E98B6F58A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:10:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 09:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="467829574"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 09:09:36 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:09:27 -0600
Message-Id: <de79449a7af0dd95a6b0355c222d2a9db72e0eb1.1394124934.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394124934.git.tom.zanussi@linux.intel.com>
References: <cover.1394124934.git.tom.zanussi@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] lttng-tools: Add version 2.4.0
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
X-List-Received-Date: Thu, 06 Mar 2014 17:10:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tom Zanussi <tom.zanussi@intel.com>

This updates lttng-tools to 2.4.0, codenamed Époque Opaque, needed
for interoperability with lttng-modules and the 3.14 (dev) kernel.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../lttng/lttng-tools/runtest-2.4.0.patch          | 27 ++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     | 59 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb

diff --git a/meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch b/meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
new file mode 100644
index 0000000..958bce4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
@@ -0,0 +1,27 @@
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
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
new file mode 100644
index 0000000..223b52e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
@@ -0,0 +1,59 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit Control"
+DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
+to extract program execution details from the Linux operating system \
+and interpret them."
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
+                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
+
+DEPENDS = "liburcu popt lttng-ust"
+RDEPENDS_${PN}-ptest += "make"
+
+SRCREV = "8e3234eea2d81f8a962214c570532f8e096a9a8d"
+PV = "v2.4.0"
+
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.4 \
+           file://runtest-2.4.0.patch \
+           file://run-ptest \
+	  "
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep ptest
+
+export KERNELDIR="${STAGING_KERNEL_DIR}"
+
+FILES_${PN} += "${libdir}/lttng/libexec/*"
+FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
+
+# Since files are installed into ${libdir}/lttng/libexec we match 
+# the libexec insane test so skip it.
+INSANE_SKIP_${PN} = "libexec"
+INSANE_SKIP_${PN}-dbg = "libexec"
+
+
+do_install_ptest () {
+	chmod +x ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
+	for i in `find ${D}/${libdir}/${PN}/ptest -perm /u+x -type f`; do
+		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:g" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
+		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
+		  -e "s:\$DIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
+		  -e "s:\$TESTDIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
+		  -e "s:\$DIR/../src/bin/lttng-sessiond/lttng-sessiond:\$SESSIOND_BIN:g" \
+		  -e "s:\$DIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
+		  -e "s:\$DIR/../bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
+		  -i $i
+	done
+
+	sed -e "s:src/bin/lttng-sessiond:$bindir:g" \
+	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:g" \
+	-i ${D}/${libdir}/${PN}/ptest/tests/regression/run-report.py
+	sed -e "s:src/bin:bin:g" \
+	-i ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
+
+}
-- 
1.8.3.1


