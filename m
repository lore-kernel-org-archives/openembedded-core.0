Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2567171D4E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 17:27:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2016 09:27:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="910537276"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 09 Dec 2016 09:27:03 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B559E6A4006;
	Fri,  9 Dec 2016 09:26:16 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 19:26:48 +0200
Message-Id: <1481304408-11692-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-buildenv-internal: show usage output
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
X-List-Received-Date: Fri, 09 Dec 2016 17:27:02 -0000

Show usage text if script is not sourced.
Tested in bash, zsh and dash.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-buildenv-internal | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 9fae3b4..c890552 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -18,6 +18,18 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
+if ! $(return >/dev/null 2>&1) ; then
+    echo 'oe-buildenv-internal: error: this script must be sourced'
+    echo ''
+    echo 'Usage: . $OEROOT/scripts/oe-buildenv-internal &&'
+    echo ''
+    echo 'OpenEmbedded oe-buildenv-internal - an internal script that is'
+    echo 'used in oe-init-build-env and oe-init-build-env-memres to'
+    echo 'initialize oe build environment'
+    echo ''
+    exit 2
+fi
+
 # It is assumed OEROOT is already defined when this is called
 if [ -z "$OEROOT" ]; then
     echo >&2 "Error: OEROOT is not defined!"
-- 
2.1.4


