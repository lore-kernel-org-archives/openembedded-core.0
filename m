Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyY-0007DK-GR
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:39 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:17 -0800 (PST)
Received: by 10.216.174.69 with SMTP id w47mr1157097wel.41.1298799017006;
	Sun, 27 Feb 2011 01:30:17 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t11sm1280252wes.41.2011.02.27.01.30.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:16 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:51 +0100
Message-Id: <5578359e325ebf3b8d6d33a62702cd19d44f67fc.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 39/50] utils.bbclass: add new wrapper script
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:27 -0000

From: Saul Wold <sgw@linux.intel.com>

Add a new create_cmdline_wrapper() function that takes cmdline options
for commands that need different directories

Related to [BUGID #775

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/utils.bbclass |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 455b49d..e923789 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -271,6 +271,29 @@ oe_machinstall() {
 	fi
 }
 
+create_cmdline_wrapper () {
+   # Create a wrapper script
+   #
+   # These are useful to work around relocation issues, by setting environment
+   # variables which point to paths in the filesystem.
+   #
+   # Usage: create_wrapper FILENAME [[VAR=VALUE]..]
+
+   cmd=$1
+   shift
+
+   # run echo via env to test syntactic validity of the variable arguments
+   echo "Generating wrapper script for $cmd"
+
+   mv $cmd $cmd.real
+   cmdname=`basename $cmd`.real
+   cat <<END >$cmd
+#!/bin/sh
+exec \`dirname \$0\`/$cmdname "\$@"
+END
+   chmod +x $cmd
+}
+
 create_wrapper () {
    # Create a wrapper script
    #
-- 
1.6.6.1



