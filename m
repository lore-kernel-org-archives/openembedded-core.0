Return-Path: <nathan.rossi@xilinx.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe001.messaging.microsoft.com [216.32.180.184])
	by mail.openembedded.org (Postfix) with ESMTP id 8148460C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 08:02:12 +0000 (UTC)
Received: from mail122-co1-R.bigfish.com (10.243.78.238) by
	CO1EHSOBE022.bigfish.com (10.243.66.85) with Microsoft SMTP Server id
	14.1.225.22; Fri, 10 Jan 2014 08:02:13 +0000
Received: from mail122-co1 (localhost [127.0.0.1])	by
	mail122-co1-R.bigfish.com (Postfix) with ESMTP id 0CEE74802A5;
	Fri, 10 Jan 2014 08:02:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh2327h2336h2438h906i1155h)
Received-SPF: pass (mail122-co1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail122-co1 (localhost.localdomain [127.0.0.1]) by mail122-co1
	(MessageSwitch) id 1389340931312091_17209;
	Fri, 10 Jan 2014 08:02:11 +0000 (UTC)
Received: from CO1EHSMHS028.bigfish.com (unknown [10.243.78.242])	by
	mail122-co1.bigfish.com (Postfix) with ESMTP id 3ED5A70004A;
	Fri, 10 Jan 2014 08:02:11 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO1EHSMHS028.bigfish.com
	(10.243.66.38) with Microsoft SMTP Server id 14.16.227.3;
	Fri, 10 Jan 2014 08:02:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1W1X2h-0000RB-00; Fri, 10 Jan 2014 00:02:11 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 18:01:33 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <dd6f2aa3-4a61-4f07-b88a-76c90724303b@CO1EHSMHS028.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH v2] ptest.bblass: Fix package QA issues when disabled
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
X-List-Received-Date: Fri, 10 Jan 2014 08:02:13 -0000
Content-Type: text/plain

When the ptest distro feature is disabled, a ptest directory is still
created in the install phase, This directory is not cleaned up or
consumed by any package and will throw a QA error, e.g.

ERROR: QA Issue: glib-2.0: Files/directories were installed but not
shipped
  /usr/lib/glib-2.0/ptest
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

This is caused by the do_install_ptest_base[cleandirs] attribute which
is not setup to be conditional on ptest being enabled.

This patch refactors the use of PTEST_ENABLED in the *ptest_base tasks,
replacing the conditional execution with the removal of the tasks from
the build, this prevents any part (including cleandirs) of the ptest
tasks from executing when disabled.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/ptest.bbclass |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index ec10f80..e5bbb89 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -18,9 +18,7 @@ do_configure_ptest() {
 }
 
 do_configure_ptest_base() {
-    if [ ${PTEST_ENABLED} = 1 ]; then
-        do_configure_ptest
-    fi
+    do_configure_ptest
 }
 
 do_compile_ptest() {
@@ -28,9 +26,7 @@ do_compile_ptest() {
 }
 
 do_compile_ptest_base() {
-    if [ ${PTEST_ENABLED} = 1 ]; then
-        do_compile_ptest
-    fi
+    do_compile_ptest
 }
 
 do_install_ptest() {
@@ -38,14 +34,12 @@ do_install_ptest() {
 }
 
 do_install_ptest_base() {
-    if [ ${PTEST_ENABLED} = 1 ]; then
-        if [ -f ${WORKDIR}/run-ptest ]; then
-            install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
-            if grep -q install-ptest: Makefile; then
-                oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
-            fi
-            do_install_ptest
+    if [ -f ${WORKDIR}/run-ptest ]; then
+        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+        if grep -q install-ptest: Makefile; then
+            oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
         fi
+        do_install_ptest
     fi
 }
 
@@ -58,4 +52,9 @@ addtask install_ptest_base   after do_install   before do_package do_populate_sy
 python () {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
         d.setVarFlag('do_install_ptest_base', 'fakeroot', 1)
+
+    # Remove all '*ptest_base' tasks when ptest is not enabled
+    if not(d.getVar('PTEST_ENABLED', True) == "1"):
+        for i in filter(lambda k: d.getVarFlag(k, "task") and k.endswith("ptest_base"), d.keys()):
+            bb.build.deltask(i, d)
 }
-- 
1.7.9.5



