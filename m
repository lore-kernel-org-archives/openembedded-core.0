Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 327AA77D48
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:54:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 03:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,322,1496127600"; d="scan'208";a="876375113"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2017 03:54:27 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 20:43:47 -0700
Message-Id: <e40f60b3e42b5adac6612c2ee484371c3ae9d939.1499394173.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499394173.git.swee.aun.khor@intel.com>
References: <cover.1499394173.git.swee.aun.khor@intel.com>
Subject: [PATCH 1/7] insane.bbclass: Support musl-x32
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
X-List-Received-Date: Fri, 07 Jul 2017 10:54:27 -0000

From: sweeaun <swee.aun.khor@intel.com>

Added musl-x32 elf header into dictionary.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7680a59..479d39c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -150,6 +150,9 @@ def package_qa_get_machine_dict(d):
             "linux-gnux32" :       {
                         "x86_64":     (62,     0,    0,          True,          32),
                       },
+            "linux-muslx32" :       {
+                        "x86_64":     (62,     0,    0,          True,          32),
+                      },
             "linux-gnun32" :       {
                         "mips64":       ( 8,     0,    0,          False,         32),
                         "mips64el":     ( 8,     0,    0,          True,          32),
@@ -488,7 +491,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
-            (target_os == "linux-gnux32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
+            (target_os == "linux-gnux32" or target_os == "linux-muslx32"  or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
     if not ((machine == elf.machine()) or is_32):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
-- 
2.7.4


