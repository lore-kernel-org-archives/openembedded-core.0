Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SfPg8-00013P-FX
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:06:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5F5u0Ev019068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2012 22:56:00 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 14 Jun 2012 22:56:00 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:56:09 +0800
Message-ID: <f03f89492b96d3a6fb00a3117c6bd9cf04ecad7b.1339739522.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339739522.git.kai.kang@windriver.com>
References: <cover.1339739522.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/4] cleanup-workdir: only deal dirs related to current arch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 06:06:40 -0000
Content-Type: text/plain

Some users may build for different archs under same workdir, so they
don't want to clean the dirs not related to current arch.

Run command 'bitbake -e' with selected packages to get the dirs related
to current arch then clean them.

Update the way to get the WORKDIR by parsing the IMAGE_ROOTFS by the
way.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/cleanup-workdir |   54 ++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 1e9c56d..156a259 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -47,6 +47,19 @@ def run_command(cmd):
         sys.exit(1)
     return output
 
+def get_cur_arch_dirs(workdir, arch_dirs):
+    pattern = workdir + '/(.*?)/'
+
+    # select thest 5 packages to get the dirs of current arch
+    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'autoconf-nativesdk']
+
+    for pkg in pkgs:
+        cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="
+        output = run_command(cmd)
+        output = output.split('"')[1]
+        m = re.match(pattern, output)
+        arch_dirs.append(m.group(1))
+
 def main():
     global parser
     parser = optparse.OptionParser(
@@ -87,21 +100,52 @@ This script must be ran under BUILDDIR after source file \"oe-init-build-env\"."
             version = parse_version(elems[2])
         pkg_cur_dirs.append(elems[0] + '-' + version)
 
-    cmd = "bitbake -e | grep ^TMPDIR"
+    cmd = "bitbake -e"
     output = run_command(cmd)
 
-    tmpdir = output.split('"')[1]
-    workdir = os.path.join(tmpdir, 'work')
-    if not os.path.exists(workdir):
-        print "WORKDIR %s does NOT exist. Quit." % workdir
+    tmpdir = None
+    image_rootfs = None
+    output = output.split('\n')
+    for line in output:
+        if tmpdir and image_rootfs:
+            break
+
+        if not tmpdir:
+            m = re.match('TMPDIR="(.*)"', line)
+            if m:
+                tmpdir = m.group(1)
+
+        if not image_rootfs:
+            m = re.match('IMAGE_ROOTFS="(.*)"', line)
+            if m:
+                image_rootfs = m.group(1)
+
+    # won't fail just in case
+    if not tmpdir or not image_rootfs:
+        print "Can't get TMPDIR or IMAGE_ROOTFS."
+        return 1
+
+    pattern = tmpdir + '/(.*?)/(.*?)/'
+    m = re.match(pattern, image_rootfs)
+    if not m:
+        print "Can't get WORKDIR."
         return 1
 
+    workdir = os.path.join(tmpdir, m.group(1))
+
+    # we only deal the dirs of current arch, total numbers of dirs are 6
+    cur_arch_dirs = [m.group(2)]
+    get_cur_arch_dirs(workdir, cur_arch_dirs)
+
     for workroot, dirs, files in os.walk(workdir):
         # For the files, they should NOT exist in WORKDIR. Romve them.
         for f in files:
             obsolete_dirs.append(os.path.join(workroot, f))
 
         for d in dirs:
+            if d not in cur_arch_dirs:
+                continue
+
             for pkgroot, pkgdirs, filenames in os.walk(os.path.join(workroot, d)):
                 for f in filenames:
                     obsolete_dirs.append(os.path.join(pkgroot, f))
-- 
1.7.5.4



