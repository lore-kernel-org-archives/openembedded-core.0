Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFC261617
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:48:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r85Cma4l003829
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 05:48:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 5 Sep 2013 05:48:36 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2013 20:49:06 +0800
Message-ID: <c425dc883150a2c69a92feae459545086e264ac9.1378385266.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378385266.git.Qi.Chen@windriver.com>
References: <cover.1378385266.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ptest.bbclass: fix error on ubuntu host
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
X-List-Received-Date: Thu, 05 Sep 2013 12:48:34 -0000
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

This patch fixes this problem by avoiding using the 'type' builtin command.

[YOCTO #5128]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/ptest.bbclass |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 37357e8..71183af 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -32,6 +32,10 @@ do_compile_ptest_base() {
     fi
 }
 
+do_install_ptest() {
+    :
+}
+
 do_install_ptest_base() {
     if [ ${PTEST_ENABLED} = 1 ]; then
         if [ -f ${WORKDIR}/run-ptest ]; then
@@ -39,9 +43,7 @@ do_install_ptest_base() {
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


