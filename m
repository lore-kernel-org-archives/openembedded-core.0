Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB9E7732C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 01 Feb 2017 06:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="59638507"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 01 Feb 2017 06:11:37 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1E8256A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:37 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:23 +0200
Message-Id: <3873fa0e90254d157c9d0f2b4a3dbe2a2e0d09b1.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 16/18] wic: msger.py: remove unused APIs
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:36 -0000

Removed unused enable_logstderr and disable_logstderr APIs.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/msger.py | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index fb8336d..dc9b734 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -207,29 +207,3 @@ def set_logfile(fpath):
 
     import atexit
     atexit.register(_savelogf)
-
-def enable_logstderr(fpath):
-    global CATCHERR_BUFFILE_FD
-    global CATCHERR_BUFFILE_PATH
-    global CATCHERR_SAVED_2
-
-    if os.path.exists(fpath):
-        os.remove(fpath)
-    CATCHERR_BUFFILE_PATH = fpath
-    CATCHERR_BUFFILE_FD = os.open(CATCHERR_BUFFILE_PATH, os.O_RDWR|os.O_CREAT)
-    CATCHERR_SAVED_2 = os.dup(2)
-    os.dup2(CATCHERR_BUFFILE_FD, 2)
-
-def disable_logstderr():
-    global CATCHERR_BUFFILE_FD
-    global CATCHERR_BUFFILE_PATH
-    global CATCHERR_SAVED_2
-
-    raw(msg=None) # flush message buffer and print it.
-    os.dup2(CATCHERR_SAVED_2, 2)
-    os.close(CATCHERR_SAVED_2)
-    os.close(CATCHERR_BUFFILE_FD)
-    os.unlink(CATCHERR_BUFFILE_PATH)
-    CATCHERR_BUFFILE_FD = -1
-    CATCHERR_BUFFILE_PATH = None
-    CATCHERR_SAVED_2 = -1
-- 
2.1.4


