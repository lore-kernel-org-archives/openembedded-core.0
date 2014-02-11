Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 164396E7F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 01:18:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1B1IiFY001368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 17:18:44 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 17:18:43 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2014 09:18:40 +0800
Message-ID: <9c7870d0861639c47df0eb63107bdcd489e7fe28.1392081479.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392081479.git.Chong.Lu@windriver.com>
References: <cover.1392081479.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] diffstat: enable ptest support
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
X-List-Received-Date: Tue, 11 Feb 2014 01:18:43 -0000
Content-Type: text/plain

Install diffstat test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/diffstat/diffstat/run-ptest |  5 +++++
 meta/recipes-devtools/diffstat/diffstat_1.58.bb   | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/run-ptest

diff --git a/meta/recipes-devtools/diffstat/diffstat/run-ptest b/meta/recipes-devtools/diffstat/diffstat/run-ptest
new file mode 100644
index 0000000..a936b3d
--- /dev/null
+++ b/meta/recipes-devtools/diffstat/diffstat/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+./testing/run_test.sh ./testing/case*.pat |sed \
+  -e 's|** ok|PASS|' \
+  -e 's|?? fail|FAIL|'
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.58.bb b/meta/recipes-devtools/diffstat/diffstat_1.58.bb
index 8f73bfc..204473a 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.58.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.58.bb
@@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0
 
 SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
            file://dirfix.patch \
-           file://aclocal.patch"
+           file://aclocal.patch \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "6d6e13f7dcfe4db5da65c5175260ea47"
 SRC_URI[sha256sum] = "fad5135199c3b9aea132c5d45874248f4ce0ff35f61abb8d03c3b90258713793"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-inherit autotools gettext
+inherit autotools gettext ptest
 
 do_configure () {
 	if [ ! -e ${S}/acinclude.m4 ]; then
@@ -24,3 +26,7 @@ do_configure () {
 	fi
 	autotools_do_configure
 }
+
+do_install_ptest() {
+	cp -r ${S}/testing ${D}${PTEST_PATH}
+}
-- 
1.8.1.2


