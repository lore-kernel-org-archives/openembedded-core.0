Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2775271AC0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 06:54:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 23:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,313,1491289200"; d="scan'208";a="1166564383"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2017 23:54:55 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 14:54:51 +0800
Message-Id: <1494312891-27807-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494312891-27807-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1494312891-27807-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2] ghostscript: check for incompatible host
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
X-List-Received-Date: Tue, 09 May 2017 06:54:55 -0000

The following warning occurs when building with meta-zephyr
with MACHINE set to arduino-101-sss:

WARNING: /srv/sdc/builds/11319/meta/recipes-extended/ghostscript/ghostscript_9.20.bb: Unable to get checksum for ghostscript SRC_URI entry objarch.h: file could not be found

This is due to the the TARGET_ARCH = "arc" for meta-zephyr is not
supported by ghostscript and causing bitbake unable to locate the
correct config file during recipe parse.

Adding checker in the recipe to raise an exception if the target
architecture is "arc". This would then only display an error if
someone specifically tries to build the recipe:

ERROR: ghostscript was skipped: incompatible with host arc-yocto-elf (not in COMPATIBLE_HOST)

[YOCTO #11344]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index 3c8a2e6..c9e1d04 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -108,3 +108,6 @@ do_install_class-native () {
 }
 
 BBCLASSEXTEND = "native"
+
+# ghostscript does not supports "arc"
+COMPATIBLE_HOST = "^(?!arc).*"
-- 
2.7.4


