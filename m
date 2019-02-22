Return-Path: <george.mccollister@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4157CB98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 16:55:22 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id w2so1119440ybi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P+puxCMVEXPBKu6b8v+w/odlWJCtbGh58EVlG/ZVVRc=;
	b=vLXVzQqIqqZacXR/vBp5xCNsfYcZUq7VcWJZb9t6VLLk/RLKOFbpD47hCLmtFMmC7i
	A7jc9MOlfAGUevGN5WoURm0YoCAbxr90YYSMRnL2txFmW/e9tk1E44QoA7iRZskMpZI2
	aon4P2iJVGq+H43Axvgc33GwNBtEKNfAzzzcg74yj0/jW+o7yarNZi+57xsCiYzrYvPl
	9CqjDKzLIWC+ZG3d6STpsN0asCjiC9WSGr1pSIVrD14Do6xyQcfxvG3t7u1yfcMHzykq
	JrGbIDrIg0vEjE/GfyWQ3BIqm2jAKkPfXIHx21qpW/wENiK0ody9bKDJt8/ITYtZCnBP
	lZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P+puxCMVEXPBKu6b8v+w/odlWJCtbGh58EVlG/ZVVRc=;
	b=p8AO+H4DY/bpabpapfnXmmPxOi74hpbJpiR1Cue+eZE3KU5/ZtSJNBtwxPy1xLkHyV
	ctUbpJDeqySULzTNSop+inyZLpId1bEzDWh56tmhBmHHK5Nipug54tCIIcSlIF6yVWs0
	jjFfCt/HDvjbyQ26bOwhDsO6rIPwDyIjuLZTpKvUgCWBoDJVxInPptDgUU820X7q+Tzo
	FgMbDufcAFXefgH/RNbuT3cM/mjwRz3E0RMGXAyI2DCCZCx8SmgNAB2gXNnT9VEKAATE
	PkmlZoglybOuRVKvKI6xXPMfYccA+PIM0eEEB1EE9IGEtI4TycuO0ZhZVTX0tUP/lK3i
	aZgA==
X-Gm-Message-State: AHQUAub7XU63bsxj1bSQRuabsWyISi9Rkoo9uBtEjt+HRuiKAIvMyeEd
	Z6xqgub/RQZLyWyi2D2N51MztdA=
X-Google-Smtp-Source: AHgI3IYudHKlK/T7vLMoGnUPg4FPktco5ot9x8i2w5vugChRh5lfuab4SsGyn/gqYpoE/Fze0tYvKg==
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr4075828ybc.220.1550854523410;
	Fri, 22 Feb 2019 08:55:23 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	a190sm631672ywg.76.2019.02.22.08.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 08:55:22 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 10:54:50 -0600
Message-Id: <20190222165450.30773-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Fri, 22 Feb 2019 16:55:23 -0000
Content-Transfer-Encoding: 8bit

Apply patches from systemd_239-7ubuntu10.8 to fix CVE-2019-6454.
CVE-2019-6454 is an issue in which systemd (PID1) can be crashed with a
specially formed D-Bus message.

For information see:
https://usn.ubuntu.com/3891-1/
https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../systemd/systemd/CVE-2019-6454.patch       | 210 ++++++++++++++++++
 ...eive-an-invalid-dbus-message-ignore-.patch |  61 +++++
 meta/recipes-core/systemd/systemd_239.bb      |   2 +
 3 files changed, 273 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
 create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch b/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
new file mode 100644
index 0000000000..80170dac0f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
@@ -0,0 +1,210 @@
+Description: sd-bus: enforce a size limit for dbus paths, and don't allocate
+ them on the stacka
+Forwarded: no
+
+Patch from: systemd_239-7ubuntu10.8
+
+For information see:
+https://usn.ubuntu.com/3891-1/
+https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
+
+CVE: CVE-2019-6454
+Upstream-Status: Backport
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+--- a/src/libsystemd/sd-bus/bus-internal.c
++++ b/src/libsystemd/sd-bus/bus-internal.c
+@@ -45,7 +45,7 @@
+         if (slash)
+                 return false;
+
+-        return true;
++        return (q - p) <= BUS_PATH_SIZE_MAX;
+ }
+
+ char* object_path_startswith(const char *a, const char *b) {
+--- a/src/libsystemd/sd-bus/bus-internal.h
++++ b/src/libsystemd/sd-bus/bus-internal.h
+@@ -333,6 +333,10 @@
+
+ #define BUS_MESSAGE_SIZE_MAX (128*1024*1024)
+ #define BUS_AUTH_SIZE_MAX (64*1024)
++/* Note that the D-Bus specification states that bus paths shall have no size limit. We enforce here one
++ * anyway, since truly unbounded strings are a security problem. The limit we pick is relatively large however,
++ * to not clash unnecessarily with real-life applications. */
++#define BUS_PATH_SIZE_MAX (64*1024)
+
+ #define BUS_CONTAINER_DEPTH 128
+
+--- a/src/libsystemd/sd-bus/bus-objects.c
++++ b/src/libsystemd/sd-bus/bus-objects.c
+@@ -1134,7 +1134,8 @@
+                 const char *path,
+                 sd_bus_error *error) {
+
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+
+         assert(bus);
+@@ -1150,7 +1151,12 @@
+                 return 0;
+
+         /* Second, add fallback vtables registered for any of the prefixes */
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_manager_serialize_path(bus, reply, prefix, path, true, error);
+                 if (r < 0)
+@@ -1346,6 +1352,7 @@
+ }
+
+ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
++        _cleanup_free_ char *prefix = NULL;
+         int r;
+         size_t pl;
+         bool found_object = false;
+@@ -1370,9 +1377,12 @@
+         assert(m->member);
+
+         pl = strlen(m->path);
+-        do {
+-                char prefix[pl+1];
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
+
++        do {
+                 bus->nodes_modified = false;
+
+                 r = object_find_and_run(bus, m, m->path, false, &found_object);
+@@ -1499,9 +1509,15 @@
+
+         n = hashmap_get(bus->nodes, path);
+         if (!n) {
+-                char *prefix;
++                _cleanup_free_ char *prefix = NULL;
++                size_t pl;
++
++                pl = strlen(path);
++                assert(pl <= BUS_PATH_SIZE_MAX);
++                prefix = new(char, pl + 1);
++                if (!prefix)
++                        return -ENOMEM;
+
+-                prefix = alloca(strlen(path) + 1);
+                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                         n = hashmap_get(bus->nodes, prefix);
+                         if (n)
+@@ -2091,8 +2107,9 @@
+                 char **names) {
+
+         BUS_DONT_DESTROY(bus);
++        _cleanup_free_ char *prefix = NULL;
+         bool found_interface = false;
+-        char *prefix;
++        size_t pl;
+         int r;
+
+         assert_return(bus, -EINVAL);
+@@ -2111,6 +2128,12 @@
+         if (names && names[0] == NULL)
+                 return 0;
+
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         do {
+                 bus->nodes_modified = false;
+
+@@ -2120,7 +2143,6 @@
+                 if (bus->nodes_modified)
+                         continue;
+
+-                prefix = alloca(strlen(path) + 1);
+                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                         r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
+                         if (r != 0)
+@@ -2252,7 +2274,8 @@
+
+ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
+         _cleanup_set_free_ Set *s = NULL;
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+
+         assert(bus);
+@@ -2297,7 +2320,12 @@
+         if (bus->nodes_modified)
+                 return 0;
+
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_added_append_all_prefix(bus, m, s, prefix, path, true);
+                 if (r < 0)
+@@ -2436,7 +2464,8 @@
+
+ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
+         _cleanup_set_free_ Set *s = NULL;
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+
+         assert(bus);
+@@ -2468,7 +2497,12 @@
+         if (bus->nodes_modified)
+                 return 0;
+
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_removed_append_all_prefix(bus, m, s, prefix, path, true);
+                 if (r < 0)
+@@ -2618,7 +2652,8 @@
+                 const char *path,
+                 const char *interface) {
+
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+
+         assert(bus);
+@@ -2632,7 +2667,12 @@
+         if (bus->nodes_modified)
+                 return 0;
+
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = interfaces_added_append_one_prefix(bus, m, prefix, path, interface, true);
+                 if (r != 0)
diff --git a/meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch b/meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
new file mode 100644
index 0000000000..57311faa60
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
@@ -0,0 +1,61 @@
+Description: sd-bus: if we receive an invalid dbus message, ignore and
+ proceeed
+ .
+ dbus-daemon might have a slightly different idea of what a valid msg is
+ than us (for example regarding valid msg and field sizes). Let's hence
+ try to proceed if we can and thus drop messages rather than fail the
+ connection if we fail to validate a message.
+ .
+ Hopefully the differences in what is considered valid are not visible
+ for real-life usecases, but are specific to exploit attempts only.
+Author: Lennart Poettering <lennart@poettering.net>
+Forwarded: other,https://github.com/systemd/systemd/pull/11708/
+
+Patch from: systemd_239-7ubuntu10.8
+
+For information see:
+https://usn.ubuntu.com/3891-1/
+https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
+
+CVE: CVE-2019-6454
+Upstream-Status: Backport
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
+index 30d6455b6f..441b4a816f 100644
+--- a/src/libsystemd/sd-bus/bus-socket.c
++++ b/src/libsystemd/sd-bus/bus-socket.c
+@@ -1072,7 +1072,7 @@ static int bus_socket_read_message_need(sd_bus *bus, size_t *need) {
+ }
+
+ static int bus_socket_make_message(sd_bus *bus, size_t size) {
+-        sd_bus_message *t;
++        sd_bus_message *t = NULL;
+         void *b;
+         int r;
+
+@@ -1097,7 +1097,9 @@ static int bus_socket_make_message(sd_bus *bus, size_t size) {
+                                     bus->fds, bus->n_fds,
+                                     NULL,
+                                     &t);
+-        if (r < 0) {
++        if (r == -EBADMSG)
++                log_debug_errno(r, "Received invalid message from connection %s, dropping.", strna(bus->description));
++        else if (r < 0) {
+                 free(b);
+                 return r;
+         }
+@@ -1108,7 +1110,8 @@ static int bus_socket_make_message(sd_bus *bus, size_t size) {
+         bus->fds = NULL;
+         bus->n_fds = 0;
+
+-        bus->rqueue[bus->rqueue_size++] = t;
++        if (t)
++                bus->rqueue[bus->rqueue_size++] = t;
+
+         return 1;
+ }
+--
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index e2dfe639b3..922ba3b57d 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -41,6 +41,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            file://0025-journald-set-a-limit-on-the-number-of-fields.patch \
            file://0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
+           file://CVE-2019-6454.patch \
+           file://sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.20.1


