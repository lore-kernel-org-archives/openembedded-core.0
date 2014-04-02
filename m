Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 34FED6CA54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 02:44:19 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so10826429pad.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 19:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7MDWMEwcfKlY4tyJlEuEBe8o1j/Kl+1oyhYLs1D0WaU=;
	b=SbaM1iqHdw70WoEm5YfnvZFXE0GBZtVcTZT/JdmaxDXlp6RwyMA5wdcrmVGQPYCAt7
	CyYW0HcCySC4bu0hCWPXe619aw+GLXJ7sPgOu7CyM1QIt+k3ZhrtjH4I+xq9AkYzgK92
	bSeEIwExhA19PXtpLnlStMbr/Dchz4uMaYfJHQbpeXLayMDcBIGom9M3X/RckulfIq1n
	UHAhrfYQ8PtWRpG4O6sDFzNV/ewi1K6f7CW8HeNOvkQNrotUZCp393Mjl9WcWiMcaTIl
	yAvfn671dQXKLNS6c7NYIU8zPsD/NHnwSYTmabuuVB3lKykASgpena5T8a0UPQU3JFFr
	FSBA==
X-Received: by 10.68.163.197 with SMTP id yk5mr34761882pbb.57.1396406660297;
	Tue, 01 Apr 2014 19:44:20 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id dn1sm846326pbb.54.2014.04.01.19.44.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 19:44:19 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 13:50:10 +1100
Message-Id: <1396407010-6283-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396407010-6283-1-git-send-email-net147@gmail.com>
References: <1396407010-6283-1-git-send-email-net147@gmail.com>
Subject: [PATCH 3/3] systemd: backport patch to avoid assertion failures
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
X-List-Received-Date: Wed, 02 Apr 2014 02:44:21 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...t-use-assert_return-to-check-for-disconne.patch | 513 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb           |   1 +
 2 files changed, 514 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch

diff --git a/meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch b/meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch
new file mode 100644
index 0000000..c5bee97
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/sd-bus-don-t-use-assert_return-to-check-for-disconne.patch
@@ -0,0 +1,513 @@
+From a3d59cd1b0a2738d06893948492113f2c35be0af Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 19 Mar 2014 21:41:21 +0100
+Subject: [PATCH] sd-bus: don't use assert_return() to check for disconnected
+ bus connections
+
+A terminated connection is a runtime error and not a developer mistake,
+hence don't use assert_return() to check for it.
+
+Upstream-Status: Backport
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/libsystemd/sd-bus/bus-control.c     | 20 +++++++++---
+ src/libsystemd/sd-bus/bus-convenience.c | 58 +++++++++++++++++++++++++--------
+ src/libsystemd/sd-bus/bus-objects.c     | 23 +++++++++----
+ src/libsystemd/sd-bus/sd-bus.c          | 49 ++++++++++++++++++++--------
+ 4 files changed, 113 insertions(+), 37 deletions(-)
+
+diff --git a/src/libsystemd/sd-bus/bus-control.c b/src/libsystemd/sd-bus/bus-control.c
+index bb6683e..bd392a2 100644
+--- a/src/libsystemd/sd-bus/bus-control.c
++++ b/src/libsystemd/sd-bus/bus-control.c
+@@ -128,12 +128,14 @@ _public_ int sd_bus_request_name(sd_bus *bus, const char *name, uint64_t flags)
+         assert_return(bus, -EINVAL);
+         assert_return(name, -EINVAL);
+         assert_return(bus->bus_client, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+         assert_return(!(flags & ~(SD_BUS_NAME_ALLOW_REPLACEMENT|SD_BUS_NAME_REPLACE_EXISTING|SD_BUS_NAME_QUEUE)), -EINVAL);
+         assert_return(service_name_is_valid(name), -EINVAL);
+         assert_return(name[0] != ':', -EINVAL);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (bus->is_kernel)
+                 return bus_request_name_kernel(bus, name, flags);
+         else
+@@ -201,11 +203,13 @@ _public_ int sd_bus_release_name(sd_bus *bus, const char *name) {
+         assert_return(bus, -EINVAL);
+         assert_return(name, -EINVAL);
+         assert_return(bus->bus_client, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+         assert_return(service_name_is_valid(name), -EINVAL);
+         assert_return(name[0] != ':', -EINVAL);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (bus->is_kernel)
+                 return bus_release_name_kernel(bus, name);
+         else
+@@ -342,9 +346,11 @@ static int bus_list_names_dbus1(sd_bus *bus, char ***acquired, char ***activatab
+ _public_ int sd_bus_list_names(sd_bus *bus, char ***acquired, char ***activatable) {
+         assert_return(bus, -EINVAL);
+         assert_return(acquired || activatable, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (bus->is_kernel)
+                 return bus_list_names_kernel(bus, acquired, activatable);
+         else
+@@ -735,11 +741,13 @@ _public_ int sd_bus_get_owner(
+         assert_return(name, -EINVAL);
+         assert_return(mask <= _SD_BUS_CREDS_ALL, -ENOTSUP);
+         assert_return(mask == 0 || creds, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+         assert_return(service_name_is_valid(name), -EINVAL);
+         assert_return(bus->bus_client, -ENODATA);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (bus->is_kernel)
+                 return bus_get_owner_kdbus(bus, name, mask, creds);
+         else
+@@ -1196,10 +1204,12 @@ _public_ int sd_bus_get_owner_machine_id(sd_bus *bus, const char *name, sd_id128
+         assert_return(bus, -EINVAL);
+         assert_return(name, -EINVAL);
+         assert_return(machine, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+         assert_return(service_name_is_valid(name), -EINVAL);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (streq_ptr(name, bus->unique_name))
+                 return sd_id128_get_machine(machine);
+ 
+diff --git a/src/libsystemd/sd-bus/bus-convenience.c b/src/libsystemd/sd-bus/bus-convenience.c
+index 6e02ad3..c5b9cd4 100644
+--- a/src/libsystemd/sd-bus/bus-convenience.c
++++ b/src/libsystemd/sd-bus/bus-convenience.c
+@@ -36,9 +36,11 @@ _public_ int sd_bus_emit_signal(
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_message_new_signal(bus, &m, path, interface, member);
+         if (r < 0)
+                 return r;
+@@ -70,9 +72,11 @@ _public_ int sd_bus_call_method(
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_message_new_method_call(bus, &m, destination, path, interface, member);
+         if (r < 0)
+                 return r;
+@@ -100,9 +104,12 @@ _public_ int sd_bus_reply_method_return(
+         assert_return(call, -EINVAL);
+         assert_return(call->sealed, -EPERM);
+         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+-        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
++        assert_return(call->bus, -EINVAL);
+         assert_return(!bus_pid_changed(call->bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(call->bus->state))
++                return -ENOTCONN;
++
+         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
+                 return 0;
+ 
+@@ -134,9 +141,12 @@ _public_ int sd_bus_reply_method_error(
+         assert_return(call->sealed, -EPERM);
+         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+         assert_return(sd_bus_error_is_set(e), -EINVAL);
+-        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
++        assert_return(call->bus, -EINVAL);
+         assert_return(!bus_pid_changed(call->bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(call->bus->state))
++                return -ENOTCONN;
++
+         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
+                 return 0;
+ 
+@@ -159,9 +169,12 @@ _public_ int sd_bus_reply_method_errorf(
+         assert_return(call, -EINVAL);
+         assert_return(call->sealed, -EPERM);
+         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+-        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
++        assert_return(call->bus, -EINVAL);
+         assert_return(!bus_pid_changed(call->bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(call->bus->state))
++                return -ENOTCONN;
++
+         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
+                 return 0;
+ 
+@@ -182,9 +195,12 @@ _public_ int sd_bus_reply_method_errno(
+         assert_return(call, -EINVAL);
+         assert_return(call->sealed, -EPERM);
+         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+-        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
++        assert_return(call->bus, -EINVAL);
+         assert_return(!bus_pid_changed(call->bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(call->bus->state))
++                return -ENOTCONN;
++
+         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
+                 return 0;
+ 
+@@ -208,9 +224,12 @@ _public_ int sd_bus_reply_method_errnof(
+         assert_return(call, -EINVAL);
+         assert_return(call->sealed, -EPERM);
+         assert_return(call->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+-        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
++        assert_return(call->bus, -EINVAL);
+         assert_return(!bus_pid_changed(call->bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(call->bus->state))
++                return -ENOTCONN;
++
+         if (call->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED)
+                 return 0;
+ 
+@@ -239,9 +258,11 @@ _public_ int sd_bus_get_property(
+         assert_return(member_name_is_valid(member), -EINVAL);
+         assert_return(reply, -EINVAL);
+         assert_return(signature_is_single(type, false), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &rep, "ss", strempty(interface), member);
+         if (r < 0)
+                 return r;
+@@ -273,9 +294,11 @@ _public_ int sd_bus_get_property_trivial(
+         assert_return(member_name_is_valid(member), -EINVAL);
+         assert_return(bus_type_is_trivial(type), -EINVAL);
+         assert_return(ptr, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &reply, "ss", strempty(interface), member);
+         if (r < 0)
+                 return r;
+@@ -309,9 +332,11 @@ _public_ int sd_bus_get_property_string(
+         assert_return(isempty(interface) || interface_name_is_valid(interface), -EINVAL);
+         assert_return(member_name_is_valid(member), -EINVAL);
+         assert_return(ret, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &reply, "ss", strempty(interface), member);
+         if (r < 0)
+                 return r;
+@@ -348,9 +373,11 @@ _public_ int sd_bus_get_property_strv(
+         assert_return(isempty(interface) || interface_name_is_valid(interface), -EINVAL);
+         assert_return(member_name_is_valid(member), -EINVAL);
+         assert_return(ret, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_call_method(bus, destination, path, "org.freedesktop.DBus.Properties", "Get", error, &reply, "ss", strempty(interface), member);
+         if (r < 0)
+                 return r;
+@@ -383,9 +410,11 @@ _public_ int sd_bus_set_property(
+         assert_return(isempty(interface) || interface_name_is_valid(interface), -EINVAL);
+         assert_return(member_name_is_valid(member), -EINVAL);
+         assert_return(signature_is_single(type, false), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = sd_bus_message_new_method_call(bus, &m, destination, path, "org.freedesktop.DBus.Properties", "Set");
+         if (r < 0)
+                 return r;
+@@ -416,9 +445,12 @@ _public_ int sd_bus_query_sender_creds(sd_bus_message *call, uint64_t mask, sd_b
+ 
+         assert_return(call, -EINVAL);
+         assert_return(call->sealed, -EPERM);
+-        assert_return(call->bus && BUS_IS_OPEN(call->bus->state), -ENOTCONN);
++        assert_return(call->bus, -EINVAL);
+         assert_return(!bus_pid_changed(call->bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(call->bus->state))
++                return -ENOTCONN;
++
+         c = sd_bus_message_get_creds(call);
+ 
+         /* All data we need? */
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index 08792fe..539cf2a 100644
+--- a/src/libsystemd/sd-bus/bus-objects.c
++++ b/src/libsystemd/sd-bus/bus-objects.c
+@@ -2196,9 +2196,10 @@ _public_ int sd_bus_emit_properties_changed_strv(
+         assert_return(bus, -EINVAL);
+         assert_return(object_path_is_valid(path), -EINVAL);
+         assert_return(interface_name_is_valid(interface), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
+ 
+         /* A non-NULL but empty names list means nothing needs to be
+            generated. A NULL list OTOH indicates that all properties
+@@ -2241,9 +2242,11 @@ _public_ int sd_bus_emit_properties_changed(
+         assert_return(bus, -EINVAL);
+         assert_return(object_path_is_valid(path), -EINVAL);
+         assert_return(interface_name_is_valid(interface), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (!name)
+                 return 0;
+ 
+@@ -2361,9 +2364,11 @@ _public_ int sd_bus_emit_interfaces_added_strv(sd_bus *bus, const char *path, ch
+ 
+         assert_return(bus, -EINVAL);
+         assert_return(object_path_is_valid(path), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (strv_isempty(interfaces))
+                 return 0;
+ 
+@@ -2421,9 +2426,11 @@ _public_ int sd_bus_emit_interfaces_added(sd_bus *bus, const char *path, const c
+ 
+         assert_return(bus, -EINVAL);
+         assert_return(object_path_is_valid(path), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         interfaces = strv_from_stdarg_alloca(interface);
+ 
+         return sd_bus_emit_interfaces_added_strv(bus, path, interfaces);
+@@ -2435,9 +2442,11 @@ _public_ int sd_bus_emit_interfaces_removed_strv(sd_bus *bus, const char *path,
+ 
+         assert_return(bus, -EINVAL);
+         assert_return(object_path_is_valid(path), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (strv_isempty(interfaces))
+                 return 0;
+ 
+@@ -2461,9 +2470,11 @@ _public_ int sd_bus_emit_interfaces_removed(sd_bus *bus, const char *path, const
+ 
+         assert_return(bus, -EINVAL);
+         assert_return(object_path_is_valid(path), -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         interfaces = strv_from_stdarg_alloca(interface);
+ 
+         return sd_bus_emit_interfaces_removed_strv(bus, path, interfaces);
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index fa6d43a..15c7677 100644
+--- a/src/libsystemd/sd-bus/sd-bus.c
++++ b/src/libsystemd/sd-bus/sd-bus.c
+@@ -1594,10 +1594,12 @@ static int bus_send_internal(sd_bus *bus, sd_bus_message *_m, uint64_t *cookie,
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(m, -EINVAL);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (m->n_fds > 0) {
+                 r = sd_bus_can_send(bus, SD_BUS_TYPE_UNIX_FD);
+                 if (r < 0)
+@@ -1673,10 +1675,12 @@ _public_ int sd_bus_send_to(sd_bus *bus, sd_bus_message *m, const char *destinat
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(m, -EINVAL);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         if (!streq_ptr(m->destination, destination)) {
+ 
+                 if (!destination)
+@@ -1728,13 +1732,15 @@ _public_ int sd_bus_call_async(
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(m, -EINVAL);
+         assert_return(m->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+         assert_return(!(m->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED), -EINVAL);
+         assert_return(callback, -EINVAL);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = hashmap_ensure_allocated(&bus->reply_callbacks, uint64_hash_func, uint64_compare_func);
+         if (r < 0)
+                 return r;
+@@ -1841,13 +1847,15 @@ _public_ int sd_bus_call(
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(m, -EINVAL);
+         assert_return(m->header->type == SD_BUS_MESSAGE_METHOD_CALL, -EINVAL);
+         assert_return(!(m->header->flags & BUS_MESSAGE_NO_REPLY_EXPECTED), -EINVAL);
+         assert_return(!bus_error_is_dirty(error), -EINVAL);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
++
+         r = bus_ensure_running(bus);
+         if (r < 0)
+                 return r;
+@@ -1973,9 +1981,11 @@ _public_ int sd_bus_get_events(sd_bus *bus) {
+         int flags = 0;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state) || bus->state == BUS_CLOSING, -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state) && bus->state != BUS_CLOSING)
++                return -ENOTCONN;
++
+         if (bus->state == BUS_OPENING)
+                 flags |= POLLOUT;
+         else if (bus->state == BUS_AUTHENTICATING) {
+@@ -2000,9 +2010,11 @@ _public_ int sd_bus_get_timeout(sd_bus *bus, uint64_t *timeout_usec) {
+ 
+         assert_return(bus, -EINVAL);
+         assert_return(timeout_usec, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state) || bus->state == BUS_CLOSING, -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+ 
++        if (!BUS_IS_OPEN(bus->state) && bus->state != BUS_CLOSING)
++                return -ENOTCONN;
++
+         if (bus->track_queue) {
+                 *timeout_usec = 0;
+                 return 1;
+@@ -2531,7 +2543,8 @@ static int bus_poll(sd_bus *bus, bool need_more, uint64_t timeout_usec) {
+         if (bus->state == BUS_CLOSING)
+                 return 1;
+ 
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
+ 
+         e = sd_bus_get_events(bus);
+         if (e < 0)
+@@ -2586,7 +2599,8 @@ _public_ int sd_bus_wait(sd_bus *bus, uint64_t timeout_usec) {
+         if (bus->state == BUS_CLOSING)
+                 return 0;
+ 
+-        assert_return(BUS_IS_OPEN(bus->state) , -ENOTCONN);
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
+ 
+         if (bus->rqueue_size > 0)
+                 return 0;
+@@ -2603,7 +2617,8 @@ _public_ int sd_bus_flush(sd_bus *bus) {
+         if (bus->state == BUS_CLOSING)
+                 return 0;
+ 
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
+ 
+         r = bus_ensure_running(bus);
+         if (r < 0)
+@@ -3113,9 +3128,13 @@ _public_ int sd_bus_get_peer_creds(sd_bus *bus, uint64_t mask, sd_bus_creds **re
+         assert_return(bus, -EINVAL);
+         assert_return(mask <= _SD_BUS_CREDS_ALL, -ENOTSUP);
+         assert_return(ret, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+-        assert_return(!bus->is_kernel, -ENOTSUP);
++
++        if (!bus->is_kernel)
++                return -ENOTSUP;
++
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
+ 
+         if (!bus->ucred_valid && !isempty(bus->label))
+                 return -ENODATA;
+@@ -3154,9 +3173,13 @@ _public_ int sd_bus_try_close(sd_bus *bus) {
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+-        assert_return(BUS_IS_OPEN(bus->state), -ENOTCONN);
+         assert_return(!bus_pid_changed(bus), -ECHILD);
+-        assert_return(bus->is_kernel, -ENOTSUP);
++
++        if (!bus->is_kernel)
++                return -ENOTSUP;
++
++        if (!BUS_IS_OPEN(bus->state))
++                return -ENOTCONN;
+ 
+         if (bus->rqueue_size > 0)
+                 return -EBUSY;
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 044aab5..44b1965 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
+           file://sd-bus-don-t-use-assert_return-to-check-for-disconne.patch \
            \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
1.9.0


