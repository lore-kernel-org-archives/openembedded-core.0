Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGi-0000rk-KD
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:33 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so5745739pad.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=f0Vi9xrRJuo/baQu+H7Epq0ioVUAJXKJunqNVmDrVDs=;
	b=dhchh0juZPd/isnOUFLiiqBGBiDL9aMVLbFW5Fv6sm9kJv2ie9V8kh0BOLidJ20Ai+
	C6mcPV4YBKzapT9SiYtO+FlaK+3e47/z/IeZ4D94SNWz+ZT1nGwOx8ef/ErbG7igj8j1
	nA64kyAZ+kYsuDBoOpR0k4NLNH/spGpn6+RDXz3bT/UOjsxxYMrgQCb0IfUoowBQaTCW
	FmKdIfrjqprbk1CPr7sUswg3W5v3xtX6v2VD531QHjyEwO3rMxv7wyQS8FZe2ulKBW4x
	dra94IG1dTyVwoxgTLYBfDL+C80j4vhUshyoM5tfF/3gQ8fqiCFHHSLkHpF887+c1CJx
	7cLg==
X-Received: by 10.68.230.200 with SMTP id ta8mr8576152pbc.13.1359061678669;
	Thu, 24 Jan 2013 13:07:58 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:31 -0800
Message-Id: <e684d68286657cc9cfce53b0e5b597f79fae1248.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 10/11] systemd: Upgrade to 197
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
X-List-Received-Date: Thu, 24 Jan 2013 21:23:33 -0000

LGPL-2.1 licensce is updated to reflect the new FSF address
Drop patches to disable argparse and dbus-python

analyser has been implemented in C lets use that patch
and get rid of the python version

disable hostname detection for uclibc bases systems
since uclibc lacks NSS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emd-analyze-use-argparse-instead-of-getop.patch |  106 --
 .../0001-systemd-analyze-rewrite-in-C.patch        | 1087 ++++++++++++++++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   94 --
 .../systemd/{systemd_196.bb => systemd_197.bb}     |   14 +-
 4 files changed, 1094 insertions(+), 207 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 rename meta/recipes-core/systemd/{systemd_196.bb => systemd_197.bb} (95%)

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch b/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
deleted file mode 100644
index 1e208a2..0000000
--- a/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-Upstream-Status: Backport [revert]
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 10 Dec 2012 12:24:32 +0100
-Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of getopt"
-
-This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
-
-Argparse is broken in current OE python
----
- src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++---------------
- 1 files changed, 39 insertions(+), 21 deletions(-)
-
-diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
-index 88699d6..87a83dd 100755
---- a/src/analyze/systemd-analyze
-+++ b/src/analyze/systemd-analyze
-@@ -1,7 +1,6 @@
- #!/usr/bin/python
- 
--import sys, os
--import argparse
-+import getopt, sys, os
- from gi.repository import Gio
- try:
-         import cairo
-@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size = 12, r = 0, g = 0, b = 0, vcenter = 0.5
- 
-         context.restore()
- 
-+def usage():
-+        sys.stdout.write("""systemd-analyze [--user] time
-+systemd-analyze [--user] blame
-+systemd-analyze [--user] plot
-+
-+Process systemd profiling information
-+
-+  -h --help         Show this help
-+""")
-+
-+def help():
-+        usage()
-+        sys.exit()
-+
- def time():
- 
-         initrd_time, start_time, finish_time = acquire_start_time()
-@@ -266,29 +279,34 @@ def plot():
- 
-         surface.finish()
- 
--parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
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
-+def unknown_verb():
-+        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
-+        usage()
-+        sys.exit(1)
- 
--args = parser.parse_args()
-+bus = Gio.BusType.SYSTEM
- 
--if args.user:
--        bus = Gio.BusType.SESSION
--else:
--        bus = Gio.BusType.SYSTEM
-+try:
-+        opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
-+except getopt.GetoptError as err:
-+        sys.stdout.write(str(err) + "\n")
-+        usage()
-+        sys.exit(2)
-+for o, a in opts:
-+        if o in ("-h", "--help"):
-+                help()
-+        elif o == '--user':
-+                bus = Gio.BusType.SESSION
-+        else:
-+                assert False, "unhandled option"
- 
- verb = {'time' : time,
- 	'blame': blame,
- 	'plot' : plot,
-+	'help' : help,
- 	}
--verb.get(args.action)()
-+
-+if len(args) == 0:
-+        time()
-+else:
-+        verb.get(args[0], unknown_verb)()
--- 
-1.7.7.6
-
diff --git a/meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch b/meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
new file mode 100644
index 0000000..b278390
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-systemd-analyze-rewrite-in-C.patch
@@ -0,0 +1,1087 @@
+Upstream-Status: Pending
+
+From 523f304facdf3dbc09dbcdcff500ddce60274987 Mon Sep 17 00:00:00 2001
+From: Peeters Simon <peeters.simon@gmail.com>
+Date: Thu, 17 Jan 2013 14:34:25 -0800
+Subject: [PATCH] systemd-analyze: rewrite in C.
+
+Written by Peeters Simon <peeters.simon@gmail.com>. Makefile stuff
+and cleaned up a bit by Auke Kok <auke-jan.h.kok@intel.com>.
+---
+ Makefile.am                    |  21 +-
+ src/analyze/systemd-analyze.c  | 684 +++++++++++++++++++++++++++++++++++++++++
+ src/analyze/systemd-analyze.in | 328 --------------------
+ 3 files changed, 694 insertions(+), 339 deletions(-)
+ create mode 100644 src/analyze/systemd-analyze.c
+ delete mode 100755 src/analyze/systemd-analyze.in
+
+Index: systemd-197/Makefile.am
+===================================================================
+--- systemd-197.orig/Makefile.am	2013-01-07 17:37:15.391966148 -0800
++++ systemd-197/Makefile.am	2013-01-24 10:06:11.219490786 -0800
+@@ -185,7 +185,8 @@
+ 	systemd-ask-password \
+ 	systemd-tty-ask-password-agent \
+ 	systemd-tmpfiles \
+-	systemd-machine-id-setup
++	systemd-machine-id-setup \
++	systemd-analyze
+ 
+ bin_PROGRAMS = \
+ 	systemd-cgls \
+@@ -220,14 +221,16 @@
+ 	systemd-fstab-generator \
+ 	systemd-system-update-generator
+ 
+-dist_bin_SCRIPTS = \
+-	src/analyze/systemd-analyze
++systemd_analyze_SOURCES = \
++	src/analyze/systemd-analyze.c
+ 
+-EXTRA_DIST += \
+-	src/analyze/systemd-analyze.in
++systemd_analyze_CFLAGS = \
++	$(AM_CFLAGS) \
++	$(DBUS_CFLAGS)
+ 
+-CLEANFILES += \
+-	src/analyze/systemd-analyze
++systemd_analyze_LDADD = \
++	libsystemd-shared.la \
++	libsystemd-dbus.la
+ 
+ dist_bashcompletion_DATA = \
+ 	shell-completion/systemd-bash-completion.sh
+@@ -3839,10 +3842,6 @@
+ 	$(SED_PROCESS)
+ 	$(AM_V_GEN)chmod +x $@
+ 
+-src/analyze/systemd-analyze: %: %.in Makefile
+-	$(SED_PROCESS)
+-	$(AM_V_GEN)chmod +x $@
+-
+ src/%.c: src/%.gperf
+ 	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_GEN)$(GPERF) < $< > $@
+Index: systemd-197/src/analyze/systemd-analyze.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ systemd-197/src/analyze/systemd-analyze.c	2013-01-24 10:06:11.219490786 -0800
+@@ -0,0 +1,684 @@
++#include <stdio.h>
++#include <stdlib.h>
++#include <getopt.h>
++#include <locale.h>
++
++#include "install.h"
++#include "log.h"
++#include "dbus-common.h"
++#include "build.h"
++#include "util.h"
++
++#define svg(...) printf(__VA_ARGS__)
++
++static UnitFileScope arg_scope = UNIT_FILE_SYSTEM;
++
++struct unit_times {
++        char *name;
++        unsigned long long int ixt;
++        unsigned long long int iet;
++        unsigned long long int axt;
++        unsigned long long int aet;
++};
++
++
++unsigned long long int property_getull(
++                DBusConnection *bus,
++                const char *dest,
++                const char *path,
++                const char *interface,
++                const char *property)
++{
++        _cleanup_dbus_message_unref_ DBusMessage *reply = NULL;
++        DBusMessageIter iter, sub;
++        unsigned long long int result = 0;
++        union {
++                char byte;
++                dbus_int16_t i16;
++                dbus_uint16_t u16;
++                dbus_int32_t i32;
++                dbus_uint32_t u32;
++                dbus_int64_t i64;
++                dbus_uint64_t u64;
++        } dbus_result;
++
++        int r = bus_method_call_with_reply (
++                        bus,
++                        dest,
++                        path,
++                        "org.freedesktop.DBus.Properties",
++                        "Get",
++                        &reply,
++                        NULL,
++                        DBUS_TYPE_STRING, &interface,
++                        DBUS_TYPE_STRING, &property,
++                        DBUS_TYPE_INVALID);
++        if (r)
++                goto finish;
++
++        if (!dbus_message_iter_init(reply, &iter) ||
++                        dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_VARIANT)
++                goto finish;
++
++        dbus_message_iter_recurse(&iter, &sub);
++
++        switch(dbus_message_iter_get_arg_type(&sub)) {
++                case DBUS_TYPE_BYTE:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.byte);
++                        result = dbus_result.byte;
++                        break;
++                case DBUS_TYPE_INT16:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.i16);
++                        result = dbus_result.i16;
++                        break;
++                case DBUS_TYPE_UINT16:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.u16);
++                        result = dbus_result.u16;
++                        break;
++                case DBUS_TYPE_INT32:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.i32);
++                        result = dbus_result.i32;
++                        break;
++                case DBUS_TYPE_UINT32:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.u32);
++                        result = dbus_result.u32;
++                        break;
++                case DBUS_TYPE_INT64:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.i64);
++                        result = dbus_result.i64;
++                        break;
++                case DBUS_TYPE_UINT64:
++                        dbus_message_iter_get_basic(&sub, &dbus_result.u64);
++                        result = dbus_result.u64;
++                        break;
++                default:
++                        goto finish;
++        }
++finish:
++        return result;
++}
++
++static int compare_unit_times1(const void *a, const void *b) {
++        const struct unit_times *u = a, *v = b;
++
++        return (int)(v->aet - v->ixt) - (int)(u->aet - u->ixt);
++}
++
++static int compare_unit_times2(const void *a, const void *b) {
++        const struct unit_times *u = a, *v = b;
++
++        return (long long int)(u->ixt) - (long long int)(v->ixt);
++}
++
++int acquire_time_data(DBusConnection *bus, struct unit_times **out)
++{
++        _cleanup_dbus_message_unref_ DBusMessage *reply = NULL;
++        DBusMessageIter iter, sub, sub2;
++        unsigned int c = 0, n_units = 0;
++        struct unit_times *unit_times = NULL;
++        int r = bus_method_call_with_reply (
++                        bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "ListUnits",
++                        &reply,
++                        NULL,
++                        DBUS_TYPE_INVALID);
++        if (r)
++                goto finish;
++
++        if (!dbus_message_iter_init(reply, &iter) ||
++                        dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_ARRAY ||
++                        dbus_message_iter_get_element_type(&iter) != DBUS_TYPE_STRUCT)  {
++                log_error("Failed to parse reply.");
++                r = -EIO;
++                goto finish;
++        }
++
++        dbus_message_iter_recurse(&iter, &sub);
++
++        while (dbus_message_iter_get_arg_type(&sub) != DBUS_TYPE_INVALID) {
++                struct unit_times *u;
++                char *path;
++
++                if (dbus_message_iter_get_arg_type(&sub) != DBUS_TYPE_STRUCT) {
++                        log_error("Failed to parse reply.");
++                        r = -EIO;
++                        goto finish;
++                }
++
++                if (c >= n_units) {
++                        struct unit_times *w;
++
++                        n_units = MAX(2*c, 16);
++                        w = realloc(unit_times, sizeof(struct unit_times) * n_units);
++
++                        if (!w) {
++                                log_error("Failed to allocate unit array.");
++                                r = -ENOMEM;
++                                goto finish;
++                        }
++
++                        unit_times = w;
++                }
++                u = unit_times+c;
++
++                dbus_message_iter_recurse(&sub, &sub2);
++
++                if (bus_iter_get_basic_and_next(&sub2, DBUS_TYPE_STRING, &u->name, true) < 0 ||
++                                dbus_message_iter_next(&sub2), dbus_message_iter_next(&sub2), dbus_message_iter_next(&sub2),
++                                dbus_message_iter_next(&sub2), dbus_message_iter_next(&sub2),
++                                bus_iter_get_basic_and_next(&sub2, DBUS_TYPE_OBJECT_PATH, &path, true) < 0) {
++                        log_error("Failed to parse reply.");
++                        r = -EIO;
++                        goto finish;
++                }
++                u->name = strdup(u->name);
++                u->ixt = property_getull(bus,
++                                "org.freedesktop.systemd1",
++                                path,
++                                "org.freedesktop.systemd1.Unit",
++                                "InactiveExitTimestampMonotonic");
++                u->iet = property_getull(bus,
++                                "org.freedesktop.systemd1",
++                                path,
++                                "org.freedesktop.systemd1.Unit",
++                                "InactiveEnterTimestampMonotonic");
++                u->axt = property_getull(bus,
++                                "org.freedesktop.systemd1",
++                                path,
++                                "org.freedesktop.systemd1.Unit",
++                                "ActiveExitTimestampMonotonic");
++                u->aet = property_getull(bus,
++                                "org.freedesktop.systemd1",
++                                path,
++                                "org.freedesktop.systemd1.Unit",
++                                "ActiveEnterTimestampMonotonic");
++                dbus_message_iter_next(&sub);
++                if (u->ixt == 0)
++                        continue;
++                c++;
++        }
++
++        *out = unit_times;
++        return c;
++finish:
++        free(unit_times);
++        return r;
++}
++
++static void svg_graph_box(int height, long long int begin, long long int end, float scale_x, float scale_y)
++{
++        double d = 0.0;
++        int i = 0;
++
++        /* outside box, fill */
++        svg("<rect class=\"box\" x=\"%.03f\" y=\"0\" width=\"%.03f\" height=\"%.03f\" />\n",
++            0,
++            scale_x * (end - begin),
++            scale_y * height);
++
++        for (d = 0.000001 * begin; d <= 0.000001 * end;
++             d += 0.1) {
++                /* lines for each second */
++                if (i % 50 == 0)
++                        svg("  <line class=\"sec5\" x1=\"%.03f\" y1=\"0\" x2=\"%.03f\" y2=\"%.03f\" />\n",
++                            scale_x * d,
++                            scale_x * d,
++                            scale_y * height);
++                else if (i % 10 == 0)
++                        svg("  <line class=\"sec1\" x1=\"%.03f\" y1=\"0\" x2=\"%.03f\" y2=\"%.03f\" />\n",
++                            scale_x * d,
++                            scale_x * d,
++                            scale_y * height);
++                else
++                        svg("  <line class=\"sec01\" x1=\"%.03f\" y1=\"0\" x2=\"%.03f\" y2=\"%.03f\" />\n",
++                            scale_x * d,
++                            scale_x * d,
++                            scale_y * height);
++
++                /* time label */
++                if (i % 10 == 0)
++                        svg("  <text class=\"sec\" x=\"%.03f\" y=\"%.03f\" >%.01fs</text>\n",
++                            scale_x * d, -5.0, d);
++
++                i++;
++        }
++}
++
++int analyze_plot(DBusConnection *bus)
++{
++        struct unit_times *times;
++        int n = acquire_time_data(bus, &times);
++        int m = n + 1;
++        unsigned long long int firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time;
++        long long int starttime = 0;
++
++        float scale_x = 100.0;
++        float scale_y = 20.0;
++
++        if (n<=0)
++                return -n;
++
++        qsort(times, n, sizeof(struct unit_times), compare_unit_times2);
++
++        firmware_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "FirmwareTimestampMonotonic");
++        loader_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "LoaderTimestampMonotonic");
++        kernel_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "KernelTimestamp");
++        initrd_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "InitRDTimestampMonotonic");
++        userspace_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "UserspaceTimestampMonotonic");
++        finish_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "FinishTimestampMonotonic");
++
++
++        if (firmware_time > 0) {
++                m++;
++                starttime += firmware_time - loader_time;
++        }
++        if (loader_time > 0) {
++                m++;
++                starttime += loader_time;
++        }
++        if (initrd_time > 0)
++                m += 2;
++        else if (kernel_time > 0)
++                m++;
++
++        float width = 80.0 + (scale_x * (starttime + finish_time) * 0.000001);
++        float height = 150.0 + (m* scale_y);
++
++        svg("<?xml version=\"1.0\" standalone=\"no\"?>\n");
++        svg("<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" ");
++        svg("\"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">\n");
++
++        //svg("<g transform=\"translate(10,%d)\">\n", 1000 + 150 + (pcount * 20));
++        svg("<svg width=\"%.0fpx\" height=\"%.0fpx\" version=\"1.1\" ", width, height);
++        svg("xmlns=\"http://www.w3.org/2000/svg\">\n\n");
++
++        /* write some basic info as a comment, including some help */
++        svg("<!-- This file is a systemd-analyze SVG file. It is best rendered in a   -->\n");
++        svg("<!-- browser such as Chrome/Chromium, firefox. Other applications that   -->\n");
++        svg("<!-- render these files properly but much more slow are ImageMagick,     -->\n");
++        svg("<!-- gimp, inkscape, etc.. To display the files on your system, just     -->\n");
++        svg("<!-- point your browser to file:///var/log/ and click.                   -->\n\n");
++        svg("<!-- this plot was generated by systemd-analyze version %-16.16s -->\n\n", VERSION);
++
++        /* style sheet */
++        svg("<defs>\n  <style type=\"text/css\">\n    <![CDATA[\n");
++
++        svg("      rect       { stroke-width: 1; stroke-opacity: 0; }\n");
++        svg("      rect.activating   { fill: rgb(255,0,0); fill-opacity: 0.7; }\n");
++        svg("      rect.active       { fill: rgb(200,150,150); fill-opacity: 0.7; }\n");
++        svg("      rect.deactivating { fill: rgb(150,100,100); fill-opacity: 0.7; }\n");
++        svg("      rect.kernel       { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
++        svg("      rect.initrd       { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
++        svg("      rect.firmware     { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
++        svg("      rect.loader       { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
++        svg("      rect.userspace    { fill: rgb(150,150,150); fill-opacity: 0.7; }\n");
++        svg("      rect.cpu   { fill: rgb(64,64,240); stroke-width: 0; fill-opacity: 0.7; }\n");
++        svg("      rect.wait  { fill: rgb(240,240,0); stroke-width: 0; fill-opacity: 0.7; }\n");
++        svg("      rect.bi    { fill: rgb(240,128,128); stroke-width: 0; fill-opacity: 0.7; }\n");
++        svg("      rect.bo    { fill: rgb(192,64,64); stroke-width: 0; fill-opacity: 0.7; }\n");
++        svg("      rect.ps    { fill: rgb(192,192,192); stroke: rgb(128,128,128); fill-opacity: 0.7; }\n");
++        svg("      rect.krnl  { fill: rgb(240,240,0); stroke: rgb(128,128,128); fill-opacity: 0.7; }\n");
++        svg("      rect.box   { fill: rgb(240,240,240); stroke: rgb(192,192,192); }\n");
++        svg("      rect.clrw  { stroke-width: 0; fill-opacity: 0.7;}\n");
++        svg("      line       { stroke: rgb(64,64,64); stroke-width: 1; }\n");
++        svg("//    line.sec1  { }\n");
++        svg("      line.sec5  { stroke-width: 2; }\n");
++        svg("      line.sec01 { stroke: rgb(224,224,224); stroke-width: 1; }\n");
++        svg("      line.dot   { stroke-dasharray: 2 4; }\n");
++        svg("      line.idle  { stroke: rgb(64,64,64); stroke-dasharray: 10 6; stroke-opacity: 0.7; }\n");
++
++        svg("      .run       { font-size: 8; font-style: italic; }\n");
++        svg("      text       { font-family: Verdana, Helvetica; font-size: 10; }\n");
++        svg("      text.sec   { font-size: 8; }\n");
++        svg("      text.t1    { font-size: 24; }\n");
++        svg("      text.t2    { font-size: 12; }\n");
++        svg("      text.idle  { font-size: 18; }\n");
++
++        svg("    ]]>\n   </style>\n</defs>\n\n");
++
++        svg("<text x=\"20\" y=\"40\">Startup finished in ");
++
++        if (firmware_time > 0)
++                svg("%llums (firmware) + ", (firmware_time - loader_time) / 1000);
++        if (loader_time > 0)
++                svg("%llums (loader) + ", loader_time / 1000);
++        if (initrd_time > 0)
++                svg("%llums (kernel) + %llums (initrd) + ", initrd_time / 1000, (userspace_time - initrd_time) / 1000);
++        else if (kernel_time > 0)
++                svg("%llums (kernel) + ", userspace_time  / 1000);
++        svg("%llums (userspace) ", (finish_time - userspace_time) / 1000);
++        if (kernel_time > 0)
++                svg("= %llums\n", (firmware_time + finish_time) / 1000);
++        else
++                svg("= %llums\n", (finish_time - userspace_time) / 1000);
++        svg("</text>");
++
++        svg("<g transform=\"translate(20,100)\">\n");
++        svg_graph_box(m, starttime, finish_time, scale_x, scale_y);
++
++        float top = 0.0;
++
++        if (firmware_time > 0) {
++                svg("  <rect class=\"firmware\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                                scale_x * (starttime - firmware_time) * 0.000001,
++                                top,
++                                scale_x * (firmware_time - loader_time) * 0.000001,
++                                scale_y - 1.0);
++                svg("  <text x=\"%.03f\" y=\"%.03f\">firmware</text>\n",
++                    scale_x * (starttime - firmware_time) * 0.000001 + 5.0,
++                    top + 14.0);
++                top += scale_y;
++        }
++        if (loader_time > 0) {
++                svg("  <rect class=\"loader\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                                scale_x * (starttime - loader_time) * 0.000001,
++                                top,
++                                scale_x * (loader_time) * 0.000001,
++                                scale_y - 1.0);
++                svg("  <text x=\"%.03f\" y=\"%.03f\">loader</text>\n",
++                    scale_x * (starttime - loader_time) * 0.000001 + 5.0,
++                    top + 14.0);
++                top += scale_y;
++        }
++        if (initrd_time > 0) {
++                svg("  <rect class=\"kernel\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                                scale_x * (starttime) * 0.000001,
++                                top,
++                                scale_x * (initrd_time) * 0.000001,
++                                scale_y - 1.0);
++                svg("  <text x=\"%.03f\" y=\"%.03f\">kernel</text>\n",
++                    scale_x * (starttime) * 0.000001 + 5.0,
++                    top + 14.0);
++                top += scale_y;
++                svg("  <rect class=\"inird\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                                scale_x * (starttime + initrd_time) * 0.000001,
++                                top,
++                                scale_x * (userspace_time - initrd_time) * 0.000001,
++                                scale_y - 1.0);
++                svg("  <text x=\"%.03f\" y=\"%.03f\">initrd</text>\n",
++                    scale_x * (starttime + initrd_time) * 0.000001 + 5.0,
++                    top + 14.0);
++                top += scale_y;
++        } else if (kernel_time > 0) {
++                svg("  <rect class=\"kernel\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                                scale_x * (starttime) * 0.000001,
++                                top,
++                                scale_x * (userspace_time) * 0.000001,
++                                scale_y - 1.0);
++                svg("  <text x=\"%.03f\" y=\"%.03f\">kernel</text>\n",
++                    scale_x * (starttime) * 0.000001 + 5.0,
++                    top + 14.0);
++                top += scale_y;
++        }
++
++        svg("  <rect class=\"userspace\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                        scale_x * (userspace_time) * 0.000001,
++                        top,
++                        scale_x * (finish_time - userspace_time) * 0.000001,
++                        scale_y - 1.0);
++        svg("  <text x=\"%.03f\" y=\"%.03f\">userspace</text>\n",
++            scale_x * (userspace_time) * 0.000001 + 5.0,
++            top + 14.0);
++            top += scale_y;
++
++
++        for (int i=0; i < n; i++) {
++                //draw times[i]
++
++                bool drawn = false;
++
++                if (times[i].ixt >= userspace_time && times[i].ixt <= finish_time) {
++                        unsigned long long int end = finish_time;
++                        if (times[i].aet >= times[i].ixt && times[i].aet < end)
++                                end = times[i].aet;
++                        if (times[i].axt >= times[i].ixt && times[i].axt < end)
++                                end = times[i].axt;
++                        if (times[i].iet >= times[i].ixt && times[i].iet < end)
++                                end = times[i].iet;
++                        svg("  <rect class=\"activating\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                            scale_x * (starttime + times[i].ixt) * 0.000001,
++                            top + (scale_y * i),
++                            scale_x * (end - times[i].ixt) * 0.000001,
++                            scale_y - 1.0);
++                }
++                if (times[i].aet >= userspace_time && times[i].aet <= finish_time) {
++                        unsigned long long int end = finish_time;
++                        if (times[i].axt >= times[i].aet && times[i].axt < end)
++                                end = times[i].axt;
++                        if (times[i].iet >= times[i].aet && times[i].iet < end)
++                                end = times[i].iet;
++                        svg("  <rect class=\"active\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                            scale_x * (starttime + times[i].aet) * 0.000001,
++                            top + (scale_y * i),
++                            scale_x * (end - times[i].aet) * 0.000001,
++                            scale_y - 1.0);
++                }
++                if (times[i].axt >= userspace_time && times[i].axt <= finish_time) {
++                        unsigned long long int end = finish_time;
++                        if (times[i].iet >= times[i].axt && times[i].iet < end)
++                                end = times[i].iet;
++                        svg("  <rect class=\"deactivating\" x=\"%.03f\" y=\"%.03f\" width=\"%.03f\" height=\"%.03f\" />\n",
++                            scale_x * (starttime + times[i].axt) * 0.000001,
++                            top + (scale_y * i),
++                            scale_x * (end - times[i].axt) * 0.000001,
++                            scale_y - 1.0);
++                }
++
++                svg("  <text x=\"%.03f\" y=\"%.03f\">%s</text>\n",
++                    (starttime + times[i].ixt) * scale_x * 0.000001 + 5.0,
++                    top + (scale_y * i) + 14.0,
++                    times[i].name);
++
++        }
++        svg("</g>\n\n");
++
++        svg("</svg>");
++        return 0;
++}
++
++int analyze_blame(DBusConnection *bus)
++{
++        struct unit_times *times;
++        int n = acquire_time_data(bus, &times);
++        if (n<=0)
++                return -n;
++
++        qsort(times, n, sizeof(struct unit_times), compare_unit_times1);
++
++        for (int i = 0; i < n; i++) {
++                if (times[i].ixt <= 0 || times[i].aet <= 0)
++                        continue;
++                if (times[i].aet <= times[i].ixt)
++                        continue;
++                printf("%6llums %s\n", (times[i].aet - times[i].ixt) / 1000, times[i].name);
++        }
++        return 0;
++}
++int analyze_time(DBusConnection *bus)
++{
++        unsigned long long firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time;
++
++        firmware_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "FirmwareTimestampMonotonic");
++        loader_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "LoaderTimestampMonotonic");
++        kernel_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "KernelTimestamp");
++        initrd_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "InitRDTimestampMonotonic");
++        userspace_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "UserspaceTimestampMonotonic");
++        finish_time = property_getull(bus,
++                        "org.freedesktop.systemd1",
++                        "/org/freedesktop/systemd1",
++                        "org.freedesktop.systemd1.Manager",
++                        "FinishTimestampMonotonic");
++
++        printf("Startup finished in ");
++
++        if (firmware_time > 0)
++                printf("%llums (firmware) + ", (firmware_time - loader_time) / 1000);
++        if (loader_time > 0)
++                printf("%llums (loader) + ", loader_time / 1000);
++        if (initrd_time > 0)
++                printf("%llums (kernel) + %llums (initrd) + ", initrd_time / 1000, (userspace_time - initrd_time) / 1000);
++        else if (kernel_time > 0)
++                printf("%llums (kernel) + ", userspace_time  / 1000);
++
++        printf("%llums (userspace) ", (finish_time - userspace_time) / 1000);
++
++        if (kernel_time > 0)
++                printf("= %llums\n", (firmware_time + finish_time) / 1000);
++        else
++                printf("= %llums\n", (finish_time - userspace_time) / 1000);
++
++        return 0;
++}
++
++void analyze_help()
++{
++        printf("%s [OPTIONS...] {COMMAND} ...\n\n"
++                        "  -h --help           Show this help\n"
++                        "     --version        Show package version\n"
++                        "     --system         Connect to system manager\n"
++                        "     --user           Connect to user service manager\n\n"
++                        "Commands:\n"
++                        "  time\n"
++                        "  blame\n",
++                        program_invocation_short_name);
++
++}
++
++static int parse_argv(int argc, char *argv[])
++{
++        enum {
++                ARG_VERSION = 0x100,
++                ARG_USER,
++                ARG_SYSTEM
++        };
++
++        static const struct option options[] = {
++                { "help",      no_argument,       NULL, 'h'           },
++                { "version",   no_argument,       NULL, ARG_VERSION   },
++                { "user",      no_argument,       NULL, ARG_USER      },
++                { "system",    no_argument,       NULL, ARG_SYSTEM    },
++                { NULL,        0,                 NULL, 0             }
++        };
++
++        int c;
++
++        assert(argc >= 0);
++        assert(argv);
++
++        while ((c = getopt_long(argc, argv, "h", options, NULL)) >= 0) {
++                switch (c) {
++                        case 'h':
++                                analyze_help();
++                                return 0;
++                        case ARG_VERSION:
++                                puts(PACKAGE_STRING);
++                                puts(SYSTEMD_FEATURES);
++                                return 0;
++                        case ARG_USER:
++                                arg_scope = UNIT_FILE_USER;
++                                break;
++                        case ARG_SYSTEM:
++                                arg_scope = UNIT_FILE_SYSTEM;
++                                break;
++
++                        case '?':
++                                return -EINVAL;
++
++                        default:
++                                log_error("Unknown option code '%c'.", c);
++                                return -EINVAL;
++                }
++        }
++        return 1;
++}
++
++
++int main(int argc, char*argv[]) {
++        int r, retval = EXIT_FAILURE;
++        DBusConnection *bus = NULL;
++        DBusError error;
++        bool private_bus = false;
++
++        dbus_error_init(&error);
++
++        setlocale(LC_ALL, "");
++        log_parse_environment();
++        log_open();
++
++        r = parse_argv(argc, argv);
++        if (r < 0)
++                goto finish;
++        else if (r == 0) {
++                retval = EXIT_SUCCESS;
++                goto finish;
++        }
++
++        bus_connect(arg_scope == UNIT_FILE_SYSTEM ? DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, &bus, &private_bus, &error);
++
++        if (!argv[optind] || streq(argv[optind], "time"))
++                retval = analyze_time(bus);
++        else if (streq(argv[optind], "blame"))
++                retval = analyze_blame(bus);
++        else if (streq(argv[optind], "plot"))
++                retval = analyze_plot(bus);
++        else
++                log_error("Unknown operation '%s'.", argv[optind]);
++
++finish:
++        if (bus) {
++                dbus_connection_flush(bus);
++                dbus_connection_close(bus);
++                dbus_connection_unref(bus);
++        }
++
++        dbus_error_free(&error);
++
++        return retval;
++}
+Index: systemd-197/src/analyze/systemd-analyze.in
+===================================================================
+--- systemd-197.orig/src/analyze/systemd-analyze.in	2013-01-07 16:27:01.000000000 -0800
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,328 +0,0 @@
+-#!@PYTHON_BINARY@
+-# -*-python-*-
+-
+-#  This file is part of systemd.
+-#
+-#  Copyright 2010-2013 Lennart Poettering
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-#
+-#  systemd is distributed in the hope that it will be useful, but
+-#  WITHOUT ANY WARRANTY; without even the implied warranty of
+-#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+-#  Lesser General Public License for more details.
+-#
+-#  You should have received a copy of the GNU Lesser General Public License
+-#  along with systemd; If not, see <http://www.gnu.org/licenses/>.
+-
+-import sys, os
+-import argparse
+-from gi.repository import Gio
+-try:
+-        import cairo
+-except ImportError:
+-        cairo = None
+-
+-def acquire_time_data():
+-        manager = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.systemd1.Manager', None)
+-        units = manager.ListUnits()
+-
+-        l = []
+-
+-        for i in units:
+-                if i[5] != "":
+-                        continue
+-
+-                properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                        None, 'org.freedesktop.systemd1', i[6], 'org.freedesktop.DBus.Properties', None)
+-
+-                ixt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic')
+-                aet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic')
+-                axt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic')
+-                iet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic')
+-
+-                l.append((str(i[0]), ixt, aet, axt, iet))
+-
+-        return l
+-
+-def acquire_start_time():
+-        properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.DBus.Properties', None)
+-
+-        # Note that the firmware/loader times are returned as positive
+-        # values but are actually considered negative from the point
+-        # in time of kernel initialization. Also, the monotonic kernel
+-        # time will always be 0 since that's the epoch of the
+-        # monotonic clock. Since we want to know whether the kernel
+-        # timestamp is set at all we will instead ask for the realtime
+-        # clock for this timestamp.
+-
+-        firmware_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FirmwareTimestampMonotonic')
+-        loader_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'LoaderTimestampMonotonic')
+-        kernel_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'KernelTimestamp')
+-        initrd_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic')
+-        userspace_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic')
+-        finish_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic')
+-
+-        if finish_time == 0:
+-                sys.exit("Bootup is not yet finished. Please try again later.")
+-
+-        assert firmware_time >= loader_time
+-        assert initrd_time <= userspace_time
+-        assert userspace_time <= finish_time
+-
+-        return firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time
+-
+-def draw_box(context, j, k, l, m, r = 0, g = 0, b = 0):
+-        context.save()
+-        context.set_source_rgb(r, g, b)
+-        context.rectangle(j, k, l, m)
+-        context.fill()
+-        context.restore()
+-
+-def draw_text(context, x, y, text, size = 12, r = 0, g = 0, b = 0, vcenter = 0.5, hcenter = 0.5):
+-        context.save()
+-
+-        context.set_source_rgb(r, g, b)
+-        context.select_font_face("Sans", cairo.FONT_SLANT_NORMAL, cairo.FONT_WEIGHT_NORMAL)
+-        context.set_font_size(size)
+-
+-        if vcenter or hcenter:
+-                x_bearing, y_bearing, width, height = context.text_extents(text)[:4]
+-
+-                if hcenter:
+-                        x = x - width*hcenter - x_bearing
+-
+-                if vcenter:
+-                        y = y - height*vcenter - y_bearing
+-
+-        context.move_to(x, y)
+-        context.show_text(text)
+-
+-        context.restore()
+-
+-def time():
+-
+-        firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time = acquire_start_time()
+-
+-        sys.stdout.write("Startup finished in ")
+-
+-        if firmware_time > 0:
+-                sys.stdout.write("%lums (firmware) + " % ((firmware_time - loader_time) / 1000))
+-        if loader_time > 0:
+-                sys.stdout.write("%lums (loader) + " % (loader_time / 1000))
+-        if initrd_time > 0:
+-                sys.stdout.write("%lums (kernel) + %lums (initrd) + " % (initrd_time / 1000, (userspace_time - initrd_time) / 1000))
+-        elif kernel_time > 0:
+-                sys.stdout.write("%lums (kernel) + " % (userspace_time  / 1000))
+-
+-        sys.stdout.write("%lums (userspace) " % ((finish_time - userspace_time) / 1000))
+-
+-        if kernel_time > 0:
+-                sys.stdout.write("= %lums\n" % ((firmware_time + finish_time) / 1000))
+-        else:
+-                sys.stdout.write("= %lums\n" % ((finish_time - userspace_time) / 1000))
+-
+-def blame():
+-
+-        data = acquire_time_data()
+-        s = sorted(data, key = lambda i: i[2] - i[1], reverse = True)
+-
+-        for name, ixt, aet, axt, iet in s:
+-
+-                if ixt <= 0 or aet <= 0:
+-                        continue
+-
+-                if aet <= ixt:
+-                        continue
+-
+-                sys.stdout.write("%6lums %s\n" % ((aet - ixt) / 1000, name))
+-
+-def plot():
+-        if cairo is None:
+-                sys.exit("Failed to initilize python-cairo required for 'plot' verb.")
+-        firmware_time, loader_time, kernel_time, initrd_time, userspace_time, finish_time = acquire_start_time()
+-        data = acquire_time_data()
+-        s = sorted(data, key = lambda i: i[1])
+-
+-        # Account for kernel and initramfs bars if they exist
+-        if initrd_time > 0:
+-                count = 3
+-        else:
+-                count = 2
+-
+-        for name, ixt, aet, axt, iet in s:
+-
+-                if (ixt >= userspace_time and ixt <= finish_time) or \
+-                                (aet >= userspace_time and aet <= finish_time) or \
+-                                (axt >= userspace_time and axt <= finish_time):
+-                        count += 1
+-
+-        border = 100
+-        bar_height = 20
+-        bar_space = bar_height * 0.1
+-
+-        # 1000px = 10s, 1px = 10ms
+-        width = finish_time/10000 + border*2
+-        height = count * (bar_height + bar_space) + border * 2
+-
+-        if width < 1000:
+-                width = 1000
+-
+-        surface = cairo.SVGSurface(sys.stdout, width, height)
+-        context = cairo.Context(surface)
+-
+-        draw_box(context, 0, 0, width, height, 1, 1, 1)
+-
+-        context.translate(border + 0.5, border + 0.5)
+-
+-        context.save()
+-        context.set_line_width(1)
+-        context.set_source_rgb(0.7, 0.7, 0.7)
+-
+-        for x in range(0, int(finish_time/10000) + 100, 100):
+-                context.move_to(x, 0)
+-                context.line_to(x, height-border*2)
+-
+-        context.move_to(0, 0)
+-        context.line_to(width-border*2, 0)
+-
+-        context.move_to(0, height-border*2)
+-        context.line_to(width-border*2, height-border*2)
+-
+-        context.stroke()
+-        context.restore()
+-
+-        osrel = "Linux"
+-        if os.path.exists("/etc/os-release"):
+-                for line in open("/etc/os-release"):
+-                        if line.startswith('PRETTY_NAME='):
+-                                osrel = line[12:]
+-                                osrel = osrel.strip('\"\n')
+-                                break
+-
+-        banner = "{} {} ({} {}) {}".format(osrel, *(os.uname()[1:5]))
+-        draw_text(context, 0, -15, banner, hcenter = 0, vcenter = 1)
+-
+-        for x in range(0, int(finish_time/10000) + 100, 100):
+-                draw_text(context, x, -5, "%lus" % (x/100), vcenter = 0, hcenter = 0)
+-
+-        y = 0
+-
+-        # draw boxes for kernel and initramfs boot time
+-        if initrd_time > 0:
+-                draw_box(context, 0, y, initrd_time/10000, bar_height, 0.7, 0.7, 0.7)
+-                draw_text(context, 10, y + bar_height/2, "kernel", hcenter = 0)
+-                y += bar_height + bar_space
+-
+-                draw_box(context, initrd_time/10000, y, userspace_time/10000-initrd_time/10000, bar_height, 0.7, 0.7, 0.7)
+-                draw_text(context, initrd_time/10000 + 10, y + bar_height/2, "initramfs", hcenter = 0)
+-                y += bar_height + bar_space
+-
+-        else:
+-                draw_box(context, 0, y, userspace_time/10000, bar_height, 0.6, 0.6, 0.6)
+-                draw_text(context, 10, y + bar_height/2, "kernel", hcenter = 0)
+-                y += bar_height + bar_space
+-
+-        draw_box(context, userspace_time/10000, y, finish_time/10000-userspace_time/10000, bar_height, 0.7, 0.7, 0.7)
+-        draw_text(context, userspace_time/10000 + 10, y + bar_height/2, "userspace", hcenter = 0)
+-        y += bar_height + bar_space
+-
+-        for name, ixt, aet, axt, iet in s:
+-
+-                drawn = False
+-                left = -1
+-
+-                if ixt >= userspace_time and ixt <= finish_time:
+-
+-                        # Activating
+-                        a = ixt
+-                        b = min(filter(lambda x: x >= ixt, (aet, axt, iet, finish_time))) - ixt
+-
+-                        draw_box(context, a/10000, y, b/10000, bar_height, 1, 0, 0)
+-                        drawn = True
+-
+-                        if left < 0:
+-                                left = a
+-
+-                if aet >= userspace_time and aet <= finish_time:
+-
+-                        # Active
+-                        a = aet
+-                        b = min(filter(lambda x: x >= aet, (axt, iet, finish_time))) - aet
+-
+-                        draw_box(context, a/10000, y, b/10000, bar_height, .8, .6, .6)
+-                        drawn = True
+-
+-                        if left < 0:
+-                                left = a
+-
+-                if axt >= userspace_time and axt <= finish_time:
+-
+-                        # Deactivating
+-                        a = axt
+-                        b = min(filter(lambda x: x >= axt, (iet, finish_time))) - axt
+-
+-                        draw_box(context, a/10000, y, b/10000, bar_height, .6, .4, .4)
+-                        drawn = True
+-
+-                        if left < 0:
+-                                left = a
+-
+-                if drawn:
+-                        x = left/10000
+-
+-                        if x < width/2-border:
+-                                draw_text(context, x + 10, y + bar_height/2, name, hcenter = 0)
+-                        else:
+-                                draw_text(context, x - 10, y + bar_height/2, name, hcenter = 1)
+-
+-                        y += bar_height + bar_space
+-
+-        draw_text(context, 0, height-border*2, "Legend: Red = Activating; Pink = Active; Dark Pink = Deactivating", hcenter = 0, vcenter = -1)
+-
+-        if initrd_time > 0:
+-                draw_text(context, 0, height-border*2 + bar_height, "Startup finished in %lums (kernel) + %lums (initramfs) + %lums (userspace) = %lums" % ( \
+-                        initrd_time/1000, \
+-                        (userspace_time - initrd_time)/1000, \
+-                        (finish_time - userspace_time)/1000, \
+-                        finish_time/1000), hcenter = 0, vcenter = -1)
+-        else:
+-                draw_text(context, 0, height-border*2 + bar_height, "Startup finished in %lums (kernel) + %lums (userspace) = %lums" % ( \
+-                        userspace_time/1000, \
+-                        (finish_time - userspace_time)/1000, \
+-                        finish_time/1000), hcenter = 0, vcenter = -1)
+-
+-        surface.finish()
+-
+-parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
+-                                 version='systemd-analyze @PACKAGE_VERSION@',
+-                                 description='Process systemd profiling information',
+-                                 epilog='''\
+-time - print time spent in the kernel before reaching userspace
+-blame - print list of running units ordered by time to init
+-plot - output SVG graphic showing service initialization
+-''')
+-
+-parser.add_argument('action', choices=('time', 'blame', 'plot'),
+-                    default='time', nargs='?',
+-                    help='action to perform (default: time)')
+-parser.add_argument('--user', action='store_true',
+-                    help='use the session bus')
+-
+-args = parser.parse_args()
+-
+-if args.user:
+-        bus = Gio.BusType.SESSION
+-else:
+-        bus = Gio.BusType.SYSTEM
+-
+-verb = {'time' : time,
+-	'blame': blame,
+-	'plot' : plot,
+-	}
+-verb.get(args.action)()
diff --git a/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch b/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
deleted file mode 100644
index 96ad323..0000000
--- a/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Upstream-Status: Backport [revert]
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 10 Dec 2012 12:25:00 +0100
-Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
-
-This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
-
-Python-gobject is too old in current OE
----
- src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
- 1 files changed, 14 insertions(+), 17 deletions(-)
-
-diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
-index 87a83dd..636fd74 100755
---- a/src/analyze/systemd-analyze
-+++ b/src/analyze/systemd-analyze
-@@ -1,15 +1,14 @@
- #!/usr/bin/python
- 
--import getopt, sys, os
--from gi.repository import Gio
-+import getopt, dbus, sys, os
- try:
-         import cairo
- except ImportError:
-         cairo = None
- 
- def acquire_time_data():
--        manager = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
--                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.systemd1.Manager', None)
-+
-+        manager = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
-         units = manager.ListUnits()
- 
-         l = []
-@@ -18,25 +17,23 @@ def acquire_time_data():
-                 if i[5] != "":
-                         continue
- 
--                properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
--                        None, 'org.freedesktop.systemd1', i[6], 'org.freedesktop.DBus.Properties', None)
-+                properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
- 
--                ixt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic')
--                aet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic')
--                axt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic')
--                iet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic')
-+                ixt = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic'))
-+                aet = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic'))
-+                axt = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic'))
-+                iet = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic'))
- 
-                 l.append((str(i[0]), ixt, aet, axt, iet))
- 
-         return l
- 
- def acquire_start_time():
--        properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
--                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.DBus.Properties', None)
-+        properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
- 
--        initrd_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic')
--        userspace_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic')
--        finish_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic')
-+        initrd_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic'))
-+        userspace_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic'))
-+        finish_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic'))
- 
-         if finish_time == 0:
-                 sys.stderr.write("Bootup is not yet finished. Please try again later.\n")
-@@ -284,7 +281,7 @@ def unknown_verb():
-         usage()
-         sys.exit(1)
- 
--bus = Gio.BusType.SYSTEM
-+bus = dbus.SystemBus()
- 
- try:
-         opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
-@@ -296,7 +293,7 @@ for o, a in opts:
-         if o in ("-h", "--help"):
-                 help()
-         elif o == '--user':
--                bus = Gio.BusType.SESSION
-+                bus = dbus.SessionBus()
-         else:
-                 assert False, "unhandled option"
- 
--- 
-1.7.7.6
-
diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_197.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd_196.bb
rename to meta/recipes-core/systemd/systemd_197.bb
index 9801fc5..d87855d 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -3,13 +3,11 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 
 LICENSE = "GPLv2 & LGPLv2.1 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
 PROVIDES = "udev"
 
-PR = "r1"
-
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -18,17 +16,16 @@ SECTION = "base/shell"
 inherit gtk-doc useradd pkgconfig autotools perlnative
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
-           file://0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch \
-           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch \
            file://touchscreen.rules \
            file://modprobe.rules \
            file://var-run.conf \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
+           file://0001-systemd-analyze-rewrite-in-C.patch \
            file://0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch \
           "
-SRC_URI[md5sum] = "05ebd7f108e420e2b4e4810ea4b3c810"
-SRC_URI[sha256sum] = "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcffdfc6f058b55e4bf"
+SRC_URI[md5sum] = "56a860dceadfafe59f40141eb5223743"
+SRC_URI[sha256sum] = "e6857ea21ae24d7056e7b0f4c2aaaba73b8bf57025b8949c0a8af0c1bc9774b5"
 
 UCLIBCPATCHES = ""
 UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
@@ -67,6 +64,8 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-microhttpd \
                  --without-python \
                "
+# uclibc does not have NSS
+EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
 do_configure_prepend() {
@@ -150,6 +149,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${systemd_unitdir}/system/* \
                 /lib/udev/rules.d/99-systemd.rules \
                 ${base_libdir}/security/*.so \
+                ${libdir}/libnss_myhostname.so.2 \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/localectl \
-- 
1.7.9.5



