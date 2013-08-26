Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 11F3A6A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 00:40:16 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id c10so4145421ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 17:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=FknhuNDKByhdr8KHuB1Q4Ozz5UL1rHzjVyAIBT4s1vg=;
	b=dwMeHuGczjytFrKBxVvq6dRJ57YRZLAyieZXeXt2QSJ8PIeTroa3ukfjcLRAxOaV4H
	lcywGFYhT2qGHzTAUjxBvhBcpnwJLEWyjl1LlSrTL8KJscaxyBCyzI+3iQ7iDQwkpP4b
	Kb1Fj6powFlc4q7cIa/rivVk+i3js3XCEqEI5GvqCeDH2dVAov4zbh1fVDObt6VPE5IH
	W0OzKqqwCtSKB+iNmF7BSFepjN+mBSRrJ5rQUpvzR00SOVB4n0LfXntq1dlhG+MizWp0
	7QvWXkfooFRo6WcI5zvXZb1hmhrm8sjbLeyZ3KNZcNnxnBFmgsaknE1Q2+0SmYDGgOzx
	jwoA==
X-Received: by 10.50.136.200 with SMTP id qc8mr4854071igb.52.1377477616060;
	Sun, 25 Aug 2013 17:40:16 -0700 (PDT)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPSA id p7sm14574747iga.3.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 17:40:15 -0700 (PDT)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2013 19:40:06 -0500
Message-Id: <1377477606-17591-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] pseudo: fix memory leak and missed privilege drop
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
X-List-Received-Date: Mon, 26 Aug 2013 00:40:16 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

qemu.bbclass adds PSEUDO_UNLOAD=1 in qemu_run_binary to avoid reference to
pseudo functions that may not exist in the target environment.  This patch
detects the addition of that variable within the environment to which the
call applies, even if not present in the parent environment.

As a side effect it fixes a memory leak.

[YOCTO #4843]

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../0001-pseudo_has_unload-add-function.patch      |  190 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    7 +-
 2 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
new file mode 100644
index 0000000..b5c81c9
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
@@ -0,0 +1,190 @@
+From be97cb958f2934fa398fc8e344b25b84ebd4e90c Mon Sep 17 00:00:00 2001
+From: "Peter A. Bigot" <pab@pabigot.com>
+Date: Sun, 25 Aug 2013 19:22:09 -0500
+Subject: [PATCH] pseudo_has_unload: add function
+
+Various wrappers checked for a non-null pseudo_get_value("PSEUDO_UNLOAD") to
+determine whether the environment should include the pseudo variables.  None
+of those checks freed the returned value when it was not null.  The new
+check function does.
+
+The new check function also sees whether PSEUDO_UNLOAD was defined in the
+environment that should be used in the wrapped system call.  This allows
+pkg_postinst scripts to strip out the LD_PRELOAD setting, for example before
+invoking qemu to execute commands in an environment that does not have
+libpseudo.so.
+
+[YOCTO #4843]
+
+Upstream-Status: Pending
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+---
+ ports/common/guts/execv.c              |    2 +-
+ ports/common/guts/execve.c             |    2 +-
+ ports/common/guts/execvp.c             |    2 +-
+ ports/common/guts/fork.c               |    2 +-
+ ports/linux/newclone/pseudo_wrappers.c |    2 +-
+ ports/linux/oldclone/pseudo_wrappers.c |    2 +-
+ ports/unix/guts/popen.c                |    2 +-
+ ports/unix/guts/system.c               |    2 +-
+ pseudo.h                               |    1 +
+ pseudo_util.c                          |   27 +++++++++++++++++++++++++++
+ 10 files changed, 36 insertions(+), 8 deletions(-)
+
+diff --git a/ports/common/guts/execv.c b/ports/common/guts/execv.c
+index 763e1f9..3e1f820 100644
+--- a/ports/common/guts/execv.c
++++ b/ports/common/guts/execv.c
+@@ -19,7 +19,7 @@
+ 	}
+ 
+ 	pseudo_setupenv();
+-	if (pseudo_get_value("PSEUDO_UNLOAD"))
++	if (pseudo_has_unload(NULL))
+ 		pseudo_dropenv();
+ 
+ 	/* if exec() fails, we may end up taking signals unexpectedly...
+diff --git a/ports/common/guts/execve.c b/ports/common/guts/execve.c
+index a003657..ff6a44e 100644
+--- a/ports/common/guts/execve.c
++++ b/ports/common/guts/execve.c
+@@ -20,7 +20,7 @@
+         }
+ 
+ 	new_environ = pseudo_setupenvp(envp);
+-	if (pseudo_get_value("PSEUDO_UNLOAD"))
++	if (pseudo_has_unload(new_environ))
+ 		new_environ = pseudo_dropenvp(new_environ);
+ 
+ 	/* if exec() fails, we may end up taking signals unexpectedly...
+diff --git a/ports/common/guts/execvp.c b/ports/common/guts/execvp.c
+index 5e75be7..04253c3 100644
+--- a/ports/common/guts/execvp.c
++++ b/ports/common/guts/execvp.c
+@@ -20,7 +20,7 @@
+         }
+ 
+ 	pseudo_setupenv();
+-	if (pseudo_get_value("PSEUDO_UNLOAD"))
++	if (pseudo_has_unload(NULL))
+ 		pseudo_dropenv();
+ 
+ 	/* if exec() fails, we may end up taking signals unexpectedly...
+diff --git a/ports/common/guts/fork.c b/ports/common/guts/fork.c
+index df8abd7..bebe3b0 100644
+--- a/ports/common/guts/fork.c
++++ b/ports/common/guts/fork.c
+@@ -12,7 +12,7 @@
+ 	 */
+ 	if (rc == 0) {
+ 		pseudo_setupenv();
+-		if (!pseudo_get_value("PSEUDO_UNLOAD")) {
++		if (!pseudo_has_unload(NULL)) {
+ 			pseudo_reinit_libpseudo();
+ 		} else {
+ 			pseudo_dropenv();
+diff --git a/ports/linux/newclone/pseudo_wrappers.c b/ports/linux/newclone/pseudo_wrappers.c
+index 9dbac42..257e8bb 100644
+--- a/ports/linux/newclone/pseudo_wrappers.c
++++ b/ports/linux/newclone/pseudo_wrappers.c
+@@ -28,7 +28,7 @@ int wrap_clone_child(void *args) {
+ 
+ 	if (!(flags & CLONE_VM)) {
+ 		pseudo_setupenv();
+-		if (!pseudo_get_value("PSEUDO_UNLOAD")) {
++		if (!pseudo_has_unload(NULL)) {
+ 			pseudo_reinit_libpseudo();
+ 		} else {
+ 			pseudo_dropenv();
+diff --git a/ports/linux/oldclone/pseudo_wrappers.c b/ports/linux/oldclone/pseudo_wrappers.c
+index c0ce5dd..598d966 100644
+--- a/ports/linux/oldclone/pseudo_wrappers.c
++++ b/ports/linux/oldclone/pseudo_wrappers.c
+@@ -22,7 +22,7 @@ int wrap_clone_child(void *args) {
+ 
+ 	if (!(flags & CLONE_VM)) {
+ 		pseudo_setupenv();
+-		if (!pseudo_get_value("PSEUDO_UNLOAD")) {
++		if (!pseudo_has_unload(NULL)) {
+ 			pseudo_reinit_libpseudo();
+ 		} else {
+ 			pseudo_dropenv();
+diff --git a/ports/unix/guts/popen.c b/ports/unix/guts/popen.c
+index 0ca16b0..5d44c0e 100644
+--- a/ports/unix/guts/popen.c
++++ b/ports/unix/guts/popen.c
+@@ -9,7 +9,7 @@
+ 	 * in ways that avoid our usual enforcement of the environment.
+ 	 */
+ 	pseudo_setupenv();
+-	if (pseudo_get_value("PSEUDO_UNLOAD"))
++	if (pseudo_has_unload(NULL))
+ 		pseudo_dropenv();
+ 
+ 	rc = real_popen(command, mode);
+diff --git a/ports/unix/guts/system.c b/ports/unix/guts/system.c
+index 028b372..6351592 100644
+--- a/ports/unix/guts/system.c
++++ b/ports/unix/guts/system.c
+@@ -9,7 +9,7 @@
+ 		return 1;
+ 
+ 	pseudo_setupenv();
+-	if (pseudo_get_value("PSEUDO_UNLOAD"))
++	if (pseudo_has_unload(NULL))
+ 		pseudo_dropenv();
+ 
+ 	rc = real_system(command);
+diff --git a/pseudo.h b/pseudo.h
+index 56760a4..f600793 100644
+--- a/pseudo.h
++++ b/pseudo.h
+@@ -28,6 +28,7 @@ extern void pseudo_init_client(void);
+ void pseudo_dump_env(char **envp);
+ int pseudo_set_value(const char *key, const char *value);
+ char *pseudo_get_value(const char *key);
++int pseudo_has_unload(char * const *envp);
+ 
+ #include "pseudo_tables.h"
+ 
+diff --git a/pseudo_util.c b/pseudo_util.c
+index 8d0969e..16c70e0 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -95,6 +95,33 @@ dump_env(char **envp) {
+ }
+ #endif
+ 
++int
++pseudo_has_unload(char * const *envp) {
++	static const char unload[] = "PSEUDO_UNLOAD";
++	static size_t unload_len = strlen(unload);
++	size_t i = 0;
++
++	/* Is it in the caller environment? */
++	if (NULL != getenv(unload))
++		return 1;
++
++	/* Is it in the environment cache? */
++	if (pseudo_util_initted == -1)
++		pseudo_init_util();
++	while (pseudo_env[i].key && strcmp(pseudo_env[i].key, unload))
++	       ++i;
++	if (pseudo_env[i].key && pseudo_env[i].value)
++		return 1;
++
++	/* Is it in the operational environment? */
++	while (envp && *envp) {
++		if ((!strncmp(*envp, unload, unload_len)) && ('=' == (*envp)[unload_len]))
++			return 1;
++		++envp;
++	}
++	return 0;
++}
++
+ /* Caller must free memory! */
+ char *
+ pseudo_get_value(const char *key) {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index 5694c4d..c5df919 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -1,8 +1,11 @@
 require pseudo.inc
 
-PR = "r3"
+PR = "r4"
 
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+    file://0001-pseudo_has_unload-add-function.patch \
+"
 
 SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
 SRC_URI[sha256sum] = "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a8947d2ff6c1d3d52"
-- 
1.7.9.5


