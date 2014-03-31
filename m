Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C75886F770
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:48:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2014 02:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="503412355"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2014 02:48:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 12:51:21 +0300
Message-Id: <9e2ace2e2747ecda37004ea44d2e70de0586e185.1396259433.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1396259433.git.cristian.iorga@intel.com>
References: <cover.1396259433.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1396259433.git.cristian.iorga@intel.com>
References: <cover.1396259433.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 09:48:34 -0000

core-image-lsb only gave a warning:
"WARNING: Building libpam but 'pam' isn't in DISTRO_FEATURES,
PAM won't work correctly"
when the proper DISTRO was not set for it.
default choice would be DISTRO = "poky-lsb",
but not necessarily, depending on each custom distro.

This fix will enforce the proper usage of pam
as a distro feature for core-image-lsb by giving
an error instead of just a warning.

Fixes [YOCTO #6073]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/images/core-image-lsb.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index ed316a6..ab61c6e 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -9,4 +9,6 @@ IMAGE_INSTALL = "\
     packagegroup-core-lsb \
     "
 
-inherit core-image
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "pam"
-- 
1.8.3.2


