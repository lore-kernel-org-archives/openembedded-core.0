Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn1-0001ej-Nh
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720775"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:27 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:01 -0800
Message-Id: <32dc588820006a6c5f86c4b4da8dab09c8b49f73.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 01/26] wget: Update to 1.13.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 23:08:40 -0000

* remove gnutls.bzr patch as it was in upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../wget/wget-1.12/gnutls.bzr.patch                |  266 --------------------
 .../{wget-1.12 => wget-1.13.4}/fix_makefile.patch  |    0
 .../wget/{wget_1.12.bb => wget_1.13.4.bb}          |    6 +-
 3 files changed, 2 insertions(+), 270 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch
 rename meta/recipes-extended/wget/{wget-1.12 => wget-1.13.4}/fix_makefile.patch (100%)
 rename meta/recipes-extended/wget/{wget_1.12.bb => wget_1.13.4.bb} (43%)

diff --git a/meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch b/meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch
deleted file mode 100644
index 6f0c2eb..0000000
--- a/meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch
+++ /dev/null
@@ -1,266 +0,0 @@
---- wget-1.12/src/gnutls.c	2009-09-22 04:59:33.000000000 +0200
-+++ /OE/projects/wget/src/gnutls.c	2010-10-30 16:24:10.000000000 +0200
-@@ -1,6 +1,6 @@
- /* SSL support via GnuTLS library.
--   Copyright (C) 2005, 2006, 2007, 2008, 2009 Free Software Foundation,
--   Inc.
-+   Copyright (C) 2005, 2006, 2007, 2008, 2009, 2010 Free Software
-+   Foundation, Inc.
- 
- This file is part of GNU Wget.
- 
-@@ -37,6 +37,8 @@
- #endif
- #include <string.h>
- #include <stdio.h>
-+#include <dirent.h>
-+#include <stdlib.h>
- 
- #include <gnutls/gnutls.h>
- #include <gnutls/x509.h>
-@@ -46,6 +48,10 @@
- #include "url.h"
- #include "ssl.h"
- 
-+#ifdef WIN32
-+# include "w32sock.h"
-+#endif
-+
- /* Note: some of the functions private to this file have names that
-    begin with "wgnutls_" (e.g. wgnutls_read) so that they wouldn't be
-    confused with actual gnutls functions -- such as the gnutls_read
-@@ -56,15 +62,50 @@
- bool
- ssl_init ()
- {
-+  const char *ca_directory;
-+  DIR *dir;
-+
-   gnutls_global_init ();
-   gnutls_certificate_allocate_credentials (&credentials);
-+
-+  ca_directory = opt.ca_directory ? opt.ca_directory : "/etc/ssl/certs";
-+
-+  dir = opendir (ca_directory);
-+  if (dir == NULL)
-+    {
-+      if (opt.ca_directory)
-+        logprintf (LOG_NOTQUIET, _("ERROR: Cannot open directory %s.\n"),
-+                   opt.ca_directory);
-+    }
-+  else
-+    {
-+      struct dirent *dent;
-+      while ((dent = readdir (dir)) != NULL)
-+        {
-+          struct stat st;
-+          char *ca_file;
-+          asprintf (&ca_file, "%s/%s", ca_directory, dent->d_name);
-+
-+          stat (ca_file, &st);
-+
-+          if (S_ISREG (st.st_mode))
-+            gnutls_certificate_set_x509_trust_file (credentials, ca_file,
-+                                                    GNUTLS_X509_FMT_PEM);
-+
-+          free (ca_file);
-+        }
-+
-+      closedir (dir);
-+    }
-+
-   if (opt.ca_cert)
-     gnutls_certificate_set_x509_trust_file (credentials, opt.ca_cert,
-                                             GNUTLS_X509_FMT_PEM);
-   return true;
- }
- 
--struct wgnutls_transport_context {
-+struct wgnutls_transport_context
-+{
-   gnutls_session session;       /* GnuTLS session handle */
-   int last_error;               /* last error returned by read/write/... */
- 
-@@ -73,7 +114,7 @@
-      is stored to PEEKBUF, and wgnutls_read checks that buffer before
-      actually reading.  */
-   char peekbuf[512];
--  int peekstart, peeklen;
-+  int peeklen;
- };
- 
- #ifndef MIN
-@@ -83,19 +124,18 @@
- static int
- wgnutls_read (int fd, char *buf, int bufsize, void *arg)
- {
--  int ret;
-+  int ret = 0;
-   struct wgnutls_transport_context *ctx = arg;
- 
-   if (ctx->peeklen)
-     {
-       /* If we have any peek data, simply return that. */
-       int copysize = MIN (bufsize, ctx->peeklen);
--      memcpy (buf, ctx->peekbuf + ctx->peekstart, copysize);
-+      memcpy (buf, ctx->peekbuf, copysize);
-       ctx->peeklen -= copysize;
-       if (ctx->peeklen != 0)
--        ctx->peekstart += copysize;
--      else
--        ctx->peekstart = 0;
-+        memmove (ctx->peekbuf, ctx->peekbuf + copysize, ctx->peeklen);
-+
-       return copysize;
-     }
- 
-@@ -105,6 +145,7 @@
- 
-   if (ret < 0)
-     ctx->last_error = ret;
-+
-   return ret;
- }
- 
-@@ -124,31 +165,49 @@
- static int
- wgnutls_poll (int fd, double timeout, int wait_for, void *arg)
- {
--  return 1;
-+  struct wgnutls_transport_context *ctx = arg;
-+  return ctx->peeklen || gnutls_record_check_pending (ctx->session)
-+    || select_fd (fd, timeout, wait_for);
- }
- 
- static int
- wgnutls_peek (int fd, char *buf, int bufsize, void *arg)
- {
--  int ret;
-+  int ret = 0;
-   struct wgnutls_transport_context *ctx = arg;
--
--  /* We don't support peeks following peeks: the reader must drain all
--     peeked data before the next peek.  */
--  assert (ctx->peeklen == 0);
-+  int offset = MIN (bufsize, ctx->peeklen);
-   if (bufsize > sizeof ctx->peekbuf)
-     bufsize = sizeof ctx->peekbuf;
- 
--  do
--    ret = gnutls_record_recv (ctx->session, buf, bufsize);
--  while (ret == GNUTLS_E_INTERRUPTED);
-+  if (ctx->peeklen)
-+    memcpy (buf, ctx->peekbuf, offset);
- 
--  if (ret >= 0)
-+  if (bufsize > offset)
-     {
--      memcpy (ctx->peekbuf, buf, ret);
--      ctx->peeklen = ret;
-+      do
-+        {
-+          ret = gnutls_record_recv (ctx->session, buf + offset,
-+                                    bufsize - offset);
-+        }
-+      while (ret == GNUTLS_E_INTERRUPTED);
-+
-+      if (ret < 0)
-+        {
-+          if (offset)
-+            ret = 0;
-+          else
-+            return ret;
-+        }
-+
-+      if (ret > 0)
-+        {
-+          memcpy (ctx->peekbuf + offset, buf + offset,
-+                  ret);
-+          ctx->peeklen += ret;
-+        }
-     }
--  return ret;
-+
-+  return offset + ret;
- }
- 
- static const char *
-@@ -165,23 +224,20 @@
-   /*gnutls_bye (ctx->session, GNUTLS_SHUT_RDWR);*/
-   gnutls_deinit (ctx->session);
-   xfree (ctx);
--#ifndef WINDOWS
-   close (fd);
--#else
--  closesocket (fd);
--#endif
- }
- 
- /* gnutls_transport is the singleton that describes the SSL transport
-    methods provided by this file.  */
- 
--static struct transport_implementation wgnutls_transport = {
-+static struct transport_implementation wgnutls_transport =
-+{
-   wgnutls_read, wgnutls_write, wgnutls_poll,
-   wgnutls_peek, wgnutls_errstr, wgnutls_close
- };
- 
- bool
--ssl_connect (int fd)
-+ssl_connect_wget (int fd)
- {
-   static const int cert_type_priority[] = {
-     GNUTLS_CRT_X509, GNUTLS_CRT_OPENPGP, 0
-@@ -189,11 +245,42 @@
-   struct wgnutls_transport_context *ctx;
-   gnutls_session session;
-   int err;
-+  int allowed_protocols[4] = {0, 0, 0, 0};
-   gnutls_init (&session, GNUTLS_CLIENT);
-   gnutls_set_default_priority (session);
-   gnutls_certificate_type_set_priority (session, cert_type_priority);
-   gnutls_credentials_set (session, GNUTLS_CRD_CERTIFICATE, credentials);
--  gnutls_transport_set_ptr (session, (gnutls_transport_ptr) fd);
-+#ifndef FD_TO_SOCKET
-+# define FD_TO_SOCKET(X) (X)
-+#endif
-+  gnutls_transport_set_ptr (session, (gnutls_transport_ptr) FD_TO_SOCKET (fd));
-+
-+  err = 0;
-+  switch (opt.secure_protocol)
-+    {
-+    case secure_protocol_auto:
-+      break;
-+    case secure_protocol_sslv2:
-+    case secure_protocol_sslv3:
-+      allowed_protocols[0] = GNUTLS_SSL3;
-+      err = gnutls_protocol_set_priority (session, allowed_protocols);
-+      break;
-+    case secure_protocol_tlsv1:
-+      allowed_protocols[0] = GNUTLS_TLS1_0;
-+      allowed_protocols[1] = GNUTLS_TLS1_1;
-+      allowed_protocols[2] = GNUTLS_TLS1_2;
-+      err = gnutls_protocol_set_priority (session, allowed_protocols);
-+      break;
-+    default:
-+      abort ();
-+    }
-+  if (err < 0)
-+    {
-+      logprintf (LOG_NOTQUIET, "GnuTLS: %s\n", gnutls_strerror (err));
-+      gnutls_deinit (session);
-+      return false;
-+    }
-+
-   err = gnutls_handshake (session);
-   if (err < 0)
-     {
-@@ -201,6 +288,7 @@
-       gnutls_deinit (session);
-       return false;
-     }
-+
-   ctx = xnew0 (struct wgnutls_transport_context);
-   ctx->session = session;
-   fd_register_transport (fd, &wgnutls_transport, ctx);
diff --git a/meta/recipes-extended/wget/wget-1.12/fix_makefile.patch b/meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch
similarity index 100%
rename from meta/recipes-extended/wget/wget-1.12/fix_makefile.patch
rename to meta/recipes-extended/wget/wget-1.13.4/fix_makefile.patch
diff --git a/meta/recipes-extended/wget/wget_1.12.bb b/meta/recipes-extended/wget/wget_1.13.4.bb
similarity index 43%
rename from meta/recipes-extended/wget/wget_1.12.bb
rename to meta/recipes-extended/wget/wget_1.13.4.bb
index cab27e9..b2da52f 100644
--- a/meta/recipes-extended/wget/wget_1.12.bb
+++ b/meta/recipes-extended/wget/wget_1.13.4.bb
@@ -1,11 +1,9 @@
 PR = "${INC_PR}.1"
 
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://gnutls.bzr.patch \
            file://fix_makefile.patch \
           "
-
-SRC_URI[md5sum] = "141461b9c04e454dc8933c9d1f2abf83"
-SRC_URI[sha256sum] = "7578ed0974e12caa71120581fa3962ee5a69f7175ddc3d6a6db0ecdcba65b572"
+SRC_URI[md5sum] = "1df489976a118b9cbe1b03502adbfc27"
+SRC_URI[sha256sum] = "24c7710bc9f220ce23d8a9e0f5673b0efc1cace62db6de0239b5863ecc934dcd"
 
 require wget.inc
-- 
1.7.6.4



