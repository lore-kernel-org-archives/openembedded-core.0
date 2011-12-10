Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZAY7-0007zv-ED
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:12:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 16:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94558749"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.199])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 16:05:26 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 16:05:24 -0800
Message-Id: <00fbcd63de9e191c6c808d64d880c64fa7aecc6c.1323475141.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <e335966f9acb0586d498f9c390bd797de2987db5.1323475141.git.elizabeth.flanagan@intel.com>
References: <e335966f9acb0586d498f9c390bd797de2987db5.1323475141.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323475141.git.elizabeth.flanagan@intel.com>
References: <cover.1323475141.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 3/3] license/copyleft: exception for ast parse
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Dec 2011 00:12:19 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

As the standard for LICENSE format is not well defined, we
may well run into issues where LICENSE cannot be parsed via
ast. In cases like this, we need to warn and continue.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/copyleft_compliance.bbclass |    2 ++
 meta/classes/license.bbclass             |    5 ++++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 5d9ab11..2fe524b 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -48,6 +48,8 @@ def copyleft_should_include(d):
         licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+    except SyntaxError:
+        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
 
     return all(include_license(lic) for lic in licenses)
 
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 96fdb46..4689aaf 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -231,7 +231,10 @@ python do_populate_lic() {
     try:
         v.visit_string(license_types)
     except oe.license.InvalidLicense as exc:
-        bb.fatal("%s: %s" % (d.getVar('PF', True), exc))
+        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+    except SyntaxError:
+        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
+
 }
 
 SSTATETASKS += "do_populate_lic"
-- 
1.7.1



