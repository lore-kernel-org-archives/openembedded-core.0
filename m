Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D11F60761
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 09:02:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T92Fc3005346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 02:02:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Sep 2016 02:02:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2016 02:02:12 -0700
Message-ID: <b1a11a1060394d0fb65c80eaeee5a64fbeae9811.1475139494.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1475139494.git.liezhi.yang@windriver.com>
References: <cover.1475139494.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] source-highlight: use with-boost-libdir
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
X-List-Received-Date: Thu, 29 Sep 2016 09:02:15 -0000
Content-Type: text/plain

Without with-boost-libdir, it checks lib64 libx32 lib lib64 in
sysroot/usr/ and set it as boost lib path if it exist, this is
unreliable when build with multilib.

Fixed when switch baselib from lib64 to lib, for example, when we build
qemux86-64 + multilib setting, the baselib is lib64, and when disable
multilib, it would be lib, then we may see the error when
do_configure since lib64 may exist during build source-highlight:

configure: error: Could not find a version of the Boost::Regex library!

Steps to reproduce:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake world

Then:
MACHINE = "qemux86-64"
$ bitbake source-highlight

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/source-highlight/source-highlight_3.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
index 37d2fa9..c6203df 100644
--- a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
+++ b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
@@ -15,7 +15,7 @@ DEPENDS_append = " boost"
 
 DEPENDS_append_class-target = " source-highlight-native"
 
-EXTRA_OECONF = "--with-boost=${PKG_CONFIG_SYSROOT_DIR}/${prefix}"
+EXTRA_OECONF = "--with-boost=yes --with-boost-libdir=${PKG_CONFIG_SYSROOT_DIR}${libdir}"
 
 BBCLASSEXTEND = "native"
 
-- 
2.9.0


