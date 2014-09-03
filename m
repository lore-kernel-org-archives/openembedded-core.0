Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 384E8713C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:11:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s839B1D6028491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 02:11:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 02:11:00 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 17:05:29 +0800
Message-ID: <ff575b1b7622194f6e15d1b38c191df729a80f47.1409735063.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409735063.git.Chong.Lu@windriver.com>
References: <cover.1409735063.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] perf: fix issue about package splitting
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
X-List-Received-Date: Wed, 03 Sep 2014 09:11:04 -0000
Content-Type: text/plain

Currently, perf can't split to perf-archive, perf-tests, perf-python and
perf-perl. All files are included in perf package. Change the files paths to
make split successfully and add PACKAGECONFIG to make main pkg depends on sub
pkgs as default.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bfd210c..baf0077 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -149,20 +149,27 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
+PACKAGECONFIG ??= "archive perl python tests"
+PACKAGECONFIG[archive] = ",,, ${PN}-archive"
+PACKAGECONFIG[perl] = ",,, ${PN}-perl"
+PACKAGECONFIG[python] = ",,, ${PN}-python"
+PACKAGECONFIG[tests] = ",,, ${PN}-tests"
+
 RDEPENDS_${PN} += "elfutils"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
+RDEPENDS_${PN}-tests =+ "python"
 
 RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
-FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
+FILES_${PN} += "${libdir}/traceevent"
 FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
-FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
-FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
-FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
-FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
+FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
+FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
+FILES_${PN}-python = "${exec_prefix}/libexec/perf-core/scripts/python"
+FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
 
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-- 
1.9.1


