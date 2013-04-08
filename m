Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UPDvq-0000fw-NU
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:24:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2013 08:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="291767423"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 08:06:45 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 18:06:40 +0300
Message-Id: <1365433601-24194-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365433601-24194-1-git-send-email-laurentiu.palcu@intel.com>
References: <1365433601-24194-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] image.bbclass: fix postinstall intercepts fallback
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
X-List-Received-Date: Mon, 08 Apr 2013 15:24:34 -0000

The wrong type of paranthesis was used so 'continue' did nothing (was in
another context) and the packages were marked as installed.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9721a6b..3cde0b8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -186,7 +186,7 @@ run_intercept_scriptlets () {
 			[ "$script" = "*" ] && break
 			[ "$script" = "postinst_intercept" ] || [ ! -x "$script" ] && continue
 			echo "> Executing $script"
-			./$script || (echo "WARNING: intercept script \"$script\" failed, falling back to running postinstalls at first boot" && continue)
+			./$script || { echo "WARNING: intercept script \"$script\" failed, falling back to running postinstalls at first boot" && continue; };
 			#
 			# If we got here, than the intercept was successful. Next, we must
 			# mark the postinstalls as "installed". For rpm is a little bit
-- 
1.7.9.5



