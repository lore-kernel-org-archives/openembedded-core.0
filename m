Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 613BB7169F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 16:42:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2015 09:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,366,1427785200"; d="scan'208";a="566012487"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2015 09:42:52 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 09:43:00 +0000
Message-Id: <f0998ca770393ec8de5dbf0af7e46ee6500ed529.1430732245.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1430732245.git.alejandro.hernandez@linux.intel.com>
References: <cover.1430732245.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/2] python3-native: Disable pip on native builds to fix Autobuilder issues
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
X-List-Received-Date: Mon, 04 May 2015 16:42:58 -0000

As Python-3.4 pip is required and installed by default, pips installation
is bootstrapped using python wheels, this makes it complicated to patch
and causes errors on the Autobuilders, since we don't need pip for
python3-native, this disables it fixing the issues.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python3-native_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.4.2.bb b/meta/recipes-devtools/python/python3-native_3.4.2.bb
index 37399be..463957f 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.2.bb
@@ -42,7 +42,7 @@ inherit native
 
 RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native"
 
-EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
 
 EXTRA_OEMAKE = '\
   BUILD_SYS="" \
-- 
1.8.4.5


