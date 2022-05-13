X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH v2 1/3] npm.bbclass: Fix file permissions before opening it for writing
Date: Fri, 13 May 2022 17:30:29 +0200
Message-Id: <20220513153031.1032716-1-zboszor@pr.hu>
In-Reply-To: <16EEAE47FC3C363C.27599@lists.openembedded.org>
References: <16EEAE47FC3C363C.27599@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Some node module archives in npmjs.org contain wrong permissions.
I found a case with package.json in the archive being r-xr-xr-x
for which open(..., "w") fails. Modify the manifest file permissions
to add the write bit for the owner.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/npm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index ba50fcac20..86ee0f665a 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -81,6 +81,7 @@ python npm_do_configure() {
     import json
     import re
     import shlex
+    import stat
     import tempfile
     from bb.fetch2.npm import NpmEnvironment
     from bb.fetch2.npm import npm_unpack
@@ -202,6 +203,7 @@ python npm_do_configure() {
         if has_shrinkwrap_file:
             _update_manifest("devDependencies")
 
+    os.chmod(cached_manifest_file, os.stat(cached_manifest_file).st_mode | stat.S_IWUSR)
     with open(cached_manifest_file, "w") as f:
         json.dump(cached_manifest, f, indent=2)
 
-- 
2.36.1

