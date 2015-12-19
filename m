Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 93E4E7319C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:38 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id 74so13362878qgh.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZLBZd9kQetuU3NM53LVAkmY+WIqkOfAJlrqaUnDoivk=;
	b=tXkEDoDFQreqUAsqd8L73TsaWrjR10JQ5BjMhMP38gKp45jb3LllKoRp9kKOkrrBZs
	HFPQLhums+E9BC2aOZDWs7KZx+kOw1kbTnXF7juLm+Hxjb7D8bKddBAJ3J9Ucmxvqn4E
	DqTpHu9Dhsu38V2ximYkRW0PxiP64lID1TLuBDEyFOMXcY6Km1xW/FXpTxTEGSOm1HLI
	HLfiwKa1io4FyLGPlwebBVYbwuCVB2Dxlghk6XRyR6MlDjJrYZSeGtbOAHWpzU5/79pg
	Tv3Njq2b0lcAW6uE0HvPOcJZPaD19jl+Z2m052v+QEHyySm9PWmIzkyJ06yQhQ5avLYy
	jpzA==
X-Received: by 10.140.156.197 with SMTP id c188mr15988972qhc.85.1450569158977; 
	Sat, 19 Dec 2015 15:52:38 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:20 +0000
Message-Id: <7ffc399f13bd113ea2647340972d3d1d6c7ae772.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 11/17] libcgroup: Add dependency on fts when building on musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libcgroup/libcgroup/musl-decls-compat.patch    | 235 +++++++++++++++++++++
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |   4 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch

diff --git a/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch b/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
new file mode 100644
index 0000000..65f4ef9
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
@@ -0,0 +1,235 @@
+commit ca780b4f7f71abeeb04a585f2a4d889caaa985fa
+Author: Isaac Dunham <ibid.ag@gmail.com>
+Date:   Fri Sep 5 22:35:32 2014 -0700
+
+    Remove __.*DECLS nonsense
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libcgroup-0.41/include/libcgroup/config.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/config.h
++++ libcgroup-0.41/include/libcgroup/config.h
+@@ -9,7 +9,9 @@
+ #include <features.h>
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /**
+  * @defgroup group_config 5. Configuration
+@@ -107,6 +109,8 @@ int cgroup_config_create_template_group(
+  * @}
+  * @}
+  */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /*_LIBCGROUP_CONFIG_H*/
+Index: libcgroup-0.41/include/libcgroup/error.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/error.h
++++ libcgroup-0.41/include/libcgroup/error.h
+@@ -9,7 +9,9 @@
+ #include <features.h>
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /**
+  * @defgroup group_errors 6. Error handling
+@@ -99,6 +101,8 @@ int cgroup_get_last_errno(void);
+  * @}
+  * @}
+  */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _LIBCGROUP_INIT_H */
+Index: libcgroup-0.41/include/libcgroup/groups.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/groups.h
++++ libcgroup-0.41/include/libcgroup/groups.h
+@@ -11,7 +11,9 @@
+ #include <stdbool.h>
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /**
+  * Flags for cgroup_delete_cgroup_ext().
+@@ -577,6 +579,8 @@ char *cgroup_get_cgroup_name(struct cgro
+  */
+ 
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _LIBCGROUP_GROUPS_H */
+Index: libcgroup-0.41/include/libcgroup/init.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/init.h
++++ libcgroup-0.41/include/libcgroup/init.h
+@@ -9,7 +9,9 @@
+ #include <features.h>
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /**
+  * @defgroup group_init 1. Initialization
+@@ -58,6 +60,8 @@ int cgroup_get_subsys_mount_point(const
+  * @}
+  * @}
+  */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _LIBCGROUP_INIT_H */
+Index: libcgroup-0.41/include/libcgroup/iterators.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/iterators.h
++++ libcgroup-0.41/include/libcgroup/iterators.h
+@@ -11,7 +11,9 @@
+ #include <features.h>
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /**
+  * @defgroup group_iterators 3. Iterators
+@@ -423,6 +425,8 @@ int cgroup_get_subsys_mount_point_end(vo
+  * @}
+  */
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _LIBCGROUP_ITERATORS_H */
+Index: libcgroup-0.41/include/libcgroup/tasks.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/tasks.h
++++ libcgroup-0.41/include/libcgroup/tasks.h
+@@ -12,7 +12,9 @@
+ #include <stdbool.h>
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /** Flags for cgroup_change_cgroup_uid_gid(). */
+ enum cgflags {
+@@ -204,6 +206,8 @@ int cgroup_register_unchanged_process(pi
+  * @}
+  * @}
+  */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _LIBCGROUP_TASKS_H */
+Index: libcgroup-0.41/src/daemon/cgrulesengd.h
+===================================================================
+--- libcgroup-0.41.orig/src/daemon/cgrulesengd.h
++++ libcgroup-0.41/src/daemon/cgrulesengd.h
+@@ -17,7 +17,9 @@
+ 
+ #include <features.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ #include "config.h"
+ #include "libcgroup.h"
+@@ -119,7 +121,9 @@ void cgre_flash_templates(int signum);
+  */
+ void cgre_catch_term(int signum);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _CGRULESENGD_H */
+ 
+Index: libcgroup-0.41/src/libcgroup-internal.h
+===================================================================
+--- libcgroup-0.41.orig/src/libcgroup-internal.h
++++ libcgroup-0.41/src/libcgroup-internal.h
+@@ -16,7 +16,9 @@
+ 
+ #define __LIBCG_INTERNAL
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ #include "config.h"
+ #include <fts.h>
+@@ -279,6 +281,8 @@ extern void cgroup_dictionary_iterator_e
+  */
+ int cg_chmod_path(const char *path, mode_t mode, int owner_is_umask);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif
+Index: libcgroup-0.41/include/libcgroup/log.h
+===================================================================
+--- libcgroup-0.41.orig/include/libcgroup/log.h
++++ libcgroup-0.41/include/libcgroup/log.h
+@@ -11,7 +11,9 @@
+ 
+ #include <stdarg.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /**
+  * @defgroup group_log 7. Logging
+@@ -142,6 +144,8 @@ extern int cgroup_parse_log_level_str(co
+  * @}
+  * @}
+  */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _LIBCGROUP_LOG_H */
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 287aecd..9597963 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -11,12 +11,16 @@ inherit autotools pkgconfig
 DEPENDS = "bison-native flex-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2"
+SRC_URI_append_libc-musl = " file://musl-decls-compat.patch"
 
 SRC_URI[md5sum] = "3dea9d50b8a5b73ff0bf1cdcb210f63f"
 SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libcg/files/libcgroup/"
 
+DEPENDS_append_libc-musl = " fts "
+EXTRA_OEMAKE_append_libc-musl = "LIBS=-lfts"
+
 EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
 PACKAGES =+ "cgroups-pam-plugin"
-- 
2.6.4


