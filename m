Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9E6E6E30D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 04:55:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0M4tb7m003796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 20:55:37 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 20:55:37 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 12:55:34 +0800
Message-ID: <b40f906d0553210df97d848dfc3ba956b2b05ff6.1390366473.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1390366473.git.Chong.Lu@windriver.com>
References: <cover.1390366473.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gawk: enable ptest support
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
X-List-Received-Date: Wed, 22 Jan 2014 04:55:37 -0000
Content-Type: text/plain

Install gawk test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/gawk/gawk-4.0.2/run-ptest | 10 ++++++++++
 meta/recipes-extended/gawk/gawk_4.0.2.bb        | 13 ++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gawk/gawk-4.0.2/run-ptest

diff --git a/meta/recipes-extended/gawk/gawk-4.0.2/run-ptest b/meta/recipes-extended/gawk/gawk-4.0.2/run-ptest
new file mode 100644
index 0000000..7d214ea
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk-4.0.2/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd test
+for i in `grep -vE "@|^$|#|Gt-dummy" Maketests |awk -F: '{print $1}'`; \
+  do LC_ALL=${GAWKLOCALE:-C} LANG=${GAWKLOCALE:-C} srcdir=`pwd` AWK=gawk CMP=cmp \
+  make -f Maketests $i &>$i.tmp; \
+  grep -q "Error" $i.tmp; \
+  if [ $? == 0 ]; then echo "FAIL: $i"; \
+  else echo "PASS: $i"; rm -f $i.tmp; fi; \
+done
diff --git a/meta/recipes-extended/gawk/gawk_4.0.2.bb b/meta/recipes-extended/gawk/gawk_4.0.2.bb
index 424b6b0..eb86af3 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.2.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.2.bb
@@ -16,7 +16,9 @@ DEPENDS += "readline"
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
 
-SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "4d505dc2c9f1eb3e9f8d6cac87d4bd1a"
 SRC_URI[sha256sum] = "6e0de117c3713aa8d7fa347fc9fd645b10038ae49d8cf947d8c1d51cbb76141a"
@@ -39,3 +41,12 @@ do_install_append() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
 }
+
+inherit ptest
+
+do_install_ptest() {
+	mkdir ${D}${PTEST_PATH}/test
+	for i in `grep -vE "@|^$|#|Gt-dummy" ${S}/test/Maketests |awk -F: '{print $1}'` Maketests; \
+	  do cp ${S}/test/$i* ${D}${PTEST_PATH}/test; \
+	done
+}
-- 
1.8.1.2


