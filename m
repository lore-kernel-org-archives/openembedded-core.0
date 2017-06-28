Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28A217806E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:59:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 18:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,273,1496127600"; d="scan'208";a="985963834"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2017 18:59:25 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jun 2017 09:59:17 +0800
Message-Id: <1498615159-6719-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 1/3] scriptutils: exit politely when no text editor available
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
X-List-Received-Date: Wed, 28 Jun 2017 01:59:25 -0000

devtool edit-recipe now has ugly tracebacks if executed without an
editor available. This happens in the build containers whenever no
text editor is available.

subprocess.check_call will run text editing command with recipe path
provided. It will wait for command to complete. If the return code
was zero then return, otherwise raise CalledProcessError exception.

This enhancement will suppress the traceback by catching the exception
and prompt the error messages in a proper manner shown below:

pokyuser@59c99c507238:/workdir/docker-dbg$ devtool edit-recipe ifupdown
/bin/sh: 1: vi: not found
ERROR: Execution of 'vi' failed: Command 'vi
"/workdir/docker-dbg/workspace/recipes/ifupdown/ifupdown_0.8.16.bb"'
returned non-zero exit status 127

[YOCTO #11434]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/scriptutils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 92b601c..2b3f3fc 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -134,8 +134,8 @@ def run_editor(fn):
     editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
     try:
         return subprocess.check_call('%s %s' % (editor, params), shell=True)
-    except OSError as exc:
-        logger.error("Execution of editor '%s' failed: %s", editor, exc)
+    except subprocess.CalledProcessError as exc:
+        logger.error("Execution of '%s' failed: %s" % (editor, exc))
         return 1
 
 def is_src_url(param):
-- 
2.7.4


