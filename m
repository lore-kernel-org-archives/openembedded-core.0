Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0A66013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:34:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2IMY2jl006371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 15:34:02 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 15:34:02 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 15:34:02 -0700
Message-ID: <1426718042-18369-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: find all .debug directories
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
X-List-Received-Date: Wed, 18 Mar 2015 22:34:03 -0000
Content-Type: text/plain

The list of directories for ltp-dbg is incomplete, so
we generalize it.

We also eliminate a non-fatal qa error that the file
test_arch_stripped is stripped.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20150119.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20150119.bb b/meta/recipes-extended/ltp/ltp_20150119.bb
index b422646..90c5973 100644
--- a/meta/recipes-extended/ltp/ltp_20150119.bb
+++ b/meta/recipes-extended/ltp/ltp_20150119.bb
@@ -65,9 +65,9 @@ RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect"
 
 FILES_${PN}-dbg += "\
     /opt/ltp/runtest/.debug \
-    /opt/ltp/testcases/bin/.debug \
-    /opt/ltp/testcases/bin/*/bin/.debug \
-    /opt/ltp/testcases/bin/*/test/.debug \
+    /opt/ltp/testcases/*/.debug \
+    /opt/ltp/testcases/*/*/.debug \
+    /opt/ltp/testcases/*/*/*/.debug \
     /opt/ltp/scenario_groups/.debug \
     /opt/ltp/testscripts/.debug \
     /opt/ltp/testscripts/open_posix_testsuite/.debug \
@@ -79,3 +79,6 @@ FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/lt
 
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
 INHIBIT_PACKAGE_STRIP = "1"
+# However, test_arch_stripped is already stripped, so...
+INSANE_SKIP_${PN} += "already-stripped"
+
-- 
1.7.9.5


