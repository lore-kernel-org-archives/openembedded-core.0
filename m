Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.69294.1629377508985439870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 05:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31A1B31B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 05:51:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B38113F70D
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 05:51:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libcgroup: upgrade to 2.0
Date: Thu, 19 Aug 2021 13:51:43 +0100
Message-Id: <20210819125143.768013-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Our UPSTREAM_CHECK_URI was looking at SourceForge, but development has
moved to GitHub so update the URI.

Update to 2.0.

Swap musl-decls-compat.patch for a backport of an upstream commit.

Replace do_install commands with a backport of an upstream commit to
install the PAM module correctly.

Don't mess about installing the library into base_libdir as the /lib vs
/usr/lib prefix split is moot these days.

Delete libcgroupfortesting.so as we don't install the test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libcgroup/libcgroup/CVE-2018-14348.patch  |  37 ----
 .../libcgroup/libcgroup/module.patch          |  36 ++++
 .../libcgroup/musl-decls-compat.patch         | 187 +++++++++++-------
 meta/recipes-core/libcgroup/libcgroup_0.41.bb |  46 -----
 meta/recipes-core/libcgroup/libcgroup_2.0.bb  |  34 ++++
 5 files changed, 188 insertions(+), 152 deletions(-)
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.=
patch
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/module.patch
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup_0.41.bb
 create mode 100644 meta/recipes-core/libcgroup/libcgroup_2.0.bb

diff --git a/meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch b=
/meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch
deleted file mode 100644
index d133703dec8..00000000000
--- a/meta/recipes-core/libcgroup/libcgroup/CVE-2018-14348.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0d88b73d189ea3440ccaab00418d6469f76fa590 Mon Sep 17 00:00:00 2001
-From: Michal Hocko <mhocko@suse.com>
-Date: Wed, 18 Jul 2018 11:24:29 +0200
-Subject: [PATCH] cgrulesengd: remove umask(0)
-
-One of our partners has noticed that cgred daemon is creating a log file
-(/var/log/cgred) with too wide permissions (0666) and that is seen as
-a security bug because an untrusted user can write to otherwise
-restricted area. CVE-2018-14348 has been assigned to this issue.
-
-CVE: CVE-2018-14348
-Upstream-Status: Backport [https://sourceforge.net/p/libcg/libcg/ci/0d88=
b73d189ea3440ccaab00418d6469f76fa590]
-
-Signed-off-by: Michal Hocko <mhocko@suse.com>
-Acked-by: Balbir Singh <bsingharora@gmail.com>
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- src/daemon/cgrulesengd.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/daemon/cgrulesengd.c b/src/daemon/cgrulesengd.c
-index ea51f11..0d288f3 100644
---- a/src/daemon/cgrulesengd.c
-+++ b/src/daemon/cgrulesengd.c
-@@ -889,9 +889,6 @@ int cgre_start_daemon(const char *logp, const int lo=
gf,
- 		} else if (pid > 0) {
- 			exit(EXIT_SUCCESS);
- 		}
--
--		/* Change the file mode mask. */
--		umask(0);
- 	} else {
- 		flog(LOG_DEBUG, "Not using daemon mode\n");
- 		pid =3D getpid();
---=20
-2.13.3
-
diff --git a/meta/recipes-core/libcgroup/libcgroup/module.patch b/meta/re=
cipes-core/libcgroup/libcgroup/module.patch
new file mode 100644
index 00000000000..d8ff9b1479f
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup/module.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 76f0879056ce7e3f0123c277f2303954d0b6cead Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Tomasz=3D20K=3DC5=3D82oczko?=3D <kloczek@github.com>
+Date: Wed, 12 May 2021 20:36:02 +0000
+Subject: [PATCH 2/2] automake: build PAM module as unversioned DSO
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+PAM modules should be build as unversioned DSO.
+Add -avoid-version to pam_cgroup_la_LDFLAGS
+
+Signed-off-by: Tomasz K=C5=82oczko <kloczek@github.com>
+Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
+---
+ src/pam/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pam/Makefile.am b/src/pam/Makefile.am
+index bd5a91d..4b0b2a9 100644
+--- a/src/pam/Makefile.am
++++ b/src/pam/Makefile.am
+@@ -4,7 +4,7 @@ if WITH_PAM
+=20
+ pamlib_LTLIBRARIES =3D pam_cgroup.la
+ pam_cgroup_la_SOURCES =3D pam_cgroup.c
+-pam_cgroup_la_LDFLAGS =3D -module
++pam_cgroup_la_LDFLAGS =3D -module -avoid-version
+ pam_cgroup_la_LIBADD =3D $(top_builddir)/src/libcgroup.la -lpam
+=20
+ endif
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patc=
h b/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
index 65f4ef9a557..531a562967c 100644
--- a/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
+++ b/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
@@ -1,16 +1,37 @@
-commit ca780b4f7f71abeeb04a585f2a4d889caaa985fa
-Author: Isaac Dunham <ibid.ag@gmail.com>
-Date:   Fri Sep 5 22:35:32 2014 -0700
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-    Remove __.*DECLS nonsense
+From 26f2889113789c176273bd24fcd1592a8064c346 Mon Sep 17 00:00:00 2001
+From: "Anthony G. Basile" <blueness@gentoo.org>
+Date: Tue, 6 Jul 2021 07:54:47 -0600
+Subject: [PATCH 1/2] Replace __BEGIN_DECLS and __END_DECLS with extern "=
C".
=20
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+The macros __BEGIN_DECLS and __END_DECLS are a GNU-ism found in
+glibc and uClibc, but not musl.  We replace them by the more general
+extern "C" { ... } block exposed only if we have __cplusplus.
=20
-Index: libcgroup-0.41/include/libcgroup/config.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/config.h
-+++ libcgroup-0.41/include/libcgroup/config.h
+Forward ported from a patch by Anthony G. Basile <blueness@gentoo.org>.
+
+Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
+Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
+---
+ include/libcgroup/config.h    | 8 ++++++--
+ include/libcgroup/error.h     | 8 ++++++--
+ include/libcgroup/groups.h    | 8 ++++++--
+ include/libcgroup/init.h      | 8 ++++++--
+ include/libcgroup/iterators.h | 8 ++++++--
+ include/libcgroup/log.h       | 8 ++++++--
+ include/libcgroup/tasks.h     | 8 ++++++--
+ src/bindings/libcgroup.p      | 8 --------
+ src/daemon/cgrulesengd.h      | 8 ++++++--
+ src/libcgroup-internal.h      | 8 ++++++--
+ src/tools/tools-common.h      | 8 ++++++--
+ 11 files changed, 60 insertions(+), 28 deletions(-)
+
+diff --git a/include/libcgroup/config.h b/include/libcgroup/config.h
+index 9aaa390..f835009 100644
+--- a/include/libcgroup/config.h
++++ b/include/libcgroup/config.h
 @@ -9,7 +9,9 @@
  #include <features.h>
  #endif
@@ -22,20 +43,20 @@ Index: libcgroup-0.41/include/libcgroup/config.h
 =20
  /**
   * @defgroup group_config 5. Configuration
-@@ -107,6 +109,8 @@ int cgroup_config_create_template_group(
+@@ -128,6 +130,8 @@ int cgroup_config_create_template_group(
   * @}
   * @}
   */
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /*_LIBCGROUP_CONFIG_H*/
-Index: libcgroup-0.41/include/libcgroup/error.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/error.h
-+++ libcgroup-0.41/include/libcgroup/error.h
+diff --git a/include/libcgroup/error.h b/include/libcgroup/error.h
+index 1dfdde9..14a6e16 100644
+--- a/include/libcgroup/error.h
++++ b/include/libcgroup/error.h
 @@ -9,7 +9,9 @@
  #include <features.h>
  #endif
@@ -53,14 +74,14 @@ Index: libcgroup-0.41/include/libcgroup/error.h
   */
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /* _LIBCGROUP_INIT_H */
-Index: libcgroup-0.41/include/libcgroup/groups.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/groups.h
-+++ libcgroup-0.41/include/libcgroup/groups.h
+diff --git a/include/libcgroup/groups.h b/include/libcgroup/groups.h
+index 201558f..39ec3cd 100644
+--- a/include/libcgroup/groups.h
++++ b/include/libcgroup/groups.h
 @@ -11,7 +11,9 @@
  #include <stdbool.h>
  #endif
@@ -72,20 +93,20 @@ Index: libcgroup-0.41/include/libcgroup/groups.h
 =20
  /**
   * Flags for cgroup_delete_cgroup_ext().
-@@ -577,6 +579,8 @@ char *cgroup_get_cgroup_name(struct cgro
+@@ -587,6 +589,8 @@ char *cgroup_get_cgroup_name(struct cgroup *cgroup);
   */
 =20
 =20
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /* _LIBCGROUP_GROUPS_H */
-Index: libcgroup-0.41/include/libcgroup/init.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/init.h
-+++ libcgroup-0.41/include/libcgroup/init.h
+diff --git a/include/libcgroup/init.h b/include/libcgroup/init.h
+index 5150f2f..ea2dcc9 100644
+--- a/include/libcgroup/init.h
++++ b/include/libcgroup/init.h
 @@ -9,7 +9,9 @@
  #include <features.h>
  #endif
@@ -97,20 +118,20 @@ Index: libcgroup-0.41/include/libcgroup/init.h
 =20
  /**
   * @defgroup group_init 1. Initialization
-@@ -58,6 +60,8 @@ int cgroup_get_subsys_mount_point(const
+@@ -58,6 +60,8 @@ int cgroup_get_subsys_mount_point(const char *controll=
er, char **mount_point);
   * @}
   * @}
   */
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /* _LIBCGROUP_INIT_H */
-Index: libcgroup-0.41/include/libcgroup/iterators.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/iterators.h
-+++ libcgroup-0.41/include/libcgroup/iterators.h
+diff --git a/include/libcgroup/iterators.h b/include/libcgroup/iterators=
.h
+index c6d453d..b3ba3af 100644
+--- a/include/libcgroup/iterators.h
++++ b/include/libcgroup/iterators.h
 @@ -11,7 +11,9 @@
  #include <features.h>
  #endif
@@ -122,20 +143,45 @@ Index: libcgroup-0.41/include/libcgroup/iterators.h
 =20
  /**
   * @defgroup group_iterators 3. Iterators
-@@ -423,6 +425,8 @@ int cgroup_get_subsys_mount_point_end(vo
+@@ -423,6 +425,8 @@ int cgroup_get_subsys_mount_point_end(void **handle)=
;
   * @}
   */
 =20
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /* _LIBCGROUP_ITERATORS_H */
-Index: libcgroup-0.41/include/libcgroup/tasks.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/tasks.h
-+++ libcgroup-0.41/include/libcgroup/tasks.h
+diff --git a/include/libcgroup/log.h b/include/libcgroup/log.h
+index 0dd03b4..f693473 100644
+--- a/include/libcgroup/log.h
++++ b/include/libcgroup/log.h
+@@ -11,7 +11,9 @@
+=20
+ #include <stdarg.h>
+=20
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+=20
+ /**
+  * @defgroup group_log 7. Logging
+@@ -142,6 +144,8 @@ extern int cgroup_parse_log_level_str(const char *le=
velstr);
+  * @}
+  * @}
+  */
+-__END_DECLS
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
+=20
+ #endif /* _LIBCGROUP_LOG_H */
+diff --git a/include/libcgroup/tasks.h b/include/libcgroup/tasks.h
+index aad438a..8553c30 100644
+--- a/include/libcgroup/tasks.h
++++ b/include/libcgroup/tasks.h
 @@ -12,7 +12,9 @@
  #include <stdbool.h>
  #endif
@@ -147,20 +193,20 @@ Index: libcgroup-0.41/include/libcgroup/tasks.h
 =20
  /** Flags for cgroup_change_cgroup_uid_gid(). */
  enum cgflags {
-@@ -204,6 +206,8 @@ int cgroup_register_unchanged_process(pi
+@@ -204,6 +206,8 @@ int cgroup_register_unchanged_process(pid_t pid, int=
 flags);
   * @}
   * @}
   */
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /* _LIBCGROUP_TASKS_H */
-Index: libcgroup-0.41/src/daemon/cgrulesengd.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/src/daemon/cgrulesengd.h
-+++ libcgroup-0.41/src/daemon/cgrulesengd.h
+diff --git a/src/daemon/cgrulesengd.h b/src/daemon/cgrulesengd.h
+index e273b4b..0b12076 100644
+--- a/src/daemon/cgrulesengd.h
++++ b/src/daemon/cgrulesengd.h
 @@ -17,7 +17,9 @@
 =20
  #include <features.h>
@@ -178,15 +224,15 @@ Index: libcgroup-0.41/src/daemon/cgrulesengd.h
 =20
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif /* _CGRULESENGD_H */
 =20
-Index: libcgroup-0.41/src/libcgroup-internal.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/src/libcgroup-internal.h
-+++ libcgroup-0.41/src/libcgroup-internal.h
+diff --git a/src/libcgroup-internal.h b/src/libcgroup-internal.h
+index 1dfc92b..edc5abb 100644
+--- a/src/libcgroup-internal.h
++++ b/src/libcgroup-internal.h
 @@ -16,7 +16,9 @@
 =20
  #define __LIBCG_INTERNAL
@@ -197,39 +243,42 @@ Index: libcgroup-0.41/src/libcgroup-internal.h
 +#endif
 =20
  #include "config.h"
- #include <fts.h>
-@@ -279,6 +281,8 @@ extern void cgroup_dictionary_iterator_e
-  */
- int cg_chmod_path(const char *path, mode_t mode, int owner_is_umask);
+ #include <dirent.h>
+@@ -407,6 +409,8 @@ int cgroupv2_controller_enabled(const char * const c=
g_name,
+=20
+ #endif /* UNIT_TEST */
 =20
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
  #endif
-Index: libcgroup-0.41/include/libcgroup/log.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- libcgroup-0.41.orig/include/libcgroup/log.h
-+++ libcgroup-0.41/include/libcgroup/log.h
-@@ -11,7 +11,9 @@
+diff --git a/src/tools/tools-common.h b/src/tools/tools-common.h
+index 292c408..e3541b1 100644
+--- a/src/tools/tools-common.h
++++ b/src/tools/tools-common.h
+@@ -18,7 +18,9 @@
 =20
- #include <stdarg.h>
+ #define __TOOLS_COMMON
 =20
 -__BEGIN_DECLS
 +#ifdef __cplusplus
 +extern "C" {
 +#endif
+ #include "config.h"
+ #include <libcgroup.h>
+ #include "../libcgroup-internal.h"
+@@ -136,6 +138,8 @@ int parse_r_flag(const char * const program_name,
+=20
+ #endif /* UNIT_TEST */
 =20
- /**
-  * @defgroup group_log 7. Logging
-@@ -142,6 +144,8 @@ extern int cgroup_parse_log_level_str(co
-  * @}
-  * @}
-  */
 -__END_DECLS
 +#ifdef __cplusplus
-+}
++} /* extern "C" */
 +#endif
 =20
- #endif /* _LIBCGROUP_LOG_H */
+ #endif /* TOOLS_COMMON */
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes=
-core/libcgroup/libcgroup_0.41.bb
deleted file mode 100644
index 400f96f17f9..00000000000
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY =3D "Linux control group abstraction library"
-HOMEPAGE =3D "http://libcg.sourceforge.net/"
-DESCRIPTION =3D "libcgroup is a library that abstracts the control group=
 file system \
-in Linux. Control groups allow you to limit, account and isolate resourc=
e usage \
-(CPU, memory, disk I/O, etc.) of groups of processes."
-SECTION =3D "libs"
-LICENSE =3D "LGPLv2.1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
-
-inherit autotools pkgconfig
-
-DEPENDS =3D "bison-native flex-native"
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${P=
V}.tar.bz2 \
-           file://CVE-2018-14348.patch"
-SRC_URI:append:libc-musl =3D " file://musl-decls-compat.patch"
-
-SRC_URI[md5sum] =3D "3dea9d50b8a5b73ff0bf1cdcb210f63f"
-SRC_URI[sha256sum] =3D "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6=
d404e17706f6fb51"
-
-UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/libcg/files/libc=
group/"
-
-DEPENDS:append:libc-musl =3D " fts "
-EXTRA_OEMAKE:append:libc-musl =3D " LIBS=3D-lfts"
-
-PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-PACKAGECONFIG[pam] =3D "--enable-pam-module-dir=3D${base_libdir}/securit=
y --enable-pam=3Dyes,--enable-pam=3Dno,libpam"
-
-PACKAGES =3D+ "cgroups-pam-plugin"
-FILES:cgroups-pam-plugin =3D "${base_libdir}/security/pam_cgroup.so*"
-FILES:${PN}-dev +=3D "${base_libdir}/security/*.la"
-
-do_install:append() {
-	# Moving libcgroup to base_libdir
-	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-		mkdir -p ${D}/${base_libdir}/
-		mv -f ${D}${libdir}/libcgroup.so.* ${D}${base_libdir}/
-		rm -f ${D}${libdir}/libcgroup.so
-		lnr ${D}${base_libdir}/libcgroup.so.1 ${D}${libdir}/libcgroup.so
-	fi
-	# pam modules in ${base_libdir}/security/ should be binary .so files, n=
ot symlinks.
-	if [ -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ]; then
-		mv -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ${D}${base_libdi=
r}/security/pam_cgroup.so
-		rm -f ${D}${base_libdir}/security/pam_cgroup.so.*
-	fi
-}
diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb b/meta/recipes-=
core/libcgroup/libcgroup_2.0.bb
new file mode 100644
index 00000000000..bc0a75d46c1
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "Linux control group abstraction library"
+HOMEPAGE =3D "http://libcg.sourceforge.net/"
+DESCRIPTION =3D "libcgroup is a library that abstracts the control group=
 file system \
+in Linux. Control groups allow you to limit, account and isolate resourc=
e usage \
+(CPU, memory, disk I/O, etc.) of groups of processes."
+SECTION =3D "libs"
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
+
+inherit autotools pkgconfig
+
+DEPENDS =3D "bison-native flex-native"
+
+SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BP}.tar.bz2 \
+           file://musl-decls-compat.patch \
+           file://module.patch"
+
+SRC_URI[sha256sum] =3D "11a2fbf0e42f46089f406b8b0dca7fef04aec2f21600b70e=
402c5db3661305d7"
+UPSTREAM_CHECK_URI =3D "https://github.com/libcgroup/libcgroup/releases/=
"
+
+DEPENDS:append:libc-musl =3D " fts "
+EXTRA_OEMAKE:append:libc-musl =3D " LIBS=3D-lfts"
+
+PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG[pam] =3D "--enable-pam-module-dir=3D${base_libdir}/securit=
y --enable-pam=3Dyes,--enable-pam=3Dno,libpam"
+
+PACKAGES =3D+ "cgroups-pam-plugin"
+FILES:cgroups-pam-plugin =3D "${base_libdir}/security/pam_cgroup.so*"
+FILES:${PN}-dev +=3D "${base_libdir}/security/*.la"
+
+do_install:append() {
+	# Until we ship the test suite, this library isn't useful
+	rm -f ${D}${libdir}/libcgroupfortesting.*
+}
--=20
2.25.1

