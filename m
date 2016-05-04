Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2526E666
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 08:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="968636126"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2016 08:27:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 83AAF6A4008
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:25 +0300
Message-Id: <8ec0f95685d91d77aeb015f37f27acde9e31b425.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 12/14] wic: decode output of subprocess.communicate
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
X-List-Received-Date: Wed, 04 May 2016 15:27:52 -0000

stdeout and stderr content returned by communicate API has different
types in Python 3(bytes) and Python 2(string). Decoding it to 'utf-8'
makes it unicode on both pythons.

Decoded stdout and stderr output to utf-8 to make the code
working under both Python 2 and Python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index 737751b..db536ba 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -65,8 +65,8 @@ def runtool(cmdln_or_args, catch=1):
         process = subprocess.Popen(cmdln_or_args, stdout=sout,
                                    stderr=serr, shell=shell)
         (sout, serr) = process.communicate()
-        # combine stdout and stderr, filter None out
-        out = ''.join(filter(None, [sout, serr]))
+        # combine stdout and stderr, filter None out and decode
+        out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
     except OSError as err:
         if err.errno == 2:
             # [Errno 2] No such file or directory
-- 
2.1.4


