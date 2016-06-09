Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 669C16FF22
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 20:55:27 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2016 13:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,446,1459839600"; d="scan'208";a="119192150"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2016 13:55:29 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 07:53:06 -0500
Message-Id: <1465476786-4405-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] lib/oe/terminal.py: decode bytes variable before rstrip/split
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
X-List-Received-Date: Thu, 09 Jun 2016 20:55:28 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

On python 3, bytes variable types must be decoded if these are intended to be
used as strings, otherwise we get the following error exception:

    TypeError: Type str doesn't support the buffer API

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index dc25d14..7f4458e 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -246,7 +246,7 @@ def check_terminal_version(terminalName):
         newenv["LANG"] = "C"
         p = sub.Popen(['sh', '-c', cmdversion], stdout=sub.PIPE, stderr=sub.PIPE, env=newenv)
         out, err = p.communicate()
-        ver_info = out.rstrip().split('\n')
+        ver_info = out.decode().rstrip().split('\n')
     except OSError as exc:
         import errno
         if exc.errno == errno.ENOENT:
-- 
2.6.6


