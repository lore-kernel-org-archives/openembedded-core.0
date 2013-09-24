Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5F9610D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 01:16:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8O1GN3C028604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 18:16:23 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 23 Sep 2013 18:16:23 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2013 09:16:23 +0800
Message-ID: <1379985383-5526-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2] ptest-runner: compatibile with busybox
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
X-List-Received-Date: Tue, 24 Sep 2013 01:16:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Do not use pushd, busybox does not support it if system only has busybox;
Replace find command with ls to avoid some busybox's find unsupported options;

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-support/ptest-runner/files/ptest-runner |   19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
index ccb0434..3342413 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -7,24 +7,15 @@ do
 
     [ ! -d "$libdir" ] && continue
 
-    cd "$libdir"
-    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
+    for x in `ls -d $libdir/*/ptest 2>/dev/null`
     do
-        # test if a dir is linking to one that they are under same directory
-        # like perl5-->perl
-        ptestdir=`dirname $x|cut -f2 -d"/"`
-        if [ -h "$ptestdir" ]; then
-            linkdir=`readlink -f "$ptestdir"`
-            if [ `dirname "$linkdir"` = "$libdir" ]; then
-                continue
-            fi
-        fi
-    
+        [ ! -f $x/run-ptest ] && continue
+        [ -h `dirname $x` ] && continue
+
         date "+%Y-%m-%dT%H:%M"
         echo "BEGIN: $x"
-        pushd `dirname "$x"`
+        cd "$x"
         ./run-ptest
-        popd
         echo "END: $x"
         date "+%Y-%m-%dT%H:%M"
     done
-- 
1.7.10.4


