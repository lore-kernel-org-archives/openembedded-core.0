Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAK4Y-0006VE-7w
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 13:55:58 +0100
Received: by mail-wg0-f49.google.com with SMTP id 15so3286273wgd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 04:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=kx4HztwTDGygCNdzsYx+lHcBiWOYiEpFutVWB305Lv0=;
	b=lmrbAu8dascJfM4nMtmktTyqUOPEB5j/BaWHFNShwtQ+P6aWToKq56nilh77ijCnVg
	7wcqOzYa5DLHSbNw7lO4b91wAJ0VvSCC/6saUbzxjxKU2/V87omZr3BjdXWXXgLUP8Xt
	V/+L5H6UMtvb65OlcpHpFHc0Vz9XvYWirBms7xWm0dYPcvkEXwcumY9WaUp6F8vAxiuO
	Hps0JHCyBUr1jqAVwPgLNk6KSpOtFh+eT+CRVUSEreh7Mg//V0pU5sBQLqNqOmk0zBLy
	Np9iJUeF1qcCFGkvOEQ45cw/oHbmoJXnAZBKKdMoeHOLRaSTtvv0Qf55JpU7Fch3CpOl
	pDRQ==
X-Received: by 10.180.87.98 with SMTP id w2mr19028519wiz.30.1361882375218;
	Tue, 26 Feb 2013 04:39:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id n10sm1722554wia.0.2013.02.26.04.39.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 04:39:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 12:37:10 +0000
Message-Id: <1361882230-8206-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnzk0bXGNCq9tQKjQ3Y9r9XVqvYYcD3N5UlpcHa+cKjumV5Z1WZsEyzUNVbW/HyHslXfoxs
Subject: [PATCH] dbus: set correct address when using --address=systemd:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 12:56:00 -0000
X-List-Received-Date: Tue, 26 Feb 2013 12:56:00 -0000

Patch taken from upstream 1.7 branch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../dbus/dbus-1.6.8/systemd-address.patch          |  187 ++++++++++++++++++++
 meta/recipes-core/dbus/dbus.inc                    |    1 +
 2 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch

diff --git a/meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch b/meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
new file mode 100644
index 0000000..ae1291c
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
@@ -0,0 +1,187 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From d728fdc655f17031da3bb129ab2fd17dadf0fe3a Mon Sep 17 00:00:00 2001
+From: Simon Peeters <peeters.simon@gmail.com>
+Date: Sun, 07 Oct 2012 14:59:30 +0000
+Subject: Set correct address when using --address=systemd:
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
+Signed-off-by: Simon Peeters <peeters.simon@gmail.com>
+---
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
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 4897fd3..affffbc 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -16,6 +16,7 @@ INC_PR = "r6"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
+           file://systemd-address.patch \
            file://dbus-1.init"
 
 inherit useradd autotools pkgconfig gettext update-rc.d
-- 
1.7.10.4



