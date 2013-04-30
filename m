Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXE5E-00037S-0Q
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 19:11:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2013 09:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="295525203"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.98])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2013 09:53:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 17:52:58 +0100
Message-Id: <c4a83801dc67074b524dd33c56ba9eed819def6f.1367340369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
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
X-List-Received-Date: Tue, 30 Apr 2013 17:12:44 -0000
X-List-Received-Date: Tue, 30 Apr 2013 17:12:44 -0000

This is the first step in deprecating SERIAL_CONSOLE without affecting
machine configurations that still use it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 075f812..d5e923b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -745,6 +745,9 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 
+SERIAL_CONSOLE ??= ""
+SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
+
 # Make sure MACHINE isn't exported
 # (breaks binutils at least)
 MACHINE[unexport] = "1"
-- 
1.8.1.2



