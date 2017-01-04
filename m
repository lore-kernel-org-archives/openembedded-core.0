Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AD69D719A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 19:01:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2017 11:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,317,1477983600"; d="scan'208";a="918945514"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 04 Jan 2017 11:01:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 187BE6A4006;
	Wed,  4 Jan 2017 11:00:46 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 20:48:18 +0200
Message-Id: <1483555698-27838-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483555698-27838-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1483555698-27838-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 2/2] populate_sdk_ext: whitelist do_package tasks
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
X-List-Received-Date: Wed, 04 Jan 2017 19:01:39 -0000

With enabled SSTATE_MIRRORS sstate code expects mirrors to
contain entries for all tasks, which is not the case for ext
installer as it uses reduced sstate cache.

Added do_package tasks to BB_SETSCENE_ENFORCE_WHITELIST to prevent
installer failing with ERROR: Sstate artifact unavailable

[YOCTO #10832]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fc9cc22..d1b3fb4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -305,7 +305,7 @@ python copy_buildsystem () {
             f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n\n')
 
             # Set up whitelist for run on install
-            f.write('BB_SETSCENE_ENFORCE_WHITELIST = "%:* *:do_shared_workdir *:do_rm_work"\n\n')
+            f.write('BB_SETSCENE_ENFORCE_WHITELIST = "%:* *:do_shared_workdir *:do_rm_work *:do_package"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n\n')
-- 
2.1.4


