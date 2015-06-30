Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D018475C87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:52:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Jun 2015 01:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="720168246"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2015 01:52:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 72E7D6A4005;
	Tue, 30 Jun 2015 01:52:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:39 +0300
Message-Id: <1435654312-18177-8-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 07/20] wic: Turn off debug output for 'bitbake -e'
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
X-List-Received-Date: Tue, 30 Jun 2015 08:52:56 -0000

Switched debug level to 'normal' to prevent huge 'bitbake -e'
output to go into wic debug output. This should help to make
wic debug info much more clean and easier to read.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 1de6f46..2f9f515 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -122,7 +122,12 @@ def get_bitbake_var(var, image=None):
         cmd = "bitbake -e"
         if image:
             cmd += " %s" % image
+
+        log_level = msger.get_loglevel()
+        msger.set_loglevel('normal')
         rc, lines = __exec_cmd(cmd)
+        msger.set_loglevel(log_level)
+
         if rc:
             print "Couldn't get '%s' output." % cmd
             print "Bitbake failed with error:\n%s\n" % lines
-- 
2.1.4


