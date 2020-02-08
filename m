Return-Path: <aehs29@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id EE98C60EB6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 10:32:08 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id i6so1112470pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 02:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/FfSLvwUERNlLc6tS4qp75uLtXpFPoqzxAEg55rhGLw=;
	b=JVy9z/Df++GuvSIj/qbiZ0eWWeQ06PD22FiXFzpIv/UhAAjCqp6WgofkogUnBrJfI8
	yMq3RZvzdX8xOZP+IBFYrxsUcxFlTFvWUJEDnYndb6LZ8KwfkaC395DP0d98gIGc621s
	eQmGfvdgqOUTK8WVVz3yJR6cylJ8EGXyexnyonn5wEfeSS+zJsCO+4/PtYlsaTVFsyGe
	Yfz9UK0OxDgPCYjxuQ1dBCbCWEE0WFC+LVTSdZMXQYbjVo4ySXwaXeGmIvbO7EwRbR8h
	8thW4Vv/6/U+RfLacsg2EG1YnTD9yZGK90kBgiM+frtoth4YPVN79WlHByackSK0i+OG
	wedg==
X-Gm-Message-State: APjAAAXc4JAcVsMzGxYUQJnGTek1+C/qkl83gnUTfR4EUt2vXmKGywqe
	UiDxbuyqNuSgmxAUrQXKL/xAwyioRQxu1g==
X-Google-Smtp-Source: APXvYqwd0UvR2EUz6HeG/bjKl/q/Gu3fM8N/9Ued8qUsi8mKDJAsb/NiLoBGmTQAzdyJV7s57GJb/A==
X-Received: by 2002:a63:d705:: with SMTP id d5mr4016936pgg.24.1581157929471;
	Sat, 08 Feb 2020 02:32:09 -0800 (PST)
Received: from penguin.lxd (c-73-223-117-38.hsd1.ca.comcast.net.
	[73.223.117.38]) by smtp.gmail.com with ESMTPSA id
	q11sm5690962pff.111.2020.02.08.02.32.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 08 Feb 2020 02:32:08 -0800 (PST)
From: Alejandro Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Feb 2020 02:32:02 -0800
Message-Id: <20200208103202.4962-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 2/2] testimage: Extend runtime testing infrastructure to allow unconventional booting processes to be tested
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
X-List-Received-Date: Sat, 08 Feb 2020 10:32:09 -0000
Content-Transfer-Encoding: 8bit

The current runtime infrastructure contains hardcoded values which Ill refer to
as patterns, these patterns are either searched through or sent via the serial
terminal to communicate between HOST and TARGET.

These patterns are required since they allow us to check when a device has
finished booting, to log in, and to check whether a command sent from our tests
has returned, this way we are able to check both the status of the commands that
were sent along with its output.

The testing process goes somewhat as follows:
1. Launch QEMU and start booting.
2. Check when the device has booted by looking for the pattern login:.
3. Log in as the root user (default for our images).
4. Check that we were able to log in succesfully.
5. Start running the runtime test cases defined by TEST_SUITES.
6. One of such test cases could send a command to the QEMU target.
7. Check whether that command returned.
8. Check its output and status, return whether the test case passed or failed.

This patch allows this set of patterns to be defined instead of being hardcoded,
but it also automatically sets the defaults that we have been using in the past
if they have not been manually defined, for this reason, the patch is less
invasive and should not affect in any way how tests are currently being run.

Cases that can be enabled with this patch:
- A customized image that does not use the root user (or maybe we want to check
what happens if we dont use the root user).
- An image where the PS1 env variable has been modified, and the prompt pattern
wouldnt match the default.
- Baremetal applications, which do not follow the conventional way of booting
Linux and would probably not show a prompt for a user to log in, same applies
for testing bootloaders.
- poky-tiny: Using DISTRO=poky-tiny and an image such as the core-image-tiny
from meta-intel, which boots directly to RAM, and does not show a log in prompt
since it does not contain a conventional init process.

The code itself contains comments that should be self explanatory but here is an
example on how these patterns can be defined in a hypothetical case where we
want to run test cases as the webserver user instead:

TESTIMAGE_BOOT_PATTERNS = "send_login_user search_login_succeeded"
TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
TESTIMAGE_BOOT_PATTERNS[search_login_succeeded] = "webserver@[a-zA-Z0-9\-]+:~#"

The variable TESTIMAGE_BOOT_PATTERNS defines which patterns to override when
used to communicate with the target when booting, anyone familiar with the
PACKAGECONFIG syntax should have no trouble setting these.

Other patterns would still be set up as default, e.g.
search_reached_prompt would still be login:

The accepted flags for TESTIMAGE_BOOT_PATTERNS are the following:
search_reached_prompt, send_login_user, search_login_succeeded,
search_cmd_finished.

They are prefixed with either search/send, to differentiate if the pattern is
meant to be sent or searched to/from the target terminal.

A working example of this code that falls under the baremetal case mentioned
above along with a test case is present on the meta-freertos layer, which tests
an RTOS image built with OpenEmbedded and automatically runs a test case on it
after booting such image:

As usual, INHERIT += "testimage" needs to be present on local.conf
$ bitbake freertos-demo -c testimage

RESULTS:
RESULTS - freertos_echo.FreeRTOSTest.test_freertos_echo: PASSED (2.00s)
SUMMARY:
freertos-demo () - Ran 1 test in 2.006s
freertos-demo - OK - All required tests passed (successes=1, skipped=0,
failures=0, errors=0)

Signed-off-by: Alejandro Hernandez Samaniego <aehs29@gmail.com>
Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/classes/testimage.bbclass    | 39 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/core/target/qemu.py |  7 ++++--
 meta/lib/oeqa/utils/qemurunner.py | 31 ++++++++++++++++++++----
 3 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 0d55c3247e..75f0f2c3e3 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -34,6 +34,17 @@ TESTIMAGE_AUTO ??= "0"
 # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
 # TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
 
+# TESTIMAGE_BOOT_PATTERNS can be used to override certain patterns used to communicate with the target when booting,
+# if a pattern is not specifically present on this variable a default will be used when booting the target.
+# TESTIMAGE_BOOT_PATTERNS[<flag>] overrides the pattern used for that specific flag, where flag comes from a list of accepted flags
+# e.g. normally the system boots and waits for a login prompt (login:), after that it sends the command: "root\n" to log as the root user
+# if we wanted to log in as the hypothetical "webserver" user for example we could set the following:
+# TESTIMAGE_BOOT_PATTERNS = "send_login_user search_login_succeeded"
+# TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
+# TESTIMAGE_BOOT_PATTERNS[search_login_succeeded] = "webserver@[a-zA-Z0-9\-]+:~#"
+# The accepted flags are the following: search_reached_prompt, send_login_user, search_login_succeeded, search_cmd_finished.
+# They are prefixed with either search/send, to differentiate if the pattern is meant to be sent or searched to/from the target terminal
+
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 TEST_EXPORT_DIR ?= "${TMPDIR}/testimage/${PN}"
@@ -68,6 +79,8 @@ TEST_TARGET ?= "qemu"
 TEST_QEMUPARAMS ?= ""
 TEST_RUNQEMUPARAMS ?= ""
 
+TESTIMAGE_BOOT_PATTERNS ?= ""
+
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_append_qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
@@ -150,6 +163,29 @@ def get_testimage_json_result_dir(d):
 def get_testimage_result_id(configuration):
     return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['MACHINE'], configuration['STARTTIME'])
 
+def get_testimage_boot_patterns(d):
+    from collections import defaultdict
+    boot_patterns = defaultdict(str)
+    # Only accept certain values
+    accepted_patterns = ['search_reached_prompt', 'send_login_user', 'search_login_succeeded', 'search_cmd_finished']
+    # Not all patterns need to be overriden, e.g. perhaps we only want to change the user
+    boot_patterns_flags = d.getVarFlags('TESTIMAGE_BOOT_PATTERNS') or {}
+    if boot_patterns_flags:
+        patterns_set = [p for p in boot_patterns_flags.items() if p[0] in d.getVar('TESTIMAGE_BOOT_PATTERNS').split()]
+        for flag, flagval in patterns_set:
+                if flag not in accepted_patterns:
+                    bb.fatal('Testimage: The only accepted boot patterns are: search_reached_prompt,send_login_user, \
+                    search_login_succeeded,search_cmd_finished\n Make sure your TESTIMAGE_BOOT_PATTERNS=%s \
+                    contains an accepted flag.' % d.getVar('TESTIMAGE_BOOT_PATTERNS'))
+                    return
+                # We know boot prompt is searched through in binary format, others might be expressions
+                if flag == 'search_reached_prompt':
+                    boot_patterns[flag] = flagval.encode()
+                else:
+                    boot_patterns[flag] = flagval.encode().decode('unicode-escape')
+    return boot_patterns
+
+
 def testimage_main(d):
     import os
     import json
@@ -259,6 +295,9 @@ def testimage_main(d):
                       'serial_ports': len(d.getVar("SERIAL_CONSOLES").split()),
                     }
 
+    if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
+        target_kwargs['boot_patterns'] = get_testimage_boot_patterns(d)
+
     # TODO: Currently BBPATH is needed for custom loading of targets.
     # It would be better to find these modules using instrospection.
     target_kwargs['target_modules_path'] = d.getVar('BBPATH')
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 008a9f03ce..059106e915 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -8,6 +8,7 @@ import os
 import sys
 import signal
 import time
+from collections import defaultdict
 
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
@@ -18,7 +19,8 @@ class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
-            tmpdir='', dir_image='', boottime=60, serial_ports=2, **kwargs):
+            tmpdir='', dir_image='', boottime=60, serial_ports=2,
+            boot_patterns = defaultdict(str), **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
@@ -30,13 +32,14 @@ class OEQemuTarget(OESSHTarget):
         self.kernel = kernel
         self.kvm = kvm
         self.use_slirp = slirp
+        self.boot_patterns = boot_patterns
 
         self.runner = QemuRunner(machine=machine, rootfs=rootfs, tmpdir=tmpdir,
                                  deploy_dir_image=dir_image, display=display,
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger,
-                                 serial_ports=serial_ports)
+                                 serial_ports=serial_ports, boot_patterns = boot_patterns)
 
     def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 2cada35d48..b09d4240ee 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -21,6 +21,7 @@ import threading
 import codecs
 import logging
 from oeqa.utils.dump import HostDumper
+from collections import defaultdict
 
 # Get Unicode non printable control chars
 control_range = list(range(0,32))+list(range(127,160))
@@ -31,7 +32,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2):
+                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str)):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -57,6 +58,7 @@ class QemuRunner:
         self.use_slirp = use_slirp
         self.serial_ports = serial_ports
         self.msg = ''
+        self.boot_patterns = boot_patterns
 
         self.runqemutime = 120
         self.qemu_pidfile = 'pidfile_'+str(os.getpid())
@@ -65,6 +67,25 @@ class QemuRunner:
 
         self.logger = logger
 
+        # Enable testing other OS's
+        # Set commands for target communication, and default to Linux ALWAYS
+        # Other OS's or baremetal applications need to provide their
+        # own implementation passing it through QemuRunner's constructor
+        # or by passing them through TESTIMAGE_BOOT_PATTERNS[flag]
+        # provided variables, where <flag> is one of the mentioned below.
+        accepted_patterns = ['search_reached_prompt', 'send_login_user', 'search_login_succeeded', 'search_cmd_finished']
+        default_boot_patterns = defaultdict(str)
+        # Default to the usual paterns used to communicate with the target
+        default_boot_patterns['search_reached_prompt'] = b' login:'
+        default_boot_patterns['send_login_user'] = 'root\n'
+        default_boot_patterns['search_login_succeeded'] = r"root@[a-zA-Z0-9\-]+:~#"
+        default_boot_patterns['search_cmd_finished'] = r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#"
+
+        # Only override patterns that were set e.g. login user TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
+        for pattern in accepted_patterns:
+            if not self.boot_patterns[pattern]:
+                self.boot_patterns[pattern] = default_boot_patterns[pattern]
+
     def create_socket(self):
         try:
             sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
@@ -321,7 +342,7 @@ class QemuRunner:
                             self.log(data)
 
                         data = b''
-                        if b' login:' in bootlog:
+                        if self.boot_patterns['search_reached_prompt'] in bootlog:
                             self.server_socket = qemusock
                             stopread = True
                             reachedlogin = True
@@ -353,8 +374,8 @@ class QemuRunner:
 
         # If we are not able to login the tests can continue
         try:
-            (status, output) = self.run_serial("root\n", raw=True)
-            if re.search(r"root@[a-zA-Z0-9\-]+:~#", output):
+            (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True)
+            if re.search(self.boot_patterns['search_login_succeeded'], output):
                 self.logged = True
                 self.logger.debug("Logged as root in serial console")
                 if netconf:
@@ -475,7 +496,7 @@ class QemuRunner:
                 if answer:
                     data += answer.decode('utf-8')
                     # Search the prompt to stop
-                    if re.search(r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
+                    if re.search(self.boot_patterns['search_cmd_finished'], data):
                         break
                 else:
                     raise Exception("No data on serial console socket")
-- 
2.20.1


