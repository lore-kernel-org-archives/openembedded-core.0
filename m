Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4D2C7713D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:42:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="916466788"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2016 01:42:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:41:58 +1300
Message-Id: <0b7cf15d6d8ea68698d8c7db02e83914d13f1caa.1455874891.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874891.git.paul.eggleton@linux.intel.com>
References: <cover.1455874891.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874891.git.paul.eggleton@linux.intel.com>
References: <cover.1455874891.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/populate_sdk_ext: add a better config extension mechanism
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
X-List-Received-Date: Fri, 19 Feb 2016 09:42:04 -0000

The sdk_extraconf() method of setting the configuration was awkward
since you needed to set it in a class and then inherit that class since
function definitions aren't allowed in conf files. It seemed to me the
a neater way to do this was to read the extra lines from an additional
conf file sdk-extra.conf (which can be located in a conf/ directory
anywhere along BBPATH as with other configuration files).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 6e36642..ad12b66 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -175,7 +175,15 @@ python copy_buildsystem () {
         # Hide the config information from bitbake output (since it's fixed within the SDK)
         f.write('BUILDCFG_HEADER = ""\n')
 
+        # Allow additional config through sdk-extra.conf
+        fn = bb.cookerdata.findConfigFile('sdk-extra.conf', d)
+        if fn:
+            with open(fn, 'r') as xf:
+                for line in xf:
+                    f.write(line)
+
         # If you define a sdk_extraconf() function then it can contain additional config
+        # (Though this is awkward; sdk-extra.conf should probably be used instead)
         extraconf = (d.getVar('sdk_extraconf', True) or '').strip()
         if extraconf:
             # Strip off any leading / trailing spaces
-- 
2.5.0


