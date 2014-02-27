Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 407B36F1BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:22:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1R3MODF018585
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 19:22:24 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 26 Feb 2014 19:22:24 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2014 11:23:28 +0800
Message-ID: <1393471408-29014-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] dbus: proper error handler should be given after send_negotiate_unix_fd failed
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
X-List-Received-Date: Thu, 27 Feb 2014 03:22:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Once send_negotiate_unix_fd failed, this failure will happen, since
auth->guid_from_server has been set to some value before
send_negotiate_unix_fd. send_negotiate_unix_fd failure will lead to
this auth be handled by process_ok again, but this auth->guid_from_server
is not zero.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb        |    1 +
 meta/recipes-core/dbus/dbus.inc                    |    1 +
 ...guid_from_server-if-send_negotiate_unix_f.patch |  104 ++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index 30e8223..bc260de 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init  \
            file://run-ptest \
            file://python-config.patch \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
 SRC_URI[md5sum] = "b02e9c95027a416987b81f9893831061"
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index db47ede..677ff78 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://os-test.patch \
+           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
 inherit useradd autotools pkgconfig gettext update-rc.d
diff --git a/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch b/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
new file mode 100644
index 0000000..6bb6d9c
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
@@ -0,0 +1,104 @@
+From b8f84bd39485d3977625c9a8b8e8cff5d23be56f Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 27 Feb 2014 09:05:02 +0800
+Subject: [PATCH] dbus: clear guid_from_server if send_negotiate_unix_fd
+ failed
+
+Upstream-Status: Submitted
+
+bus-test dispatch test failed with below information:
+    ./bus/bus-test: Running message dispatch test
+    Activating service name='org.freedesktop.DBus.TestSuiteEchoService'
+    Successfully activated service 'org.freedesktop.DBus.TestSuiteEchoService'
+    6363: assertion failed "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0" file "dbus-auth.c" line 1545 function process_ok
+      ./bus/bus-test(_dbus_print_backtrace+0x29) [0x80cb969]
+      ./bus/bus-test(_dbus_abort+0x14) [0x80cfb44]
+      ./bus/bus-test(_dbus_real_assert+0x53) [0x80b52c3]
+      ./bus/bus-test() [0x80e24da]
+      ./bus/bus-test(_dbus_auth_do_work+0x388) [0x80e3848]
+      ./bus/bus-test() [0x80aea49]
+      ./bus/bus-test() [0x80affde]
+      ./bus/bus-test(_dbus_transport_handle_watch+0xb1) [0x80ad841]
+      ./bus/bus-test(_dbus_connection_handle_watch+0x104) [0x8089174]
+      ./bus/bus-test(dbus_watch_handle+0xd8) [0x80b15e8]
+      ./bus/bus-test(_dbus_loop_iterate+0x4a9) [0x80d1509]
+      ./bus/bus-test(bus_test_run_clients_loop+0x5d) [0x808129d]
+      ./bus/bus-test() [0x806cab0]
+      ./bus/bus-test() [0x806e0ca]
+      ./bus/bus-test() [0x806da6f]
+      ./bus/bus-test(_dbus_test_oom_handling+0x18c) [0x80b5c8c]
+      ./bus/bus-test() [0x806f723]
+      ./bus/bus-test(bus_dispatch_test+0x3c) [0x8071aac]
+      ./bus/bus-test(main+0x1b7) [0x805acc7]
+      /lib/libc.so.6(__libc_start_main+0xf3) [0x45f919b3]
+      ./bus/bus-test() [0x805ae39]
+
+The stack is below:
+    #0  0xffffe425 in __kernel_vsyscall ()
+    #1  0x45fa62d6 in raise () from /lib/libc.so.6
+    #2  0x45fa9653 in abort () from /lib/libc.so.6
+    #3  0x080cfb65 in _dbus_abort () at dbus-sysdeps.c:94
+    #4  0x080b52c3 in _dbus_real_assert (condition=0,
+        condition_text=condition_text@entry=0x8117a38 "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0",
+        file=file@entry=0x8117273 "dbus-auth.c", line=line@entry=1545,
+        func=func@entry=0x8117f8e <__FUNCTION__.3492> "process_ok")
+        data=0x8157290) at dbus-connection.c:1515
+    #0  0x00000033fee353e9 in raise () from /lib64/libc.so.6
+    #1  0x00000033fee38508 in abort () from /lib64/libc.so.6
+    #2  0x000000000047d585 in _dbus_abort () at dbus-sysdeps.c:94
+    #3  0x0000000000466486 in _dbus_real_assert (condition=<optimized out>,
+        condition_text=condition_text@entry=0x4c2988 "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0",
+        file=file@entry=0x4c21a5 "dbus-auth.c", line=line@entry=1546,
+        func=func@entry=0x4c2fce <__FUNCTION__.3845> "process_ok")
+        at dbus-internals.c:931
+    #4  0x000000000048d424 in process_ok (args_from_ok=0x7fffffffe480,
+        auth=0x6ff340) at dbus-auth.c:1546
+    #5  handle_client_state_waiting_for_data (auth=0x6ff340,
+        command=<optimized out>, args=0x7fffffffe480) at dbus-auth.c:1996
+    #6  0x000000000048e789 in process_command (auth=0x6ff340) at dbus-auth.c:2208
+    #7  _dbus_auth_do_work (auth=0x6ff340) at dbus-auth.c:2458
+    #8  0x000000000046091d in do_authentication (
+        transport=transport@entry=0x6ffaa0, do_reading=do_reading@entry=1,
+        do_writing=do_writing@entry=0,
+        auth_completed=auth_completed@entry=0x7fffffffe55c)
+        at dbus-transport-socket.c:442
+    #9  0x0000000000461d08 in socket_handle_watch (transport=0x6ffaa0,
+        watch=0x6f4190, flags=1) at dbus-transport-socket.c:921
+    #10 0x000000000045fa3a in _dbus_transport_handle_watch (transport=0x6ffaa0,
+
+Once send_negotiate_unix_fd failed, this failure will happen, since
+auth->guid_from_server has been set to some value before
+send_negotiate_unix_fd. send_negotiate_unix_fd failure will lead to
+this auth be handled by process_ok again, but this auth->guid_from_server
+is not zero.
+
+So we should clear auth->guid_from_server if send_negotiate_unix_fd failed
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ dbus/dbus-auth.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/dbus/dbus-auth.c b/dbus/dbus-auth.c
+index d2c37a7..37b45c6 100644
+--- a/dbus/dbus-auth.c
++++ b/dbus/dbus-auth.c
+@@ -1571,8 +1571,13 @@ process_ok(DBusAuth *auth,
+   _dbus_verbose ("Got GUID '%s' from the server\n",
+                  _dbus_string_get_const_data (& DBUS_AUTH_CLIENT (auth)->guid_from_server));
+ 
+-  if (auth->unix_fd_possible)
+-    return send_negotiate_unix_fd(auth);
++  if (auth->unix_fd_possible) {
++     if (!send_negotiate_unix_fd(auth)) {
++         _dbus_string_set_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server, 0);
++         return FALSE;
++     }
++     return TRUE;
++  }
+ 
+   _dbus_verbose("Not negotiating unix fd passing, since not possible\n");
+   return send_begin (auth);
+-- 
+1.7.10.4
+
-- 
1.7.10.4


