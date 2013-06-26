Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEFBC6A8EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:30:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q2UqJr013084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:30:53 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 19:30:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 10:30:48 +0800
Message-ID: <a1060761efe1f7eb6f02d12848c2b89c685f07e1.1372212772.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372212772.git.hongxu.jia@windriver.com>
References: <cover.1372212772.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libx11: move xcms enabling to PACKAGECONFIG for LSB Library Check
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
X-List-Received-Date: Wed, 26 Jun 2013 02:30:51 -0000
Content-Type: text/plain

When --disable-xcms is used, the LSB 4.1 Library Check will fail:
...
Checking library symbols (libX11.so.6)
Did not find XcmsAddColorSpace (unversioned) in libX11.so.6
Did not find XcmsAddFunctionSet (unversioned) in libX11.so.6
Did not find XcmsAllocColor (unversioned) in libX11.so.6
...

[YOCTO #4016]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index e0fce3e..c9506b0 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -25,10 +25,9 @@ DEPENDS += "xproto-native"
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
 EXTRA_OEMAKE += 'CWARNFLAGS=""'
 
-# Let people with incredibly archaic requirements enable Xcms, but disable it by
-# default.
+# LSB 4.1 Library Check requires enable Xcms, set enable as default.
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
+PACKAGECONFIG[xcms] = "--enable-xcms"
 
 # src/util/makekeys is built natively but needs -D_GNU_SOURCE defined.
 CPPFLAGS_FOR_BUILD += "-D_GNU_SOURCE"
-- 
1.8.1.2


