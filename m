Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.6953.1606312098313518383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PZ8LkwuN;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=5512; q=dns/txt; s=axis-central1;
  t=1606312100; x=1637848100;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EsfjkWOP/rTXQ8DzX7zPPY7rMPqHWGI3OB9Qu75RVsY=;
  b=PZ8LkwuNAiomK1yGwQRhjnZcy8eMfQgXiB+cpAXkKrQ2BRNA6lPr2Zj9
   5oOd+XnmN2wg+inkv3OU0Gzn69vpzAJE80OG6L00RgXnNHO1ani1HcDmL
   DE9vN7WW+m8DixpxlAPn2yjF1vaf5KTvDxJkkv8QJC7bvEqpba0BDZ8rN
   aaCwLDq/vmjN1qH6JaBMt3DWU147rfzn8eR+5MRaiLezRk4OX/NHymvr7
   I2LgEfDgtX8rPW7HB0ttNboyfqa7LktSSx5HszRZkh3x1aEnmPAdAch4S
   Zb4prO3OhCTRrBhFOlvvA8CjXUtKiGSkwX6o2T1lhQwb7EYtfMyqm7YjB
   Q==;
IronPort-SDR: dyuD6Vhw/hwwh7Q9fZvJyw9bEmACzw7GUIYlY1ONGGWQAAJq0bfBXWA1QGC/Ma3/VHkcWy/Cjf
 T95gGnhnYhUd6Xg34hatpVbv23F+Sje+8kPHQNTqvknTNbRIVG8Y4NZn275uljmXmVnkbN8YtW
 5g6y/iD8joQadYvP4DAUs0SJEQ0LjKUciNZVWuPb9CXf2A7sYYisKCpklqL/mBMNhYT6ej/Qne
 m8ZUTDxwHNN3JK/k6s1NPfTBvuiEfw+No6ZPGHN0s15b+BXbqMVsdmjWQW7v2g2Nvv+xl3x/2z
 5Rs=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="15422711"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/4] pseudo: Simplify pseudo_client_ignore_path_chroot()
Date: Wed, 25 Nov 2020 14:48:10 +0100
Message-ID: <dc076eec080ae9dd901ed4387b1a20239f7594ce.1606312002.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606312002.git.pkj@axis.com>
References: <cover.1606312002.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This also plugs a memory leak in pseudo_client_ignore_path_chroot().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 +++++++++++++++++++
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

diff --git a/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch b/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
new file mode 100644
index 0000000000..e4a5356f5c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
@@ -0,0 +1,69 @@
+From 28c760542eecd7c5b35ea88aa2b14d62afbda961 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sat, 21 Nov 2020 17:22:38 +0100
+Subject: [PATCH] pseudo_client: Lessen indentation of
+ pseudo_client_ignore_path_chroot()
+
+Change-Id: I739b18efb7a95ce2d2d907d0faf7df539ab9af1c
+---
+ pseudo_client.c | 45 +++++++++++++++++++++++++--------------------
+ 1 file changed, 25 insertions(+), 20 deletions(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 116d926..a8bc3dc 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1527,28 +1527,33 @@ int pseudo_client_ignore_fd(int fd) {
+ 
+ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
+ 	char *env;
+-	if (path) {
+-		if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
+-			return 0;
+-		env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
+-		if (env) {
+-			char *p = env;
+-        	        while (*p) {
+-				char *next = strchr(p, ',');
+-				if (!next)
+-				    next = strchr(p, '\0');
+-				if ((next - p) && !strncmp(path, p, next - p)) {
+-		 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
+-					return 1;
+-				}
+-				if (next && *next != '\0')
+-					p = next+1;
+-				else
+-					break;
+-			}
+-			free(env);
++
++	if (!path)
++		return 0;
++
++	if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
++		return 0;
++
++	env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
++	if (!env)
++		return 0;
++
++	char *p = env;
++	while (*p) {
++		char *next = strchr(p, ',');
++		if (!next)
++			next = strchr(p, '\0');
++		if ((next - p) && !strncmp(path, p, next - p)) {
++ 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
++			return 1;
+ 		}
++		if (next && *next != '\0')
++			p = next+1;
++		else
++			break;
+ 	}
++	free(env);
++
+ 	return 0;
+ }
+ 
diff --git a/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch b/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch
new file mode 100644
index 0000000000..be3ab25bd3
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch
@@ -0,0 +1,50 @@
+From a1d61d68777373a50ae23b9dd83b428abe2f748d Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sat, 21 Nov 2020 17:30:33 +0100
+Subject: [PATCH] pseudo_client: Simplify pseudo_client_ignore_path_chroot()
+
+This also plugs a memory leak by making sure env is freed.
+
+Change-Id: Ia8635fd2c6b1e85919e4743713a85e0b52c28fac
+---
+ pseudo_client.c | 21 ++++++++++-----------
+ 1 file changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index a8bc3dc..7dc0345 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1538,23 +1538,22 @@ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
+ 	if (!env)
+ 		return 0;
+ 
++	int ret = 0;
+ 	char *p = env;
+-	while (*p) {
++	while (p) {
+ 		char *next = strchr(p, ',');
+-		if (!next)
+-			next = strchr(p, '\0');
+-		if ((next - p) && !strncmp(path, p, next - p)) {
+- 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
+-			return 1;
+-		}
+-		if (next && *next != '\0')
+-			p = next+1;
+-		else
++		if (next)
++			*next++ = '\0';
++		if (!strncmp(path, p, strlen(p))) {
++			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
++			ret = 1;
+ 			break;
++		}
++		p = next;
+ 	}
+ 	free(env);
+ 
+-	return 0;
++	return ret;
+ }
+ 
+ int pseudo_client_ignore_path(const char *path) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2e13fec540..50933c4bc1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,6 +4,8 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
+           file://0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch \
+           file://0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch \
            "
 
 SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
