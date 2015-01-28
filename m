Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6226872D98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:55:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="518910016"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2015 03:47:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:54:42 +0000
Message-Id: <2b49a3fd0f9574e1cd924e719ef9606c7a3c3532.1422445957.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] classes/image: skip recipe on invalid IMAGE_FEATURES item
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

If you add an item to EXTRA_IMAGE_FEATURES in your local.conf that is
not supported by image.bbclass itself (such as "tools-sdk" which is
implemented in core-image.bbclass), it can be somewhat annoying to have
the parse fall over if you have a recipe that inherits image.bbclass
only. Change the error from bb.fatal to skip the recipe instead so that
you only see the error when attempting to build the recipe, plus add a
bit of logic to report if the feature is coming in via
EXTRA_IMAGE_FEATURES.

Fixes [YOCTO #5023].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6bd3e03..62b214a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -52,7 +52,10 @@ def check_image_features(d):
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
     for feature in features:
         if feature not in valid_features:
-            bb.fatal("'%s' in IMAGE_FEATURES is not a valid image feature. Valid features: %s" % (feature, ' '.join(valid_features)))
+            if bb.utils.contains('EXTRA_IMAGE_FEATURES', feature, True, False, d):
+                raise bb.parse.SkipRecipe("'%s' in IMAGE_FEATURES (added via EXTRA_IMAGE_FEATURES) is not a valid image feature. Valid features: %s" % (feature, ' '.join(valid_features)))
+            else:
+                raise bb.parse.SkipRecipe("'%s' in IMAGE_FEATURES is not a valid image feature. Valid features: %s" % (feature, ' '.join(valid_features)))
 
 IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
-- 
1.9.3


