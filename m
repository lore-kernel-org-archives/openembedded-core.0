Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 84701600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 20:33:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 13:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,455,1427785200"; d="scan'208";a="573274352"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 18 May 2015 13:33:25 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 20:33:07 +0000
Message-Id: <1431981187-24981-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH] license_class: Add explicity avoid of CLOSED license in validations
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
X-List-Received-Date: Mon, 18 May 2015 20:33:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CLOSED license isn't a generic license it is a set and can
be any closed source license.

[YOCTO #7752]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 7972c79..756e7f0 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -80,6 +80,10 @@ python license_create_manifest() {
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                                         pkg_dic[pkg]["PN"], "generic_%s" % 
                                         re.sub('\+', '', lic))
+                # add explicity avoid of CLOSED license because isn't generic
+                if lic == "CLOSED":
+                   continue
+
                 if not os.path.exists(lic_file):
                    bb.warn("The license listed %s was not in the "\ 
                             "licenses collected for recipe %s" 
@@ -278,8 +282,10 @@ def find_license_files(d):
                     lic_files_paths.append(("generic_" + license_type, path))
                     break
         else:
-            # And here is where we warn people that their licenses are lousy
-            bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
+            # Add explicity avoid of CLOSED license because this isn't generic
+            if license_type != 'CLOSED':
+                # And here is where we warn people that their licenses are lousy
+                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
             pass
 
     if not generic_directory:
-- 
1.8.4.5


