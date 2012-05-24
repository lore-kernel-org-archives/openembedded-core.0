Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuW-0002yZ-0d
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125513"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:24 -0700
Message-Id: <915769c405e24751eae613e9ef55f05490a726de.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 13/32] utils.bbclass: Testing via env in create_wrapper is a nice idea but breaks things
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
X-List-Received-Date: Thu, 24 May 2012 21:49:35 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

For example, pseudo-native wants to set LD_LIBRBARY_PATH but setting this
into the environment here causes the existing pseudo (running during do_install)
to poke into paths in /opt and this breaks builds.

The simplest fix is simply not to do this. Comments tweaks to match the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 3b59463..fde8f44 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -282,7 +282,6 @@ create_cmdline_wrapper () {
    cmd=$1
    shift
 
-   # run echo via env to test syntactic validity of the variable arguments
    echo "Generating wrapper script for $cmd"
 
    mv $cmd $cmd.real
@@ -306,8 +305,7 @@ create_wrapper () {
    cmd=$1
    shift
 
-   # run echo via env to test syntactic validity of the variable arguments
-   env $@ echo "Generating wrapper script for $cmd"
+   echo "Generating wrapper script for $cmd"
 
    mv $cmd $cmd.real
    cmdname=`basename $cmd`.real
-- 
1.7.9.5



