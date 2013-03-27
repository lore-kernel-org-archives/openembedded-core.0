Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKpSi-0006Gb-AU
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 13:28:17 +0100
Received: by mail-wi0-f169.google.com with SMTP id c10so2224421wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 05:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=BozpsgA7ZlskcWQ7SmXpHdrl6eMGLjWkt+QRqH6r9JI=;
	b=pnso+PACGfz6/j8OXW/d9l6WpSI/ZbeB1ZL0JQVEMNezwgqwzCUZRZTCTrIbmU2CxQ
	YmwwmPThHh2pg8VnmajbkrS6eGZ6UpGENVL80ZFVHemX5rHYOBERyTOYmta7yv+R/Rp6
	LxHtoOVpMLqKDCaJvAw3QM/2rTPq7HVhluFNsYDHXDmlLNCObY46L2NC4o6SQqphA8Lz
	a23rYsL3NncYqCTJ6xdcLVUe215evxqyF/zw1TGkaKbU5lf4hzhyvBGD7RK80wDlLNLN
	LX6fKaGcYcrKXZHMpXPqpJqU01zrtlaKvMGAuEzpTzsjQekJ+6jHgK7/Q4WgmXQjb4lj
	XvMg==
X-Received: by 10.194.11.70 with SMTP id o6mr22078268wjb.29.1364386275047;
	Wed, 27 Mar 2013 05:11:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id n2sm8275237wiy.6.2013.03.27.05.11.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 05:11:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 12:08:31 +0000
Message-Id: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkZkGHX02ai3ttMMCRn1jINiXKglhIwx4rs5SklZi9Be2AWSwkk6hQphQVR/uJtlRk7qbx/
Subject: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 12:28:17 -0000

From: Khem Raj <raj.khem@gmail.com>

Tested on ppc and x86_64
compile tested for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-systemd-analyze-rewrite-in-C.patch        | 1087 --------------------
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  140 +--
 .../systemd/systemd/udev-linkage.patch             |   62 --
 meta/recipes-core/systemd/systemd_197.bb           |  275 -----
 meta/recipes-core/systemd/systemd_198.bb           |  275 +++++
 5 files changed, 345 insertions(+), 1494 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/udev-linkage.patch
 delete mode 100644 meta/recipes-core/systemd/systemd_197.bb
 create mode 100644 meta/recipes-core/systemd/systemd_198.bb

diff --git a/meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch b/meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
deleted file mode 100644
index b278390..0000000
--- a/meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
+++ /dev/null
@@ -1,1087 +0,0 @@
-Upstream-Status: Pending
-
-From 523f304facdf3dbc09dbcdcff500ddce60274987 Mon Sep 17 00:00:00 2001
-From: Peeters Simon <peeters.simon@gmail.com>
-Date: Thu, 17 Jan 2013 14:34:25 -0800
-Subject: [PATCH] systemd-analyze: rewrite in C.
-
-Written by Peeters Simon <peeters.simon@gmail.com>. Makefile stuff
-and cleaned up a bit by Auke Kok <auke-jan.h.kok@intel.com>.
----
- Makefile.am                    |  21 +-
- src/analyze/systemd-analyze.c  | 684 +++++++++++++++++++++++++++++++++++++++++
- src/analyze/systemd-analyze.in | 328 --------------------
- 3 files changed, 694 insertions(+), 339 deletions(-)
- create mode 100644 src/analyze/systemd-analyze.c
- delete mode 100755 src/analyze/systemd-analyze.in
-
-Index: systemd-197/Makefile.am
-===================================================================
---- systemd-197.orig/Makefile.am	2013-01-07 17:37:15.391966148 -0800
-+++ systemd-197/Makefile.am	2013-01-24 10:06:11.219490786 -0800
-@@ -185,7 +185,8 @@
- 	systemd-ask-password \
- 	systemd-tty-ask-password-agent \
- 	systemd-tmpfiles \
--	systemd-machine-id-setup
-+	systemd-machine-id-setup \
-+	systemd-analyze
- 
- bin_PROGRAMS = \
- 	systemd-cgls \
-@@ -220,14 +221,16 @@
- 	systemd-fstab-generator \
- 	systemd-system-update-generator
- 
--dist_bin_SCRIPTS = \
--	src/analyze/systemd-analyze
-+systemd_analyze_SOURCES = \
-+	src/analyze/systemd-analyze.c
- 
--EXTRA_DIST += \
--	src/analyze/systemd-analyze.in
-+systemd_analyze_CFLAGS = \
-+	$(AM_CFLAGS) \
-+	$(DBUS_CFLAGS)
- 
--CLEANFILES += \
--	src/analyze/systemd-analyze
-+systemd_analyze_LDADD = \
-+	libsystemd-shared.la \
-+	libsystemd-dbus.la
- 
- dist_bashcompletion_DATA = \
- 	shell-completion/systemd-bash-completion.sh
-@@ -3839,10 +3842,6 @@
- 	$(SED_PROCESS)
- 	$(AM_V_GEN)chmod +x $@
- 
--src/analyze/systemd-analyze: %: %.in Makefile
--	$(SED_PROCESS)
--	$(AM_V_GEN)chmod +x $@
--
- src/%.c: src/%.gperf
- 	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN)$(GPERF) < $< > $@
-Index: systemd-197/src/analyze/systemd-analyze.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ systemd-197/src/analyze/systemd-analyze.c	2013-01-24 10:06:11.219490786 -0800
-@@ -0,0 +1,684 @@
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <getopt.h>
-+#include <locale.h>
-+
-+#include "install.h"
-+#include "log.h"
-+#include "dbus-common.h"
-+#include "build.h"
-+#include "util.h"
-+
-+#define svg(...) printf(__VA_ARGS__)
-+
-+static UnitFileScope arg_scope = UNIT_FILE_SYSTEM;
-+
-+struct unit_times {
-+        char *name;
-+        unsigned long long int ixt;
-+        unsigned long long int iet;
-+        unsigned long long int axt;
-+        unsigned long long int aet;
-+};
-+
-+
-+unsigned long long int property_getull(
-+                DBusConnection *bus,
-+                const char *dest,
-+                const char *path,
-+                const char *interface,
-+                const char *property)
-+{
-+        _cleanup_dbus_message_unref_ DBusMessage *reply = NULL;
-+        DBusMessageIter iter, sub;
-+        unsigned long long int result = 0;
-+        union {
-+                char byte;
-+                dbus_int16_t i16;
-+                dbus_uint16_t u16;
-+                dbus_int32_t i32;
-+                dbus_uint32_t u32;
-+                dbus_int64_t i64;
-+                dbus_uint64_t u64;
-+        } dbus_result;
-+
-+        int r = bus_method_call_with_reply (
-+                        bus,
-+                        dest,
-+                        path,
-+                        "org.freedesktop.DBus.Properties",
-+                        "Get",
-+                        &reply,
-+                        NULL,
-+                        DBUS_TYPE_STRING, &interface,
-+                        DBUS_TYPE_STRING, &property,
-+                        DBUS_TYPE_INVALID);
-+        if (r)
-+                goto finish;
-+
-+        if (!dbus_message_iter_init(reply, &iter) ||
-+                        dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_VARIANT)
-+                goto finish;
-+
-+        dbus_message_iter_recurse(&iter, &sub);
-+
-+        switch(dbus_message_iter_get_arg_type(&sub)) {
-+                case DBUS_TYPE_BYTE:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.byte);
-+                        result = dbus_result.byte;
-+                        break;
-+                case DBUS_TYPE_INT16:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.i16);
-+                        result = dbus_result.i16;
-+                        break;
-+                case DBUS_TYPE_UINT16:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.u16);
-+                        result = dbus_result.u16;
-+                        break;
-+                case DBUS_TYPE_INT32:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.i32);
-+                        result = dbus_result.i32;
-+                        break;
-+                case DBUS_TYPE_UINT32:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.u32);
-+                        result = dbus_result.u32;
-+                        break;
-+                case DBUS_TYPE_INT64:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.i64);
-+                        result = dbus_result.i64;
-+                        break;
-+                case DBUS_TYPE_UINT64:
-+                        dbus_message_iter_get_basic(&sub, &dbus_result.u64);
-+                        result = dbus_result.u64;
-+                        break;
-+                default:
-+                        goto finish;
-+        }
-+finish:
-+        return result;
-+}
-+
-+static int compare_unit_times1(const void *a, const void *b) {
-+        const struct unit_times *u = a, *v = b;
-+
-+        return (int)(v->aet - v->ixt) - (int)(u->aet - u->ixt);
-+}
-+
-+static int compare_unit_times2(const void *a, const void *b) {
-+        const struct unit_times *u = a, *v = b;
-+
-+        return (long long int)(u->ixt) - (long long int)(v->ixt);
-+}
-+
-+int acquire_time_data(DBusConnection *bus, struct unit_times **out)
-+{
-+        _cleanup_dbus_message_unref_ DBusMessage *reply = NULL;
-+        DBusMessageIter iter, sub, sub2;
-+        unsigned int c = 0, n_units = 0;
-+        struct unit_times *unit_times = NULL;
-+        int r = bus_method_call_with_reply (
-+                        bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "ListUnits",
-+                        &reply,
-+                        NULL,
-+                        DBUS_TYPE_INVALID);
-+        if (r)
-+                goto finish;
-+
-+        if (!dbus_message_iter_init(reply, &iter) ||
-+                        dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_ARRAY ||
-+                        dbus_message_iter_get_element_type(&iter) != DBUS_TYPE_STRUCT)  {
-+                log_error("Failed to parse reply.");
-+                r = -EIO;
-+                goto finish;
-+        }
-+
-+        dbus_message_iter_recurse(&iter, &sub);
-+
-+        while (dbus_message_iter_get_arg_type(&sub) != DBUS_TYPE_INVALID) {
-+                struct unit_times *u;
-+                char *path;
-+
-+                if (dbus_message_iter_get_arg_type(&sub) != DBUS_TYPE_STRUCT) {
-+                        log_error("Failed to parse reply.");
-+                        r = -EIO;
-+                        goto finish;
-+                }
-+
-+                if (c >= n_units) {
-+                        struct unit_times *w;
-+
-+                        n_units = MAX(2*c, 16);
-+                        w = realloc(unit_times, sizeof(struct unit_times) * n_units);
-+
-+                        if (!w) {
-+                                log_error("Failed to allocate unit array.");
-+                                r = -ENOMEM;
-+                                goto finish;
-+                        }
-+
-+                        unit_times = w;
-+                }
-+                u = unit_times+c;
-+
-+                dbus_message_iter_recurse(&sub, &sub2);
-+
-+                if (bus_iter_get_basic_and_next(&sub2, DBUS_TYPE_STRING, &u->name, true) < 0 ||
-+                                dbus_message_iter_next(&sub2), dbus_message_iter_next(&sub2), dbus_message_iter_next(&sub2),
-+                                dbus_message_iter_next(&sub2), dbus_message_iter_next(&sub2),
-+                                bus_iter_get_basic_and_next(&sub2, DBUS_TYPE_OBJECT_PATH, &path, true) < 0) {
-+                        log_error("Failed to parse reply.");
-+                        r = -EIO;
-+                        goto finish;
-+                }
-+                u->name = strdup(u->name);
-+                u->ixt = property_getull(bus,
-+                                "org.freedesktop.systemd1",
-+                                path,
-+                                "org.freedesktop.systemd1.Unit",
-+                                "InactiveExitTimestampMonotonic");
-+                u->iet = property_getull(bus,
-+                                "org.freedesktop.systemd1",
-+                                path,
-+                                "org.freedesktop.systemd1.Unit",
-+                                "InactiveEnterTimestampMonotonic");
-+                u->axt = property_getull(bus,
-+                                "org.freedesktop.systemd1",
-+                                path,
-+                                "org.freedesktop.systemd1.Unit",
-+                                "ActiveExitTimestampMonotonic");
-+                u->aet = property_getull(bus,
-+                                "org.freedesktop.systemd1",
-+                                path,
-+                                "org.freedesktop.systemd1.Unit",
-+                                "ActiveEnterTimestampMonotonic");
-+                dbus_message_iter_next(&sub);
-+                if (u->ixt == 0)
-+                        continue;
-+                c++;
-+        }
-+
-+        *out = unit_times;
-+        return c;
-+finish:
-+        free(unit_times);
-+        return r;
-+}
-+
-+static void svg_graph_box(int height, long long int begin, long long int end, float scale_x, float scale_y)
-+{
-+        double d = 0.0;
-+        int i = 0;
-+
-+        /* outside box, fill */
-+        svg("<rect class=\"box\" x=\"%.03f\" y=\"0\" width=\"%.03f\" height=\"%.03f\" />\n",
-+            0,
-+            scale_x * (end - begin),
-+            scale_y * height);
-+
-+        for (d = 0.000001 * begin; d <= 0.000001 * end;
-+             d += 0.1) {
-+                /* lines for each second */
-+                if (i % 50 == 0)
-+                        svg("  <line class=\"sec5\" x1=\"%.03f\" y1=\"0\" x2=\"%.03f\" y2=\"%.03f\" />\n",
-+                            scale_x * d,
-+                            scale_x * d,
-+                            scale_y * height);
-+                else if (i % 10 == 0)
-+                        svg("  <line class=\"sec1\" x1=\"%.03f\" y1=\"0\" x2=\"%.03f\" y2=\"%.03f\" />\n",
-+                            scale_x * d,
-+                            scale_x * d,
-+                            scale_y * height);
-+                else
-+                        svg("  <line class=\"sec01\" x1=\"%.03f\" y1=\"0\" x2=\"%.03f\" y2=\"%.03f\" />\n",
-+                            scale_x * d,
-+                            scale_x * d,
-+                            scale_y * height);
-+
-+                /* time label */
-+                if (i % 10 == 0)
-+                        svg("  <text class=\"sec\" x=\"%.03f\" y=\"%.03f\" >%.01fs</text>\n",
-+                            scale_x * d, -5.0, d);
-+
-+                i++;
-+        }
-+}
-+
-+int analyze_plot(DBusConnection *bus)
-+{
-+        struct unit_times *times;
-+        int n = acquire_time_data(bus, &times);
-+        int m = n + 1;
-+        unsigned long long int firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time;
-+        long long int starttime = 0;
-+
-+        float scale_x = 100.0;
-+        float scale_y = 20.0;
-+
-+        if (n<=0)
-+                return -n;
-+
-+        qsort(times, n, sizeof(struct unit_times), compare_unit_times2);
-+
-+        firmware_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "FirmwareTimestampMonotonic");
-+        loader_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "LoaderTimestampMonotonic");
-+        kernel_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "KernelTimestamp");
-+        initrd_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "InitRDTimestampMonotonic");
-+        userspace_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "UserspaceTimestampMonotonic");
-+        finish_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "FinishTimestampMonotonic");
-+
-+
-+        if (firmware_time > 0) {
-+                m++;
-+                starttime += firmware_time - loader_time;
-+        }
-+        if (loader_time > 0) {
-+                m++;
-+                starttime += loader_time;
-+        }
-+        if (initrd_time > 0)
-+                m += 2;
-+        else if (kernel_time > 0)
-+                m++;
-+
-+        float width = 80.0 + (scale_x * (starttime + finish_time) * 0.000001);
-+        float height = 150.0 + (m* scale_y);
-+
-+        svg("<?xml version=\"1.0\" standalone=\"no\"?>\n");
-+        svg("<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" ");
-+        svg("\"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">\n");
-+
-+        //svg("<g transform=\"translate(10,%d)\">\n", 1000 + 150 + (pcount * 20));
-+        svg("<svg width=\"%.0fpx\" height=\"%.0fpx\" version=\"1.1\" ", width, height);
-+        svg("xmlns=\"http://www.w3.org/2000/svg\">\n\n");
-+
-+        /* write some basic info as a comment, including some help */
-+        svg("<!-- This file is a systemd-analyze SVG file. It is best rendered in a   -->\n");
-+        svg("<!-- browser such as Chrome/Chromium, firefox. Other applications that   -->\n");
-+        svg("<!-- render these files properly but much more slow are ImageMagick,     -->\n");
-+        svg("<!-- gimp, inkscape, etc.. To display the files on your system, just     -->\n");
-+        svg("<!-- point your browser to file:///var/log/ and click.                   -->\n\n");
-+        svg("<!-- this plot was generated by systemd-analyze version %-16.16s -->\n\n", VERSION);
-+
-+        /* style sheet */
-+        svg("<defs>\n  <style type=\"text/css\">\n    <![CDATA[\n");
-+
-+        svg("      rect       { stroke-width: 1; stroke-opacity: 0; }\n");
-+        svg("      rect.activating   { fill: rgb(255,0,0); fill-opacity: 0.7; }\n");
-+        svg("      rect.active       { fill: rgb(200,150,150); fill-opacity: 0.7; }\n");
-+        svg("      rect.deactivating { fill: rgb(150,100,100); fill-opacity: 0.7; }\n");
-+        svg("      rect.kernel       { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
-+        svg("      rect.initrd       { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
-+        svg("      rect.firmware     { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
-+        svg("      rect.loader       { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
-+        svg("      rect.userspace    { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
-+        svg("      rect.cpu   { fill: rgb(64,64,240); stroke-width: 0; fill-opacity: 0.7; }\n");
-+        svg("      rect.wait  { fill: rgb(240,240,0); stroke-width: 0; fill-opacity: 0.7; }\n");
-+        svg("      rect.bi    { fill: rgb(240,128,128); stroke-width: 0; fill-opacity: 0.7; }\n");
-+        svg("      rect.bo    { fill: rgb(192,64,64); stroke-width: 0; fill-opacity: 0.7; }\n");
-+        svg("      rect.ps    { fill: rgb(192,192,192); stroke: rgb(128,128,128); fill-opacity: 0.7; }\n");
-+        svg("      rect.krnl  { fill: rgb(240,240,0); stroke: rgb(128,128,128); fill-opacity: 0.7; }\n");
-+        svg("      rect.box   { fill: rgb(240,240,240); stroke: rgb(192,192,192); }\n");
-+        svg("      rect.clrw  { stroke-width: 0; fill-opacity: 0.7;}\n");
-+        svg("      line       { stroke: rgb(64,64,64); stroke-width: 1; }\n");
-+        svg("//    line.sec1  { }\n");
-+        svg("      line.sec5  { stroke-width: 2; }\n");
-+        svg("      line.sec01 { stroke: rgb(224,224,224); stroke-width: 1; }\n");
-+        svg("      line.dot   { stroke-dasharray: 2 4; }\n");
-+        svg("      line.idle  { stroke: rgb(64,64,64); stroke-dasharray: 10 6; stroke-opacity: 0.7; }\n");
-+
-+        svg("      .run       { font-size: 8; font-style: italic; }\n");
-+        svg("      text       { font-family: Verdana, Helvetica; font-size: 10; }\n");
-+        svg("      text.sec   { font-size: 8; }\n");
-+        svg("      text.t1    { font-size: 24; }\n");
-+        svg("      text.t2    { font-size: 12; }\n");
-+        svg("      text.idle  { font-size: 18; }\n");
-+
-+        svg("    ]]>\n   </style>\n</defs>\n\n");
-+
-+        svg("<text x=\"20\" y=\"40\">Startup finished in ");
-+
-+        if (firmware_time > 0)
-+                svg("%llums (firmware) + ", (firmware_time - loader_time) / 1000);
-+        if (loader_time > 0)
-+                svg("%llums (loader) + ", loader_time / 1000);
-+        if (initrd_time > 0)
-+                svg("%llums (kernel) + %llums (initrd) + ", initrd_time / 1000, (userspace_time - initrd_time) / 1000);
-+        else if (kernel_time > 0)
-+                svg("%llums (kernel) + ", userspace_time  / 1000);
-+        svg("%llums (userspace) ", (finish_time - userspace_time) / 1000);
-+        if (kernel_time > 0)
-+                svg("= %llums\n", (firmware_time + finish_time) / 1000);
-+        else
-+                svg("= %llums\n", (finish_time - userspace_time) / 1000);
-+        svg("</text>");
-+
-+        svg("<g transform=\"translate(20,100)\">\n");
-+        svg_graph_box(m, starttime, finish_time, scale_x, scale_y);
-+
-+        float top = 0.0;
-+
-+        if (firmware_time > 0) {
-+                svg("  <rect class=\"firmware\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                                scale_x * (starttime - firmware_time) * 0.000001,
-+                                top,
-+                                scale_x * (firmware_time - loader_time) * 0.000001,
-+                                scale_y - 1.0);
-+                svg("  <text x=\"%.03f\" y=\"%.03f\">firmware</text>\n",
-+                    scale_x * (starttime - firmware_time) * 0.000001 + 5.0,
-+                    top + 14.0);
-+                top += scale_y;
-+        }
-+        if (loader_time > 0) {
-+                svg("  <rect class=\"loader\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                                scale_x * (starttime - loader_time) * 0.000001,
-+                                top,
-+                                scale_x * (loader_time) * 0.000001,
-+                                scale_y - 1.0);
-+                svg("  <text x=\"%.03f\" y=\"%.03f\">loader</text>\n",
-+                    scale_x * (starttime - loader_time) * 0.000001 + 5.0,
-+                    top + 14.0);
-+                top += scale_y;
-+        }
-+        if (initrd_time > 0) {
-+                svg("  <rect class=\"kernel\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                                scale_x * (starttime) * 0.000001,
-+                                top,
-+                                scale_x * (initrd_time) * 0.000001,
-+                                scale_y - 1.0);
-+                svg("  <text x=\"%.03f\" y=\"%.03f\">kernel</text>\n",
-+                    scale_x * (starttime) * 0.000001 + 5.0,
-+                    top + 14.0);
-+                top += scale_y;
-+                svg("  <rect class=\"inird\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                                scale_x * (starttime + initrd_time) * 0.000001,
-+                                top,
-+                                scale_x * (userspace_time - initrd_time) * 0.000001,
-+                                scale_y - 1.0);
-+                svg("  <text x=\"%.03f\" y=\"%.03f\">initrd</text>\n",
-+                    scale_x * (starttime + initrd_time) * 0.000001 + 5.0,
-+                    top + 14.0);
-+                top += scale_y;
-+        } else if (kernel_time > 0) {
-+                svg("  <rect class=\"kernel\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                                scale_x * (starttime) * 0.000001,
-+                                top,
-+                                scale_x * (userspace_time) * 0.000001,
-+                                scale_y - 1.0);
-+                svg("  <text x=\"%.03f\" y=\"%.03f\">kernel</text>\n",
-+                    scale_x * (starttime) * 0.000001 + 5.0,
-+                    top + 14.0);
-+                top += scale_y;
-+        }
-+
-+        svg("  <rect class=\"userspace\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                        scale_x * (userspace_time) * 0.000001,
-+                        top,
-+                        scale_x * (finish_time - userspace_time) * 0.000001,
-+                        scale_y - 1.0);
-+        svg("  <text x=\"%.03f\" y=\"%.03f\">userspace</text>\n",
-+            scale_x * (userspace_time) * 0.000001 + 5.0,
-+            top + 14.0);
-+            top += scale_y;
-+
-+
-+        for (int i=0; i < n; i++) {
-+                //draw times[i]
-+
-+                bool drawn = false;
-+
-+                if (times[i].ixt >= userspace_time && times[i].ixt <= finish_time) {
-+                        unsigned long long int end = finish_time;
-+                        if (times[i].aet >= times[i].ixt && times[i].aet < end)
-+                                end = times[i].aet;
-+                        if (times[i].axt >= times[i].ixt && times[i].axt < end)
-+                                end = times[i].axt;
-+                        if (times[i].iet >= times[i].ixt && times[i].iet < end)
-+                                end = times[i].iet;
-+                        svg("  <rect class=\"activating\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                            scale_x * (starttime + times[i].ixt) * 0.000001,
-+                            top + (scale_y * i),
-+                            scale_x * (end - times[i].ixt) * 0.000001,
-+                            scale_y - 1.0);
-+                }
-+                if (times[i].aet >= userspace_time && times[i].aet <= finish_time) {
-+                        unsigned long long int end = finish_time;
-+                        if (times[i].axt >= times[i].aet && times[i].axt < end)
-+                                end = times[i].axt;
-+                        if (times[i].iet >= times[i].aet && times[i].iet < end)
-+                                end = times[i].iet;
-+                        svg("  <rect class=\"active\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                            scale_x * (starttime + times[i].aet) * 0.000001,
-+                            top + (scale_y * i),
-+                            scale_x * (end - times[i].aet) * 0.000001,
-+                            scale_y - 1.0);
-+                }
-+                if (times[i].axt >= userspace_time && times[i].axt <= finish_time) {
-+                        unsigned long long int end = finish_time;
-+                        if (times[i].iet >= times[i].axt && times[i].iet < end)
-+                                end = times[i].iet;
-+                        svg("  <rect class=\"deactivating\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
-+                            scale_x * (starttime + times[i].axt) * 0.000001,
-+                            top + (scale_y * i),
-+                            scale_x * (end - times[i].axt) * 0.000001,
-+                            scale_y - 1.0);
-+                }
-+
-+                svg("  <text x=\"%.03f\" y=\"%.03f\">%s</text>\n",
-+                    (starttime + times[i].ixt) * scale_x * 0.000001 + 5.0,
-+                    top + (scale_y * i) + 14.0,
-+                    times[i].name);
-+
-+        }
-+        svg("</g>\n\n");
-+
-+        svg("</svg>");
-+        return 0;
-+}
-+
-+int analyze_blame(DBusConnection *bus)
-+{
-+        struct unit_times *times;
-+        int n = acquire_time_data(bus, &times);
-+        if (n<=0)
-+                return -n;
-+
-+        qsort(times, n, sizeof(struct unit_times), compare_unit_times1);
-+
-+        for (int i = 0; i < n; i++) {
-+                if (times[i].ixt <= 0 || times[i].aet <= 0)
-+                        continue;
-+                if (times[i].aet <= times[i].ixt)
-+                        continue;
-+                printf("%6llums %s\n", (times[i].aet - times[i].ixt) / 1000, times[i].name);
-+        }
-+        return 0;
-+}
-+int analyze_time(DBusConnection *bus)
-+{
-+        unsigned long long firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time;
-+
-+        firmware_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "FirmwareTimestampMonotonic");
-+        loader_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "LoaderTimestampMonotonic");
-+        kernel_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "KernelTimestamp");
-+        initrd_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "InitRDTimestampMonotonic");
-+        userspace_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "UserspaceTimestampMonotonic");
-+        finish_time = property_getull(bus,
-+                        "org.freedesktop.systemd1",
-+                        "/org/freedesktop/systemd1",
-+                        "org.freedesktop.systemd1.Manager",
-+                        "FinishTimestampMonotonic");
-+
-+        printf("Startup finished in ");
-+
-+        if (firmware_time > 0)
-+                printf("%llums (firmware) + ", (firmware_time - loader_time) / 1000);
-+        if (loader_time > 0)
-+                printf("%llums (loader) + ", loader_time / 1000);
-+        if (initrd_time > 0)
-+                printf("%llums (kernel) + %llums (initrd) + ", initrd_time / 1000, (userspace_time - initrd_time) / 1000);
-+        else if (kernel_time > 0)
-+                printf("%llums (kernel) + ", userspace_time  / 1000);
-+
-+        printf("%llums (userspace) ", (finish_time - userspace_time) / 1000);
-+
-+        if (kernel_time > 0)
-+                printf("= %llums\n", (firmware_time + finish_time) / 1000);
-+        else
-+                printf("= %llums\n", (finish_time - userspace_time) / 1000);
-+
-+        return 0;
-+}
-+
-+void analyze_help()
-+{
-+        printf("%s [OPTIONS...] {COMMAND} ...\n\n"
-+                        "  -h --help           Show this help\n"
-+                        "     --version        Show package version\n"
-+                        "     --system         Connect to system manager\n"
-+                        "     --user           Connect to user service manager\n\n"
-+                        "Commands:\n"
-+                        "  time\n"
-+                        "  blame\n",
-+                        program_invocation_short_name);
-+
-+}
-+
-+static int parse_argv(int argc, char *argv[])
-+{
-+        enum {
-+                ARG_VERSION = 0x100,
-+                ARG_USER,
-+                ARG_SYSTEM
-+        };
-+
-+        static const struct option options[] = {
-+                { "help",      no_argument,       NULL, 'h'           },
-+                { "version",   no_argument,       NULL, ARG_VERSION   },
-+                { "user",      no_argument,       NULL, ARG_USER      },
-+                { "system",    no_argument,       NULL, ARG_SYSTEM    },
-+                { NULL,        0,                 NULL, 0             }
-+        };
-+
-+        int c;
-+
-+        assert(argc >= 0);
-+        assert(argv);
-+
-+        while ((c = getopt_long(argc, argv, "h", options, NULL)) >= 0) {
-+                switch (c) {
-+                        case 'h':
-+                                analyze_help();
-+                                return 0;
-+                        case ARG_VERSION:
-+                                puts(PACKAGE_STRING);
-+                                puts(SYSTEMD_FEATURES);
-+                                return 0;
-+                        case ARG_USER:
-+                                arg_scope = UNIT_FILE_USER;
-+                                break;
-+                        case ARG_SYSTEM:
-+                                arg_scope = UNIT_FILE_SYSTEM;
-+                                break;
-+
-+                        case '?':
-+                                return -EINVAL;
-+
-+                        default:
-+                                log_error("Unknown option code '%c'.", c);
-+                                return -EINVAL;
-+                }
-+        }
-+        return 1;
-+}
-+
-+
-+int main(int argc, char*argv[]) {
-+        int r, retval = EXIT_FAILURE;
-+        DBusConnection *bus = NULL;
-+        DBusError error;
-+        bool private_bus = false;
-+
-+        dbus_error_init(&error);
-+
-+        setlocale(LC_ALL, "");
-+        log_parse_environment();
-+        log_open();
-+
-+        r = parse_argv(argc, argv);
-+        if (r < 0)
-+                goto finish;
-+        else if (r == 0) {
-+                retval = EXIT_SUCCESS;
-+                goto finish;
-+        }
-+
-+        bus_connect(arg_scope == UNIT_FILE_SYSTEM ? DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, &bus, &private_bus, &error);
-+
-+        if (!argv[optind] || streq(argv[optind], "time"))
-+                retval = analyze_time(bus);
-+        else if (streq(argv[optind], "blame"))
-+                retval = analyze_blame(bus);
-+        else if (streq(argv[optind], "plot"))
-+                retval = analyze_plot(bus);
-+        else
-+                log_error("Unknown operation '%s'.", argv[optind]);
-+
-+finish:
-+        if (bus) {
-+                dbus_connection_flush(bus);
-+                dbus_connection_close(bus);
-+                dbus_connection_unref(bus);
-+        }
-+
-+        dbus_error_free(&error);
-+
-+        return retval;
-+}
-Index: systemd-197/src/analyze/systemd-analyze.in
-===================================================================
---- systemd-197.orig/src/analyze/systemd-analyze.in	2013-01-07 16:27:01.000000000 -0800
-+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
-@@ -1,328 +0,0 @@
--#!@PYTHON_BINARY@
--# -*-python-*-
--
--#  This file is part of systemd.
--#
--#  Copyright 2010-2013 Lennart Poettering
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--#
--#  systemd is distributed in the hope that it will be useful, but
--#  WITHOUT ANY WARRANTY; without even the implied warranty of
--#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--#  Lesser General Public License for more details.
--#
--#  You should have received a copy of the GNU Lesser General Public License
--#  along with systemd; If not, see <http://www.gnu.org/licenses/>.
--
--import sys, os
--import argparse
--from gi.repository import Gio
--try:
--        import cairo
--except ImportError:
--        cairo = None
--
--def acquire_time_data():
--        manager = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
--                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.systemd1.Manager', None)
--        units = manager.ListUnits()
--
--        l = []
--
--        for i in units:
--                if i[5] != "":
--                        continue
--
--                properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
--                        None, 'org.freedesktop.systemd1', i[6], 'org.freedesktop.DBus.Properties', None)
--
--                ixt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic')
--                aet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic')
--                axt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic')
--                iet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic')
--
--                l.append((str(i[0]), ixt, aet, axt, iet))
--
--        return l
--
--def acquire_start_time():
--        properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
--                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.DBus.Properties', None)
--
--        # Note that the firmware/loader times are returned as positive
--        # values but are actually considered negative from the point
--        # in time of kernel initialization. Also, the monotonic kernel
--        # time will always be 0 since that's the epoch of the
--        # monotonic clock. Since we want to know whether the kernel
--        # timestamp is set at all we will instead ask for the realtime
--        # clock for this timestamp.
--
--        firmware_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FirmwareTimestampMonotonic')
--        loader_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'LoaderTimestampMonotonic')
--        kernel_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'KernelTimestamp')
--        initrd_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic')
--        userspace_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic')
--        finish_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic')
--
--        if finish_time == 0:
--                sys.exit("Bootup is not yet finished. Please try again later.")
--
--        assert firmware_time >= loader_time
--        assert initrd_time <= userspace_time
--        assert userspace_time <= finish_time
--
--        return firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time
--
--def draw_box(context, j, k, l, m, r = 0, g = 0, b = 0):
--        context.save()
--        context.set_source_rgb(r, g, b)
--        context.rectangle(j, k, l, m)
--        context.fill()
--        context.restore()
--
--def draw_text(context, x, y, text, size = 12, r = 0, g = 0, b = 0, vcenter = 0.5, hcenter = 0.5):
--        context.save()
--
--        context.set_source_rgb(r, g, b)
--        context.select_font_face("Sans", cairo.FONT_SLANT_NORMAL, cairo.FONT_WEIGHT_NORMAL)
--        context.set_font_size(size)
--
--        if vcenter or hcenter:
--                x_bearing, y_bearing, width, height = context.text_extents(text)[:4]
--
--                if hcenter:
--                        x = x - width*hcenter - x_bearing
--
--                if vcenter:
--                        y = y - height*vcenter - y_bearing
--
--        context.move_to(x, y)
--        context.show_text(text)
--
--        context.restore()
--
--def time():
--
--        firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time = acquire_start_time()
--
--        sys.stdout.write("Startup finished in ")
--
--        if firmware_time > 0:
--                sys.stdout.write("%lums (firmware) + " % ((firmware_time - loader_time) / 1000))
--        if loader_time > 0:
--                sys.stdout.write("%lums (loader) + " % (loader_time / 1000))
--        if initrd_time > 0:
--                sys.stdout.write("%lums (kernel) + %lums (initrd) + " % (initrd_time / 1000, (userspace_time - initrd_time) / 1000))
--        elif kernel_time > 0:
--                sys.stdout.write("%lums (kernel) + " % (userspace_time  / 1000))
--
--        sys.stdout.write("%lums (userspace) " % ((finish_time - userspace_time) / 1000))
--
--        if kernel_time > 0:
--                sys.stdout.write("= %lums\n" % ((firmware_time + finish_time) / 1000))
--        else:
--                sys.stdout.write("= %lums\n" % ((finish_time - userspace_time) / 1000))
--
--def blame():
--
--        data = acquire_time_data()
--        s = sorted(data, key = lambda i: i[2] - i[1], reverse = True)
--
--        for name, ixt, aet, axt, iet in s:
--
--                if ixt <= 0 or aet <= 0:
--                        continue
--
--                if aet <= ixt:
--                        continue
--
--                sys.stdout.write("%6lums %s\n" % ((aet - ixt) / 1000, name))
--
--def plot():
--        if cairo is None:
--                sys.exit("Failed to initilize python-cairo required for 'plot' verb.")
--        firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time = acquire_start_time()
--        data = acquire_time_data()
--        s = sorted(data, key = lambda i: i[1])
--
--        # Account for kernel and initramfs bars if they exist
--        if initrd_time > 0:
--                count = 3
--        else:
--                count = 2
--
--        for name, ixt, aet, axt, iet in s:
--
--                if (ixt >= userspace_time and ixt <= finish_time) or \
--                                (aet >= userspace_time and aet <= finish_time) or \
--                                (axt >= userspace_time and axt <= finish_time):
--                        count += 1
--
--        border = 100
--        bar_height = 20
--        bar_space = bar_height * 0.1
--
--        # 1000px = 10s, 1px = 10ms
--        width = finish_time/10000 + border*2
--        height = count * (bar_height + bar_space) + border * 2
--
--        if width < 1000:
--                width = 1000
--
--        surface = cairo.SVGSurface(sys.stdout, width, height)
--        context = cairo.Context(surface)
--
--        draw_box(context, 0, 0, width, height, 1, 1, 1)
--
--        context.translate(border + 0.5, border + 0.5)
--
--        context.save()
--        context.set_line_width(1)
--        context.set_source_rgb(0.7, 0.7, 0.7)
--
--        for x in range(0, int(finish_time/10000) + 100, 100):
--                context.move_to(x, 0)
--                context.line_to(x, height-border*2)
--
--        context.move_to(0, 0)
--        context.line_to(width-border*2, 0)
--
--        context.move_to(0, height-border*2)
--        context.line_to(width-border*2, height-border*2)
--
--        context.stroke()
--        context.restore()
--
--        osrel = "Linux"
--        if os.path.exists("/etc/os-release"):
--                for line in open("/etc/os-release"):
--                        if line.startswith('PRETTY_NAME='):
--                                osrel = line[12:]
--                                osrel = osrel.strip('\"\n')
--                                break
--
--        banner = "{} {} ({} {}) {}".format(osrel, *(os.uname()[1:5]))
--        draw_text(context, 0, -15, banner, hcenter = 0, vcenter = 1)
--
--        for x in range(0, int(finish_time/10000) + 100, 100):
--                draw_text(context, x, -5, "%lus" % (x/100), vcenter = 0, hcenter = 0)
--
--        y = 0
--
--        # draw boxes for kernel and initramfs boot time
--        if initrd_time > 0:
--                draw_box(context, 0, y, initrd_time/10000, bar_height, 0.7, 0.7, 0.7)
--                draw_text(context, 10, y + bar_height/2, "kernel", hcenter = 0)
--                y += bar_height + bar_space
--
--                draw_box(context, initrd_time/10000, y, userspace_time/10000-initrd_time/10000, bar_height, 0.7, 0.7, 0.7)
--                draw_text(context, initrd_time/10000 + 10, y + bar_height/2, "initramfs", hcenter = 0)
--                y += bar_height + bar_space
--
--        else:
--                draw_box(context, 0, y, userspace_time/10000, bar_height, 0.6, 0.6, 0.6)
--                draw_text(context, 10, y + bar_height/2, "kernel", hcenter = 0)
--                y += bar_height + bar_space
--
--        draw_box(context, userspace_time/10000, y, finish_time/10000-userspace_time/10000, bar_height, 0.7, 0.7, 0.7)
--        draw_text(context, userspace_time/10000 + 10, y + bar_height/2, "userspace", hcenter = 0)
--        y += bar_height + bar_space
--
--        for name, ixt, aet, axt, iet in s:
--
--                drawn = False
--                left = -1
--
--                if ixt >= userspace_time and ixt <= finish_time:
--
--                        # Activating
--                        a = ixt
--                        b = min(filter(lambda x: x >= ixt, (aet, axt, iet, finish_time))) - ixt
--
--                        draw_box(context, a/10000, y, b/10000, bar_height, 1, 0, 0)
--                        drawn = True
--
--                        if left < 0:
--                                left = a
--
--                if aet >= userspace_time and aet <= finish_time:
--
--                        # Active
--                        a = aet
--                        b = min(filter(lambda x: x >= aet, (axt, iet, finish_time))) - aet
--
--                        draw_box(context, a/10000, y, b/10000, bar_height, .8, .6, .6)
--                        drawn = True
--
--                        if left < 0:
--                                left = a
--
--                if axt >= userspace_time and axt <= finish_time:
--
--                        # Deactivating
--                        a = axt
--                        b = min(filter(lambda x: x >= axt, (iet, finish_time))) - axt
--
--                        draw_box(context, a/10000, y, b/10000, bar_height, .6, .4, .4)
--                        drawn = True
--
--                        if left < 0:
--                                left = a
--
--                if drawn:
--                        x = left/10000
--
--                        if x < width/2-border:
--                                draw_text(context, x + 10, y + bar_height/2, name, hcenter = 0)
--                        else:
--                                draw_text(context, x - 10, y + bar_height/2, name, hcenter = 1)
--
--                        y += bar_height + bar_space
--
--        draw_text(context, 0, height-border*2, "Legend: Red = Activating; Pink = Active; Dark Pink = Deactivating", hcenter = 0, vcenter = -1)
--
--        if initrd_time > 0:
--                draw_text(context, 0, height-border*2 + bar_height, "Startup finished in %lums (kernel) + %lums (initramfs) + %lums (userspace) = %lums" % ( \
--                        initrd_time/1000, \
--                        (userspace_time - initrd_time)/1000, \
--                        (finish_time - userspace_time)/1000, \
--                        finish_time/1000), hcenter = 0, vcenter = -1)
--        else:
--                draw_text(context, 0, height-border*2 + bar_height, "Startup finished in %lums (kernel) + %lums (userspace) = %lums" % ( \
--                        userspace_time/1000, \
--                        (finish_time - userspace_time)/1000, \
--                        finish_time/1000), hcenter = 0, vcenter = -1)
--
--        surface.finish()
--
--parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
--                                 version='systemd-analyze @PACKAGE_VERSION@',
--                                 description='Process systemd profiling information',
--                                 epilog='''\
--time - print time spent in the kernel before reaching userspace
--blame - print list of running units ordered by time to init
--plot - output SVG graphic showing service initialization
--''')
--
--parser.add_argument('action', choices=('time', 'blame', 'plot'),
--                    default='time', nargs='?',
--                    help='action to perform (default: time)')
--parser.add_argument('--user', action='store_true',
--                    help='use the session bus')
--
--args = parser.parse_args()
--
--if args.user:
--        bus = Gio.BusType.SESSION
--else:
--        bus = Gio.BusType.SYSTEM
--
--verb = {'time' : time,
--	'blame': blame,
--	'plot' : plot,
--	}
--verb.get(args.action)()
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
index aa186bd..8d1aa7d 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -1,20 +1,20 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: systemd-196/src/fsck/fsck.c
+Index: systemd-198/src/fsck/fsck.c
 ===================================================================
---- systemd-196.orig/src/fsck/fsck.c	2012-07-26 03:45:14.000000000 -0700
-+++ systemd-196/src/fsck/fsck.c	2013-01-21 16:10:46.807537608 -0800
-@@ -36,6 +36,8 @@
- #include "bus-errors.h"
+--- systemd-198.orig/src/fsck/fsck.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/fsck/fsck.c	2013-03-09 14:49:03.756572873 -0800
+@@ -37,6 +37,8 @@
  #include "virt.h"
+ #include "fileio.h"
  
 +#include "config.h"
 +
  static bool arg_skip = false;
  static bool arg_force = false;
  static bool arg_show_progress = false;
-@@ -193,9 +195,16 @@
+@@ -203,9 +205,16 @@
                  char *device;
                  double p;
                  usec_t t;
@@ -33,10 +33,10 @@ Index: systemd-196/src/fsck/fsck.c
  
                  /* Only show one progress counter at max */
                  if (!locked) {
-Index: systemd-196/src/core/swap.c
+Index: systemd-198/src/core/swap.c
 ===================================================================
---- systemd-196.orig/src/core/swap.c	2012-10-29 19:40:42.000000000 -0700
-+++ systemd-196/src/core/swap.c	2013-01-21 16:15:11.751544181 -0800
+--- systemd-198.orig/src/core/swap.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/core/swap.c	2013-03-09 14:49:03.756572873 -0800
 @@ -41,6 +41,8 @@
  #include "path-util.h"
  #include "virt.h"
@@ -46,7 +46,7 @@ Index: systemd-196/src/core/swap.c
  static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
          [SWAP_DEAD] = UNIT_INACTIVE,
          [SWAP_ACTIVATING] = UNIT_ACTIVATING,
-@@ -1059,6 +1061,7 @@
+@@ -1037,6 +1039,7 @@
                  char *dev = NULL, *d;
                  int prio = 0, k;
  
@@ -54,7 +54,7 @@ Index: systemd-196/src/core/swap.c
                  k = fscanf(m->proc_swaps,
                             "%ms "  /* device/file */
                             "%*s "  /* type of swap */
-@@ -1066,6 +1069,16 @@
+@@ -1044,6 +1047,16 @@
                             "%*s "  /* used */
                             "%i\n", /* priority */
                             &dev, &prio);
@@ -71,10 +71,10 @@ Index: systemd-196/src/core/swap.c
                  if (k != 2) {
                          if (k == EOF)
                                  break;
-Index: systemd-196/src/core/mount-setup.c
+Index: systemd-198/src/core/mount-setup.c
 ===================================================================
---- systemd-196.orig/src/core/mount-setup.c	2012-11-09 06:55:35.000000000 -0800
-+++ systemd-196/src/core/mount-setup.c	2013-01-21 16:10:46.807537608 -0800
+--- systemd-198.orig/src/core/mount-setup.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/core/mount-setup.c	2013-03-09 14:49:03.760572872 -0800
 @@ -28,6 +28,7 @@
  #include <assert.h>
  #include <unistd.h>
@@ -83,16 +83,16 @@ Index: systemd-196/src/core/mount-setup.c
  
  #include "mount-setup.h"
  #include "dev-setup.h"
-@@ -42,6 +43,8 @@
- #include "missing.h"
+@@ -43,6 +44,8 @@
  #include "virt.h"
+ #include "efivars.h"
  
 +#include "config.h"
 +
  #ifndef TTY_GID
  #define TTY_GID 5
  #endif
-@@ -224,9 +227,12 @@
+@@ -231,9 +234,12 @@
          for (;;) {
                  char *controller;
                  int enabled = 0;
@@ -107,11 +107,11 @@ Index: systemd-196/src/core/mount-setup.c
                          if (feof(f))
                                  break;
  
-Index: systemd-196/src/core/mount.c
+Index: systemd-198/src/core/mount.c
 ===================================================================
---- systemd-196.orig/src/core/mount.c	2012-10-22 16:53:02.000000000 -0700
-+++ systemd-196/src/core/mount.c	2013-01-21 16:10:46.811537609 -0800
-@@ -41,6 +41,8 @@
+--- systemd-198.orig/src/core/mount.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/core/mount.c	2013-03-09 14:49:03.760572872 -0800
+@@ -42,6 +42,8 @@
  #include "exit-status.h"
  #include "def.h"
  
@@ -120,7 +120,7 @@ Index: systemd-196/src/core/mount.c
  static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
          [MOUNT_DEAD] = UNIT_INACTIVE,
          [MOUNT_MOUNTING] = UNIT_ACTIVATING,
-@@ -1538,7 +1540,7 @@
+@@ -1584,7 +1586,7 @@
                  int k;
  
                  device = path = options = options2 = fstype = d = p = o = NULL;
@@ -129,7 +129,7 @@ Index: systemd-196/src/core/mount.c
                  if ((k = fscanf(m->proc_self_mountinfo,
                                  "%*s "       /* (1) mount id */
                                  "%*s "       /* (2) parent id */
-@@ -1557,7 +1559,31 @@
+@@ -1603,7 +1605,31 @@
                                  &fstype,
                                  &device,
                                  &options2)) != 5) {
@@ -162,10 +162,10 @@ Index: systemd-196/src/core/mount.c
                          if (k == EOF)
                                  break;
  
-Index: systemd-196/src/core/umount.c
+Index: systemd-198/src/core/umount.c
 ===================================================================
---- systemd-196.orig/src/core/umount.c	2012-11-16 09:32:41.000000000 -0800
-+++ systemd-196/src/core/umount.c	2013-01-21 16:10:46.811537609 -0800
+--- systemd-198.orig/src/core/umount.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/core/umount.c	2013-03-09 14:49:03.760572872 -0800
 @@ -36,6 +36,8 @@
  #include "util.h"
  #include "virt.h"
@@ -235,20 +235,20 @@ Index: systemd-196/src/core/umount.c
                          if (k == EOF)
                                  break;
  
-Index: systemd-196/src/shared/socket-util.c
+Index: systemd-198/src/shared/socket-util.c
 ===================================================================
---- systemd-196.orig/src/shared/socket-util.c	2012-11-14 13:21:15.000000000 -0800
-+++ systemd-196/src/shared/socket-util.c	2013-01-21 16:10:46.811537609 -0800
-@@ -39,6 +39,8 @@
- #include "socket-util.h"
+--- systemd-198.orig/src/shared/socket-util.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/shared/socket-util.c	2013-03-09 14:49:03.760572872 -0800
+@@ -40,6 +40,8 @@
  #include "missing.h"
+ #include "fileio.h"
  
 +#include "config.h"
 +
  int socket_address_parse(SocketAddress *a, const char *s) {
          int r;
          char *e, *n;
-@@ -202,8 +204,16 @@
+@@ -203,8 +205,16 @@
          a->type = SOCK_RAW;
  
          errno = 0;
@@ -266,10 +266,10 @@ Index: systemd-196/src/shared/socket-util.c
  
          family = netlink_family_from_string(sfamily);
          if (family < 0)
-Index: systemd-196/src/tmpfiles/tmpfiles.c
+Index: systemd-198/src/tmpfiles/tmpfiles.c
 ===================================================================
---- systemd-196.orig/src/tmpfiles/tmpfiles.c	2012-10-23 16:06:30.000000000 -0700
-+++ systemd-196/src/tmpfiles/tmpfiles.c	2013-01-21 16:10:46.811537609 -0800
+--- systemd-198.orig/src/tmpfiles/tmpfiles.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/tmpfiles/tmpfiles.c	2013-03-09 14:55:40.772566599 -0800
 @@ -51,6 +51,8 @@
  #include "conf-files.h"
  #include "capability.h"
@@ -279,26 +279,25 @@ Index: systemd-196/src/tmpfiles/tmpfiles.c
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -990,7 +992,7 @@
-         i = new0(Item, 1);
+@@ -993,6 +995,7 @@
          if (!i)
                  return log_oom();
--
+ 
 +#ifdef HAVE_MSFORMAT
-         if (sscanf(buffer,
-                    "%c "
-                    "%ms "
-@@ -1006,6 +1008,28 @@
+         r = sscanf(buffer,
+                    "%c %ms %ms %ms %ms %ms %n",
+                    &type,
+@@ -1002,6 +1005,29 @@
                     &group,
                     &age,
-                    &n) < 2) {
+                    &n);
 +#else
-+	i->path = malloc(257);
-+	mode = malloc(257);
-+	user = malloc(257);
-+	group = malloc(257);
-+	age = malloc(257);
-+        if (sscanf(buffer,
++        i->path = malloc(257);
++        mode = malloc(257);
++        user = malloc(257);
++        group = malloc(257);
++        age = malloc(257);
++        r = sscanf(buffer,
 +                   "%c "
 +                   "%256s "
 +                   "%256s "
@@ -312,38 +311,39 @@ Index: systemd-196/src/tmpfiles/tmpfiles.c
 +                   user,
 +                   group,
 +                   age,
-+                   &n) < 2) {
++                   &n);
 +#endif /* HAVE_MSFORMAT */
++
+         if (r < 2) {
                  log_error("[%s:%u] Syntax error.", fname, line);
                  r = -EIO;
-                 goto finish;
-Index: systemd-196/src/cryptsetup/cryptsetup-generator.c
+Index: systemd-198/src/cryptsetup/cryptsetup-generator.c
 ===================================================================
---- systemd-196.orig/src/cryptsetup/cryptsetup-generator.c	2012-08-08 14:53:24.000000000 -0700
-+++ systemd-196/src/cryptsetup/cryptsetup-generator.c	2013-01-21 16:10:46.811537609 -0800
-@@ -30,6 +30,8 @@
- #include "virt.h"
+--- systemd-198.orig/src/cryptsetup/cryptsetup-generator.c	2013-03-07 13:18:34.000000000 -0800
++++ systemd-198/src/cryptsetup/cryptsetup-generator.c	2013-03-09 14:51:33.080571639 -0800
+@@ -31,6 +31,8 @@
  #include "strv.h"
+ #include "fileio.h"
  
 +#include "config.h"
 +
  static const char *arg_dest = "/tmp";
  static bool arg_enabled = true;
  static bool arg_read_crypttab = true;
-@@ -421,8 +423,15 @@
-                 l = strstrip(line);
-                 if (*l == '#' || *l == 0)
-                         continue;
--
+@@ -395,7 +397,16 @@
+                         if (*l == '#' || *l == 0)
+                                 continue;
+ 
 +#ifdef HAVE_MSFORMAT
-                 k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options);
+                         k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options);
 +#else
-+		name = malloc(257);
-+		device = malloc(257);
-+		password = malloc(257);
-+		options = malloc(257);
-+                k = sscanf(l, "%256s %256s %256s %256s", name, device, password, options);
++                        name = malloc(257);
++                        device = malloc(257);
++                        password = malloc(257);
++                        options = malloc(257);
++                        k = sscanf(l, "%256s %256s %256s %256s", name, device, password, options);
 +#endif /* HAVE_MSFORMAT */
-                 if (k < 2 || k > 4) {
-                         log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
-                         r = EXIT_FAILURE;
++
+                         if (k < 2 || k > 4) {
+                                 log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
+                                 r = EXIT_FAILURE;
diff --git a/meta/recipes-core/systemd/systemd/udev-linkage.patch b/meta/recipes-core/systemd/systemd/udev-linkage.patch
deleted file mode 100644
index a0d9b4c..0000000
--- a/meta/recipes-core/systemd/systemd/udev-linkage.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Don't cause libudev to link against libsystemd-daemon.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 8ee37c2bed1d452d566abf85b0cdf732b7ca029a Mon Sep 17 00:00:00 2001
-From: Kay Sievers <kay@vrfy.org>
-Date: Thu, 7 Feb 2013 13:47:46 +0100
-Subject: [PATCH] build-sys: at least for now, never link libudev against
- systemd's shared libraries
-
----
- Makefile.am |   12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 474110a..0e6c88f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -811,8 +811,6 @@ libsystemd_shared_la_SOURCES = \
- 	src/shared/calendarspec.c \
- 	src/shared/calendarspec.h
- 
--libsystemd_shared_la_LIBADD = libsystemd-daemon.la
--
- #-------------------------------------------------------------------------------
- noinst_LTLIBRARIES += \
- 	libsystemd-dbus.la
-@@ -1662,6 +1660,9 @@ systemd_tty_ask_password_agent_LDADD = \
- libsystemd_daemon_la_SOURCES = \
- 	src/libsystemd-daemon/sd-daemon.c
- 
-+libsystemd_daemon_internal_la_SOURCES = \
-+        $(libsystemd_daemon_la_SOURCES)
-+
- libsystemd_daemon_la_CFLAGS = \
- 	$(AM_CFLAGS) \
- 	-fvisibility=hidden \
-@@ -1689,6 +1690,9 @@ UNINSTALL_EXEC_HOOKS += libsystemd-daemon-uninstall-hook
- lib_LTLIBRARIES += \
- 	libsystemd-daemon.la
- 
-+noinst_LTLIBRARIES += \
-+        libsystemd-daemon-internal.la
-+
- pkgconfiglib_DATA += \
- 	src/libsystemd-daemon/libsystemd-daemon.pc
- 
-@@ -1768,7 +1772,9 @@ libudev_la_LDFLAGS = \
- 	-Wl,--version-script=$(top_srcdir)/src/libudev/libudev.sym
- 
- libudev_la_LIBADD = \
--	libsystemd-shared.la
-+	libsystemd-shared.la \
-+	libsystemd-daemon-internal.la \
-+	libsystemd-id128-internal.la
- 
- pkgconfiglib_DATA += \
- 	src/libudev/libudev.pc
--- 
-1.7.10.4
-
diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
deleted file mode 100644
index 5ba3a23..0000000
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ /dev/null
@@ -1,275 +0,0 @@
-DESCRIPTION = "Systemd a init replacement"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
-
-LICENSE = "GPLv2 & LGPLv2.1 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
-
-PROVIDES = "udev"
-
-PE = "1"
-PR = "r4"
-
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SECTION = "base/shell"
-
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
-
-SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
-           file://touchscreen.rules \
-           file://modprobe.rules \
-           file://var-run.conf \
-           ${UCLIBCPATCHES} \
-           file://00-create-volatile.conf \
-           file://0001-systemd-analyze-rewrite-in-C.patch \
-           file://udev-linkage.patch \
-           file://init \
-          "
-SRC_URI[md5sum] = "56a860dceadfafe59f40141eb5223743"
-SRC_URI[sha256sum] = "e6857ea21ae24d7056e7b0f4c2aaaba73b8bf57025b8949c0a8af0c1bc9774b5"
-
-UCLIBCPATCHES = ""
-UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
-                             file://systemd-pam-fix-execvpe.patch \
-                             file://systemd-pam-fix-fallocate.patch \
-                             file://systemd-pam-fix-getty-unit.patch \
-                             file://systemd-pam-fix-mkostemp.patch \
-                             file://systemd-pam-fix-msformat.patch \
-                             file://optional_secure_getenv.patch \
-                            "
-LDFLAGS_libc-uclibc_append = " -lrt"
-
-GTKDOC_DOCDIR = "${S}/docs/"
-
-PACKAGECONFIG ??= "xz"
-# Sign the journal for anti-tampering
-PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
-# Compress the journal
-PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
-
-CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
-
-# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
-EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
-                 --with-rootlibdir=${base_libdir} \
-                 --sbindir=${base_sbindir} \
-                 --libexecdir=${base_libdir} \
-                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-                 --enable-xz \
-                 --disable-manpages \
-                 --disable-coredump \
-                 --disable-introspection \
-                 --disable-tcpwrap \
-                 --enable-split-usr \
-                 --disable-microhttpd \
-                 --without-python \
-                 --with-sysvrcnd-path=${sysconfdir} \
-                 ac_cv_path_KILL=${base_bindir}/kill \
-               "
-# uclibc does not have NSS
-EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
-
-# There's no docbook-xsl-native, so for the xsltproc check to false
-do_configure_prepend() {
-	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-
-	sed -i -e 's:=/root:=${ROOT_HOME}:g' units/*.service*
-}
-
-do_install() {
-	autotools_do_install
-	install -d ${D}/${base_sbindir}
-	# provided by a seperate recipe
-	rm ${D}${systemd_unitdir}/system/serial-getty* -f
-
-	# provide support for initramfs
-	ln -s ${systemd_unitdir}/systemd ${D}/init
-	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
-
-	# create dir for journal
-	install -d ${D}${localstatedir}/log/journal
-
-	# create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-	touch ${D}${sysconfdir}/machine-id
-
-	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
-
-	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
-
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
-	fi
-}
-
-python populate_packages_prepend (){
-    systemdlibdir = d.getVar("base_libdir", True)
-    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
-}
-PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
-
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "-r lock"
-
-FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
-
-FILES_${PN}-initramfs = "/init"
-RDEPENDS_${PN}-initramfs = "${PN}"
-
-FILES_${PN}-gui = "${bindir}/systemadm"
-
-FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
-                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
-                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
-
-RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
-
-CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
-                ${sysconfdir}/systemd/logind.conf \
-                ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
-
-FILES_${PN} = " ${base_bindir}/* \
-                ${datadir}/dbus-1/services \
-                ${datadir}/dbus-1/system-services \
-                ${datadir}/polkit-1 \
-                ${datadir}/${PN} \
-                ${sysconfdir}/bash_completion.d/ \
-                ${sysconfdir}/binfmt.d/ \
-                ${sysconfdir}/dbus-1/ \
-                ${sysconfdir}/machine-id \
-                ${sysconfdir}/modules-load.d/ \
-                ${sysconfdir}/sysctl.d/ \
-                ${sysconfdir}/systemd/ \
-                ${sysconfdir}/tmpfiles.d/ \
-                ${sysconfdir}/xdg/ \
-                ${sysconfdir}/init.d/README \
-                ${systemd_unitdir}/* \
-                ${systemd_unitdir}/system/* \
-                /lib/udev/rules.d/99-systemd.rules \
-                ${base_libdir}/security/*.so \
-                ${libdir}/libnss_myhostname.so.2 \
-                /cgroup \
-                ${bindir}/systemd* \
-                ${bindir}/localectl \
-                ${bindir}/hostnamectl \
-                ${bindir}/timedatectl \
-                ${exec_prefix}/lib/tmpfiles.d/*.conf \
-                ${exec_prefix}/lib/systemd \
-                ${exec_prefix}/lib/binfmt.d \
-                ${exec_prefix}/lib/modules-load.d \
-                ${exec_prefix}/lib/sysctl.d \
-                ${localstatedir} \
-                ${libexecdir} \
-                /lib/udev/rules.d/70-uaccess.rules \
-                /lib/udev/rules.d/71-seat.rules \
-                /lib/udev/rules.d/73-seat-late.rules \
-                /lib/udev/rules.d/99-systemd.rules \
-               "
-
-FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
-
-RDEPENDS_${PN} += "dbus"
-
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
-                      util-linux-agetty \
-                      util-linux-fsck e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-"
-
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-hwdb"
-
-FILES_udev-dbg += "/lib/udev/.debug"
-
-RDEPENDS_udev += "udev-utils"
-RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
-
-FILES_udev += "${base_sbindir}/udevd \
-               ${base_libdir}/systemd/systemd-udevd \
-               /lib/udev/accelerometer \
-               /lib/udev/ata_id \
-               /lib/udev/cdrom_id \
-               /lib/udev/collect \
-               /lib/udev/findkeyboards \
-               /lib/udev/keyboard-force-release.sh \
-               /lib/udev/keymap \
-               /lib/udev/mtd_probe \
-               /lib/udev/scsi_id \
-               /lib/udev/v4l_id \
-               /lib/udev/keymaps \
-               /lib/udev/rules.d/4*.rules \
-               /lib/udev/rules.d/5*.rules \
-               /lib/udev/rules.d/6*.rules \
-               /lib/udev/rules.d/70-power-switch.rules \
-               /lib/udev/rules.d/75*.rules \
-               /lib/udev/rules.d/78*.rules \
-               /lib/udev/rules.d/8*.rules \
-               /lib/udev/rules.d/95*.rules \
-               ${sysconfdir}/udev \
-               ${sysconfdir}/init.d/systemd-udevd \
-               ${systemd_unitdir}/system/*udev* \
-               ${systemd_unitdir}/system/*.wants/*udev* \
-              "
-
-FILES_udev-consolekit += "/lib/ConsoleKit"
-RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-FILES_udev-utils = "${bindir}/udevadm"
-
-FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
-
-INITSCRIPT_PACKAGES = "udev"
-INITSCRIPT_NAME_udev = "systemd-udevd"
-INITSCRIPT_PARAMS_udev = "start 03 S ."
-
-# TODO:
-# u-a for runlevel and telinit
-
-pkg_postinst_systemd () {
-update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
-update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
-update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
-}
-
-pkg_prerm_systemd () {
-update-alternatives --remove init ${systemd_unitdir}/systemd
-update-alternatives --remove halt ${base_bindir}/systemctl
-update-alternatives --remove reboot ${base_bindir}/systemctl
-update-alternatives --remove shutdown ${base_bindir}/systemctl
-update-alternatives --remove poweroff ${base_bindir}/systemctl
-}
-
-pkg_postinst_udev-hwdb () {
-	if test -n "$D"; then
-		exit 1
-	fi
-
-	udevadm hwdb --update
-}
-
-pkg_prerm_udev-hwdb () {
-	if test -n "$D"; then
-		exit 1
-	fi
-
-	rm -f ${sysconfdir}/udev/hwdb.bin
-}
-
-# As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
-# building udev and systemd in world builds.
-python () {
-    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
-        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
-}
diff --git a/meta/recipes-core/systemd/systemd_198.bb b/meta/recipes-core/systemd/systemd_198.bb
new file mode 100644
index 0000000..6a8db51
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd_198.bb
@@ -0,0 +1,275 @@
+DESCRIPTION = "Systemd a init replacement"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+PE = "1"
+
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SECTION = "base/shell"
+
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
+
+SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
+           file://touchscreen.rules \
+           file://modprobe.rules \
+           file://var-run.conf \
+           ${UCLIBCPATCHES} \
+           file://00-create-volatile.conf \
+           file://init \
+          "
+SRC_URI[md5sum] = "26a75e2a310f8c1c1ea9ec26ddb171c5"
+SRC_URI[sha256sum] = "444492355e5ff0ad99e0691ecaff1081ee8d45901580f47ba8b74e56107c71bf"
+
+UCLIBCPATCHES = ""
+UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
+                             file://systemd-pam-fix-execvpe.patch \
+                             file://systemd-pam-fix-fallocate.patch \
+                             file://systemd-pam-fix-getty-unit.patch \
+                             file://systemd-pam-fix-mkostemp.patch \
+                             file://systemd-pam-fix-msformat.patch \
+                             file://optional_secure_getenv.patch \
+                            "
+LDFLAGS_libc-uclibc_append = " -lrt"
+
+GTKDOC_DOCDIR = "${S}/docs/"
+
+PACKAGECONFIG ??= "xz"
+# Sign the journal for anti-tampering
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+
+CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
+
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
+                 --with-rootlibdir=${base_libdir} \
+                 --sbindir=${base_sbindir} \
+                 --libexecdir=${base_libdir} \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 --enable-xz \
+                 --disable-manpages \
+                 --disable-coredump \
+                 --disable-introspection \
+                 --disable-tcpwrap \
+                 --enable-split-usr \
+                 --disable-microhttpd \
+                 --without-python \
+                 --with-sysvrcnd-path=${sysconfdir} \
+                 ac_cv_path_KILL=${base_bindir}/kill \
+               "
+# uclibc does not have NSS
+EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
+
+# There's no docbook-xsl-native, so for the xsltproc check to false
+do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+
+	sed -i -e 's:=/root:=${ROOT_HOME}:g' units/*.service*
+}
+
+do_install() {
+	autotools_do_install
+	install -d ${D}/${base_sbindir}
+	# provided by a seperate recipe
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+
+	# provide support for initramfs
+	ln -s ${systemd_unitdir}/systemd ${D}/init
+	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
+
+	# create dir for journal
+	install -d ${D}${localstatedir}/log/journal
+
+	# create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
+	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+	fi
+}
+
+python populate_packages_prepend (){
+    systemdlibdir = d.getVar("base_libdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
+
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r lock"
+
+FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
+
+FILES_${PN}-gui = "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
+
+CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+                ${sysconfdir}/systemd/logind.conf \
+                ${sysconfdir}/systemd/system.conf \
+                ${sysconfdir}/systemd/user.conf"
+
+FILES_${PN} = " ${base_bindir}/* \
+                ${datadir}/bash-completion \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${PN} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/binfmt.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
+                ${sysconfdir}/init.d/README \
+                ${systemd_unitdir}/* \
+                ${systemd_unitdir}/system/* \
+                /lib/udev/rules.d/99-systemd.rules \
+                ${base_libdir}/security/*.so \
+                ${libdir}/libnss_myhostname.so.2 \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${bindir}/localectl \
+                ${bindir}/hostnamectl \
+                ${bindir}/timedatectl \
+                ${bindir}/bootctl \
+                ${bindir}/kernel-install \
+                ${exec_prefix}/lib/tmpfiles.d/*.conf \
+                ${exec_prefix}/lib/systemd \
+                ${exec_prefix}/lib/binfmt.d \
+                ${exec_prefix}/lib/modules-load.d \
+                ${exec_prefix}/lib/sysctl.d \
+                ${localstatedir} \
+                ${libexecdir} \
+                /lib/udev/rules.d/70-uaccess.rules \
+                /lib/udev/rules.d/71-seat.rules \
+                /lib/udev/rules.d/73-seat-late.rules \
+                /lib/udev/rules.d/99-systemd.rules \
+               "
+
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+
+RDEPENDS_${PN} += "dbus"
+
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
+                      util-linux-agetty \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+"
+
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-hwdb"
+
+FILES_udev-dbg += "/lib/udev/.debug"
+
+RDEPENDS_udev += "udev-utils"
+RPROVIDES_udev = "hotplug"
+RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
+
+FILES_udev += "${base_sbindir}/udevd \
+               ${base_libdir}/systemd/systemd-udevd \
+               /lib/udev/accelerometer \
+               /lib/udev/ata_id \
+               /lib/udev/cdrom_id \
+               /lib/udev/collect \
+               /lib/udev/findkeyboards \
+               /lib/udev/keyboard-force-release.sh \
+               /lib/udev/keymap \
+               /lib/udev/mtd_probe \
+               /lib/udev/scsi_id \
+               /lib/udev/v4l_id \
+               /lib/udev/keymaps \
+               /lib/udev/rules.d/4*.rules \
+               /lib/udev/rules.d/5*.rules \
+               /lib/udev/rules.d/6*.rules \
+               /lib/udev/rules.d/70-power-switch.rules \
+               /lib/udev/rules.d/75*.rules \
+               /lib/udev/rules.d/78*.rules \
+               /lib/udev/rules.d/8*.rules \
+               /lib/udev/rules.d/95*.rules \
+               ${sysconfdir}/udev \
+               ${sysconfdir}/init.d/systemd-udevd \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
+              "
+
+FILES_udev-consolekit += "/lib/ConsoleKit"
+RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
+
+FILES_udev-utils = "${bindir}/udevadm"
+
+FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
+
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "systemd-udevd"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
+# TODO:
+# u-a for runlevel and telinit
+
+pkg_postinst_systemd () {
+update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
+update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
+}
+
+pkg_prerm_systemd () {
+update-alternatives --remove init ${systemd_unitdir}/systemd
+update-alternatives --remove halt ${base_bindir}/systemctl
+update-alternatives --remove reboot ${base_bindir}/systemctl
+update-alternatives --remove shutdown ${base_bindir}/systemctl
+update-alternatives --remove poweroff ${base_bindir}/systemctl
+}
+
+pkg_postinst_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	udevadm hwdb --update
+}
+
+pkg_prerm_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	rm -f ${sysconfdir}/udev/hwdb.bin
+}
+
+# As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
+# building udev and systemd in world builds.
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+}
-- 
1.7.10.4



