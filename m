Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B98B79DC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:43:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBK7hhD2002477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 23:43:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Dec 2018 23:43:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2018 23:43:21 -0800
Message-ID: <29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545291716.git.liezhi.yang@windriver.com>
References: <cover.1545291716.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa/concurrencytest: fix for locating meta-selftest
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
X-List-Received-Date: Thu, 20 Dec 2018 07:43:43 -0000
Content-Type: text/plain

The previous code assumed builddir and meta-selftest are in the same dir, but
this isn't always true, builddir can be anywhere, use bitbake to locate
meta-selftest can fix the problem.

The bb.fatal() doesn't work (no error message is print), so I use raise
Exception to print error messages.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index f050289..ef1698c 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -139,6 +139,20 @@ def removebuilddir(d):
         delay = delay - 1
     bb.utils.prunedir(d)
 
+def get_selftestdir():
+    """
+    Use 'which bitbake' to locate meta-selftest dir
+    """
+    cmd = 'which bitbake'
+    retval, bitbake_path = subprocess.getstatusoutput(cmd)
+    if retval != 0:
+        raise Exception('Failed to run %s' % cmd)
+    topdir = os.path.realpath('%s/../../' % os.path.dirname(bitbake_path))
+    selftestdir = os.path.join(topdir, 'meta-selftest')
+    if not os.path.exists(selftestdir):
+        raise Exception('Failed to run %s' % cmd)
+    return selftestdir
+
 def fork_for_tests(concurrency_num, suite):
     result = []
     test_blocks = partition_tests(suite, concurrency_num)
@@ -166,7 +180,7 @@ def fork_for_tests(concurrency_num, suite):
                 if 'BUILDDIR' in os.environ:
                     builddir = os.environ['BUILDDIR']
                     newbuilddir = builddir + "-st-" + str(ourpid)
-                    selftestdir = os.path.abspath(builddir + "/../meta-selftest")
+                    selftestdir = get_selftestdir()
                     newselftestdir = newbuilddir + "/meta-selftest"
 
                     bb.utils.mkdirhier(newbuilddir)
-- 
2.10.2


