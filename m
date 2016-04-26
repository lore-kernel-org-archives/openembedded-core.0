Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8679E6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:04:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3Q64d4l030865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:04:39 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 23:04:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 23:04:37 -0700
Message-ID: <c53c41d6a33a354b8030e5a4b325aeb2753e9258.1461650616.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461650616.git.liezhi.yang@windriver.com>
References: <cover.1461650616.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: fix for native and nativesdk
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
X-List-Received-Date: Tue, 26 Apr 2016 06:04:39 -0000
Content-Type: text/plain

From: Dengke Du <dengke.du@windriver.com>

The do_install_append is used for moving/renaming for ALTERNATIVE, but
it breaks native, for example there is no ln, but ln.coreutils, that
makes coreutils-native don't work. This patch fixes the problem.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.25.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index 419a693..77b3862 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -70,6 +70,11 @@ do_compile_prepend () {
 }
 
 do_install_append() {
+	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
+		rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
+		return
+	fi
+
 	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
@@ -91,11 +96,6 @@ do_install_append() {
 	cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
 }
 
-do_install_append_class-native(){
-	# remove groups to fix conflict with shadow-native
-	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
-}
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.7.4


