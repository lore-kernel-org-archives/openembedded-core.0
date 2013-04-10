Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxRM-0006Jg-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 18:00:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2013 08:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="284331494"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2013 08:42:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:42:25 +0100
Message-Id: <d4302eaad7f35db943d35af87799b442ecc9b06b.1365608262.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365608262.git.paul.eggleton@linux.intel.com>
References: <cover.1365608262.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] rpm-postinsts: don't create broken postinst script
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
X-List-Received-Date: Wed, 10 Apr 2013 16:00:26 -0000

Not only was the variable reference in this line broken, but it wasn't
going to work anyway - we install the script directly into /etc/rcS.d
and not into /etc/init.d, so the code in update-rc.d.bbclass couldn't
find anything there. This resulted in a postinstall script for
rpm-postinsts being created in /etc/rpm-postinsts which can't work when
the root filesystem is read-only. To simplify things just remove the use
of update-rc.d.bbclass since we don't really need the added complexity
here.

Fixes [YOCTO #4222].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index 27ef2aa..0a62da0 100644
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -5,15 +5,12 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1
 
 RDEPENDS_${PN} = "base-files"
 
-inherit update-rc.d allarch
+inherit allarch
 #
 # Allow distributions to alter when [postponed] package install scripts are run
 #
 POSTINSTALL_INITPOSITION ?= "98"
 
-INITSCRIPT_NAME = "run-postinsts"
-INITSCRIPT_PARAMS = "start ${{POSTINSTALL_INITPOSITION} S ."
-
 POSTLOG ?= "/var/log/postinstall.log"
 REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
 
-- 
1.7.10.4



