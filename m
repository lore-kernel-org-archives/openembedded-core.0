Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RllGv-0007aO-34
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:50:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 09:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95565800"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.110])
	by azsmga001.ch.intel.com with ESMTP; 13 Jan 2012 09:43:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 17:42:56 +0000
Message-Id: <44c377326aa19c844ad48f3940f6976614d7365c.1326476501.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/base: note variable name in COMPATIBLE_* skip messages
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
X-List-Received-Date: Fri, 13 Jan 2012 17:50:37 -0000

When raising SkipPackage for COMPATIBLE_MACHINE and COMPATIBLE_HOST
exceptions, include the name of the variable as a hint to the user.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f0c358e..091e965 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -379,7 +379,7 @@ python () {
             import re
             this_host = d.getVar('HOST_SYS', 1)
             if not re.match(need_host, this_host):
-                raise bb.parse.SkipPackage("incompatible with host %s" % this_host)
+                raise bb.parse.SkipPackage("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
 
         need_machine = d.getVar('COMPATIBLE_MACHINE', 1)
         if need_machine:
@@ -388,7 +388,7 @@ python () {
             if this_machine and not re.match(need_machine, this_machine):
                 this_soc_family = d.getVar('SOC_FAMILY', 1)
                 if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
-                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
+                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
 
 
         dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', 1)
-- 
1.7.5.4



