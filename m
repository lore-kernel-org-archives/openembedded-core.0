Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC5C73F27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 16:19:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 09:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="706182368"
Received: from jashore-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.219])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2015 09:19:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 17:19:26 +0100
Message-Id: <84428a11d6c7902212b78dbbcfa37a2dfb7802b4.1430929064.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430929064.git.paul.eggleton@linux.intel.com>
References: <cover.1430929064.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430929064.git.paul.eggleton@linux.intel.com>
References: <cover.1430929064.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes/buildstats: don't catch all errors from mkdirhier
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
X-List-Received-Date: Wed, 06 May 2015 16:19:40 -0000

mkdirhier() doesn't raise an exception if the directory exists, so if it
does raise one we should just be failing, otherwise we're just going
to hit errors later anyway.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildstats.bbclass | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index f15c45d..54d9f72 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -181,20 +181,14 @@ python run_buildstats () {
         # at first pass make the buildstats heriarchy and then
         # set the buildname
         ########################################################################
-        try:
-            bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
-        except:
-            pass
+        bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
         set_bn(e)
         bn = get_bn(e)
         set_device(e)
         device = get_device(e)
 
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        try:
-            bb.utils.mkdirhier(bsdir)
-        except:
-            pass
+        bb.utils.mkdirhier(bsdir)
         if device != "NoLogicalDevice":
             set_diskdata("__diskdata_build", device, e.data)
         set_timedata("__timedata_build", e.data)
@@ -242,10 +236,7 @@ python run_buildstats () {
         if device != "NoLogicalDevice":
             set_diskdata("__diskdata_task", device, e.data)
         set_timedata("__timedata_task", e.data, e.time)
-        try:
-            bb.utils.mkdirhier(taskdir)
-        except:
-            pass
+        bb.utils.mkdirhier(taskdir)
         # write into the task event file the name and start time
         file = open(os.path.join(taskdir, e.task), "a")
         file.write("Event: %s \n" % bb.event.getName(e))
-- 
2.1.0


