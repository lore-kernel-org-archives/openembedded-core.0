Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qz5dw-0005zd-2x
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 13:41:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2011 04:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,313,1312182000"; d="scan'208";a="47509940"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.57])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2011 04:36:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2011 12:36:12 +0100
Message-Id: <ff51425aa7ce3a4fd4f9329ff1df5e47774f56e0.1314876902.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314876902.git.paul.eggleton@linux.intel.com>
References: <cover.1314876902.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314876902.git.paul.eggleton@linux.intel.com>
References: <cover.1314876902.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS
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
X-List-Received-Date: Thu, 01 Sep 2011 11:41:12 -0000

This variable should be split with \n sequences and these need to be
specified literally in the string. A corrected version of the example
given in the original commit (OE-core rev
75e3875341ddc8940e9ee2ccbbb2ec18194a68e6):

SANITY_TESTED_DISTROS = " \
        Ubuntu 11.04 \n \
        Fedora release 14 (Laughlin) \n \
        "

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 37b9028..44b0688 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -149,7 +149,7 @@ def check_supported_distro(e):
                 finally:
                     f.close()
     if distro:
-        if distro not in [x.strip() for x in tested_distros.split('\n')]:
+        if distro not in [x.strip() for x in tested_distros.split('\\n')]:
             bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
     else:
         bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
-- 
1.7.4.1



