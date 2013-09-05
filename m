Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 888746C6BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:57:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r85Dvt14007412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 06:57:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 5 Sep 2013 06:57:53 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2013 21:58:25 +0800
Message-ID: <8e47e2d04e84ba5229e9455b26266bbd3300b1b4.1378388992.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378388992.git.Qi.Chen@windriver.com>
References: <cover.1378388992.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/2] ptest.bbclass: fix error on ubuntu host
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
X-List-Received-Date: Thu, 05 Sep 2013 13:57:52 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The do_install_ptest_base function uses 'type -t' command to check
whether do_install_ptest is a function and acts correspondingly.

However, the 'type' command is a shell builtin and its behavior is
not all the same across Linux distros. On ubuntu, if we use #!/bin/sh
as the interpreter for the scripts, as in the case of our intermediate
scripts, the '-t' option for the 'type' command is not supported. So
the check always fails and the do_install_ptest function, even if defined,
is not run.

The same problem also applies to the do_configure_ptest_base and the
do_compile_ptest_base functions.

This patch fixes this problem by avoiding using the 'type' builtin command.

[YOCTO #5128]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/ptest.bbclass |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 37357e8..15a42d6 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -16,22 +16,30 @@ RDEPENDS_${PN}-ptest_virtclass-nativesdk = ""
 
 PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 
+do_configure_ptest() {
+    :
+}
+
 do_configure_ptest_base() {
     if [ ${PTEST_ENABLED} = 1 ]; then
-        if [ a$(type -t do_configure_ptest) = afunction ]; then
-            do_configure_ptest
-        fi
+        do_configure_ptest
     fi
 }
 
+do_compile_ptest() {
+    :
+}
+
 do_compile_ptest_base() {
     if [ ${PTEST_ENABLED} = 1 ]; then
-        if [ a$(type -t do_compile_ptest) = afunction ]; then
-            do_compile_ptest
-        fi
+        do_compile_ptest
     fi
 }
 
+do_install_ptest() {
+    :
+}
+
 do_install_ptest_base() {
     if [ ${PTEST_ENABLED} = 1 ]; then
         if [ -f ${WORKDIR}/run-ptest ]; then
@@ -39,9 +47,7 @@ do_install_ptest_base() {
             if grep -q install-ptest: Makefile; then
                 oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
             fi
-            if [ a$(type -t do_install_ptest) = afunction ]; then
-                do_install_ptest
-            fi
+            do_install_ptest
         fi
     fi
 }
-- 
1.7.9.5


