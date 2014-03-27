Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E68D16F90E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 07:15:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Mar 2014 00:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,739,1389772800"; d="scan'208";a="508717204"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2014 00:15:00 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 09:18:17 +0200
Message-Id: <c0db7dda21301aa17eb2b36cfe1a343664d163e0.1395904656.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1395904656.git.cristian.iorga@intel.com>
References: <cover.1395904656.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1395904656.git.cristian.iorga@intel.com>
References: <cover.1395904656.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] lsb: fix lsb_log_msg() implementation
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
X-List-Received-Date: Thu, 27 Mar 2014 07:15:24 -0000

LSB lsb_log_message calls a begin()
function that should be implemented
in /etc/init.d/functions.
The aforementioned script does not
implement the begin() function, as
such there is a small issue related to logging.

This fix implements a local version of
the function, while cleaning up the
troublesome previous implementation.

Fix [YOCTO #5795]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/lsb/lsb/init-functions  | 7 ++++++-
 meta/recipes-extended/lsb/lsb/lsb_log_message | 5 -----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb/init-functions b/meta/recipes-extended/lsb/lsb/init-functions
index e15827a..7c1dce2 100755
--- a/meta/recipes-extended/lsb/lsb/init-functions
+++ b/meta/recipes-extended/lsb/lsb/init-functions
@@ -30,10 +30,15 @@ log_warning_msg () {
 	/etc/core-lsb/lsb_log_message warning "$@"
 }
 
+# int log_begin_message (char *message)
 log_begin_msg () {
-	/etc/core-lsb/lsb_log_message begin "$@"
+	if [ -z "$1" ]; then
+		return 1
+	fi
+	echo " * $@"
 }
 
+
 log_end_msg () {
 	/etc/core-lsb/lsb_log_message end "$@"
 }
diff --git a/meta/recipes-extended/lsb/lsb/lsb_log_message b/meta/recipes-extended/lsb/lsb/lsb_log_message
index a716518..10343b0 100755
--- a/meta/recipes-extended/lsb/lsb/lsb_log_message
+++ b/meta/recipes-extended/lsb/lsb/lsb_log_message
@@ -21,11 +21,6 @@ case "$ACTION" in
 	warning "$*"
 	echo
 	;;
-  begin)
-  	echo -n $*
-	begin "$*"
-	echo
-	;;
   *)
   	;;
 esac
-- 
1.8.3.2


