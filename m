Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 357E965FDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 09:02:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4C92jdR006790
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 02:02:45 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 02:02:45 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 17:02:42 +0800
Message-ID: <00a00d1ac5ace8f241fc507bdb4ec6b49c20d80b.1399885162.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399885162.git.Chong.Lu@windriver.com>
References: <cover.1399885162.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: Update to 1.8.2 version
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
X-List-Received-Date: Mon, 12 May 2014 09:02:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upgrade dbus to 1.8.2.
Change install-ptest rules.
Remove unneeded patches since it's included in new version.
Remove unrecognized option: "--with-xml"

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb}    |   3 +-
 meta/recipes-core/dbus/dbus.inc                    |   4 +-
 ...orrect-address-when-using-address-systemd.patch | 193 ---------------------
 ...y-freeing-if-error-during-listing-service.patch |  45 -----
 meta/recipes-core/dbus/dbus/ptest.patch            | 125 +++++++------
 meta/recipes-core/dbus/dbus_1.6.18.bb              |   4 -
 meta/recipes-core/dbus/dbus_1.8.2.bb               |   4 +
 7 files changed, 77 insertions(+), 301 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb} (96%)
 delete mode 100644 meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb

diff --git a/meta/recipes-core/dbus/dbus-test_1.6.18.bb b/meta/recipes-core/dbus/dbus-test_1.8.2.bb
similarity index 96%
rename from meta/recipes-core/dbus/dbus-test_1.6.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.8.2.bb
index 9ea0f4d..0404b9b 100644
--- a/meta/recipes-core/dbus/dbus-test_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.2.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN}-dev = ""
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
-           file://ptest.patch \
+           file://dbus-add-install-ptest-rules.patch \
            file://dbus-1.init  \
            file://run-ptest \
            file://python-config.patch \
@@ -39,7 +39,6 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --with-xml=expat \
                 --disable-systemd \
                 --without-systemdsystemunitdir \
                 --with-dbus-test-dir=${PTEST_PATH} \
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 4510ae3..91c8b43 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -17,8 +17,6 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://Set-correct-address-when-using-address-systemd.patch \
-           file://fixed-memory-freeing-if-error-during-listing-service.patch \
 "
 
 inherit useradd autotools pkgconfig gettext update-rc.d
@@ -56,6 +54,7 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-send \
                ${bindir}/dbus-monitor \
                ${bindir}/dbus-launch \
+               ${bindir}/dbus-run-session \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
@@ -84,7 +83,6 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --with-xml=expat \
                 --disable-systemd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
diff --git a/meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch b/meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
deleted file mode 100644
index 1fca9bb..0000000
--- a/meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From d728fdc655f17031da3bb129ab2fd17dadf0fe3a Mon Sep 17 00:00:00 2001
-From: Simon Peeters <peeters.simon@gmail.com>
-Date: Sun, 7 Oct 2012 16:59:30 +0200
-Subject: [PATCH] Set correct address when using --address=systemd:
-
-When dbus gets launched through systemd, we need to create an address
-string based on the sockets passed.
-
-The _dbus_append_addres_from_socket() function is responsible for
-extracting the address information from the file-descriptor and
-formatting it in a dbus friendly way.
-
-This fixes bus activation when running dbus under a systemd session.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=50962
-
-Upstream-Status: Backport
-
-Signed-off-by: Simon Peeters <peeters.simon@gmail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- dbus/dbus-server-unix.c  | 38 ++++++++++++++++++---------
- dbus/dbus-sysdeps-unix.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++
- dbus/dbus-sysdeps-unix.h |  4 +++
- 3 files changed, 97 insertions(+), 13 deletions(-)
-
-diff --git a/dbus/dbus-server-unix.c b/dbus/dbus-server-unix.c
-index 130f66e..d995240 100644
---- a/dbus/dbus-server-unix.c
-+++ b/dbus/dbus-server-unix.c
-@@ -149,7 +149,7 @@ _dbus_server_listen_platform_specific (DBusAddressEntry *entry,
-     }
-   else if (strcmp (method, "systemd") == 0)
-     {
--      int n, *fds;
-+      int i, n, *fds;
-       DBusString address;
- 
-       n = _dbus_listen_systemd_sockets (&fds, error);
-@@ -159,27 +159,39 @@ _dbus_server_listen_platform_specific (DBusAddressEntry *entry,
-           return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
-         }
- 
--      _dbus_string_init_const (&address, "systemd:");
-+      if (!_dbus_string_init (&address))
-+          goto systemd_oom;
- 
--      *server_p = _dbus_server_new_for_socket (fds, n, &address, NULL);
--      if (*server_p == NULL)
-+      for (i = 0; i < n; i++)
-         {
--          int i;
--
--          for (i = 0; i < n; i++)
-+          if (i > 0)
-             {
--              _dbus_close_socket (fds[i], NULL);
-+              if (!_dbus_string_append (&address, ";"))
-+                goto systemd_oom;
-             }
--          dbus_free (fds);
--
--          dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
--          return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
-+          if (!_dbus_append_address_from_socket (fds[i], &address, error))
-+            goto systemd_err;
-         }
- 
-+      *server_p = _dbus_server_new_for_socket (fds, n, &address, NULL);
-+      if (*server_p == NULL)
-+        goto systemd_oom;
-+
-       dbus_free (fds);
- 
-       return DBUS_SERVER_LISTEN_OK;
--	}
-+  systemd_oom:
-+      _DBUS_SET_OOM (error);
-+  systemd_err:
-+      for (i = 0; i < n; i++)
-+        {
-+          _dbus_close_socket (fds[i], NULL);
-+        }
-+      dbus_free (fds);
-+      _dbus_string_free (&address);
-+
-+      return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
-+    }
- #ifdef DBUS_ENABLE_LAUNCHD
-   else if (strcmp (method, "launchd") == 0)
-     {
-diff --git a/dbus/dbus-sysdeps-unix.c b/dbus/dbus-sysdeps-unix.c
-index b4ecc96..55743b1 100644
---- a/dbus/dbus-sysdeps-unix.c
-+++ b/dbus/dbus-sysdeps-unix.c
-@@ -55,6 +55,7 @@
- #include <netinet/in.h>
- #include <netdb.h>
- #include <grp.h>
-+#include <arpa/inet.h>
- 
- #ifdef HAVE_ERRNO_H
- #include <errno.h>
-@@ -4160,4 +4161,71 @@ _dbus_check_setuid (void)
- #endif
- }
- 
-+/**
-+ * Read the address from the socket and append it to the string
-+ *
-+ * @param fd the socket
-+ * @param address
-+ * @param error return location for error code
-+ */
-+dbus_bool_t
-+_dbus_append_address_from_socket (int         fd,
-+                                  DBusString *address,
-+                                  DBusError  *error)
-+{
-+  union {
-+      struct sockaddr sa;
-+      struct sockaddr_storage storage;
-+      struct sockaddr_un un;
-+      struct sockaddr_in ipv4;
-+      struct sockaddr_in6 ipv6;
-+  } socket;
-+  char hostip[INET6_ADDRSTRLEN];
-+  int size = sizeof (socket);
-+
-+  if (getsockname (fd, &socket.sa, &size))
-+    goto err;
-+
-+  switch (socket.sa.sa_family)
-+    {
-+    case AF_UNIX:
-+      if (socket.un.sun_path[0]=='\0')
-+        {
-+          if (_dbus_string_append_printf (address, "unix:abstract=%s", &(socket.un.sun_path[1])))
-+            return TRUE;
-+        }
-+      else
-+        {
-+          if (_dbus_string_append_printf (address, "unix:path=%s", socket.un.sun_path))
-+            return TRUE;
-+        }
-+      break;
-+    case AF_INET:
-+      if (inet_ntop (AF_INET, &socket.ipv4.sin_addr, hostip, sizeof (hostip)))
-+        if (_dbus_string_append_printf (address, "tcp:family=ipv4,host=%s,port=%u",
-+                   hostip, ntohs (socket.ipv4.sin_port)))
-+          return TRUE;
-+      break;
-+#ifdef AF_INET6
-+    case AF_INET6:
-+      if (inet_ntop (AF_INET6, &socket.ipv6.sin6_addr, hostip, sizeof (hostip)))
-+        if (_dbus_string_append_printf (address, "tcp:family=ipv6,host=%s,port=%u",
-+                   hostip, ntohs (socket.ipv6.sin6_port)))
-+          return TRUE;
-+      break;
-+#endif
-+    default:
-+      dbus_set_error (error,
-+                      _dbus_error_from_errno (EINVAL),
-+                      "Failed to read address from socket: Unknown socket type.");
-+      return FALSE;
-+    }
-+ err:
-+  dbus_set_error (error,
-+                  _dbus_error_from_errno (errno),
-+                  "Failed to open socket: %s",
-+                  _dbus_strerror (errno));
-+  return FALSE;
-+}
-+
- /* tests in dbus-sysdeps-util.c */
-diff --git a/dbus/dbus-sysdeps-unix.h b/dbus/dbus-sysdeps-unix.h
-index 9b70896..a265b33 100644
---- a/dbus/dbus-sysdeps-unix.h
-+++ b/dbus/dbus-sysdeps-unix.h
-@@ -138,6 +138,10 @@ dbus_bool_t _dbus_parse_uid (const DBusString  *uid_str,
- 
- void _dbus_close_all (void);
- 
-+dbus_bool_t _dbus_append_address_from_socket (int         fd,
-+                                              DBusString *address,
-+                                              DBusError  *error);
-+
- /** @} */
- 
- DBUS_END_DECLS
--- 
-1.9.0
-
diff --git a/meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch b/meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
deleted file mode 100644
index 96290f4..0000000
--- a/meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 03aeaccbffa97c9237b57ca067e3da7388862129 Mon Sep 17 00:00:00 2001
-From: Radoslaw Pajak <r.pajak@samsung.com>
-Date: Fri, 8 Nov 2013 13:51:32 +0100
-Subject: [PATCH] fixed memory freeing if error during listing services
-
-Upstream-Status: Backport
-
-Signed-off-by: Radoslaw Pajak <r.pajak@samsung.com>
-Reviewed-by: Simon McVittie <simon.mcvittie@collabora.co.uk>
-Bug: https://bugs.freedesktop.org/show_bug.cgi?id=71526
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- bus/activation.c | 2 +-
- bus/services.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bus/activation.c b/bus/activation.c
-index fcb7133..ea48a26 100644
---- a/bus/activation.c
-+++ b/bus/activation.c
-@@ -2179,7 +2179,7 @@ bus_activation_list_services (BusActivation *activation,
- 
-  error:
-   for (j = 0; j < i; j++)
--    dbus_free (retval[i]);
-+    dbus_free (retval[j]);
-   dbus_free (retval);
- 
-   return FALSE;
-diff --git a/bus/services.c b/bus/services.c
-index 6f380fa..01a720e 100644
---- a/bus/services.c
-+++ b/bus/services.c
-@@ -368,7 +368,7 @@ bus_registry_list_services (BusRegistry *registry,
-   
-  error:
-   for (j = 0; j < i; j++)
--    dbus_free (retval[i]);
-+    dbus_free (retval[j]);
-   dbus_free (retval);
- 
-   return FALSE;
--- 
-1.9.0
-
diff --git a/meta/recipes-core/dbus/dbus/ptest.patch b/meta/recipes-core/dbus/dbus/ptest.patch
index 263d17e..5066cad 100644
--- a/meta/recipes-core/dbus/dbus/ptest.patch
+++ b/meta/recipes-core/dbus/dbus/ptest.patch
@@ -1,26 +1,32 @@
+dbus: add install-ptest rules
+
 Add install-ptest rules.
 Change TEST_ENVIRONMENT to allow running outside build dir.
+Change DBUS_BUILD_TESTS to DBUS_ENABLE_EMBEDDED_TESTS.
+
+Upstream-Status: Pending
 
+Signed-off-by: Björn Stenberg <bjst@enea.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
  Makefile.am                |    7 +++++++
  bus/Makefile.am            |    6 ++++++
  dbus/Makefile.am           |    6 ++++++
  doc/Makefile.am            |    4 ++++
- test/Makefile.am           |   25 ++++++++++++++++++++-----
- test/name-test/Makefile.am |    9 +++++++++
+ test/Makefile.am           |   34 +++++++++++++++++++++++++++++-----
+ test/name-test/Makefile.am |   13 +++++++++++++
  tools/Makefile.am          |   12 ++++++++++++
- 7 files changed, 64 insertions(+), 5 deletions(-)
+ 7 files changed, 77 insertions(+), 5 deletions(-)
 
-Signed-off-by: Björn Stenberg <bjst@enea.com>
-Upstream-Status: Pending
-
-diff -ur a/Makefile.am b/Makefile.am
---- a/Makefile.am	2012-12-06 14:34:01.157414449 +0100
-+++ b/Makefile.am	2012-12-06 15:21:14.447113035 +0100
-@@ -30,4 +30,11 @@
+diff --git a/Makefile.am b/Makefile.am
+index 756ab8b..b434868 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -33,4 +33,11 @@ DISTCHECK_CONFIGURE_FLAGS = \
  
  ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
  
-+if DBUS_BUILD_TESTS
++if DBUS_ENABLE_EMBEDDED_TESTS
 +install-ptest:
 +	@for subdir in $(SUBDIRS); do \
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
@@ -28,60 +34,76 @@ diff -ur a/Makefile.am b/Makefile.am
 +endif
 +
  include tools/lcov.am
-diff -ur a/bus/Makefile.am b/bus/Makefile.am
---- a/bus/Makefile.am	2012-12-06 14:34:01.169413931 +0100
-+++ b/bus/Makefile.am	2012-12-06 15:21:14.463112346 +0100
-@@ -290,3 +290,9 @@
+diff --git a/bus/Makefile.am b/bus/Makefile.am
+index f335e30..0316be5 100644
+--- a/bus/Makefile.am
++++ b/bus/Makefile.am
+@@ -281,3 +281,9 @@ endif
  #### Extra dist
  
  EXTRA_DIST=$(CONFIG_IN_FILES) $(SCRIPT_IN_FILES)
 +
-+if DBUS_BUILD_TESTS
++if DBUS_ENABLE_EMBEDDED_TESTS
 +install-ptest:
 +	@$(MKDIR_P) $(DESTDIR)
 +	@install $(dbus_daemon_exec_PROGRAMS) $(noinst_PROGRAMS) $(DESTDIR)
 +endif
-diff -ur a/dbus/Makefile.am b/dbus/Makefile.am
---- a/dbus/Makefile.am	2012-12-06 14:34:01.161414276 +0100
-+++ b/dbus/Makefile.am	2012-12-06 15:21:14.451112862 +0100
-@@ -310,3 +310,9 @@
+diff --git a/dbus/Makefile.am b/dbus/Makefile.am
+index b248107..d467e33 100644
+--- a/dbus/Makefile.am
++++ b/dbus/Makefile.am
+@@ -327,3 +327,9 @@ clean-local:
  update-systemd:
- 	curl http://cgit.freedesktop.org/systemd/plain/src/sd-daemon.c > sd-daemon.c
- 	curl http://cgit.freedesktop.org/systemd/plain/src/sd-daemon.h > sd-daemon.h
+ 	curl http://cgit.freedesktop.org/systemd/systemd/plain/src/libsystemd-daemon/sd-daemon.c > $(srcdir)/sd-daemon.c
+ 	curl http://cgit.freedesktop.org/systemd/systemd/plain/src/systemd/sd-daemon.h > $(srcdir)/sd-daemon.h
 +
-+if DBUS_BUILD_TESTS
++if DBUS_ENABLE_EMBEDDED_TESTS
 +install-ptest:
 +	@$(MKDIR_P) $(DESTDIR)
 +	@install $(noinst_PROGRAMS) $(DESTDIR)
 +endif
-diff -ur a/test/Makefile.am b/test/Makefile.am
---- a/test/Makefile.am	2012-12-06 14:34:01.165414103 +0100
-+++ b/test/Makefile.am	2012-12-06 15:21:14.455112690 +0100
-@@ -119,12 +119,13 @@
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index b9a4c10..54eb139 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -159,3 +159,7 @@ clean-local:
+ 	rm -rf dbus-docs dbus-docs.tmp
+ 	rm -f *.1.html
+ 	rm -f doxygen.stamp
++
++if DBUS_ENABLE_EMBEDDED_TESTS
++install-ptest:
++endif
+diff --git a/test/Makefile.am b/test/Makefile.am
+index cec5cda..1ff31f4 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -156,12 +156,14 @@ installcheck_environment = \
  	DBUS_TEST_HOMEDIR=@abs_top_builddir@/dbus \
  	DBUS_TEST_SYSCONFDIR=$(DESTDIR)$(sysconfdir)
  
 +ptest_run_dir = ..
 +
  TESTS_ENVIRONMENT = \
--	DBUS_BLOCK_ON_ABORT=1 \
+-	XDG_RUNTIME_DIR=@abs_top_builddir@/test/XDG_RUNTIME_DIR \
 -	DBUS_FATAL_WARNINGS=1 \
 -	DBUS_TEST_DAEMON=@abs_top_builddir@/bus/dbus-daemon$(EXEEXT) \
 -	DBUS_TEST_DATA=@abs_top_builddir@/test/data \
 -	DBUS_TEST_HOMEDIR=@abs_top_builddir@/dbus \
++	XDG_RUNTIME_DIR=$(ptest_run_dir)/test/XDG_RUNTIME_DIR \
 +	DBUS_FATAL_WARNINGS=0 \
 +	DBUS_TEST_DAEMON=$(ptest_run_dir)/bus/dbus-daemon$(EXEEXT) \
 +	DBUS_TEST_DATA=$(ptest_run_dir)/test/data \
 +	DBUS_TEST_HOMEDIR=$(ptest_run_dir)/dbus \
  	$(NULL)
  
- test_corrupt_SOURCES = corrupt.c
-@@ -325,3 +325,25 @@
- data/valid-config-files/system.conf: $(top_builddir)/bus/system.conf
+ manual_authz_SOURCES = manual-authz.c
+@@ -376,3 +378,25 @@ CLEANFILES = $(noinst_DATA) XDG_RUNTIME_DIR
+ $(imported_data): data/valid-config-files/%.conf: $(top_builddir)/bus/%.conf
  	$(AM_V_at)$(MKDIR_P) data/valid-config-files
  	$(AM_V_GEN)cp $< $@
 +
-+if DBUS_BUILD_TESTS
++if DBUS_ENABLE_EMBEDDED_TESTS
 +install-ptest: install-ptest-nonrecursive
 +	@for subdir in $(SUBDIRS); do \
 +		if [ $$subdir != "." ]; then \
@@ -102,12 +124,13 @@ diff -ur a/test/Makefile.am b/test/Makefile.am
 +		install -D ${srcdir}/$${file%.in} $(DESTDIR)/$${file%.in}; \
 +	done;
 +endif
-diff -ur a/test/name-test/Makefile.am b/test/name-test/Makefile.am
---- a/test/name-test/Makefile.am	2012-12-06 14:34:01.169413931 +0100
-+++ b/test/name-test/Makefile.am	2012-12-06 15:21:14.459112518 +0100
-@@ -36,4 +36,16 @@
- test_privserver_client_LDADD=../libdbus-testutils.la
- test_autolaunch_LDADD=../libdbus-testutils.la
+diff --git a/test/name-test/Makefile.am b/test/name-test/Makefile.am
+index 8ed1e16..4af148f 100644
+--- a/test/name-test/Makefile.am
++++ b/test/name-test/Makefile.am
+@@ -45,4 +45,17 @@ test_privserver_LDADD=../libdbus-testutils-internal.la
+ test_privserver_client_LDADD=../libdbus-testutils-internal.la
+ test_autolaunch_LDADD=../libdbus-testutils-internal.la
  
 +install-ptest:
 +	@$(MKDIR_P) $(DESTDIR)
@@ -121,16 +144,18 @@ diff -ur a/test/name-test/Makefile.am b/test/name-test/Makefile.am
 +	@for file in $(EXTRA_DIST); do \
 +		cp $(srcdir)/$$file $(DESTDIR); \
 +	done;
++
  endif
-diff -ur a/tools/Makefile.am b/tools/Makefile.am
---- a/tools/Makefile.am	2012-12-06 14:34:01.161414276 +0100
-+++ b/tools/Makefile.am	2012-12-06 15:21:14.455112690 +0100
-@@ -78,3 +78,15 @@
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 73d95fc..30430f6 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -86,3 +86,15 @@ install-data-local:
  
  installcheck-local:
  	test -d $(DESTDIR)$(localstatedir)/lib/dbus
 +
-+if DBUS_BUILD_TESTS
++if DBUS_ENABLE_EMBEDDED_TESTS
 +install-ptest:
 +	@$(MKDIR_P) $(DESTDIR)
 +	@for file in $(bin_PROGRAMS); do \
@@ -141,14 +166,6 @@ diff -ur a/tools/Makefile.am b/tools/Makefile.am
 +		fi; \
 +	done;
 +endif
-diff -ur a/doc/Makefile.am b/doc/Makefile.am
---- a/doc/Makefile.am	2012-06-06 12:45:55.000000000 +0200
-+++ b/doc/Makefile.am	2012-12-06 16:04:58.990070587 +0100
-@@ -174,3 +174,7 @@
- 
- maintainer-clean-local:
- 	rm -f $(XMLTO_OUTPUT)
-+
-+if DBUS_BUILD_TESTS
-+install-ptest:
-+endif
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/dbus/dbus_1.6.18.bb b/meta/recipes-core/dbus/dbus_1.6.18.bb
deleted file mode 100644
index 7270c36..0000000
--- a/meta/recipes-core/dbus/dbus_1.6.18.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include dbus.inc
-
-SRC_URI[md5sum] = "b02e9c95027a416987b81f9893831061"
-SRC_URI[sha256sum] = "7085a0895a9eb11a952394cdbea6d8b4358e17cb991fed0e8fb85e2b9e686dcd"
diff --git a/meta/recipes-core/dbus/dbus_1.8.2.bb b/meta/recipes-core/dbus/dbus_1.8.2.bb
new file mode 100644
index 0000000..37ebed2
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus_1.8.2.bb
@@ -0,0 +1,4 @@
+include dbus.inc
+
+SRC_URI[md5sum] = "d6f709bbec0a022a1847c7caec9d6068"
+SRC_URI[sha256sum] = "5689f7411165adc953f37974e276a3028db94447c76e8dd92efe910c6d3bae08"
-- 
1.8.1.2


