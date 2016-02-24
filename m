Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4A490772BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893686092"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:46 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:14 +0000
Message-Id: <e1efd4cf783e1e97a893ffd319c303fba61cbfb6.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 10/10] os-release: sanitise VERSION_ID field
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:46 -0000

Per os-release(5) the VERSION_ID field should be:

  a lower-case string (mostly numeric, no spaces or other characters
  outside of 0-9, a-z, ".", "_" and "-")

Do some string manipulation to try and ensure the VERSION_ID field
we write is valid.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/os-release/os-release.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index df19ca2..03abc50 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -23,11 +23,20 @@ PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 BUILD_ID ?= "${DATETIME}"
 BUILD_ID[vardepsexclude] = "DATETIME"
 
+def sanitise_version(ver):
+    # VERSION_ID should be (from os-release(5)):
+    #    lower-case string (mostly numeric, no spaces or other characters
+    #    outside of 0-9, a-z, ".", "_" and "-")
+    ret = ver.replace('+', '-').replace(' ','_')
+    return ret.lower()
+
 python do_compile () {
     import shutil
     with open(d.expand('${B}/os-release'), 'w') as f:
         for field in d.getVar('OS_RELEASE_FIELDS', True).split():
             value = d.getVar(field, True)
+            if value and field == 'VERSION_ID':
+                value = sanitise_version(value)
             if value:
                 f.write('{0}="{1}"\n'.format(field, value))
     if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
-- 
2.5.0


