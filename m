Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E40E6FA5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 01:43:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R1hdvD025838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 18:43:39 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 18:43:38 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 09:43:36 +0800
Message-ID: <1b730d155fa4bc1c464fa84ea934ed40391ddafa.1401154906.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401154906.git.Chong.Lu@windriver.com>
References: <cover.1401154906.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][V2] ethtool: fix ptest execution failure
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
X-List-Received-Date: Tue, 27 May 2014 01:43:39 -0000
Content-Type: text/plain

Modify ptest suite to make it enabled on new version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/ethtool/ethtool/run-ptest |  2 +-
 meta/recipes-extended/ethtool/ethtool_3.14.bb   | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/ethtool/ethtool/run-ptest b/meta/recipes-extended/ethtool/ethtool/run-ptest
index 1e245da..a359387 100644
--- a/meta/recipes-extended/ethtool/ethtool/run-ptest
+++ b/meta/recipes-extended/ethtool/ethtool/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-make -k runtest-TESTS
+make -k check-TESTS
diff --git a/meta/recipes-extended/ethtool/ethtool_3.14.bb b/meta/recipes-extended/ethtool/ethtool_3.14.bb
index 2a3ca70..4f4e389 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.14.bb
@@ -20,9 +20,15 @@ do_compile_ptest() {
 }
 
 do_install_ptest () {
-   cp ${B}/Makefile                 ${D}${PTEST_PATH}
-   install ${B}/test-cmdline        ${D}${PTEST_PATH}
-   install ${B}/test-features       ${D}${PTEST_PATH}
-   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
-   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
+   for i in Makefile test-cmdline test-features; do \
+       install ${B}/$i ${D}${PTEST_PATH}; done
+   install ${S}/test-driver ${D}${PTEST_PATH}
+   sed -e 's/^Makefile/_Makefile/' \
+       -e 's/^test_cmdline_OBJECTS/#test_cmdline_OBJECTS/' \
+       -e 's/^test_features_OBJECTS/#test_features_OBJECTS/' \
+       -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
+       -e '/^all:/,+1d' \
+       -e 's/bash/sh/' \
+       -e 's/gawk/awk/' \
+       -i ${D}${PTEST_PATH}/Makefile
 }
-- 
1.8.1.2


