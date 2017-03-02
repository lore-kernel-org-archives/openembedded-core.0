Return-Path: <sstrogin@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD5777630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3778; q=dns/txt; s=iport;
	t=1488478068; x=1489687668;
	h=from:subject:to:cc:message-id:date:mime-version:
	content-transfer-encoding;
	bh=AvRUFNrKkCfdSdqcHn7VXTL+weI9KqqTQmelzM/ZjPI=;
	b=BB8YFQYDVp7NkvJuQEziPuobdZzgGDAzcLTBsiZmrOn/2m/mjzPRXtA6
	taw8sYDktprM82rGTSrMEw/qH2250EWmEAUf8OpxFH7R3v2DJSgkhUA3h
	us6tDK1W6nlNF/dlJsfg3ShPCobwNWCeCwV+T5we0I9++9SvCswFRilxE s=;
X-IronPort-AV: E=Sophos;i="5.35,232,1484006400"; d="scan'208";a="650094473"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2017 18:07:46 +0000
Received: from [10.61.217.47] ([10.61.217.47]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id v22I7j4j022518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 2 Mar 2017 18:07:46 GMT
From: Stefan Strogin <sstrogin@cisco.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <49dd85a2-0fc0-f814-5ef0-5cf8acad80a1@cisco.com>
Date: Thu, 2 Mar 2017 20:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: sstrogin
Cc: xe-linux-external@cisco.com
Subject: [PATCH v2] slang: add ptest
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
X-List-Received-Date: Thu, 02 Mar 2017 18:07:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Stefan Strogin <sstrogin@cisco.com>
Cc: xe-linux-external@cisco.com
---
 meta/recipes-extended/slang/slang/run-ptest        |  3 +++
 ...-add-output-in-the-format-result-testname.patch | 30 ++++++++++++++++++++++
 meta/recipes-extended/slang/slang_2.3.1a.bb        | 21 ++++++++++++++-
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/slang/slang/run-ptest
 create mode 100644 meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch

diff --git a/meta/recipes-extended/slang/slang/run-ptest b/meta/recipes-extended/slang/slang/run-ptest
new file mode 100644
index 0000000000..39f474af31
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C test runtests
diff --git a/meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch b/meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch
new file mode 100644
index 0000000000..27a9bb87ea
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch
@@ -0,0 +1,30 @@
+From 38688ee2754415cf2a1935dafb8278861b7315e7 Mon Sep 17 00:00:00 2001
+From: Stefan Strogin <sstrogin@cisco.com>
+Date: Thu, 2 Mar 2017 00:26:31 +0200
+Subject: [PATCH] test: add output in the format "result: testname"
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Stefan Strogin <sstrogin@cisco.com>
+---
+ src/test/runtests.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/test/runtests.sh b/src/test/runtests.sh
+index a3eaad0..64f0705 100755
+--- a/src/test/runtests.sh
++++ b/src/test/runtests.sh
+@@ -34,8 +34,10 @@ do
+     then
+ 	n_failed=`expr ${n_failed} + 1`
+ 	tests_failed="$tests_failed $testfile"
++	echo "FAIL: $testfile"
+     else
+         touch lastrun/$testfile
++	echo "PASS: $testfile"
+     fi
+ done
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/slang/slang_2.3.1a.bb b/meta/recipes-extended/slang/slang_2.3.1a.bb
index c71d80481f..9c73a5f624 100644
--- a/meta/recipes-extended/slang/slang_2.3.1a.bb
+++ b/meta/recipes-extended/slang/slang_2.3.1a.bb
@@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://no-x.patch \
            file://dont-link-to-host.patch \
+           file://test-add-output-in-the-format-result-testname.patch \
+           file://run-ptest \
           "
 
 SRC_URI[md5sum] = "c5235313042ed0e71ec708f7b85ec241"
@@ -25,7 +27,7 @@ SRC_URI[sha256sum] = "54f0c3007fde918039c058965dffdfd6c5aec0bad0f4227192cc486021
 UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
 
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 CLEANBROKEN = "1"
 
 EXTRA_OECONF = "--without-onig"
@@ -49,6 +51,23 @@ do_configure_prepend() {
     cd ${B}
 }
 
+do_compile_ptest() {
+	oe_runmake -C src static
+	oe_runmake -C src/test sltest
+}
+
+do_install_ptest() {
+	cp -r ${S}/src/test ${D}${PTEST_PATH}/
+	mkdir ${D}${PTEST_PATH}/objs
+	cp ${S}/src/objs/libslang.a ${D}${PTEST_PATH}/objs/
+
+	cp ${S}/slsh/lib/require.sl ${D}${PTEST_PATH}/test/
+	sed -i 's/\.\.\/\.\.\/slsh\/lib\/require\.sl/require\.sl/' ${D}${PTEST_PATH}/test/req.sl
+
+	cp ${S}/doc/text/slangfun.txt ${D}${PTEST_PATH}/test/
+	sed -i 's/\.\.\/\.\.\/doc\/text\/slangfun\.txt/slangfun\.txt/' ${D}${PTEST_PATH}/test/docfun.sl
+}
+
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 
 PARALLEL_MAKE = ""
-- 
2.11.0


