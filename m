Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F30586C3B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 07:02:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3B72bUV007434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 00:02:37 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 11 Apr 2019 00:02:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2019 15:02:33 +0800
Message-ID: <1554966153-165096-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554966153-165096-1-git-send-email-changqing.li@windriver.com>
References: <1554966153-165096-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ruby: add ptest
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
X-List-Received-Date: Thu, 11 Apr 2019 07:02:37 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/ruby/ruby.inc       |  2 +-
 meta/recipes-devtools/ruby/ruby/run-ptest | 13 +++++++++++++
 meta/recipes-devtools/ruby/ruby_2.5.3.bb  | 10 ++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/run-ptest

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 28e21fe..1ecd087 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -24,7 +24,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-inherit autotools
+inherit autotools ptest
 
 
 # This snippet lets compiled extensions which rely on external libraries,
diff --git a/meta/recipes-devtools/ruby/ruby/run-ptest b/meta/recipes-devtools/ruby/ruby/run-ptest
new file mode 100644
index 0000000..de7c415
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+test_fullname=`find test -name test_*.rb` 
+ 
+for i in ${test_fullname}; do 
+	ruby ./test/runner.rb ${i}  2>&1 > /dev/null
+	ret=$? 
+	if [ $ret != 0 ]; then
+		echo "FAIL: ${i}" 
+	else
+		echo "PASS: ${i}"         
+	fi 
+done 
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.3.bb b/meta/recipes-devtools/ruby/ruby_2.5.3.bb
index 173b44b..519daf2 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.3.bb
@@ -3,6 +3,7 @@ require ruby.inc
 SRC_URI += " \
            file://ruby-CVE-2017-9226.patch \
            file://ruby-CVE-2017-9228.patch \
+           file://run-ptest \
            "
 
 SRC_URI[md5sum] = "20c85b67846d49622ef3b24230803fef"
@@ -55,6 +56,13 @@ do_install_append_class-target () {
 
 }
 
+do_install_ptest () {
+    cp -rf ${S}/test ${D}${PTEST_PATH}/
+    cp -r ${S}/include ${D}/${libdir}/ruby/
+    test_case_rb=`grep rubygems/test_case.rb ${B}/.installed.list`
+    sed -i -e 's:../../../test/:../../../ptest/test/:g' ${D}/$test_case_rb
+}
+
 PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
 
 SUMMARY_${PN}-ri-docs = "ri (Ruby Interactive) documentation for the Ruby standard library"
@@ -67,4 +75,6 @@ FILES_${PN}-rdoc += "${libdir}/ruby/*/rdoc ${bindir}/rdoc"
 
 FILES_${PN} += "${datadir}/rubygems"
 
+FILES_${PN}-ptest_append_class-target += "${libdir}/ruby/include"
+
 BBCLASSEXTEND = "native"
-- 
2.7.4


