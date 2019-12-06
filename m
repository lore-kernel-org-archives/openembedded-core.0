Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id D2B9F7FA14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 19:52:24 +0000 (UTC)
IronPort-SDR: WAxn1WpbXCoTqxizQ4LkHiPGSRK2XdscV1tg/gX6dB4/y3lYISpIvKmiyVfbYqFyA+/yRN61qp
	jBYoahgDncYuqEHGQOmumG3XHsTa9Q80auY2ziI7IztbYWwA6nEGXKbB3nG3u7S2CH5VwBPhoH
	6qxZXh1OssrPiVEHDZccitx/rbGNGEP6NEE5flLq1pUrk6bHkhugGdHMOrJUCDkfCT3jP5F477
	sAOiMTlNZFvGXulXzFC7pG0soBjHQEmUOTpxlrmqcUMK7t3Qm+JdHupoX7MyGnaXDYrWxJIQYM
	8rU=
X-IronPort-AV: E=Sophos;i="5.69,285,1571695200"; 
   d="scan'208";a="3346807"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 20:52:21 +0100
Message-Id: <20191206195221.17915-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [zeus][PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Fri, 06 Dec 2019 19:52:25 -0000
Content-Transfer-Encoding: 8bit

From: Mattias Hansson <mattias.hansson@axis.com>

do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
which sometimes causes a build error when building a recipe that adds
groups.

This issue only occurs when executing do_prepare_recipe_sysroot for a
recipe that adds groups before finishing a task that depends on pseudo
for a recipe that doesn't add groups.

Signed-off-by: Mattias Hansson <mattihn@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d3184ecf7b..1cea3a2213 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -482,6 +482,7 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_unpack', 'umask', '022')
         d.setVarFlag('do_configure', 'umask', '022')
         d.setVarFlag('do_compile', 'umask', '022')
-- 
2.21.0


