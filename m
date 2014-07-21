Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51C2770249
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 02:06:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6L26HJq011795
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jul 2014 19:06:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Jul 2014 19:06:17 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2014 10:03:57 +0800
Message-ID: <1405908237-7560-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][V2] perf: split package
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
X-List-Received-Date: Mon, 21 Jul 2014 02:06:20 -0000
Content-Type: text/plain

Currently, perf can't split to perf-archive, perf-tests, perf-python and
perf-perl. All files are included in perf package.
Change the files paths to make split successfully and add perf package
RDEPEND on the other four to keep it consistent.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 20968f9..9f9741e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -157,6 +157,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils"
+RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
@@ -166,10 +167,10 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
-FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
-FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
-FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
-FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
+FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
+FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
+FILES_${PN}-python = "${libdir}/python*/site-packages ${exec_prefix}/libexec/perf-core/scripts/python"
+FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"
 
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-- 
1.9.1


