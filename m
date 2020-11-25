Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.6635.1606311051089131960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MIq57JL8;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=5512; q=dns/txt; s=axis-central1;
  t=1606311057; x=1637847057;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EsfjkWOP/rTXQ8DzX7zPPY7rMPqHWGI3OB9Qu75RVsY=;
  b=MIq57JL8yTldYQv3bK9c5rUm3AAiTawd9P+yxlu/mUukP1yHu6R0xF96
   FSsq+eCXkRQJfiR46asmXQfOfPEA8vs+FQwSbP077l9CbgSLtLAursGZJ
   3cRU7YvspFv5jwMqoXxIwEvPFn7WbyLQr7rYEotTv284TQdpWh/w08qcx
   io6Qjms740SGigufEc96c3R5WnYdj/MsQxQUeLXOH6D3Ql8QBSdcfoe2s
   tpvYGnlP3X/ZadZ6Ydps0AKNM5F0r9aCPTCCrg+X3tn8RCHWCUm75qA7f
   g1L+G/x16sM+E5EEOpWw4BgZ4XINug80WasK6uLB7QZfU07+8ooNLVqz8
   A==;
IronPort-SDR: 72d8PshD48qVPit96OdoeA/Jfj0xRO706JBMP6VkWJaMN2sOTXh5624lTLw8Phbc5tnxjBc4m3
 coiX5XGeFDZNXwsdB3Mr88k41ApFRu9P5sYIwNcsOfjSwVS2WNvlgWprVa/CWEA9CgUMGmvXsu
 624isxhKc10ukT32cTrbwCi/zvIk8eUeafv4AZV7jK1nmShdFunYAUp481fnA7n7Y+usjeZ/HL
 eZu0N0c+onFMM+YNbl/8UJVHGTqXrVwJW3cg/O6Drriaf8hwpP5gjE7WgHKDwvGZY+39H95mWW
 J/U=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="14881539"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] pseudo: Simplify pseudo_client_ignore_path_chroot()
Date: Wed, 25 Nov 2020 14:30:37 +0100
Message-ID: <dc076eec080ae9dd901ed4387b1a20239f7594ce.1606310940.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606310940.git.pkj@axis.com>
References: <cover.1606310940.git.pkj@axis.com>
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
