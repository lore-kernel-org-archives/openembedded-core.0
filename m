Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD6571332
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 05:53:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s825ri7O023958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 22:53:44 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 22:53:43 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 01:53:40 -0400
Message-ID: <4dc6be8debd10bb01e319cbe11726e19815a48ae.1409628729.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409628729.git.wenzong.fan@windriver.com>
References: <cover.1409628729.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pango / ptest: clean CFLAGS for host binary
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
X-List-Received-Date: Tue, 02 Sep 2014 05:53:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The binary gen-all-unicode needs to be compiled for the host
architecture, the CFLAGS passed to target system could cause
build issues for it.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-graphics/pango/pango.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 1ad46a3..b59d33d 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -67,7 +67,7 @@ fi
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
 do_compile_prepend () {
 	if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
-		make CC="${BUILD_CC}" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
+		make CC="${BUILD_CC}" CFLAGS="" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
 	fi
 }
 
-- 
1.7.9.5


