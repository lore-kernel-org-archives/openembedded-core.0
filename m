Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C3878772F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:06:12 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546797"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:06:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:06:02 +0200
Message-Id: <bf88b7cb6ea940898e13298ca7deed5aedf4bf54.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/36] selftest: allow bitbake to fail in test_options_warnqa_errorqa_switch
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
X-List-Received-Date: Mon, 13 Feb 2017 15:06:13 -0000

rpm4 seems to be stricter about duplicate entries in .spec, and so
we should let it fail for the test case to succeed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 1801511913b..0b744d1f5e9 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -91,7 +91,7 @@ class SanityOptionsTest(oeSelfTest):
         self.append_config('ERROR_QA_remove = "packages-list"')
         self.append_config('WARN_QA_append = " packages-list"')
         bitbake("xcursor-transparent-theme -ccleansstate")
-        res = bitbake("xcursor-transparent-theme")
+        res = bitbake("xcursor-transparent-theme", ignore_status = True)
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
-- 
2.11.0


