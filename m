Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BEA5C74760
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 18:11:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 11:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="33200083"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.59])
	by orsmga007.jf.intel.com with ESMTP; 13 Apr 2018 11:11:14 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 11:11:03 -0700
Message-Id: <1523643063-39747-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com, alistair.francis@xilinx.com
Subject: [PATCH] qemu_2.11.1.bb: support mingw build
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
X-List-Received-Date: Fri, 13 Apr 2018 18:11:14 -0000

The patch chardev-connect-socket-to-a-spawned-command.patch calls
"socketpair". This function is missing in mingw, so the patch
needs to be modified accordingly (by conditional compilation using
_WIN32 macro where appropriate), otherwise we end up with a broken
mingw build.

While it is possible to simply remove the whole patch for mingw build
(via a .bbappend file in meta-mingw), it makes more sense to modify
the patch itself.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 ...ardev-connect-socket-to-a-spawned-command.patch | 46 +++++++++++++++-------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
index 32809d3..6e6bf95 100644
--- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
@@ -54,10 +54,11 @@ diff --git a/chardev/char-socket.c b/chardev/char-socket.c
 index 53eda8ef00..f566107c35 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
-@@ -852,6 +852,66 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
+@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
      return false;
  }
  
++#ifndef _WIN32
 +static void chardev_open_socket_cmd(Chardev *chr,
 +                                    const char *cmd,
 +                                    Error **errp)
@@ -117,42 +118,49 @@ index 53eda8ef00..f566107c35 100644
 +        object_unref(OBJECT(sioc));
 +    }
 +}
++#endif
 +
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
                                      bool *be_opened,
-@@ -859,6 +919,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -859,6 +921,9 @@
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
++#ifndef _WIN32
 +    const char *cmd     = sock->cmd;
++#endif
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -926,7 +987,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -925,7 +990,14 @@
+     } else if (reconnect > 0) {
          s->reconnect_time = reconnect;
      }
- 
--    if (s->reconnect_time) {
+-
++#ifndef _WIN32
 +    if (cmd) {
 +        chardev_open_socket_cmd(chr, cmd, errp);
 +
 +        /* everything ready (or failed permanently) before we return */
 +        *be_opened = true;
-+    } else if (s->reconnect_time) {
++    } else
++#endif
+     if (s->reconnect_time) {
          sioc = qio_channel_socket_new();
          tcp_chr_set_client_ioc_name(chr, sioc);
-         qio_channel_socket_connect_async(sioc, s->addr,
-@@ -985,11 +1051,22 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -985,10 +1057,26 @@
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *tls_creds = qemu_opt_get(opts, "tls-creds");
++#ifndef _WIN32
 +    const char *cmd = qemu_opt_get(opts, "cmd");
++#endif
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
      backend->type = CHARDEV_BACKEND_KIND_SOCKET;
--    if (!path) {
++#ifndef _WIN32
 +    if (cmd) {
 +        /*
 +         * Here we have to ensure that no options are set which are incompatible with
@@ -163,24 +171,33 @@ index 53eda8ef00..f566107c35 100644
 +            error_setg(errp, "chardev: socket: cmd does not support any additional options");
 +            return;
 +        }
-+    } else if (!path) {
++    } else
++#endif
+     if (!path) {
          if (!host) {
              error_setg(errp, "chardev: socket: no host given");
-             return;
-@@ -1021,13 +1098,14 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1021,13 +1109,24 @@
      sock->has_reconnect = true;
      sock->reconnect = reconnect;
      sock->tls_creds = g_strdup(tls_creds);
++#ifndef _WIN32
 +    sock->cmd = g_strdup(cmd);
++#endif
  
      addr = g_new0(SocketAddressLegacy, 1);
--    if (path) {
++#ifndef _WIN32
 +    if (path || cmd) {
++#else
+     if (path) {
++#endif
          UnixSocketAddress *q_unix;
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
          q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
--        q_unix->path = g_strdup(path);
++#ifndef _WIN32
 +        q_unix->path = cmd ? g_strdup_printf("cmd:%s", cmd) : g_strdup(path);
++#else
+         q_unix->path = g_strdup(path);
++#endif
      } else {
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
          addr->u.inet.data = g_new(InetSocketAddress, 1);
@@ -223,4 +240,3 @@ index ae19dcd1ed..6de0f29bcd 100644
                                       '*wait'      : 'bool',
 -- 
 2.14.1
-
-- 
2.7.4


