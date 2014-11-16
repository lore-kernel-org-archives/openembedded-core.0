Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id 1494A72120
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 00:06:04 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id G0611p00N0BVjqb01064zH; Sat, 15 Nov 2014 17:06:05 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 18:05:49 -0600
Message-Id: <220c1fcdd8f0d27e16420a66e68c3757e3c4397b.1416081855.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
In-Reply-To: <cover.1416081855.git.pab@pabigot.com>
References: <cover.1416081855.git.pab@pabigot.com>
Subject: [PATCH V2 5/7] pseudo: provide fallback passwd and group files
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
X-List-Received-Date: Sun, 16 Nov 2014 00:06:05 -0000

Normally pseudo is built with --without-passwd-fallback, which requires
that somebody provide target passwd and group files.  Those come from
base-passwd in OE, but base-passwd cannot be built without first
invoking operations under pseudo that require getpw*/getgr*.

Provide the absolute minimum stub files, matching in content what will
eventually be on the target, that can be used in the cases where the
target files are not yet available.  The requirements for minimum stub
are the usernames and groups identified in meta/files/fs-perms.txt.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
v2 change: install fallback files read-only

 meta/recipes-devtools/pseudo/files/fallback-group  | 2 ++
 meta/recipes-devtools/pseudo/files/fallback-passwd | 1 +
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       | 9 +++++++++
 3 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/fallback-group
 create mode 100644 meta/recipes-devtools/pseudo/files/fallback-passwd

diff --git a/meta/recipes-devtools/pseudo/files/fallback-group b/meta/recipes-devtools/pseudo/files/fallback-group
new file mode 100644
index 0000000..81bf732
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/fallback-group
@@ -0,0 +1,2 @@
+root:*:0:
+mail:*:8:
diff --git a/meta/recipes-devtools/pseudo/files/fallback-passwd b/meta/recipes-devtools/pseudo/files/fallback-passwd
new file mode 100644
index 0000000..c1458dc
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/fallback-passwd
@@ -0,0 +1 @@
+root::0:0:root:/home/root:/bin/sh
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
index fb85f89..261c8d3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
@@ -5,9 +5,18 @@ SRC_URI = " \
     file://0001-pseudo_client.c-protect-pwd_lck-against-magic.patch \
     file://0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch \
     file://0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch \
+    file://fallback-passwd \
+    file://fallback-group \
 "
 
 SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
 SRC_URI[sha256sum] = "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
+
+do_install_append_class-native () {
+	install -d ${D}${sysconfdir}
+	# The fallback files should never be modified
+	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
+	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
+}
-- 
1.8.5.5


