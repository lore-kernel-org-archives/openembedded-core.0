Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DACC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:22:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12409.1707834133746588461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EDEBDA7
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 06:22:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA8A13F762
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 06:22:12 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: backport memory monitor test fixes
Date: Tue, 13 Feb 2024 14:22:11 +0000
Message-Id: <20240213142211.3517035-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195404

From: Ross Burton <ross.burton@arm.com>

We've been seeing the memory-monitor-dbus test case fail occasionally
on the autobuilder.  Luckily there have been a series of fixes upstream
to fix races in the test case, so backport these and hopefully they
fix the issue.

[ YOCTO #15362 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../glib-2.0/glib-2.0/memory-monitor.patch    | 364 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.pa=
tch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
new file mode 100644
index 00000000000..f9dfc5bb05e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
@@ -0,0 +1,364 @@
+From df7506918efc8748dac8b8398021e1b79d694ba4 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <philip@tecnocode.co.uk>
+Date: Tue, 23 Jan 2024 11:16:52 +0000
+Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
+
+tests: Fix race condition in memory-monitor-dbus.test
+
+Closes #2887
+
+See merge request GNOME/glib!3844
+
+Hopefully these commits fix the occasional failures we've been seeing:
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15362
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ gio/tests/memory-monitor-dbus.py.in          | 64 +++++++++++++-------
+ gio/tests/memory-monitor-portal.py.in        | 54 ++++++++++-------
+ gio/tests/power-profile-monitor-dbus.py.in   | 35 ++++++-----
+ gio/tests/power-profile-monitor-portal.py.in | 34 ++++++-----
+ 4 files changed, 113 insertions(+), 74 deletions(-)
+
+diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-moni=
tor-dbus.py.in
+index bf3291847..7aae01e70 100755
+--- a/gio/tests/memory-monitor-dbus.py.in
++++ b/gio/tests/memory-monitor-dbus.py.in
+@@ -16,7 +16,6 @@ import sys
+ import subprocess
+ import fcntl
+ import os
+-import time
+=20
+ import taptestrunner
+=20
+@@ -57,53 +56,74 @@ try:
+             fcntl.fcntl(self.p_mock.stdout, fcntl.F_SETFL, flags | os.O=
_NONBLOCK)
+             self.last_warning =3D -1
+             self.dbusmock =3D dbus.Interface(self.obj_lmm, dbusmock.MOC=
K_IFACE)
++
++            try:
++                self.wait_for_bus_object('org.freedesktop.LowMemoryMoni=
tor',
++                                        '/org/freedesktop/LowMemoryMoni=
tor',
++                                        system_bus=3DTrue)
++            except:
++                raise
++
+             self.memory_monitor =3D Gio.MemoryMonitor.dup_default()
++            assert("GMemoryMonitorDBus" in str(self.memory_monitor))
+             self.memory_monitor.connect("low-memory-warning", self.memo=
ry_warning_cb)
+             self.mainloop =3D GLib.MainLoop()
+             self.main_context =3D self.mainloop.get_context()
+=20
++            # The LowMemoryMonitor API is stateless: it doesn=E2=80=99t=
 expose any
++            # properties, just a warning signal. Emit the signal in a l=
oop until
++            # the GMemoryMonitor instance has initialised and synchroni=
sed to
++            # the right state.
++            def emit_warning(level):
++                self.dbusmock.EmitWarning(level)
++                return GLib.SOURCE_CONTINUE
++
++            idle_id =3D GLib.idle_add(emit_warning, 0)
++            while self.last_warning !=3D 0:
++                self.main_context.iteration(True)
++            GLib.source_remove(idle_id)
++
+         def tearDown(self):
+             self.p_mock.terminate()
+             self.p_mock.wait()
+=20
+-        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
++        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
+             '''Assert that condition function eventually returns True.
+=20
+-            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
++            Timeout is in seconds, defaulting to 5 seconds. message is
+             printed on failure.
+             '''
+-            while timeout >=3D 0:
+-                context =3D GLib.MainContext.default()
+-                while context.iteration(False):
+-                    pass
+-                if condition():
+-                    break
+-                timeout -=3D 1
+-                time.sleep(0.1)
+-            else:
+-                self.fail(message or 'timed out waiting for ' + str(con=
dition))
++            if not message:
++                message =3D 'timed out waiting for ' + str(condition)
++
++            def timed_out_cb(message):
++                self.fail(message)
++                return GLib.SOURCE_REMOVE
++
++            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
++            timeout_source.set_callback(timed_out_cb, message)
++            timeout_source.attach(self.main_context)
++
++            while not condition():
++                self.main_context.iteration(True)
++
++            timeout_source.destroy()
+=20
+         def memory_warning_cb(self, monitor, level):
++            print("Received memory warning signal, level", level)
+             self.last_warning =3D level
+             self.main_context.wakeup()
+=20
+         def test_low_memory_warning_signal(self):
+             '''LowMemoryWarning signal'''
+=20
+-            # Wait 2 seconds
+-            timeout =3D 2
+-            while timeout > 0:
+-                time.sleep(0.5)
+-                timeout -=3D 0.5
+-                self.main_context.iteration(False)
+-
+             self.dbusmock.EmitWarning(100)
+             # Wait 2 seconds or until warning
+-            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 20)
++            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 2)
+=20
+             self.dbusmock.EmitWarning(255)
+             # Wait 2 seconds or until warning
+-            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 20)
++            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 2)
+=20
+ except ImportError as e:
+     @unittest.skip("Cannot import %s" % e.name)
+diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-mo=
nitor-portal.py.in
+index 748cee850..f570508f9 100755
+--- a/gio/tests/memory-monitor-portal.py.in
++++ b/gio/tests/memory-monitor-portal.py.in
+@@ -16,7 +16,6 @@ import sys
+ import subprocess
+ import fcntl
+ import os
+-import time
+=20
+ import taptestrunner
+=20
+@@ -80,26 +79,44 @@ try:
+             self.mainloop =3D GLib.MainLoop()
+             self.main_context =3D self.mainloop.get_context()
+=20
++            # The LowMemoryMonitor API is stateless: it doesn=E2=80=99t=
 expose any
++            # properties, just a warning signal. Emit the signal in a l=
oop until
++            # the GMemoryMonitor instance has initialised and synchroni=
sed to
++            # the right state.
++            def emit_warning(level):
++                self.dbusmock.EmitWarning(level)
++                return GLib.SOURCE_CONTINUE
++
++            idle_id =3D GLib.idle_add(self.emit_warning, 0)
++            while self.last_warning !=3D 0:
++                self.main_context.iteration(True)
++            GLib.source_remove(idle_id)
++
+         def tearDown(self):
+             self.p_mock.terminate()
+             self.p_mock.wait()
+=20
+-        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
++        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
+             '''Assert that condition function eventually returns True.
+=20
+-            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
++            Timeout is in seconds, defaulting to 5 seconds. message is
+             printed on failure.
+             '''
+-            while timeout >=3D 0:
+-                context =3D GLib.MainContext.default()
+-                while context.iteration(False):
+-                    pass
+-                if condition():
+-                    break
+-                timeout -=3D 1
+-                time.sleep(0.1)
+-            else:
+-                self.fail(message or 'timed out waiting for ' + str(con=
dition))
++            if not message:
++                message =3D 'timed out waiting for ' + str(condition)
++
++            def timed_out_cb(message):
++                self.fail(message)
++                return GLib.SOURCE_REMOVE
++
++            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
++            timeout_source.set_callback(timed_out_cb, message)
++            timeout_source.attach(self.main_context)
++
++            while not condition():
++                self.main_context.iteration(True)
++
++            timeout_source.destroy()
+=20
+         def portal_memory_warning_cb(self, monitor, level):
+             self.last_warning =3D level
+@@ -108,20 +125,13 @@ try:
+         def test_low_memory_warning_portal_signal(self):
+             '''LowMemoryWarning signal'''
+=20
+-            # Wait 2 seconds
+-            timeout =3D 2
+-            while timeout > 0:
+-                time.sleep(0.5)
+-                timeout -=3D 0.5
+-                self.main_context.iteration(False)
+-
+             self.dbusmock.EmitWarning(100)
+             # Wait 2 seconds or until warning
+-            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 20)
++            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 2)
+=20
+             self.dbusmock.EmitWarning(255)
+             # Wait 2 seconds or until warning
+-            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 20)
++            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 2)
+=20
+ except ImportError as e:
+     @unittest.skip("Cannot import %s" % e.name)
+diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/powe=
r-profile-monitor-dbus.py.in
+index 06e594f4a..f955afc80 100755
+--- a/gio/tests/power-profile-monitor-dbus.py.in
++++ b/gio/tests/power-profile-monitor-dbus.py.in
+@@ -16,7 +16,6 @@ import sys
+ import subprocess
+ import fcntl
+ import os
+-import time
+=20
+ import taptestrunner
+=20
+@@ -58,6 +57,7 @@ try:
+             self.power_saver_enabled =3D False
+             self.dbus_props =3D dbus.Interface(self.obj_ppd, dbus.PROPE=
RTIES_IFACE)
+             self.power_profile_monitor =3D Gio.PowerProfileMonitor.dup_=
default()
++            assert("GPowerProfileMonitorDBus" in str(self.power_profile=
_monitor))
+             self.power_profile_monitor.connect("notify::power-saver-ena=
bled", self.power_saver_enabled_cb)
+             self.mainloop =3D GLib.MainLoop()
+             self.main_context =3D self.mainloop.get_context()
+@@ -66,22 +66,27 @@ try:
+             self.p_mock.terminate()
+             self.p_mock.wait()
+=20
+-        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
++        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
+             '''Assert that condition function eventually returns True.
+=20
+-            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
++            Timeout is in seconds, defaulting to 5 seconds. message is
+             printed on failure.
+             '''
+-            while timeout >=3D 0:
+-                context =3D GLib.MainContext.default()
+-                while context.iteration(False):
+-                    pass
+-                if condition():
+-                    break
+-                timeout -=3D 1
+-                time.sleep(0.1)
+-            else:
+-                self.fail(message or 'timed out waiting for ' + str(con=
dition))
++            if not message:
++                message =3D 'timed out waiting for ' + str(condition)
++
++            def timed_out_cb(message):
++                self.fail(message)
++                return GLib.SOURCE_REMOVE
++
++            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
++            timeout_source.set_callback(timed_out_cb, message)
++            timeout_source.attach(self.main_context)
++
++            while not condition():
++                self.main_context.iteration(True)
++
++            timeout_source.destroy()
+=20
+         def power_saver_enabled_cb(self, spec, data):
+             self.power_saver_enabled =3D self.power_profile_monitor.get=
_power_saver_enabled()
+@@ -92,10 +97,10 @@ try:
+=20
+             self.assertEqual(self.power_profile_monitor.get_power_saver=
_enabled(), False)
+             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('power-saver', variant_level=3D1))
+-            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 10)
++            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 1)
+=20
+             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('balanced', variant_level=3D1))
+-            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 10)
++            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 1)
+=20
+ except ImportError as e:
+     @unittest.skip("Cannot import %s" % e.name)
+diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/po=
wer-profile-monitor-portal.py.in
+index 09e9a450d..ad2abf621 100755
+--- a/gio/tests/power-profile-monitor-portal.py.in
++++ b/gio/tests/power-profile-monitor-portal.py.in
+@@ -16,7 +16,6 @@ import sys
+ import subprocess
+ import fcntl
+ import os
+-import time
+=20
+ import taptestrunner
+=20
+@@ -90,22 +89,27 @@ try:
+             self.p_mock.terminate()
+             self.p_mock.wait()
+=20
+-        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
++        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
+             '''Assert that condition function eventually returns True.
+=20
+-            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
++            Timeout is in seconds, defaulting to 5 seconds. message is
+             printed on failure.
+             '''
+-            while timeout >=3D 0:
+-                context =3D GLib.MainContext.default()
+-                while context.iteration(False):
+-                    pass
+-                if condition():
+-                    break
+-                timeout -=3D 1
+-                time.sleep(0.1)
+-            else:
+-                self.fail(message or 'timed out waiting for ' + str(con=
dition))
++            if not message:
++                message =3D 'timed out waiting for ' + str(condition)
++
++            def timed_out_cb(message):
++                self.fail(message)
++                return GLib.SOURCE_REMOVE
++
++            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
++            timeout_source.set_callback(timed_out_cb, message)
++            timeout_source.attach(self.main_context)
++
++            while not condition():
++                self.main_context.iteration(True)
++
++            timeout_source.destroy()
+=20
+         def power_saver_enabled_cb(self, spec, data):
+             self.power_saver_enabled =3D self.power_profile_monitor.get=
_power_saver_enabled()
+@@ -116,10 +120,10 @@ try:
+=20
+             self.assertEqual(self.power_profile_monitor.get_power_saver=
_enabled(), False)
+             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('power-saver', variant_level=3D1))
+-            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 10)
++            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 1)
+=20
+             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('balanced', variant_level=3D1))
+-            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 10)
++            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 1)
+=20
+         def test_power_profile_power_saver_enabled_portal_default(self)=
:
+             '''power-saver-enabled property default value'''
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.78.3.bb
index 2729b2a5963..42814ba5441 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
+           file://memory-monitor.patch \
            file://native-gtkdoc.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
--=20
2.34.1


