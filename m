Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3E260D67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 14:55:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 20 Dec 2013 06:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,521,1384329600"; d="scan'208";a="447624108"
Received: from dsgunati-mobl.gar.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2013 06:55:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 14:55:09 +0000
Message-Id: <fd91c58db8679625f36a186bc40c16fd1d2a3a1d.1387551254.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387551254.git.paul.eggleton@linux.intel.com>
References: <cover.1387551254.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1387551254.git.paul.eggleton@linux.intel.com>
References: <cover.1387551254.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] libav: add libpostproc to PROVIDES (for 0.8.x version only)
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
X-List-Received-Date: Fri, 20 Dec 2013 14:55:25 -0000

There is a separate libpostproc recipe in meta-oe for use with 9.x and
later versions of libav for those few that need libpostproc; however if
you just add meta-oe and try to build libpostproc without selecting the
libav 9.x version recipe, you'll be building the libpostproc recipe
together with libav 0.8.x, which provides its own libpostproc; this
leads to confusing errors at packaging time. In order to flag up that
these conflict more appropriately, add libpostproc to PROVIDES
explicitly so that you at least get a multiple providers error at the
start of the build.

Fixes [YOCTO #5335].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/libav/libav_0.8.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libav/libav_0.8.9.bb b/meta/recipes-multimedia/libav/libav_0.8.9.bb
index ce8b1ef..7c807e8 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.9.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.9.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
+PROVIDES += "libpostproc"
+
 EXTRA_OECONF += " \
     --enable-postproc \
 "
-- 
1.8.1.2


