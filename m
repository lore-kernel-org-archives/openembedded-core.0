Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 28E417354F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 23:00:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 14:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,595,1418112000"; d="scan'208";a="667771003"
Received: from nyakubch-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.15.176])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2015 15:00:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:00:12 -0800
Message-Id: <1424214012-17813-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] lzo: Upgrade to 2.09 and add ptest
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
X-List-Received-Date: Tue, 17 Feb 2015 23:00:13 -0000

lzo_init checksum changed due to date change, not license change

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/lzo/lzo/run-ptest                |  8 ++++++++
 meta/recipes-support/lzo/{lzo_2.08.bb => lzo_2.09.bb} | 19 +++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/lzo/lzo/run-ptest
 rename meta/recipes-support/lzo/{lzo_2.08.bb => lzo_2.09.bb} (56%)

diff --git a/meta/recipes-support/lzo/lzo/run-ptest b/meta/recipes-support/lzo/lzo/run-ptest
new file mode 100644
index 0000000..2ea7745
--- /dev/null
+++ b/meta/recipes-support/lzo/lzo/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+./lzotest -mavail -n10 -q /etc/services
+LZOTEST=./lzotest /bin/sh -e "./check.sh" "/etc"
+./align
+./chksum
+./simple
+./testmini
diff --git a/meta/recipes-support/lzo/lzo_2.08.bb b/meta/recipes-support/lzo/lzo_2.09.bb
similarity index 56%
rename from meta/recipes-support/lzo/lzo_2.08.bb
rename to meta/recipes-support/lzo/lzo_2.09.bb
index af06e29..2978617 100644
--- a/meta/recipes-support/lzo/lzo_2.08.bb
+++ b/meta/recipes-support/lzo/lzo_2.09.bb
@@ -3,17 +3,18 @@ HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/lzo_init.c;beginline=5;endline=25;md5=a6e25df9a83b24629e847846ccdd8054"
+                    file://src/lzo_init.c;beginline=5;endline=25;md5=355023835a9b9eeb70ab895395e951ff"
 
 SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://0001-Use-memcpy-instead-of-reinventing-it.patch \
            file://acinclude.m4 \
+           file://run-ptest \
            "
 
-SRC_URI[md5sum] = "fcec64c26a0f4f4901468f360029678f"
-SRC_URI[sha256sum] = "ac1b3e4dee46febe9fd28737eb7f5692d3232ef1a01da10444394c3d47536614"
+SRC_URI[md5sum] = "c7ffc9a103afe2d1bba0b015e7aa887f"
+SRC_URI[sha256sum] = "f294a7ced313063c057c504257f437c8335c41bfeed23531ee4e6a2b87bcb34c"
 
-inherit autotools
+inherit autotools ptest
 
 EXTRA_OECONF = "--enable-shared"
 
@@ -21,4 +22,14 @@ do_configure_prepend () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 }
 
+do_install_ptest() {
+	t=${D}${PTEST_PATH}
+	cp ${S}/util/check.sh $t
+	cp ${B}/minilzo/testmini $t
+	for i in tests/align tests/chksum lzotest/lzotest examples/simple
+		do cp ${B}/`dirname $i`/.libs/`basename $i` $t; \
+	done
+}
+
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.0


