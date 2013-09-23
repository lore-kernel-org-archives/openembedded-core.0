Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5799F610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 02:02:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8N22682011704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 19:02:06 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 22 Sep 2013 19:02:03 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2013 10:02:02 +0800
Message-ID: <1379901723-887-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] ptest-runner: compatibile with busybox
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
X-List-Received-Date: Mon, 23 Sep 2013 02:02:03 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Do not use pushd, busybox does not support it if system only has busybox;
run-ptests are always installed under ${libdir}, not linked into ${libdir},
so do not need to find run-ptest under a link, that avoid to use -L option
when use find command

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/ptest-runner/files/ptest-runner |   16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
index ccb0434..3c89073 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -7,24 +7,12 @@ do
 
     [ ! -d "$libdir" ] && continue
 
-    cd "$libdir"
-    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
+    for x in `find $libdir -name run-ptest -type f`
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
         date "+%Y-%m-%dT%H:%M"
         echo "BEGIN: $x"
-        pushd `dirname "$x"`
+        cd `dirname "$x"`
         ./run-ptest
-        popd
         echo "END: $x"
         date "+%Y-%m-%dT%H:%M"
     done
-- 
1.7.10.4


