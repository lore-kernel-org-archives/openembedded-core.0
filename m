Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id D2DED7D265
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 15:39:32 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 70903102EF1;
	Fri, 26 Jul 2019 15:39:33 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 17:39:27 +0200
Message-Id: <20190726153927.14245-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] itstool: Use python3 binary fom PATH instead of /usr/bin/python3
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
X-List-Received-Date: Fri, 26 Jul 2019 15:39:33 -0000
Content-Transfer-Encoding: 8bit

Although /usr/bin/python3 works fine for class-target builds its not
really what we want for class-native. The host system might not even
have python3 installed. The native itstool version should use pythn3
provided in recipe-sysroot-native. To accomplish it modify the default
shebang to use /usr/bin/env. This works as expected for both native and
target builds.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
index a0af44a71..f21e7f39b 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
 
 do_install_append() {
     # fix shebang of main script
-    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
+    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/env -S ${PYTHON_PN} -s:' ${D}${bindir}/itstool
 }
 
 BBCLASSEXTEND = "native"
-- 
2.21.0


