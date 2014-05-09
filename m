Return-Path: <raj.khem@gmail.com>
X-Greylist: delayed 1486 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 05:58:20 UTC
Received: from mail-pa0-f41.google.com (unknown [209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0031960897
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 05:58:20 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so3922636pab.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 22:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wRAkUfbju1Igb9Za+q/E2dpD6p/P1LvRSei7OxkDU2Y=;
	b=mv7Vzbhg0sH9rnFz9KWBjUqDdZ4Iwwx49YHCgt2HXYGnEHPYp+v7jMRY91VZnLqHKK
	I6HTamAfee6ZVtFtix6rq1DGouBZPYxZRWJirSpAoiw/LfYOeIORJ8Tf3REJsO0xQrul
	JTk+VAYOKhm6N5w+0lElVeNiQjqrjSmUQ/mR7YYLGso2q8tA00ouvWeAtvuR5sE8G6XK
	56sVE0H211tsHDFEj4aiX6yMP+MOt87sracpVcAh005oDyRrZ4f6AXDragEJViMaPsR1
	kzwH2WpIhFUdc1Wpmfemifp0p8GcSzeJ8BtsmDALXkP/EHJMrkx9kEKgIPYfbXtLgcep
	lerA==
X-Received: by 10.66.148.70 with SMTP id tq6mr16438651pab.56.1399613226367;
	Thu, 08 May 2014 22:27:06 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id nh8sm5244167pbc.25.2014.05.08.22.27.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 22:27:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 22:29:43 -0700
Message-Id: <1399613383-27533-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: Upgrade past 212 release
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
X-List-Received-Date: Fri, 09 May 2014 05:58:21 -0000

Remove unconditional enable-xz, its specified by PACKAGECONFIG anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-use-assert_return-to-check-for-disconne.patch |  513 --------------------
 .../systemd/systemd-pam-fix-fallocate.patch        |   28 +-
 .../systemd/{systemd_211.bb => systemd_212.bb}     |    6 +-
 3 files changed, 16 insertions(+), 531 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch
 rename meta/recipes-core/systemd/{systemd_211.bb => systemd_212.bb} (98%)

diff --git a/meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch b/meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch
deleted file mode 100644
index c5bee97..0000000
--- a/meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch
+++ /dev/null
@@ -1,513 +0,0 @@
-From a3d59cd1b0a2738d06893948492113f2c35be0af Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Wed, 19 Mar 2014 21:41:21 +0100
-Subject: [PATCH] sd-bus: don't use assert_return() to check for disconnected
- bus connections
-
-A terminated connection is a runtime error and not a developer mistake,
-hence don't use assert_return() to check for it.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/libsystemd/sd-bus/bus-control.c     | 20 +++++++++---
- src/libsystemd/sd-bus/bus-convenience.c | 58 +++++++++++++++++++++++++--------
- src/libsystemd/sd-bus/bus-objects.c     | 23 +++++++++----
- src/libsystemd/sd-bus/sd-bus.c          | 49 ++++++++++++++++++++--------
- 4 files changed, 113 insertions(+), 37 deletions(-)
-
-diff --git a/src/libsystemd/sd-bus/bus-control.c b/src/libsystemd/sd-bus/bus-control.c
-index bb6683e..bd392a2 100644
---- a/src/libsystemd/sd-bus/bus-control.c
-+++ b/src/libsystemd/sd-bus/bus-control.c
-@@ -128,12 +128,14 @@ _public_ int sd_bus_request_name(sd_bus *bus, const char *name, uint64_t flags)
-         assert_return(bus, -EINVAL);
-         assert_return(name, -EINVAL);
-         assert_return(bus->bus_client, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
-         assert_return(!(flags & ~(SD_BUS_NAME_ALLOW_REPLACEMENT|SD_BUS_NAME_REPLACE_EXISTING|SD_BUS_NAME_QUEUE)), -EINVAL);
-         assert_return(service_name_is_valid(name), -EINVAL);
-         assert_return(name[0] != ':', -EINVAL);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (bus->is_kernel)
-                 return bus_request_name_kernel(bus, name, flags);
-         else
-@@ -201,11 +203,13 @@ _public_ int sd_bus_release_name(sd_bus *bus, const char *name) {
-         assert_return(bus, -EINVAL);
-         assert_return(name, -EINVAL);
-         assert_return(bus->bus_client, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
-         assert_return(service_name_is_valid(name), -EINVAL);
-         assert_return(name[0] != ':', -EINVAL);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (bus->is_kernel)
-                 return bus_release_name_kernel(bus, name);
-         else
-@@ -342,9 +346,11 @@ static int bus_list_names_dbus1(sd_bus *bus, char ***acquired, char ***activatab
- _public_ int sd_bus_list_names(sd_bus *bus, char ***acquired, char ***activatable) {
-         assert_return(bus, -EINVAL);
-         assert_return(acquired || activatable, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (bus->is_kernel)
-                 return bus_list_names_kernel(bus, acquired, activatable);
-         else
-@@ -735,11 +741,13 @@ _public_ int sd_bus_get_owner(
-         assert_return(name, -EINVAL);
-         assert_return(mask <= _SD_BUS_CREDS_ALL, -ENOTSUP);
-         assert_return(mask == 0 || creds, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
-         assert_return(service_name_is_valid(name), -EINVAL);
-         assert_return(bus->bus_client, -ENODATA);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (bus->is_kernel)
-                 return bus_get_owner_kdbus(bus, name, mask, creds);
-         else
-@@ -1196,10 +1204,12 @@ _public_ int sd_bus_get_owner_machine_id(sd_bus *bus, const char *name, sd_id128
-         assert_return(bus, -EINVAL);
-         assert_return(name, -EINVAL);
-         assert_return(machine, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
-         assert_return(service_name_is_valid(name), -EINVAL);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (streq_ptr(name, bus->unique_name))
-                 return sd_id128_get_machine(machine);
- 
-diff --git a/src/libsystemd/sd-bus/bus-convenience.c b/src/libsystemd/sd-bus/bus-convenience.c
-index 6e02ad3..c5b9cd4 100644
---- a/src/libsystemd/sd-bus/bus-convenience.c
-+++ b/src/libsystemd/sd-bus/bus-convenience.c
-@@ -36,9 +36,11 @@ _public_ int sd_bus_emit_signal(
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_message_new_signal(bus, &m, path, interface, member);
-         if (r < 0)
-                 return r;
-@@ -70,9 +72,11 @@ _public_ int sd_bus_call_method(
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_message_new_method_call(bus, &m, destination, path, interface, member);
-         if (r < 0)
-                 return r;
-@@ -100,9 +104,12 @@ _public_ int sd_bus_reply_method_return(
-         assert_return(call, -EINVAL);
-         assert_return(call->sealed, -EPERM);
-         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
--        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
-+        assert_return(call->bus, -EINVAL);
-         assert_return(!bus_pid_changed(call->bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(call->bus->state))
-+                return -ENOTCONN;
-+
-         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
-                 return 0;
- 
-@@ -134,9 +141,12 @@ _public_ int sd_bus_reply_method_error(
-         assert_return(call->sealed, -EPERM);
-         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
-         assert_return(sd_bus_error_is_set(e), -EINVAL);
--        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
-+        assert_return(call->bus, -EINVAL);
-         assert_return(!bus_pid_changed(call->bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(call->bus->state))
-+                return -ENOTCONN;
-+
-         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
-                 return 0;
- 
-@@ -159,9 +169,12 @@ _public_ int sd_bus_reply_method_errorf(
-         assert_return(call, -EINVAL);
-         assert_return(call->sealed, -EPERM);
-         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
--        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
-+        assert_return(call->bus, -EINVAL);
-         assert_return(!bus_pid_changed(call->bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(call->bus->state))
-+                return -ENOTCONN;
-+
-         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
-                 return 0;
- 
-@@ -182,9 +195,12 @@ _public_ int sd_bus_reply_method_errno(
-         assert_return(call, -EINVAL);
-         assert_return(call->sealed, -EPERM);
-         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
--        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
-+        assert_return(call->bus, -EINVAL);
-         assert_return(!bus_pid_changed(call->bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(call->bus->state))
-+                return -ENOTCONN;
-+
-         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
-                 return 0;
- 
-@@ -208,9 +224,12 @@ _public_ int sd_bus_reply_method_errnof(
-         assert_return(call, -EINVAL);
-         assert_return(call->sealed, -EPERM);
-         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
--        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
-+        assert_return(call->bus, -EINVAL);
-         assert_return(!bus_pid_changed(call->bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(call->bus->state))
-+                return -ENOTCONN;
-+
-         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
-                 return 0;
- 
-@@ -239,9 +258,11 @@ _public_ int sd_bus_get_property(
-         assert_return(member_name_is_valid(member), -EINVAL);
-         assert_return(reply, -EINVAL);
-         assert_return(signature_is_single(type, false), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &rep, "ss", strempty(interface), member);
-         if (r < 0)
-                 return r;
-@@ -273,9 +294,11 @@ _public_ int sd_bus_get_property_trivial(
-         assert_return(member_name_is_valid(member), -EINVAL);
-         assert_return(bus_type_is_trivial(type), -EINVAL);
-         assert_return(ptr, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &reply, "ss", strempty(interface), member);
-         if (r < 0)
-                 return r;
-@@ -309,9 +332,11 @@ _public_ int sd_bus_get_property_string(
-         assert_return(isempty(interface) || interface_name_is_valid(interface), -EINVAL);
-         assert_return(member_name_is_valid(member), -EINVAL);
-         assert_return(ret, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &reply, "ss", strempty(interface), member);
-         if (r < 0)
-                 return r;
-@@ -348,9 +373,11 @@ _public_ int sd_bus_get_property_strv(
-         assert_return(isempty(interface) || interface_name_is_valid(interface), -EINVAL);
-         assert_return(member_name_is_valid(member), -EINVAL);
-         assert_return(ret, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &reply, "ss", strempty(interface), member);
-         if (r < 0)
-                 return r;
-@@ -383,9 +410,11 @@ _public_ int sd_bus_set_property(
-         assert_return(isempty(interface) || interface_name_is_valid(interface), -EINVAL);
-         assert_return(member_name_is_valid(member), -EINVAL);
-         assert_return(signature_is_single(type, false), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = sd_bus_message_new_method_call(bus, &m, destination, path, "org.freedesktop.DBus.Properties", "Set");
-         if (r < 0)
-                 return r;
-@@ -416,9 +445,12 @@ _public_ int sd_bus_query_sender_creds(sd_bus_message *call, uint64_t mask, sd_b
- 
-         assert_return(call, -EINVAL);
-         assert_return(call->sealed, -EPERM);
--        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
-+        assert_return(call->bus, -EINVAL);
-         assert_return(!bus_pid_changed(call->bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(call->bus->state))
-+                return -ENOTCONN;
-+
-         c = sd_bus_message_get_creds(call);
- 
-         /* All data we need? */
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 08792fe..539cf2a 100644
---- a/src/libsystemd/sd-bus/bus-objects.c
-+++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -2196,9 +2196,10 @@ _public_ int sd_bus_emit_properties_changed_strv(
-         assert_return(bus, -EINVAL);
-         assert_return(object_path_is_valid(path), -EINVAL);
-         assert_return(interface_name_is_valid(interface), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
- 
-         /* A non-NULL but empty names list means nothing needs to be
-            generated. A NULL list OTOH indicates that all properties
-@@ -2241,9 +2242,11 @@ _public_ int sd_bus_emit_properties_changed(
-         assert_return(bus, -EINVAL);
-         assert_return(object_path_is_valid(path), -EINVAL);
-         assert_return(interface_name_is_valid(interface), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (!name)
-                 return 0;
- 
-@@ -2361,9 +2364,11 @@ _public_ int sd_bus_emit_interfaces_added_strv(sd_bus *bus, const char *path, ch
- 
-         assert_return(bus, -EINVAL);
-         assert_return(object_path_is_valid(path), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (strv_isempty(interfaces))
-                 return 0;
- 
-@@ -2421,9 +2426,11 @@ _public_ int sd_bus_emit_interfaces_added(sd_bus *bus, const char *path, const c
- 
-         assert_return(bus, -EINVAL);
-         assert_return(object_path_is_valid(path), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         interfaces = strv_from_stdarg_alloca(interface);
- 
-         return sd_bus_emit_interfaces_added_strv(bus, path, interfaces);
-@@ -2435,9 +2442,11 @@ _public_ int sd_bus_emit_interfaces_removed_strv(sd_bus *bus, const char *path,
- 
-         assert_return(bus, -EINVAL);
-         assert_return(object_path_is_valid(path), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (strv_isempty(interfaces))
-                 return 0;
- 
-@@ -2461,9 +2470,11 @@ _public_ int sd_bus_emit_interfaces_removed(sd_bus *bus, const char *path, const
- 
-         assert_return(bus, -EINVAL);
-         assert_return(object_path_is_valid(path), -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         interfaces = strv_from_stdarg_alloca(interface);
- 
-         return sd_bus_emit_interfaces_removed_strv(bus, path, interfaces);
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index fa6d43a..15c7677 100644
---- a/src/libsystemd/sd-bus/sd-bus.c
-+++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -1594,10 +1594,12 @@ static int bus_send_internal(sd_bus *bus, sd_bus_message *_m, uint64_t *cookie,
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(m, -EINVAL);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (m->n_fds > 0) {
-                 r = sd_bus_can_send(bus, SD_BUS_TYPE_UNIX_FD);
-                 if (r < 0)
-@@ -1673,10 +1675,12 @@ _public_ int sd_bus_send_to(sd_bus *bus, sd_bus_message *m, const char *destinat
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(m, -EINVAL);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         if (!streq_ptr(m->destination, destination)) {
- 
-                 if (!destination)
-@@ -1728,13 +1732,15 @@ _public_ int sd_bus_call_async(
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(m, -EINVAL);
-         assert_return(m->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
-         assert_return(!(m->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED), -EINVAL);
-         assert_return(callback, -EINVAL);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = hashmap_ensure_allocated(&bus->reply_callbacks, uint64_hash_func, uint64_compare_func);
-         if (r < 0)
-                 return r;
-@@ -1841,13 +1847,15 @@ _public_ int sd_bus_call(
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(m, -EINVAL);
-         assert_return(m->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
-         assert_return(!(m->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED), -EINVAL);
-         assert_return(!bus_error_is_dirty(error), -EINVAL);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
-+
-         r = bus_ensure_running(bus);
-         if (r < 0)
-                 return r;
-@@ -1973,9 +1981,11 @@ _public_ int sd_bus_get_events(sd_bus *bus) {
-         int flags = 0;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state) || bus->state == BUS_CLOSING, -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state) && bus->state != BUS_CLOSING)
-+                return -ENOTCONN;
-+
-         if (bus->state == BUS_OPENING)
-                 flags |= POLLOUT;
-         else if (bus->state == BUS_AUTHENTICATING) {
-@@ -2000,9 +2010,11 @@ _public_ int sd_bus_get_timeout(sd_bus *bus, uint64_t *timeout_usec) {
- 
-         assert_return(bus, -EINVAL);
-         assert_return(timeout_usec, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state) || bus->state == BUS_CLOSING, -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
- 
-+        if (!BUS_IS_OPEN(bus->state) && bus->state != BUS_CLOSING)
-+                return -ENOTCONN;
-+
-         if (bus->track_queue) {
-                 *timeout_usec = 0;
-                 return 1;
-@@ -2531,7 +2543,8 @@ static int bus_poll(sd_bus *bus, bool need_more, uint64_t timeout_usec) {
-         if (bus->state == BUS_CLOSING)
-                 return 1;
- 
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
- 
-         e = sd_bus_get_events(bus);
-         if (e < 0)
-@@ -2586,7 +2599,8 @@ _public_ int sd_bus_wait(sd_bus *bus, uint64_t timeout_usec) {
-         if (bus->state == BUS_CLOSING)
-                 return 0;
- 
--        assert_return(BUS_IS_OPEN(bus->state) , -ENOTCONN);
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
- 
-         if (bus->rqueue_size > 0)
-                 return 0;
-@@ -2603,7 +2617,8 @@ _public_ int sd_bus_flush(sd_bus *bus) {
-         if (bus->state == BUS_CLOSING)
-                 return 0;
- 
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
- 
-         r = bus_ensure_running(bus);
-         if (r < 0)
-@@ -3113,9 +3128,13 @@ _public_ int sd_bus_get_peer_creds(sd_bus *bus, uint64_t mask, sd_bus_creds **re
-         assert_return(bus, -EINVAL);
-         assert_return(mask <= _SD_BUS_CREDS_ALL, -ENOTSUP);
-         assert_return(ret, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
--        assert_return(!bus->is_kernel, -ENOTSUP);
-+
-+        if (!bus->is_kernel)
-+                return -ENOTSUP;
-+
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
- 
-         if (!bus->ucred_valid && !isempty(bus->label))
-                 return -ENODATA;
-@@ -3154,9 +3173,13 @@ _public_ int sd_bus_try_close(sd_bus *bus) {
-         int r;
- 
-         assert_return(bus, -EINVAL);
--        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
-         assert_return(!bus_pid_changed(bus), -ECHILD);
--        assert_return(bus->is_kernel, -ENOTSUP);
-+
-+        if (!bus->is_kernel)
-+                return -ENOTSUP;
-+
-+        if (!BUS_IS_OPEN(bus->state))
-+                return -ENOTCONN;
- 
-         if (bus->rqueue_size > 0)
-                 return -EBUSY;
--- 
-1.9.1
-
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index d25acef..cfca0b9 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: systemd-209/src/journal/journal-file.c
+Index: git/src/journal/journal-file.c
 ===================================================================
---- systemd-209.orig/src/journal/journal-file.c	2014-02-12 18:42:33.000000000 -0800
-+++ systemd-209/src/journal/journal-file.c	2014-02-19 23:23:19.464631643 -0800
+--- git.orig/src/journal/journal-file.c	2014-04-22 22:53:05.000000000 -0700
++++ git/src/journal/journal-file.c	2014-04-22 22:53:51.130236707 -0700
 @@ -38,6 +38,8 @@
  #include "compress.h"
  #include "fsprg.h"
@@ -14,7 +14,7 @@ Index: systemd-209/src/journal/journal-file.c
  #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
  #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
  
-@@ -316,7 +318,7 @@
+@@ -314,7 +316,7 @@
  
  static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
          uint64_t old_size, new_size;
@@ -23,7 +23,7 @@ Index: systemd-209/src/journal/journal-file.c
  
          assert(f);
  
-@@ -364,9 +366,24 @@
+@@ -362,9 +364,24 @@
          /* Note that the glibc fallocate() fallback is very
             inefficient, hence we try to minimize the allocation area
             as we can. */
@@ -48,19 +48,19 @@ Index: systemd-209/src/journal/journal-file.c
  
          if (fstat(f->fd, &f->last_stat) < 0)
                  return -errno;
-Index: systemd-209/src/journal/journald-kmsg.c
+Index: git/src/journal/journald-kmsg.c
 ===================================================================
---- systemd-209.orig/src/journal/journald-kmsg.c	2014-02-19 15:03:09.000000000 -0800
-+++ systemd-209/src/journal/journald-kmsg.c	2014-02-19 23:22:14.396630422 -0800
-@@ -441,6 +441,7 @@
- 
+--- git.orig/src/journal/journald-kmsg.c	2014-04-22 22:53:05.000000000 -0700
++++ git/src/journal/journald-kmsg.c	2014-04-22 22:54:27.830236809 -0700
+@@ -437,6 +437,7 @@
  int server_open_kernel_seqnum(Server *s) {
-         int fd;
-+	int r = 0;
+         _cleanup_close_ int fd;
          uint64_t *p;
++        int r = 0;
  
          assert(s);
-@@ -454,8 +455,19 @@
+ 
+@@ -449,8 +450,19 @@
                  log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
                  return 0;
          }
@@ -80,5 +80,5 @@ Index: systemd-209/src/journal/journald-kmsg.c
 +#endif /* HAVE_POSIX_FALLOCATE */
 +	if (r < 0) {
                  log_error("Failed to allocate sequential number file, ignoring: %m");
-                 close_nointr_nofail(fd);
                  return 0;
+         }
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_212.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_211.bb
rename to meta/recipes-core/systemd/systemd_212.bb
index 63bccc7..bbc5d34 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_212.bb
@@ -17,9 +17,9 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
 
-SRCREV = "3a450ec5c6adf3057bcedd6cc19c10617abc35a5"
+SRCREV = "9b3310b066136b0674a926da094b7fe87a13a58b"
 
-PV = "211+git${SRCPV}"
+PV = "212+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
@@ -31,7 +31,6 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
-           file://sd-bus-don-t-use-assert_return-to-check-for-disconne.patch \
            \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
@@ -72,7 +71,6 @@ rootlibexecdir = "${rootprefix}/lib"
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-                 --enable-xz \
                  --disable-manpages \
                  --disable-coredump \
                  --disable-introspection \
-- 
1.7.10.4


