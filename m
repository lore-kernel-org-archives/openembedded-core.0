Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 06/14] dropbear: Fix CVE-2020-36254
Date: Wed, 22 Dec 2021 04:12:19 -1000
Message-Id: <10712b736d7cbde897c5aab30e969c04740dce34.1640181998.git.steve@sakoman.com>
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Ernst Sjöstrand <ernst.sjostrand@verisure.com>

Dropbear shares a lot of code with other SSH implementations, so this is
a port of CVE-2018-20685 to dropbear by the dropbear developers.

Reference:
https://github.com/mkj/dropbear/commit/8f8a3dff705fad774a10864a2e3dbcfa9779ceff

CVE: CVE-2020-36254
Upstream-Status: Backport

Signed-off-by: Ernst Sjöstrand <ernst.sjostrand@verisure.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |  4 ++-
 .../dropbear/dropbear/CVE-2020-36254.patch    | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index d41e8b36dc..b949a9a337 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -22,7 +22,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.socket \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
+           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
+           file://CVE-2020-36254.patch \
+           "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch b/meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch
new file mode 100644
index 0000000000..64d0d96486
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch
@@ -0,0 +1,29 @@
+From c96c48d62aefc372f2105293ddf8cff2d116dc3a Mon Sep 17 00:00:00 2001
+From: Haelwenn Monnier <contact+github.com@hacktivis.me>
+Date: Mon, 25 May 2020 14:54:29 +0200
+Subject: [PATCH] scp.c: Port OpenSSH CVE-2018-20685 fix (#80)
+
+Reference:
+https://github.com/mkj/dropbear/commit/8f8a3dff705fad774a10864a2e3dbcfa9779ceff
+
+CVE: CVE-2020-36254
+Upstream-Status: Backport
+
+---
+ scp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scp.c b/scp.c
+index 742ae00..7b8e7d2 100644
+--- a/scp.c
++++ b/scp.c
+@@ -935,7 +935,8 @@ sink(int argc, char **argv)
+ 			size = size * 10 + (*cp++ - '0');
+ 		if (*cp++ != ' ')
+ 			SCREWUP("size not delimited");
+-		if ((strchr(cp, '/') != NULL) || (strcmp(cp, "..") == 0)) {
++		if (*cp == '\0' || strchr(cp, '/') != NULL ||
++		    strcmp(cp, ".") == 0 || strcmp(cp, "..") == 0) {
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
-- 
2.25.1

