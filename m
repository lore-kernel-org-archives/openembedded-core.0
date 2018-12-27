Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8E56C23A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 09:00:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBR8xr95005785
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 01:00:24 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Dec 2018 01:00:04 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2018 00:59:41 -0800
Message-ID: <7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545901142.git.liezhi.yang@windriver.com>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] oeqa: make it work for multiple users
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
X-List-Received-Date: Thu, 27 Dec 2018 09:00:33 -0000
Content-Type: text/plain

There are failures when multiple users run oe-selftest on the same host:

PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-tests/201812250324_qemu'

This is because /tmp/oe-saved-tests was created by user A, while user B tries
to write data in it, then the error will happen. This patch can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass   | 2 +-
 meta/lib/oeqa/runtime/context.py | 7 +++----
 meta/lib/oeqa/utils/dump.py      | 5 ++++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 8a15c30..78b7b5e 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -77,7 +77,7 @@ TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
-TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
+TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests.${USER}/"
 
 TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
 
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 943e29b..96c231d 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -6,7 +6,7 @@ import os
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
 from oeqa.core.target.qemu import OEQemuTarget
-from oeqa.utils.dump import HostDumper
+from oeqa.utils.dump import HostDumper, default_host_dumper_dir
 
 from oeqa.runtime.loader import OERuntimeTestLoader
 
@@ -49,7 +49,6 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_manifest = 'data/manifest'
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
-    default_host_dumper_dir = '/tmp/oe-saved-tests'
     default_extract_dir = 'packages/extracted'
 
     def register_commands(self, logger, subparsers):
@@ -71,9 +70,9 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 % self.default_server_ip)
 
         runtime_group.add_argument('--host-dumper-dir', action='store',
-                default=self.default_host_dumper_dir,
+                default=default_host_dumper_dir,
                 help="Directory where host status is dumped, if tests fails, default: %s" \
-                % self.default_host_dumper_dir)
+                % default_host_dumper_dir)
 
         runtime_group.add_argument('--packages-manifest', action='store',
                 default=self.default_manifest,
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 5a7edc1..3ce8dd1 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -3,8 +3,11 @@ import sys
 import errno
 import datetime
 import itertools
+import getpass
 from .commands import runCmd
 
+default_host_dumper_dir = "/tmp/oe-saved-tests.%s" % getpass.getuser()
+
 class BaseDumper(object):
     """ Base class to dump commands from host/target """
 
@@ -12,7 +15,7 @@ class BaseDumper(object):
         self.cmds = []
         # Some testing doesn't inherit testimage, so it is needed
         # to set some defaults.
-        self.parent_dir = parent_dir or "/tmp/oe-saved-tests"
+        self.parent_dir = parent_dir or default_host_dumper_dir
         dft_cmds = """  top -bn1
                         iostat -x -z -N -d -p ALL 20 2
                         ps -ef
-- 
2.10.2


