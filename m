Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 852F27704E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:04:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7IH4MM3032186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:04:22 -0700
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 10:04:21 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 12:04:16 -0500
Message-ID: <ac8bfa5987396bae636ebb152128755967d3ce83.1471539779.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1471539779.git.mark.hatle@windriver.com>
References: <cover.1471539779.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] local.conf.sample: Disable ARM and PPC due to prelink test case failures
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
X-List-Received-Date: Thu, 18 Aug 2016 17:04:22 -0000
Content-Type: text/plain

Internal prelink test cases reloc8 and reloc9 are failing on both ARM
and PPC systems.  Disable them by removing the prelink from the
IMAGE_CLASSES setting.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/local.conf.sample | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 2949ffb..8879a08 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -132,6 +132,15 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 # image-prelink disabled for now due to issues with IFUNC symbol relocation
 USER_CLASSES ?= "buildstats image-mklibs"
 
+# Prelinker tests are currently failing on ARM and PPC.  Prevent us from
+# running on those architectures until the failure is explained.
+USER_CLASSES_remove_arm = 'image-prelink'
+USER_CLASSES_remove_armeb = 'image-prelink'
+USER_CLASSES_remove_aarch64 = 'image-prelink'
+USER_CLASSES_remove_aarch64eb = 'image-prelink'
+USER_CLASSES_remove_powerpc = 'image-prelink'
+USER_CLASSES_remove_powerpc64 = 'image-prelink'
+
 
 #
 # Runtime testing of images
-- 
2.5.5


