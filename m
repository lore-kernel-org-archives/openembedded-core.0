Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 782B3774ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:20:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2016 18:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="1102758842"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 18:20:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 15:19:59 +1300
Message-Id: <fc78e15323acd013c7d77dfb991bf36f7784a9a5.1482373109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482373109.git.paul.eggleton@linux.intel.com>
References: <cover.1482373109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/sstate: fix file conflict message
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
X-List-Received-Date: Thu, 22 Dec 2016 02:20:24 -0000

* Fix not decoding output from grep ("Matched in b'manifest...')
* Fix showing "Matched in b''" if no match (show "not matched to any
  task" instead)
* Drop the filtering out of .populate-sysroot from matched manifest
  names - it should have been .populate_sysroot so it doesn't work, and
  in any case the value of removing the task name is questionable given
  that we aren't removing it for any other task, and that the rest of
  the filename isn't only the task name, we might as well have the whole
  thing. At least then you can do a find on that exact name without
  wildcards and find it.
* Fix indenting of file list entries and indent "matched in" further
  underneath
* Minor punctuation fixes

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 755bf59..afdb4a3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -213,25 +213,27 @@ def sstate_install(ss, d):
                     break
             if realmatch:
                 match.append(f)
-                sstate_search_cmd = "grep -rlF '%s' %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
+                sstate_search_cmd = "grep -rlF '%s' %s --exclude=master.list | sed -e 's:^.*/::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                 search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
-                if search_output != "":
-                    match.append("Matched in %s" % search_output.rstrip())
+                if search_output:
+                    match.append("  (matched in %s)" % search_output.decode('utf-8').rstrip())
+                else:
+                    match.append("  (not matched to any task)")
     if match:
         bb.error("The recipe %s is trying to install files into a shared " \
           "area when those files already exist. Those files and their manifest " \
-          "location are:\n   %s\nPlease verify which recipe should provide the " \
-          "above files.\nThe build has stopped as continuing in this scenario WILL " \
-          "break things, if not now, possibly in the future (we've seen builds fail " \
+          "location are:\n  %s\nPlease verify which recipe should provide the " \
+          "above files.\n\nThe build has stopped, as continuing in this scenario WILL " \
+          "break things - if not now, possibly in the future (we've seen builds fail " \
           "several months later). If the system knew how to recover from this " \
-          "automatically it would however there are several different scenarios " \
+          "automatically it would, however there are several different scenarios " \
           "which can result in this and we don't know which one this is. It may be " \
           "you have switched providers of something like virtual/kernel (e.g. from " \
           "linux-yocto to linux-yocto-dev), in that case you need to execute the " \
           "clean task for both recipes and it will resolve this error. It may be " \
           "you changed DISTRO_FEATURES from systemd to udev or vice versa. Cleaning " \
-          "those recipes should again resolve this error however switching " \
-          "DISTRO_FEATURES on an existing build directory is not supported, you " \
+          "those recipes should again resolve this error, however switching " \
+          "DISTRO_FEATURES on an existing build directory is not supported - you " \
           "should really clean out tmp and rebuild (reusing sstate should be safe). " \
           "It could be the overlapping files detected are harmless in which case " \
           "adding them to SSTATE_DUPWHITELIST may be the correct solution. It could " \
@@ -239,7 +241,7 @@ def sstate_install(ss, d):
           "things (e.g. bluez 4 and bluez 5 and the correct solution for that would " \
           "be to resolve the conflict. If in doubt, please ask on the mailing list, " \
           "sharing the error and filelist above." % \
-          (d.getVar('PN'), "\n ".join(match)))
+          (d.getVar('PN'), "\n  ".join(match)))
         bb.fatal("If the above message is too much, the simpler version is you're advised to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix things in most (but not all) cases.")
 
     # Write out the manifest
-- 
2.5.5


