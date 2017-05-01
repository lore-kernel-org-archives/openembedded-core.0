Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B8E5271DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 21:56:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 01 May 2017 14:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="81230916"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga002.jf.intel.com with ESMTP; 01 May 2017 14:56:10 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 14:59:00 -0700
Message-Id: <97028d3f45e62ba1e84b867d97fe5a55e0fc1d9f.1493674443.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1493674443.git.brian.avery@intel.com>
References: <cover.1493674443.git.brian.avery@intel.com>
Subject: [PATCH 1/1] tcf-agent: add -USR2 to stop/kill initscript
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
X-List-Received-Date: Mon, 01 May 2017 21:56:10 -0000

The current initscript was lacking a -USR2 signal in the stop section.
This resulted in /etc/init.d/tcf-agent stop; taking roughly 10 seconds
then failing to kill the tcf-agent process. This patch brings us in line
with how upstream stops the agent.

Fixes [YOCTO #10858]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
index 6303280..13497cc 100755
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
@@ -35,7 +35,7 @@ case "$1" in
         echo -n "Stopping $DAEMON_NAME: "
         count=0
         while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
-            killproc $DAEMON_PATH >& /dev/null
+            kill -USR2 `pidofproc $DAEMON_PATH`  >& /dev/null
             sleep 1
             RETVAL=$?
             if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
@@ -72,4 +72,3 @@ case "$1" in
 esac
 
 exit $RETVAL
-
-- 
1.9.1


