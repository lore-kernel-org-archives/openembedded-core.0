Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 50B3F66099
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 21:21:40 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D51852232CC2;
	Mon,  9 Jun 2014 23:21:40 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C70CC2232CBE;
	Mon,  9 Jun 2014 23:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.2
Received: from localhost.localdomain (e178184227.adsl.alicedsl.de
	[85.178.184.227]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Mon,  9 Jun 2014 23:21:39 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 23:21:29 +0200
Message-Id: <1402348889-26065-4-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
References: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 3/3] perf: split packging
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
X-List-Received-Date: Mon, 09 Jun 2014 21:21:47 -0000

* some fundamental perf commands can work
  without the dependency on perl, python or bash
  make them separate packages and RSUGGEST them

* bump PR

The patch was sponsored by sysmocom

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 meta/recipes-kernel/perf/perf.bb | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 74686ca..daa7c3f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r8"
+PR = "r9"
 
 require perf-features.inc
 
@@ -27,9 +27,6 @@ DEPENDS = "virtual/kernel \
            bison flex \
           "
 
-SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
-RDEPENDS_${PN} += "elfutils bash ${SCRIPTING_RDEPENDS}"
-
 PROVIDES = "virtual/perf"
 
 inherit linux-kernel-base kernel-arch pythonnative
@@ -153,8 +150,23 @@ python do_package_prepend() {
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+
+PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
+
+RDEPENDS_${PN} += "elfutils"
+RDEPENDS_${PN}-archive =+ "bash"
+RDEPENDS_${PN}-python =+ "bash python"
+RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
+
+RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
+RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
+
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
-FILES_${PN} += "${libdir}/python*/site-packages"
+FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
+FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
+FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
+FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
+
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-- 
1.9.1

