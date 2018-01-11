Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 745DC71B69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 21:16:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 13:16:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,346,1511856000"; d="scan'208";a="166070011"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 11 Jan 2018 13:16:59 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:16:57 -0800
Message-Id: <1515705417-84500-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] qemu-2.10.1.bb: support mingw build
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
X-List-Received-Date: Thu, 11 Jan 2018 21:16:58 -0000

The patch chardev-connect-socket-to-a-spawned-command.patch calls
"socketpair". This function is missing in mingw, so the patch
needs to be modified accordingly, otherwise we end up with a broken
mingw build.
While it is possible to simply remove the patch on a recipe level for
mingw platform, it makes more sense to modify the patch itself.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 ...ardev-connect-socket-to-a-spawned-command.patch | 37 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
index 49d4af2..4f85397 100644
--- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
@@ -55,10 +55,11 @@ diff --git a/chardev/char-socket.c b/chardev/char-socket.c
 index 1ae730a4..c366a02a 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
-@@ -854,6 +854,66 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
+@@ -854,6 +854,68 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
      return false;
  }
  
++#ifndef _WIN32  
 +static void chardev_open_socket_cmd(Chardev *chr,
 +                                    const char *cmd,
 +                                    Error **errp)
@@ -118,42 +119,51 @@ index 1ae730a4..c366a02a 100644
 +        object_unref(OBJECT(sioc));
 +    }
 +}
++#endif
 +
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
                                      bool *be_opened,
-@@ -861,6 +921,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -861,6 +923,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
++#ifndef _WIN32
 +    const char *cmd     = sock->cmd;
++#endif
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -928,7 +989,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -928,7 +993,15 @@ static void qmp_chardev_open_socket(Chardev *chr,
          s->reconnect_time = reconnect;
      }
  
 -    if (s->reconnect_time) {
++#ifndef _WIN32
 +    if (cmd) {
 +        chardev_open_socket_cmd(chr, cmd, errp);
 +
 +        /* everything ready (or failed permanently) before we return */
 +        *be_opened = true;
-+    } else if (s->reconnect_time) {
++    } else
++#endif
++	if (s->reconnect_time) {
          sioc = qio_channel_socket_new();
          tcp_chr_set_client_ioc_name(chr, sioc);
          qio_channel_socket_connect_async(sioc, s->addr,
-@@ -987,11 +1053,22 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -987,11 +1060,27 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *tls_creds = qemu_opt_get(opts, "tls-creds");
++#ifndef _WIN32
 +    const char *cmd = qemu_opt_get(opts, "cmd");
++#endif
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
      backend->type = CHARDEV_BACKEND_KIND_SOCKET;
 -    if (!path) {
++#ifndef _WIN32
 +    if (cmd) {
 +        /*
 +         * Here we have to ensure that no options are set which are incompatible with
@@ -164,24 +174,35 @@ index 1ae730a4..c366a02a 100644
 +            error_setg(errp, "chardev: socket: cmd does not support any additional options");
 +            return;
 +        }
-+    } else if (!path) {
++    } else
++#endif
++	if (!path) {
          if (!host) {
              error_setg(errp, "chardev: socket: no host given");
              return;
-@@ -1023,13 +1100,14 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1023,13 +1112,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
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
 -        q_unix->path = g_strdup(path);
++#ifndef _WIN32
 +        q_unix->path = cmd ? g_strdup_printf("cmd:%s", cmd) : g_strdup(path);
++#else
++	q_unix->path = g_strdup(path);
++#endif
      } else {
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
          addr->u.inet.data = g_new(InetSocketAddress, 1);
-- 
2.7.4


