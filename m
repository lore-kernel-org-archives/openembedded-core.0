Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE11771D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475637"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:00 +1200
Message-Id: <97516475467161429710576f1c340553d0618a9f.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/10] classes/populate_sdk_ext: handle lack of uninative when filtering sstate
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:28 -0000

If the build in which the eSDK is being built isn't using uninative,
this will have an effect on NATIVELSBSTRING, which will mean that the
eSDK installer won't be able to find any of the native sstate packages.
To keep things simple, under this scenario just disable uninative
temporarily while we run the SDK installer to help us check the presence
of the sstate artifacts we need. Ideally I'd rather not have things like
this that are artificial in this verification step, but on the other
hand this was the least ugly way to solve the problem.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index f758d98..c16e228 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -108,9 +108,14 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
     # Create a temporary build directory that we can pass to the env setup script
     shutil.copyfile(sdkbasepath + '/conf/local.conf', sdkbasepath + '/conf/local.conf.bak')
     try:
+        # Force the use of sstate from the build system
         with open(sdkbasepath + '/conf/local.conf', 'a') as f:
             f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR', True))
             f.write('SSTATE_MIRRORS_forcevariable = ""\n')
+            # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
+            # be different and we won't be able to find our native sstate)
+            if not bb.data.inherits_class('uninative', d):
+                f.write('INHERIT_remove = "uninative"\n')
 
         # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
         # will not allow in its COREBASE path, so we need to rename the directory temporarily
-- 
2.5.5


