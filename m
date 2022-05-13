X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH 1/2] npm.bbclass: Fix file permissions before opening it for writing
Date: Fri, 13 May 2022 15:48:28 +0200
Message-Id: <20220513134829.1895574-2-zboszor@pr.hu>
In-Reply-To: <20220513134829.1895574-1-zboszor@pr.hu>
References: <20220513134829.1895574-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Some node module archives in npmjs.org contain wrong permissions.
I found a case with package.json in the archive being r-xr-xr-x
for which open(..., "w") fails. Set the manifest file permissions
to 0666 just in case.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/npm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index ba50fcac20..7f52ec6061 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -202,6 +202,7 @@ python npm_do_configure() {
         if has_shrinkwrap_file:
             _update_manifest("devDependencies")
 
+    os.chmod(cached_manifest_file, 0o666)
     with open(cached_manifest_file, "w") as f:
         json.dump(cached_manifest, f, indent=2)
 
-- 
2.36.1

