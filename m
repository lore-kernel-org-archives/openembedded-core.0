Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 180BA75F1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:57:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 07:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,472,1432623600"; d="scan'208";a="728662443"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2015 07:57:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:56:54 +0100
Message-Id: <0ecc33e17c7894725128181c9a660fcc64e679f1.1436884357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] classes/base: fix die() to print the full log
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
X-List-Received-Date: Tue, 14 Jul 2015 14:57:09 -0000

The recent change to connect through the shell logging functions caused
a regression - bb.error() and bb.fatal() cause a flag to be set
internally such that BitBake's UI will not print the full task log on
failure; unfortunately we have in a lot of places called die() or
bbfatal() within shell functions with a very terse message as a means of
exiting out, where we still want to see the full log (and we were
previously). We do still want to have fatal errors with proper messages
that don't result in the full log being printed, however we can't ignore
the typical usage of die(). Having added a mechanism to BitBake to log an
error and reset the flag, create a bbfatal_log() function that uses this
and call it from die() to restore the previous behaviour.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass    | 2 +-
 meta/classes/logging.bbclass | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fe803f1..6676078 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -47,7 +47,7 @@ def lsb_distro_identifier(d):
     return oe.lsb.distro_identifier(adjust_func)
 
 die() {
-	bbfatal "$*"
+	bbfatal_log "$*"
 }
 
 oe_runmake_call() {
diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
index f19eddd..6b24839 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -40,6 +40,14 @@ bbfatal() {
 	exit 1
 }
 
+# Like bbfatal, except prevents the suppression of the error log by
+# bitbake's UI.
+# Output: logs console
+bbfatal_log() {
+	printf "%b\0" "bbfatal_log $*" > ${LOGFIFO}
+	exit 1
+}
+
 # Print debug messages. These are appropriate for progress checkpoint
 # messages to the logs. Depending on the debug log level, they may also
 # go to the console.
-- 
2.1.0


