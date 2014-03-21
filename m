Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B0C336FA52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 16:32:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2014 09:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="504920356"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.240])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2014 09:31:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 16:31:31 +0000
Message-Id: <d5a52f7e1877274915eccba65d6f603dadb7949e.1395419449.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395419449.git.paul.eggleton@linux.intel.com>
References: <cover.1395419449.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395419449.git.paul.eggleton@linux.intel.com>
References: <cover.1395419449.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/image: disable pam nullok_secure with debug-tweaks
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
X-List-Received-Date: Fri, 21 Mar 2014 16:32:45 -0000

If you want passwordless logins to work with pam enabled, then you can't
have "nullok_secure" enabled on pam_unix entries. Add some
postprocessing to change these to "nullok" when debug-tweaks is in
IMAGE_FEATURES, in order to make passwordless logins with PAM work
again.

Fixes [YOCTO #5973].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9a04288..3436624 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -298,6 +298,10 @@ ssh_allow_empty_password () {
 			printf '\nDROPBEAR_EXTRA_ARGS="-B"\n' >> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
 		fi
 	fi
+
+	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/pam.d ] ; then
+		sed -i 's/nullok_secure/nullok/' ${IMAGE_ROOTFS}${sysconfdir}/pam.d/*
+	fi
 }
 
 # Enable postinst logging if debug-tweaks is enabled
-- 
1.8.5.3


