Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1RLMb8-0005Bm-IA
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 23:14:22 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id 3B7CA79901A; Tue,  1 Nov 2011 23:08:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-071-255-078.pools.arcor-ip.net
	[88.71.255.78]) by gravedo.de (Postfix) with ESMTPSA id 902A7799011;
	Tue,  1 Nov 2011 23:08:15 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 23:08:10 +0100
Message-Id: <1320185290-18117-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] meta: glib-2.0: don't apply qsort_r test removable patch for native version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 22:14:22 -0000

On some buildhosts with an older version of native glib-2.0 installed (in this case
2.16.6) the qsort_r test removable patch leads to a compilation error:

| ./.libs/libglib-2.0.so: undefined reference to `qsort_r'
| collect2: ld returned 1 exit status

This patch fixes this so the patch gets only applied for the native version of this
recipe.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
index 566355d..0efce40 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r2"
+PR = "r3"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -9,11 +9,14 @@ DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nat
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
+QSORT_PATCH = "file://remove.test.for.qsort_r.patch"
+QSORT_PATCH_virtclass-native = ""
+
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
-           file://remove.test.for.qsort_r.patch \
+           ${QSORT_PATCH} \
           "
 SRC_URI[md5sum] = "fee101d9d7daa8ddfbae00325f307f3b"
 SRC_URI[sha256sum] = "ca9c731017ab370859e847f8b70079bc6dcf389dc0ccb0d0419925aff81b9687"
-- 
1.7.5.4



