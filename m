Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFD278D80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:09:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6V79nd8031121
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:09:49 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 00:09:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 15:13:42 +0800
Message-ID: <5b9216067aa6aef5a8df3bd3a48c0229415dc253.1533021154.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533021154.git.Qi.Chen@windriver.com>
References: <cover.1533021154.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] systemd: backport patch to allow setting dbus calls timeout
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
X-List-Received-Date: Tue, 31 Jul 2018 07:09:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Backport 0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
which allows setting dbus calls timeout via BUS_DEFAULT_TIMEOUT
environment variable.

This is needed as we are meeting timeout failures from the oeqa
runtime test case systemd.py.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch | 175 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch b/meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
new file mode 100644
index 0000000..45c9b5b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch
@@ -0,0 +1,175 @@
+From 5b75a72ee968c9666b5f2ea313720b6c383cb4c2 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Fri, 13 Jul 2018 17:38:47 +0900
+Subject: [PATCH] sd-bus: make BUS_DEFAULT_TIMEOUT configurable
+
+This adds sd_bus_{get,set}_method_call_timeout().
+If the timeout is not set or set to 0, then the timeout value is
+parsed from $SYSTEMD_BUS_TIMEOUT= environment variable. If the
+environment variable is not set, then built-in timeout is used.
+---
+ doc/ENVIRONMENT.md                   |  5 +++++
+ src/libsystemd/libsystemd.sym        |  5 +++++
+ src/libsystemd/sd-bus/bus-internal.h |  9 ++++----
+ src/libsystemd/sd-bus/bus-message.c  |  7 +++++--
+ src/libsystemd/sd-bus/sd-bus.c       | 40 ++++++++++++++++++++++++++++++++++--
+ src/systemd/sd-bus.h                 |  3 +++
+ 6 files changed, 61 insertions(+), 8 deletions(-)
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+diff --git a/doc/ENVIRONMENT.md b/doc/ENVIRONMENT.md
+index 85d26fe28c..641a03d5d7 100644
+--- a/doc/ENVIRONMENT.md
++++ b/doc/ENVIRONMENT.md
+@@ -37,6 +37,11 @@ All tools:
+   useful for debugging, in order to test generators and other code against
+   specific kernel command lines.
+ 
++* `$SYSTEMD_BUS_TIMEOUT=SECS` — specifies the maximum time to wait for method call
++  completion. If no time unit is specified, assumes seconds. The usual other units
++  are understood, too (us, ms, s, min, h, d, w, month, y). If it is not set or set
++  to 0, then the built-in default is used.
++
+ systemctl:
+ 
+ * `$SYSTEMCTL_FORCE_BUS=1` — if set, do not connect to PID1's private D-Bus
+diff --git a/src/libsystemd/libsystemd.sym b/src/libsystemd/libsystemd.sym
+index 1eec17db50..006dbc9c3f 100644
+--- a/src/libsystemd/libsystemd.sym
++++ b/src/libsystemd/libsystemd.sym
+@@ -570,3 +570,8 @@ global:
+         sd_event_source_set_destroy_callback;
+         sd_event_source_get_destroy_callback;
+ } LIBSYSTEMD_238;
++
++LIBSYSTEMD_240 {
++        sd_bus_set_method_call_timeout;
++        sd_bus_get_method_call_timeout;
++} LIBSYSTEMD_239;
+diff --git a/src/libsystemd/sd-bus/bus-internal.h b/src/libsystemd/sd-bus/bus-internal.h
+index 2087ef8eeb..4864b1e911 100644
+--- a/src/libsystemd/sd-bus/bus-internal.h
++++ b/src/libsystemd/sd-bus/bus-internal.h
+@@ -319,6 +319,9 @@ struct sd_bus {
+ 
+         int *inotify_watches;
+         size_t n_inotify_watches;
++
++        /* zero means use value specified by $SYSTEMD_BUS_TIMEOUT= environment variable or built-in default */
++        usec_t method_call_timeout;
+ };
+ 
+ /* For method calls we time-out at 25s, like in the D-Bus reference implementation */
+@@ -336,8 +339,7 @@ struct sd_bus {
+ 
+ #define BUS_CONTAINER_DEPTH 128
+ 
+-/* Defined by the specification as maximum size of an array in
+- * bytes */
++/* Defined by the specification as maximum size of an array in bytes */
+ #define BUS_ARRAY_MAX_SIZE 67108864
+ 
+ #define BUS_FDS_MAX 1024
+@@ -388,8 +390,7 @@ void bus_close_io_fds(sd_bus *b);
+              _slash = streq((prefix), "/") ? NULL : strrchr((prefix), '/'))
+ 
+ /* If we are invoking callbacks of a bus object, ensure unreffing the
+- * bus from the callback doesn't destroy the object we are working
+- * on */
++ * bus from the callback doesn't destroy the object we are working on */
+ #define BUS_DONT_DESTROY(bus) \
+         _cleanup_(sd_bus_unrefp) _unused_ sd_bus *_dont_destroy_##bus = sd_bus_ref(bus)
+ 
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index 8d92bc2002..dffe70a665 100644
+--- a/src/libsystemd/sd-bus/bus-message.c
++++ b/src/libsystemd/sd-bus/bus-message.c
+@@ -5809,8 +5809,11 @@ int bus_message_remarshal(sd_bus *bus, sd_bus_message **m) {
+                 return r;
+ 
+         timeout = (*m)->timeout;
+-        if (timeout == 0 && !((*m)->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED))
+-                timeout = BUS_DEFAULT_TIMEOUT;
++        if (timeout == 0 && !((*m)->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)) {
++                r = sd_bus_get_method_call_timeout(bus, &timeout);
++                if (r < 0)
++                        return r;
++        }
+ 
+         r = sd_bus_message_seal(n, BUS_MESSAGE_COOKIE(*m), timeout);
+         if (r < 0)
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index 089b51a6d9..945490ebf7 100644
+--- a/src/libsystemd/sd-bus/sd-bus.c
++++ b/src/libsystemd/sd-bus/sd-bus.c
+@@ -1611,8 +1611,11 @@ static int bus_seal_message(sd_bus *b, sd_bus_message *m, usec_t timeout) {
+                 return 0;
+         }
+ 
+-        if (timeout == 0)
+-                timeout = BUS_DEFAULT_TIMEOUT;
++        if (timeout == 0) {
++                r = sd_bus_get_method_call_timeout(b, &timeout);
++                if (r < 0)
++                        return r;
++        }
+ 
+         if (!m->sender && b->patch_sender) {
+                 r = sd_bus_message_set_sender(m, b->patch_sender);
+@@ -4075,3 +4078,36 @@ _public_ int sd_bus_get_n_queued_write(sd_bus *bus, uint64_t *ret) {
+         *ret = bus->wqueue_size;
+         return 0;
+ }
++
++_public_ int sd_bus_set_method_call_timeout(sd_bus *bus, uint64_t usec) {
++        assert_return(bus, -EINVAL);
++        assert_return(bus = bus_resolve(bus), -ENOPKG);
++
++        bus->method_call_timeout = usec;
++        return 0;
++}
++
++_public_ int sd_bus_get_method_call_timeout(sd_bus *bus, uint64_t *ret) {
++        const char *e;
++        usec_t usec;
++
++        assert_return(bus, -EINVAL);
++        assert_return(bus = bus_resolve(bus), -ENOPKG);
++        assert_return(ret, -EINVAL);
++
++        if (bus->method_call_timeout != 0) {
++                *ret = bus->method_call_timeout;
++                return 0;
++        }
++
++        e = secure_getenv("SYSTEMD_BUS_TIMEOUT");
++        if (e && parse_sec(e, &usec) >= 0 && usec != 0) {
++                /* Save the parsed value to avoid multiple parsing. To change the timeout value,
++                 * use sd_bus_set_method_call_timeout() instead of setenv(). */
++                *ret = bus->method_call_timeout = usec;
++                return 0;
++        }
++
++        *ret = bus->method_call_timeout = BUS_DEFAULT_TIMEOUT;
++        return 0;
++}
+diff --git a/src/systemd/sd-bus.h b/src/systemd/sd-bus.h
+index 54c4b1ca83..c9fd254834 100644
+--- a/src/systemd/sd-bus.h
++++ b/src/systemd/sd-bus.h
+@@ -206,6 +206,9 @@ sd_event *sd_bus_get_event(sd_bus *bus);
+ int sd_bus_get_n_queued_read(sd_bus *bus, uint64_t *ret);
+ int sd_bus_get_n_queued_write(sd_bus *bus, uint64_t *ret);
+ 
++int sd_bus_set_method_call_timeout(sd_bus *bus, uint64_t usec);
++int sd_bus_get_method_call_timeout(sd_bus *bus, uint64_t *ret);
++
+ int sd_bus_add_filter(sd_bus *bus, sd_bus_slot **slot, sd_bus_message_handler_t callback, void *userdata);
+ int sd_bus_add_match(sd_bus *bus, sd_bus_slot **slot, const char *match, sd_bus_message_handler_t callback, void *userdata);
+ int sd_bus_add_match_async(sd_bus *bus, sd_bus_slot **slot, const char *match, sd_bus_message_handler_t callback, sd_bus_message_handler_t install_callback, void *userdata);
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index dc1545a..001a363 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch \
            file://0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
            file://0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch \
+           file://0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
1.9.1


