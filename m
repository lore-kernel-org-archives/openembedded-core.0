Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 261696B05F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 07:34:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B7Y9SV025148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 00:34:09 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 11 Sep 2013 00:34:08 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 15:34:07 +0800
Message-ID: <934e6208f68c0801666853fc81c3f67b39c368cb.1378884764.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378884764.git.rongqing.li@windriver.com>
References: <cover.1378884764.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ptest-runner: trivial fixes and refine
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
X-List-Received-Date: Wed, 11 Sep 2013 07:34:07 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. ptest files may be installed under /usr/lib64/ for 64bit filesystem
or under /usr/lib/ for 64bit multilib filesystem, so we should check both
directories

2. If a soft link is linking to a directory under the same directory, we
only run once.

[YOCTO #5125]
[YOCTO #5126]

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../ptest-runner/files/ptest-runner                |   30 +++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
index 4f3c7ce..724e066 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -1,16 +1,32 @@
 #!/bin/sh
 
 echo "START: $0"
-cd /usr/lib
-for x in *
+
+for libdir in /usr/lib/ /usr/lib64/
 do
-    if [ -x "/usr/lib/$x/ptest/run-ptest" ]; then
-       date "+%Y-%m-%dT%H:%M"
+
+    [ ! -d "$libdir" ] && continue
+
+    cd "$libdir"
+    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
+    do
+        # test if a dir is linking to one that they are under same directory
+        # like perl5-->perl
+        ptestdir=`dirname $x|cut -f2 -d"/"`
+        if [ -h "$ptestdir" ]; then
+            linkdir=`readlink -f "$ptestdir"`
+            if [ `dirname "$linkdir"`"/" = "$libdir" ]; then
+                continue
+            fi
+        fi
+    
+        date "+%Y-%m-%dT%H:%M"
         echo "BEGIN: $x"
-        cd /usr/lib/$x/ptest
+        pushd `dirname "$x"`
         ./run-ptest
+        popd
         echo "END: $x"
-       date "+%Y-%m-%dT%H:%M"
-    fi
+        date "+%Y-%m-%dT%H:%M"
+    done
 done
 echo "STOP: $0"
-- 
1.7.10.4


