Return-Path: <net147@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3043C6CA54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 02:44:16 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so10749135pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ri3bllQYPlE5qdU0uiPi5I0PhsZaslJM94CCViwGX1w=;
	b=j4P4hcqRXyNO9JamrWMlXjDWdmaIXUTSs+rZ7j+vVhD/oVIvPAK20qXSrJMco7CHWt
	YWOOv/FKjWWIe1yBJe5Y8dKRoVI9auoRjKDoabTQBHGJPhFuAVAnSHzqZbJwrD+QoFAH
	pwEPb98LVh7+iwcVAeGhFTcKy4u1P3RHyeUGpePCp09Re7Ygs22VdlTcwZhN7zcgrLoc
	W98dKJ3KFlI5bGZKUoplZQvraee3Ya+EsLT7faAGozEVvn1Qhf6cGhcH0+Uu4qn3y5hq
	bYEBO20B6UvvE2AUKRmp+7JxpVFD1GnPJd1Sf0AgK11KwZ60oGGjzwMGC5Mb3lCKfYYe
	Boxg==
X-Received: by 10.68.125.164 with SMTP id mr4mr34542632pbb.27.1396406657321;
	Tue, 01 Apr 2014 19:44:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id np9sm860192pbc.31.2014.04.01.19.44.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 19:44:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 13:50:08 +1100
Message-Id: <1396407010-6283-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 1/3] dbus: backport fix for bus activation under systemd session
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
X-List-Received-Date: Wed, 02 Apr 2014 02:44:20 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc                    |   1 +
 ...orrect-address-when-using-address-systemd.patch | 193 +++++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 677ff78..5d57ff4 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://Set-correct-address-when-using-address-systemd.patch \
 "
 
 inherit useradd autotools pkgconfig gettext update-rc.d
diff --git a/meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch b/meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
new file mode 100644
index 0000000..1fca9bb
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
@@ -0,0 +1,193 @@
+From d728fdc655f17031da3bb129ab2fd17dadf0fe3a Mon Sep 17 00:00:00 2001
+From: Simon Peeters <peeters.simon@gmail.com>
+Date: Sun, 7 Oct 2012 16:59:30 +0200
+Subject: [PATCH] Set correct address when using --address=systemd:
+
+When dbus gets launched through systemd, we need to create an address
+string based on the sockets passed.
+
+The _dbus_append_addres_from_socket() function is responsible for
+extracting the address information from the file-descriptor and
+formatting it in a dbus friendly way.
+
+This fixes bus activation when running dbus under a systemd session.
+
+https://bugs.freedesktop.org/show_bug.cgi?id=50962
+
+Upstream-Status: Backport
+
+Signed-off-by: Simon Peeters <peeters.simon@gmail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ dbus/dbus-server-unix.c  | 38 ++++++++++++++++++---------
+ dbus/dbus-sysdeps-unix.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++
+ dbus/dbus-sysdeps-unix.h |  4 +++
+ 3 files changed, 97 insertions(+), 13 deletions(-)
+
+diff --git a/dbus/dbus-server-unix.c b/dbus/dbus-server-unix.c
+index 130f66e..d995240 100644
+--- a/dbus/dbus-server-unix.c
++++ b/dbus/dbus-server-unix.c
+@@ -149,7 +149,7 @@ _dbus_server_listen_platform_specific (DBusAddressEntry *entry,
+     }
+   else if (strcmp (method, "systemd") == 0)
+     {
+-      int n, *fds;
++      int i, n, *fds;
+       DBusString address;
+ 
+       n = _dbus_listen_systemd_sockets (&fds, error);
+@@ -159,27 +159,39 @@ _dbus_server_listen_platform_specific (DBusAddressEntry *entry,
+           return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
+         }
+ 
+-      _dbus_string_init_const (&address, "systemd:");
++      if (!_dbus_string_init (&address))
++          goto systemd_oom;
+ 
+-      *server_p = _dbus_server_new_for_socket (fds, n, &address, NULL);
+-      if (*server_p == NULL)
++      for (i = 0; i < n; i++)
+         {
+-          int i;
+-
+-          for (i = 0; i < n; i++)
++          if (i > 0)
+             {
+-              _dbus_close_socket (fds[i], NULL);
++              if (!_dbus_string_append (&address, ";"))
++                goto systemd_oom;
+             }
+-          dbus_free (fds);
+-
+-          dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
+-          return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
++          if (!_dbus_append_address_from_socket (fds[i], &address, error))
++            goto systemd_err;
+         }
+ 
++      *server_p = _dbus_server_new_for_socket (fds, n, &address, NULL);
++      if (*server_p == NULL)
++        goto systemd_oom;
++
+       dbus_free (fds);
+ 
+       return DBUS_SERVER_LISTEN_OK;
+-	}
++  systemd_oom:
++      _DBUS_SET_OOM (error);
++  systemd_err:
++      for (i = 0; i < n; i++)
++        {
++          _dbus_close_socket (fds[i], NULL);
++        }
++      dbus_free (fds);
++      _dbus_string_free (&address);
++
++      return DBUS_SERVER_LISTEN_DID_NOT_CONNECT;
++    }
+ #ifdef DBUS_ENABLE_LAUNCHD
+   else if (strcmp (method, "launchd") == 0)
+     {
+diff --git a/dbus/dbus-sysdeps-unix.c b/dbus/dbus-sysdeps-unix.c
+index b4ecc96..55743b1 100644
+--- a/dbus/dbus-sysdeps-unix.c
++++ b/dbus/dbus-sysdeps-unix.c
+@@ -55,6 +55,7 @@
+ #include <netinet/in.h>
+ #include <netdb.h>
+ #include <grp.h>
++#include <arpa/inet.h>
+ 
+ #ifdef HAVE_ERRNO_H
+ #include <errno.h>
+@@ -4160,4 +4161,71 @@ _dbus_check_setuid (void)
+ #endif
+ }
+ 
++/**
++ * Read the address from the socket and append it to the string
++ *
++ * @param fd the socket
++ * @param address
++ * @param error return location for error code
++ */
++dbus_bool_t
++_dbus_append_address_from_socket (int         fd,
++                                  DBusString *address,
++                                  DBusError  *error)
++{
++  union {
++      struct sockaddr sa;
++      struct sockaddr_storage storage;
++      struct sockaddr_un un;
++      struct sockaddr_in ipv4;
++      struct sockaddr_in6 ipv6;
++  } socket;
++  char hostip[INET6_ADDRSTRLEN];
++  int size = sizeof (socket);
++
++  if (getsockname (fd, &socket.sa, &size))
++    goto err;
++
++  switch (socket.sa.sa_family)
++    {
++    case AF_UNIX:
++      if (socket.un.sun_path[0]=='\0')
++        {
++          if (_dbus_string_append_printf (address, "unix:abstract=%s", &(socket.un.sun_path[1])))
++            return TRUE;
++        }
++      else
++        {
++          if (_dbus_string_append_printf (address, "unix:path=%s", socket.un.sun_path))
++            return TRUE;
++        }
++      break;
++    case AF_INET:
++      if (inet_ntop (AF_INET, &socket.ipv4.sin_addr, hostip, sizeof (hostip)))
++        if (_dbus_string_append_printf (address, "tcp:family=ipv4,host=%s,port=%u",
++                   hostip, ntohs (socket.ipv4.sin_port)))
++          return TRUE;
++      break;
++#ifdef AF_INET6
++    case AF_INET6:
++      if (inet_ntop (AF_INET6, &socket.ipv6.sin6_addr, hostip, sizeof (hostip)))
++        if (_dbus_string_append_printf (address, "tcp:family=ipv6,host=%s,port=%u",
++                   hostip, ntohs (socket.ipv6.sin6_port)))
++          return TRUE;
++      break;
++#endif
++    default:
++      dbus_set_error (error,
++                      _dbus_error_from_errno (EINVAL),
++                      "Failed to read address from socket: Unknown socket type.");
++      return FALSE;
++    }
++ err:
++  dbus_set_error (error,
++                  _dbus_error_from_errno (errno),
++                  "Failed to open socket: %s",
++                  _dbus_strerror (errno));
++  return FALSE;
++}
++
+ /* tests in dbus-sysdeps-util.c */
+diff --git a/dbus/dbus-sysdeps-unix.h b/dbus/dbus-sysdeps-unix.h
+index 9b70896..a265b33 100644
+--- a/dbus/dbus-sysdeps-unix.h
++++ b/dbus/dbus-sysdeps-unix.h
+@@ -138,6 +138,10 @@ dbus_bool_t _dbus_parse_uid (const DBusString  *uid_str,
+ 
+ void _dbus_close_all (void);
+ 
++dbus_bool_t _dbus_append_address_from_socket (int         fd,
++                                              DBusString *address,
++                                              DBusError  *error);
++
+ /** @} */
+ 
+ DBUS_END_DECLS
+-- 
+1.9.0
+
-- 
1.9.0


