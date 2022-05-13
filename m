X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH v2 2/3] npm.bbclass: Don't create /usr/lib/node symlink
Date: Fri, 13 May 2022 17:30:30 +0200
Message-Id: <20220513153031.1032716-2-zboszor@pr.hu>
In-Reply-To: <20220513153031.1032716-1-zboszor@pr.hu>
References: <16EEAE47FC3C363C.27599@lists.openembedded.org>
 <20220513153031.1032716-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

When a recipe DEPENDS on multiple other npm based recipes,
the symlink will create a conflict.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/npm.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 86ee0f665a..dbfc2e728e 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -307,10 +307,6 @@ npm_do_install() {
     # Remove the shrinkwrap file which does not need to be packed
     rm -f ${D}/${nonarch_libdir}/node_modules/*/npm-shrinkwrap.json
     rm -f ${D}/${nonarch_libdir}/node_modules/@*/*/npm-shrinkwrap.json
-
-    # node(1) is using /usr/lib/node as default include directory and npm(1) is
-    # using /usr/lib/node_modules as install directory. Let's make both happy.
-    ln -fs node_modules ${D}/${nonarch_libdir}/node
 }
 
 FILES:${PN} += " \
-- 
2.36.1

