Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 64C07737AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:33:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A5FF86002AA
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 09:33:18 +0100
Message-Id: <60ee19f41687e06d43b491091a4e0cebfb09eb26.1434529133.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <cover.1434529133.git.joshua.lock@collabora.co.uk>
References: <cover.1434529133.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1434529133.git.joshua.lock@collabora.co.uk>
References: <cover.1434529133.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 1/1] distutils-common-base: add to, don't set, FILES_${PN}
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
X-List-Received-Date: Wed, 17 Jun 2015 08:33:27 -0000

If we set FILES_${PN} and a recipe inherits other classes that
modify FILES_${PN} *before* distutils-common-base is included, any
changes to FILES_${PN} made by those classes are lost.

Instead, append the additional directories we want to include in
FILES_${PN}

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/classes/distutils-common-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 9a608eb..427275b 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -7,7 +7,7 @@ export STAGING_LIBDIR
 
 PACKAGES = "${PN}-staticdev ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
 
-FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
+FILES_${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 FILES_${PN}-staticdev += "\
   ${PYTHON_SITEPACKAGES_DIR}/*.a \
-- 
2.1.0


