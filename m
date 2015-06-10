Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5688D75678
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 10:09:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96785864"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jun 2015 18:13:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5AA7dgt019167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 18:07:39 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Jun 2015 18:09:15 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 18:09:14 +0800
Message-ID: <1433930954-31813-4-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH v4 3/3] spdx: create a directory to save source code
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
X-List-Received-Date: Wed, 10 Jun 2015 10:09:16 -0000
Content-Type: text/plain

In order to avoid the SPDX_S be polluted in the rebuild, create ${WORKDIR}/${SPDX_TEMP_DIR} to save the source.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/classes/spdx.bbclass | 34 +++++++++++++++++++++++++++++++++-
 meta/conf/licenses.conf   |  2 ++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index c0f42ad..5421ae1 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -64,6 +64,7 @@ python do_spdx () {
 
     ## get everything from cache.  use it to decide if 
     ## something needs to be rerun
+    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
     info['sourcedir'] = d.getVar('SPDX_S', True)
     cur_ver_code = get_ver_code(info['sourcedir']).split()[0]
     cache_cur = False
@@ -94,8 +95,39 @@ python do_spdx () {
             bb.warn('Can\'t get the spdx file ' + info['pn'] + '. Please check your fossylogy server.')
     if os.path.exists(info['tar_file']):
         remove_file(info['tar_file'])
+    d.setVar('WORKDIR', info['workdir'])
 }
-addtask spdx after do_patch before do_configure
+#Get the src after do_patch.
+python do_get_spdx_s() {
+    import shutil
+    #The source of gcc is too large to get it's spdx.So,give up.
+    bpn = d.getVar('BPN', True)
+    if ((bpn == "gcc") or (bpn == "libgcc")):
+        return None
+    # Change the WORKDIR to make do_unpack do_patch run in another dir.
+    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
+    # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
+    # possibly requiring of the following tasks (such as some recipes's
+    # do_patch required 'B' existed).
+    bb.utils.mkdirhier(d.getVar('B', True))
+
+    # The kernel source is ready after do_validate_branches
+    if bb.data.inherits_class('kernel-yocto', d):
+        kernel_workdir = d.getVar('WORKDIR', True) + "/kernel-source"
+        if os.path.exists(kernel_workdir):
+            bb.utils.remove(kernel_workdir)
+        shutil.copytree(d.getVar('S', True), kernel_workdir, symlinks=True) 
+        return None
+    else:
+        bb.build.exec_func('do_unpack', d)
+    # The S of the gcc source is work-share
+    if ((bpn == "gcc") or (bpn == "libgcc")):
+        d.setVar('S', d.getVar('WORKDIR', True) + "/gcc-" + d.getVar('PV', True))
+    bb.build.exec_func('do_patch', d)
+}
+
+addtask get_spdx_s after do_patch before do_configure
+addtask spdx after do_get_spdx_s before do_configure
 
 def create_manifest(info,sstatefile):
     import shutil
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index be7602e..9e6856e 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -121,6 +121,8 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
 # both COPY_LIC_MANIFEST and COPY_LIC_DIRS
 #COPY_LIC_DIRS = "1"
 
+## SPDX temporary directory
+SPDX_TEMP_DIR ?= "${WORKDIR}/spdx_temp"
 ## SPDX manifest directory
 SPDX_MANIFEST_DIR ?= "${TMPDIR}/fossology_scans"
 
-- 
1.8.4.2


