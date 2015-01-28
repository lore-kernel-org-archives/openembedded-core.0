Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB107147D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:55:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="518910001"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2015 03:47:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:54:40 +0000
Message-Id: <3d9a37c9d21038fa219f3e6d6419b50fae2c088e.1422445957.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] classes/image: drop unused default of MACHINE_POSTPROCESS_COMMAND
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
X-List-Received-Date: Wed, 28 Jan 2015 11:55:08 -0000

In the daisy (1.6) timeframe, when we rewrote the image construction in
Python, we neglected to reimplement the support for the little used and
undocumented variable MACHINE_POSTPROCESS_COMMAND, and apparently nobody
noticed. We have a better method for implementing machine-specific image
formats that is in wider use (i.e. add a custom class which implements
the new image type, add the class to IMAGE_CLASSES and the type to
IMAGE_FSTYPES), and we now also have wic. Thus it makes more sense to
just call this variable unsupported now and drop the sole remaining
reference to it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 22b6970..6bd3e03 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -156,7 +156,6 @@ IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
-MACHINE_POSTPROCESS_COMMAND ?= ""
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
 # Enable postinst logging if debug-tweaks is enabled
-- 
1.9.3


