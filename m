Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1TyWZs-0001jF-Bx
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 00:51:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jan 2013 15:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,532,1355126400"; d="scan'208";a="276334350"
Received: from wrk.jf.intel.com ([10.7.202.72])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2013 15:35:27 -0800
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 15:34:15 -0800
Message-Id: <ac167dd477306984edf3607e3321deec0165611e.1359069690.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359069690.git.kevin.strasser@linux.intel.com>
References: <cover.1359069690.git.kevin.strasser@linux.intel.com>
Subject: [PATCH 1/1] archvier.bbclass: fix copyleft filter behavior
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 23:51:29 -0000

copyleft_should_include() was only filtering out recipes that
contain a license in COPYLEFT_LICENSE_EXCLUDE. This change adds
the requirement that the recipe contain a copyleft license, as
defined by COPYLEFT_LICENSE_INCLUDE.

Also, filtering results were being mistakenly negated in tar_filter().

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 meta/classes/archiver.bbclass |    6 ++++--
 meta/lib/oe/license.py        |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a4a2158..7fd4f0f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -64,8 +64,10 @@ def copyleft_should_include(d):
     else:
         if is_included:
             return True, 'recipe has included licenses: %s' % ', '.join(reason)
-        else:
+        elif reason:
             return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
+        else:
+            return False, 'recipe has neither included nor excluded licenses'
 
 def tar_filter(d):
     """
@@ -75,7 +77,7 @@ def tar_filter(d):
     """
     if d.getVar('FILTER', True) == "yes":
         included, reason = copyleft_should_include(d)
-        if not included:
+        if included:
             return False
         else:
             return True
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 173e319..fc15e9e 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -112,5 +112,7 @@ def is_included(licensestr, whitelist=None, blacklist=None):
     included = filter(lambda lic: include_license(lic), licenses)
     if excluded:
         return False, excluded
-    else:
+    elif included:
         return True, included
+    else:
+        return False, None
-- 
1.7.9.5



