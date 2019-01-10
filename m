Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6BC7C041
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:32:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0A7Von7002785
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2019 23:32:01 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 23:31:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jan 2019 15:49:49 +0800
Message-ID: <993b9505008c19f909b7ba13b81adddcd63826b9.1547106548.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1547106548.git.liezhi.yang@windriver.com>
References: <cover.1547106548.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa: make it work for multiple users
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
X-List-Received-Date: Thu, 10 Jan 2019 07:32:11 -0000
Content-Type: text/plain

There are failures when multiple users run oe-selftest on the same
host:

PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-
tests/201812250324_qemu'

This is because /tmp/oe-saved-tests was created by user A, while user B tries
to write data in it, then the error will happen. This patch can fix the
problem.

Move the dumped data to ${LOG_DIR}/runtime-hostdump/ rather than
/tmp/oe-saved-tests/ to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass   | 3 ++-
 meta/lib/oeqa/runtime/context.py | 5 +----
 meta/lib/oeqa/targetcontrol.py   | 2 ++
 meta/lib/oeqa/utils/dump.py      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 73cd375..cb8c12a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -77,7 +77,7 @@ TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
-TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
+TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 
 TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
 
@@ -249,6 +249,7 @@ def testimage_main(d):
                       'bootlog'     : bootlog,
                       'kvm'         : kvm,
                       'slirp'       : slirp,
+                      'dump_dir'    : d.getVar("TESTIMAGE_DUMP_DIR"),
                     }
 
     # TODO: Currently BBPATH is needed for custom loading of targets.
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 943e29b..db0482d 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -49,7 +49,6 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_manifest = 'data/manifest'
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
-    default_host_dumper_dir = '/tmp/oe-saved-tests'
     default_extract_dir = 'packages/extracted'
 
     def register_commands(self, logger, subparsers):
@@ -71,9 +70,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 % self.default_server_ip)
 
         runtime_group.add_argument('--host-dumper-dir', action='store',
-                default=self.default_host_dumper_dir,
-                help="Directory where host status is dumped, if tests fails, default: %s" \
-                % self.default_host_dumper_dir)
+                help="Directory where host status is dumped, if tests fails")
 
         runtime_group.add_argument('--packages-manifest', action='store',
                 default=self.default_manifest,
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 97d67ad..1868ad3 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -107,6 +107,8 @@ class QemuTarget(BaseTarget):
         dump_target_cmds = d.getVar("testimage_dump_target")
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
+        if not dump_dir:
+            dump_dir = os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdump')
         use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
 
         # Log QemuRunner log output to a file
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 5a7edc1..79c22b7 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -12,7 +12,7 @@ class BaseDumper(object):
         self.cmds = []
         # Some testing doesn't inherit testimage, so it is needed
         # to set some defaults.
-        self.parent_dir = parent_dir or "/tmp/oe-saved-tests"
+        self.parent_dir = parent_dir
         dft_cmds = """  top -bn1
                         iostat -x -z -N -d -p ALL 20 2
                         ps -ef
-- 
2.7.4


