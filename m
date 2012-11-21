Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fupan.Li@windriver.com>) id 1Tb1ok-00032e-OP
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 05:21:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAL2URC4020291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 18:30:27 -0800 (PST)
Received: from fli-OptiPlex-760.corp.ad.wrs.com (128.224.158.242) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 20 Nov 2012 18:30:27 -0800
From: <fupan.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 10:30:25 +0800
Message-ID: <1353465025-13655-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH] move the benchmark package bonnie++ from meta-oe layer to oe-core and upgrade bonnie++ from 1.03c to 1.03e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 04:21:43 -0000
Content-Type: text/plain

From: fli <fupan.li@windriver.com>

Signed-off-by: fli <fupan.li@windriver.com>
---
 recipes-benchmark/bonnie/bonnie++_1.03e.bb         |   32 ++++++++++++++++++++
 .../bonnie/files/compiler-error-fix.patch          |   14 +++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-benchmark/bonnie/bonnie++_1.03e.bb
 create mode 100644 recipes-benchmark/bonnie/files/compiler-error-fix.patch

diff --git a/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/recipes-benchmark/bonnie/bonnie++_1.03e.bb
new file mode 100644
index 0000000..848b206
--- /dev/null
+++ b/recipes-benchmark/bonnie/bonnie++_1.03e.bb
@@ -0,0 +1,32 @@
+# bonnie OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the GPLv4 license (see copyright.tx)
+
+DESCRIPTION="Tests large file IO and creation/deletion of small files."
+HOMEPAGE = "http://www.coker.com.au/bonnie++"
+SECTION = "benchmark/tests"
+LICENSE="GPLv2"
+
+SRC_URI="http://www.coker.com.au/bonnie++/${PN}-${PV}.tgz \
+	file://compiler-error-fix.patch"
+
+SRC_URI[md5sum] = "750aa5b5051263a99c6c195888c74968"
+SRC_URI[sha256sum] = "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb"
+LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
+
+inherit autotools
+
+EXES="bonnie++ zcav"
+SCRIPTS="bon_csv2html bon_csv2txt"
+
+PACKAGES += "bonnie-scripts"
+
+do_install () {
+	install -d ${D}/${bindir}
+	install -d ${D}/${sbindir}
+	install -m 0755 ${EXES} ${D}/${sbindir}
+	install -m 0755 ${SCRIPTS} ${D}/${bindir}
+}
+
+FILES_${PN} = "${sbindir}"
+FILES_bonnie-scripts="${bindir}"
diff --git a/recipes-benchmark/bonnie/files/compiler-error-fix.patch b/recipes-benchmark/bonnie/files/compiler-error-fix.patch
new file mode 100644
index 0000000..6655b88
--- /dev/null
+++ b/recipes-benchmark/bonnie/files/compiler-error-fix.patch
@@ -0,0 +1,14 @@
+---
+ zcav.cpp |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: bonnie++-1.03a/zcav.cpp
+===================================================================
+--- bonnie++-1.03a.orig/zcav.cpp
++++ bonnie++-1.03a/zcav.cpp
+@@ -15,6 +15,7 @@ using namespace std;
+ #else
+ #include <vector.h>
+ #endif
++#include <string.h>
+
-- 
1.7.9.5



