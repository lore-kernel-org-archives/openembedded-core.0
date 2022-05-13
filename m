X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH 2/2] staging.bbclass: Ignore installing multiple symlinks of the same name
Date: Fri, 13 May 2022 15:48:29 +0200
Message-Id: <20220513134829.1895574-3-zboszor@pr.hu>
In-Reply-To: <20220513134829.1895574-1-zboszor@pr.hu>
References: <20220513134829.1895574-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Recipes using "inherit npm" install the same /usr/lib/node symlink
that points to node_modules. When a recipe DEPENDS on multiple
npm based recipe, do_prepare_recipe_sysroot() fails.

Ignore this symlink in a way that the set of ignored symlinks
can be extended later if needed.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/staging.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9fc8f4f283..f7b6056219 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -528,6 +528,7 @@ python extend_recipe_sysroot() {
 
             with open(manifest, "r") as f:
                 manifests[dep] = manifest
+                ignored_dests = [ ''.join([d.getVar('nonarch_libdir'), '/node' ]) ]
                 for l in f:
                     l = l.strip()
                     if l.endswith("/fixmepath"):
@@ -545,7 +546,10 @@ python extend_recipe_sysroot() {
                     hashname = targetdir + dest
                     if not hashname.endswith("/"):
                         if hashname in fileset:
-                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
+                            if os.path.islink(hashname) and  dest in ignored_dests:
+                                bb.note("The symlink '%s' %s wants to install is already installed by %s, ignoring" % (dest, c, fileset[hashname]))
+                            else:
+                                bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
                         else:
                             fileset[hashname] = c
 
-- 
2.36.1

