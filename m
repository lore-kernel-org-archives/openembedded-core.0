X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [meta-oe][PATCH v2 3/3] nodejs: Add /usr/lib/node -> node_modules symlink
Date: Fri, 13 May 2022 17:30:31 +0200
Message-Id: <20220513153031.1032716-3-zboszor@pr.hu>
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

While /usr/lib/node_modules and all npm-related modules are
shipped in the npm subpackage, keep the symlink in the main
package because 3rd party modules that don't need npm are
also installed into /usr/lib/node_modules.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
index 62188f94a..be68afd4c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
@@ -159,6 +159,10 @@ do_compile () {
 
 do_install () {
     oe_runmake install DESTDIR=${D}
+
+    # node(1) is using /usr/lib/node as default include directory and npm(1) is
+    # using /usr/lib/node_modules as install directory. Let's make both happy.
+    ln -fs node_modules ${D}/${nonarch_libdir}/node
 }
 
 BINARIES = " \
@@ -176,6 +180,7 @@ do_install:append:class-native() {
 }
 
 PACKAGES =+ "${PN}-npm"
+FILES:${PN} += "${nonarch_libdir}/node"
 FILES:${PN}-npm = "${nonarch_libdir}/node_modules ${bindir}/npm ${bindir}/npx"
 RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
     python3-misc python3-multiprocessing"
-- 
2.36.1

