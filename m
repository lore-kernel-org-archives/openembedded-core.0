Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65F67770D8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 01:44:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7K1ixSa006137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:44:59 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Aug 2016 18:44:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 20:44:55 -0500
Message-ID: <85cd78ac597d899f59766e7edcbcb8b62e18c182.1471657381.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1471657381.git.mark.hatle@windriver.com>
References: <cover.1471657381.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Revert "local.conf.sample: Disable ARM and PPC due to prelink test case failures"
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
X-List-Received-Date: Sat, 20 Aug 2016 01:44:59 -0000
Content-Type: text/plain

This reverts commit d3e5c1d17f80b3dd7a6d85e07b5c0c516f09ae93.

The problem is not in prelink, but in binutils.  Any programs compiled with
the option will be broken and prelink will not make it worse.

See Yocto Project bug 10168 for more information.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/local.conf.sample | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index b35db51..85c5e21 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -131,15 +131,6 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
 USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
-# Prelinker tests are currently failing on ARM and PPC.  Prevent us from
-# running on those architectures until the failure is explained.
-USER_CLASSES_remove_arm = 'image-prelink'
-USER_CLASSES_remove_armeb = 'image-prelink'
-USER_CLASSES_remove_aarch64 = 'image-prelink'
-USER_CLASSES_remove_aarch64eb = 'image-prelink'
-USER_CLASSES_remove_powerpc = 'image-prelink'
-USER_CLASSES_remove_powerpc64 = 'image-prelink'
-
 
 #
 # Runtime testing of images
-- 
2.5.5


