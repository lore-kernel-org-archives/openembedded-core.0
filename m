Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 99AA171C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 08:23:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 01:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="963809417"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 03 May 2017 01:23:38 -0700
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 16:23:48 +0800
Message-Id: <1493799829-96908-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: saul.wold@intel.com
Subject: [PATCH] ghostscript: fix warnings when building for arduino-101-sss
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
X-List-Received-Date: Wed, 03 May 2017 08:23:40 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Hi,

The following warning occurs when building zephyr with arduino-101-sss.

WARNING: /srv/sdc/builds/11319/meta/recipes-extended/ghostscript/ghostscript_9.20.bb: Unable to get checksum for ghostscript SRC_URI entry objarch.h: file could not be found

This can be reproduced with meta-zephyr and MACHINE=arduino-101-sss,
it also needs a clean tmp, because the warning comes during initial parse.

This is due to the the TARGET_ARCH = "arc" for meta-zephyr is not
supported by ghostscript and causing bitbake unable to locate the
correct config file during recipe parse.

Adding an anonymous python checker in recipe to raise a SkipRecipe
exception if it is not one of the supported architectures.

Thanks and regards,
Rebecca

Chang Rebecca Swee Fun (1):
  ghostscript: check for incompatible TARGET_ARCH

 meta/recipes-extended/ghostscript/ghostscript_9.20.bb | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.7.4


