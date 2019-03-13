Return-Path: <marcus.cooper@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A468D6B90D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 13:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2B86818530
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:22 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id J6vrQgFsUEGW
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:20 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C93D31849F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:20 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF501E0D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:20 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 709961E0C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:20 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:20 +0100 (CET)
Received: from lnxmarcusc.se.axis.com (lnxmarcusc.se.axis.com [10.92.157.1])
	by seth.se.axis.com (Postfix) with ESMTP id 644AE5DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:07:20 +0100 (CET)
Received: by lnxmarcusc.se.axis.com (Postfix, from userid 11391)
	id 572C9943D4; Wed, 13 Mar 2019 14:07:20 +0100 (CET)
From: Marcus Cooper <marcus.cooper@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 14:07:15 +0100
Message-Id: <20190313130715.9014-1-marcusc@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
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
X-List-Received-Date: Wed, 13 Mar 2019 13:07:22 -0000

The original fix was deleted when systemd was bumped from v239 to v241,
however not all of the patches have made it into the latest version.

Refactor the original patch to contain the missing changes.

Signed-off-by: Marcus Cooper <marcusc@axis.com>
---
 .../systemd/systemd/CVE-2019-6454.patch            | 216 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb           |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch b/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
new file mode 100644
index 0000000000..b84809ef17
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
@@ -0,0 +1,216 @@
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
+diff --git a/src/libsystemd/sd-bus/bus-internal.c b/src/libsystemd/sd-bus/bus-internal.c
+index 40acae2133..598b7f110c 100644
+--- a/src/libsystemd/sd-bus/bus-internal.c
++++ b/src/libsystemd/sd-bus/bus-internal.c
+@@ -43,7 +43,7 @@ bool object_path_is_valid(const char *p) {
+         if (slash)
+                 return false;
+ 
+-        return true;
++        return (q - p) <= BUS_PATH_SIZE_MAX;
+ }
+ 
+ char* object_path_startswith(const char *a, const char *b) {
+diff --git a/src/libsystemd/sd-bus/bus-internal.h b/src/libsystemd/sd-bus/bus-internal.h
+index f208b294d8..a8d61bf72a 100644
+--- a/src/libsystemd/sd-bus/bus-internal.h
++++ b/src/libsystemd/sd-bus/bus-internal.h
+@@ -332,6 +332,10 @@ struct sd_bus {
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
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index 58329f3fe7..54b977418e 100644
+--- a/src/libsystemd/sd-bus/bus-objects.c
++++ b/src/libsystemd/sd-bus/bus-objects.c
+@@ -1133,7 +1133,8 @@ static int object_manager_serialize_path_and_fallbacks(
+                 const char *path,
+                 sd_bus_error *error) {
+ 
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -1149,7 +1150,12 @@ static int object_manager_serialize_path_and_fallbacks(
+                 return 0;
+ 
+         /* Second, add fallback vtables registered for any of the prefixes */
+-        prefix = newa(char, strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_manager_serialize_path(bus, reply, prefix, path, true, error);
+                 if (r < 0)
+@@ -1345,6 +1351,7 @@ static int object_find_and_run(
+ }
+ 
+ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
++        _cleanup_free_ char *prefix = NULL;
+         int r;
+         size_t pl;
+         bool found_object = false;
+@@ -1369,9 +1376,12 @@ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
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
+@@ -1498,9 +1508,15 @@ static int bus_find_parent_object_manager(sd_bus *bus, struct node **out, const
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
+-                prefix = newa(char, strlen(path) + 1);
+                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                         n = hashmap_get(bus->nodes, prefix);
+                         if (n)
+@@ -2083,8 +2099,9 @@ _public_ int sd_bus_emit_properties_changed_strv(
+                 const char *interface,
+                 char **names) {
+ 
++        _cleanup_free_ char *prefix = NULL;
+         bool found_interface = false;
+-        char *prefix;
++        size_t pl;
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+@@ -2105,6 +2122,12 @@ _public_ int sd_bus_emit_properties_changed_strv(
+ 
+         BUS_DONT_DESTROY(bus);
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
+@@ -2114,7 +2137,6 @@ _public_ int sd_bus_emit_properties_changed_strv(
+                 if (bus->nodes_modified)
+                         continue;
+ 
+-                prefix = newa(char, strlen(path) + 1);
+                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                         r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
+                         if (r != 0)
+@@ -2246,7 +2268,8 @@ static int object_added_append_all_prefix(
+ 
+ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
+         _cleanup_set_free_ Set *s = NULL;
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -2291,7 +2314,12 @@ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *p
+         if (bus->nodes_modified)
+                 return 0;
+ 
+-        prefix = newa(char, strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_added_append_all_prefix(bus, m, s, prefix, path, true);
+                 if (r < 0)
+@@ -2430,7 +2458,8 @@ static int object_removed_append_all_prefix(
+ 
+ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
+         _cleanup_set_free_ Set *s = NULL;
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -2462,7 +2491,12 @@ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char
+         if (bus->nodes_modified)
+                 return 0;
+ 
+-        prefix = newa(char, strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_removed_append_all_prefix(bus, m, s, prefix, path, true);
+                 if (r < 0)
+@@ -2612,7 +2646,8 @@ static int interfaces_added_append_one(
+                 const char *path,
+                 const char *interface) {
+ 
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -2626,7 +2661,12 @@ static int interfaces_added_append_one(
+         if (bus->nodes_modified)
+                 return 0;
+ 
+-        prefix = newa(char, strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = interfaces_added_append_one_prefix(bus, m, prefix, path, interface, true);
+                 if (r != 0)
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 1052b3df8c..8ceec3f83f 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
            file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
+           file://CVE-2019-6454.patch \
            "
 
 # patches needed by musl
-- 
2.11.0


