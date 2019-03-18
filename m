Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD7026C455
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 20:04:18 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o129so10453465qke.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 13:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=oRVw2KMU1efQhhFEp75tIpg4FWDpYZWZGm1uZZ4b3sM=;
	b=dOJXX+a99V896OU24f+/rm42BgBnVh3QpywMcp/+O7XiDDvfGgMNgZQ1MqshMq3Guy
	afk0vODLyerChAmY3F+vLePpEmZXsry6WWG923svLljodExmZv3wYK7qo26w/2fJL+BS
	vWJHC8nafqatpnBs2Rt2UtMN/v2tAIw7ZhclsNQhuGNhYgKXxBSo0EIyCEqNwIBNGRpk
	XgweAksz0PW52055LfE/8sTYXNu1orQ717l4Jo5kPWuE6Sj6GPSfV4zTSE2SqSxw6/gu
	8mKU9K7aBX8/ka/V14dfyU70J9DBVZT11X9U/imT5/6/yleWxyXD9sfh1MCpTc2Mse2L
	Zh7g==
X-Gm-Message-State: APjAAAWKstN/wwE/YexUhCSHvtjJB7Lw1sh423lW9j9nVkU2m7lOx7Wm
	GMDa4my0OMo3s5ZmFTNqyHTlqY/P
X-Google-Smtp-Source: APXvYqwJ90IY2efJYxwaB/d0uTwTm9YzFolgPZKuPLUt4iQHkZYzrdo88qSniCrNtYhq7t/XVPUIzw==
X-Received: by 2002:a37:c99c:: with SMTP id m28mr14273716qkl.3.1552939459222; 
	Mon, 18 Mar 2019 13:04:19 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id v52sm1943977qth.4.2019.03.18.13.04.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 13:04:17 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 18 Mar 2019 17:04:12 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2019 17:04:10 -0300
Message-Id: <20190318200410.24956-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] systemd: Update to systemd-stable v241-stable release
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
X-List-Received-Date: Mon, 18 Mar 2019 20:04:18 -0000
Content-Transfer-Encoding: 8bit

This changes the repository to use the systemd-stable, and update to
the latest release from v241-stable branch.

Following changes are included:

c1f8ff8d0d login: mark nomodeset fb devices as master-of-seat
59f2213e45 login: HyperV requires master-of-seat to be set
a09c170122 Allocate temporary strings to hold dbus paths on the heap
4f54afd5a1 Refuse dbus message paths longer than BUS_PATH_SIZE_MAX limit.
b22a96ef2f NEWS: add entry about 'udevadm trigger --wait-daemon'
bada94eb3e NEWS: fix release date
e9f930b2f5 udev-event: make subst_format_var() always provide null-terminated string on success
66320aec80 sd-device: also store properties read from udev database to sd_device::properties_db
dffc22c833 udev-rules: update log messages about OWNER= or GROUP= settings on --resolve=names=never

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/systemd/systemd.inc         |   8 +-
 .../systemd/systemd/CVE-2019-6454.patch       | 216 ------------------
 meta/recipes-core/systemd/systemd_241.bb      |   1 -
 3 files changed, 5 insertions(+), 220 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8ca3ece441..5bd88ed6ed 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "e62a7fea757f259eb330da5b6d3ab4ede46400a2"
-
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
+SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
+SRCBRANCH = "v241-stable"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
+
+PV_append = "+${SRCPV}"
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch b/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
deleted file mode 100644
index b84809ef17..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
+++ /dev/null
@@ -1,216 +0,0 @@
-Description: sd-bus: enforce a size limit for dbus paths, and don't allocate
- them on the stacka
-Forwarded: no
-
-Patch from: systemd_239-7ubuntu10.8
-
-For information see:
-https://usn.ubuntu.com/3891-1/
-https://git.launchpad.net/ubuntu/+source/systemd/commit/?id=f8e75d5634904c8e672658856508c3a02f349adb
-
-CVE: CVE-2019-6454
-Upstream-Status: Backport
-
-Signed-off-by: George McCollister <george.mccollister@gmail.com>
-
-diff --git a/src/libsystemd/sd-bus/bus-internal.c b/src/libsystemd/sd-bus/bus-internal.c
-index 40acae2133..598b7f110c 100644
---- a/src/libsystemd/sd-bus/bus-internal.c
-+++ b/src/libsystemd/sd-bus/bus-internal.c
-@@ -43,7 +43,7 @@ bool object_path_is_valid(const char *p) {
-         if (slash)
-                 return false;
- 
--        return true;
-+        return (q - p) <= BUS_PATH_SIZE_MAX;
- }
- 
- char* object_path_startswith(const char *a, const char *b) {
-diff --git a/src/libsystemd/sd-bus/bus-internal.h b/src/libsystemd/sd-bus/bus-internal.h
-index f208b294d8..a8d61bf72a 100644
---- a/src/libsystemd/sd-bus/bus-internal.h
-+++ b/src/libsystemd/sd-bus/bus-internal.h
-@@ -332,6 +332,10 @@ struct sd_bus {
- 
- #define BUS_MESSAGE_SIZE_MAX (128*1024*1024)
- #define BUS_AUTH_SIZE_MAX (64*1024)
-+/* Note that the D-Bus specification states that bus paths shall have no size limit. We enforce here one
-+ * anyway, since truly unbounded strings are a security problem. The limit we pick is relatively large however,
-+ * to not clash unnecessarily with real-life applications. */
-+#define BUS_PATH_SIZE_MAX (64*1024)
- 
- #define BUS_CONTAINER_DEPTH 128
- 
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 58329f3fe7..54b977418e 100644
---- a/src/libsystemd/sd-bus/bus-objects.c
-+++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -1133,7 +1133,8 @@ static int object_manager_serialize_path_and_fallbacks(
-                 const char *path,
-                 sd_bus_error *error) {
- 
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -1149,7 +1150,12 @@ static int object_manager_serialize_path_and_fallbacks(
-                 return 0;
- 
-         /* Second, add fallback vtables registered for any of the prefixes */
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_manager_serialize_path(bus, reply, prefix, path, true, error);
-                 if (r < 0)
-@@ -1345,6 +1351,7 @@ static int object_find_and_run(
- }
- 
- int bus_process_object(sd_bus *bus, sd_bus_message *m) {
-+        _cleanup_free_ char *prefix = NULL;
-         int r;
-         size_t pl;
-         bool found_object = false;
-@@ -1369,9 +1376,12 @@ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
-         assert(m->member);
- 
-         pl = strlen(m->path);
--        do {
--                char prefix[pl+1];
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
- 
-+        do {
-                 bus->nodes_modified = false;
- 
-                 r = object_find_and_run(bus, m, m->path, false, &found_object);
-@@ -1498,9 +1508,15 @@ static int bus_find_parent_object_manager(sd_bus *bus, struct node **out, const
- 
-         n = hashmap_get(bus->nodes, path);
-         if (!n) {
--                char *prefix;
-+                _cleanup_free_ char *prefix = NULL;
-+                size_t pl;
-+
-+                pl = strlen(path);
-+                assert(pl <= BUS_PATH_SIZE_MAX);
-+                prefix = new(char, pl + 1);
-+                if (!prefix)
-+                        return -ENOMEM;
- 
--                prefix = newa(char, strlen(path) + 1);
-                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                         n = hashmap_get(bus->nodes, prefix);
-                         if (n)
-@@ -2083,8 +2099,9 @@ _public_ int sd_bus_emit_properties_changed_strv(
-                 const char *interface,
-                 char **names) {
- 
-+        _cleanup_free_ char *prefix = NULL;
-         bool found_interface = false;
--        char *prefix;
-+        size_t pl;
-         int r;
- 
-         assert_return(bus, -EINVAL);
-@@ -2105,6 +2122,12 @@ _public_ int sd_bus_emit_properties_changed_strv(
- 
-         BUS_DONT_DESTROY(bus);
- 
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         do {
-                 bus->nodes_modified = false;
- 
-@@ -2114,7 +2137,6 @@ _public_ int sd_bus_emit_properties_changed_strv(
-                 if (bus->nodes_modified)
-                         continue;
- 
--                prefix = newa(char, strlen(path) + 1);
-                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                         r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
-                         if (r != 0)
-@@ -2246,7 +2268,8 @@ static int object_added_append_all_prefix(
- 
- static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
-         _cleanup_set_free_ Set *s = NULL;
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -2291,7 +2314,12 @@ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *p
-         if (bus->nodes_modified)
-                 return 0;
- 
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_added_append_all_prefix(bus, m, s, prefix, path, true);
-                 if (r < 0)
-@@ -2430,7 +2458,8 @@ static int object_removed_append_all_prefix(
- 
- static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
-         _cleanup_set_free_ Set *s = NULL;
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -2462,7 +2491,12 @@ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char
-         if (bus->nodes_modified)
-                 return 0;
- 
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = object_removed_append_all_prefix(bus, m, s, prefix, path, true);
-                 if (r < 0)
-@@ -2612,7 +2646,8 @@ static int interfaces_added_append_one(
-                 const char *path,
-                 const char *interface) {
- 
--        char *prefix;
-+        _cleanup_free_ char *prefix = NULL;
-+        size_t pl;
-         int r;
- 
-         assert(bus);
-@@ -2626,7 +2661,12 @@ static int interfaces_added_append_one(
-         if (bus->nodes_modified)
-                 return 0;
- 
--        prefix = newa(char, strlen(path) + 1);
-+        pl = strlen(path);
-+        assert(pl <= BUS_PATH_SIZE_MAX);
-+        prefix = new(char, pl + 1);
-+        if (!prefix)
-+                return -ENOMEM;
-+
-         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
-                 r = interfaces_added_append_one_prefix(bus, m, prefix, path, interface, true);
-                 if (r != 0)
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 5d09e5d5fb..6532a58cf8 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -24,7 +24,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
            file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
-           file://CVE-2019-6454.patch \
            "
 
 # patches needed by musl
-- 
2.21.0


