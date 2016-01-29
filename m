Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 290E477202
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:36:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0THa9DQ023698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 29 Jan 2016 09:36:09 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 09:36:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jan 2016 12:35:56 -0500
Message-ID: <e67782d1bcf15c45bbd5f96eab4bd26fbf1e1468.1454088695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454088695.git.hongxu.jia@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] mkelfimage: fix target cflags leaks to host
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
X-List-Received-Date: Fri, 29 Jan 2016 17:36:10 -0000
Content-Type: text/plain

The patch fix-makefile-to-find-libz.patch fixed native
compile failure; for target compile, it incorrectly
leaks CFLAGS to HOST_CFLAGS.

[YOCTO #3547]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index e1c33a6..92435cd 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -14,8 +14,10 @@ DEPENDS += "zlib"
 
 SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
            file://cross-compile.patch   \
-           file://fix-makefile-to-find-libz.patch   \
           "
+SRC_URI_append_class-native = " \
+           file://fix-makefile-to-find-libz.patch   \
+"
 
 CLEANBROKEN = "1"
 
-- 
1.9.1


