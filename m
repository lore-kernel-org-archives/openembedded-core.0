Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RXg0j-0008Qr-Hx
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 22:23:46 +0100
Received: by yenq1 with SMTP id q1so1210005yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 13:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ztX/AzP5h5ITlQE7/agdNAsCrW9a7r6lnFM60k2LDck=;
	b=D5FdYoufylwUdrmhYV5Zi1r5e5++muG8AtuL7MmestkThVdWGoE280pvZbavixqn+m
	VEnDveqQQAsCZouw1ltAyCDY1d5bMEpPbeHEr8CEvbCW4U2Cbuee5NRNj/+wNms8n7xR
	DxlgOEWF67UCLHDX3Os8b+/pZF22BhUB/uBIg=
Received: by 10.236.176.2 with SMTP id a2mr12193080yhm.12.1323119806587;
	Mon, 05 Dec 2011 13:16:46 -0800 (PST)
Received: from auron.mgc.mentorg.com (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id i22sm33253970yhm.10.2011.12.05.13.16.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 13:16:46 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 14:16:29 -0700
Message-Id: <1323119789-23067-4-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
References: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
Subject: [PATCH 4/4] Add copyleft compliance class
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
X-List-Received-Date: Mon, 05 Dec 2011 21:23:46 -0000

Deploys sources for recipes for compliance with copyleft-style licenses
Defaults to using symlinks, as it's a quick operation, and one can easily
follow the links when making use of the files (e.g. tar with the -h arg).

By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/copyleft_compliance.bbclass |   94 ++++++++++++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/copyleft_compliance.bbclass

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
new file mode 100644
index 0000000..5d9ab11
--- /dev/null
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -0,0 +1,94 @@
+# Deploy sources for recipes for compliance with copyleft-style licenses
+# Defaults to using symlinks, as it's a quick operation, and one can easily
+# follow the links when making use of the files (e.g. tar with the -h arg).
+#
+# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
+#
+# vi:sts=4:sw=4:et
+
+COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
+
+COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
+COPYLEFT_LICENSE_INCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
+
+COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
+COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
+
+
+def copyleft_should_include(d):
+    """Determine if this recipe's sources should be deployed for compliance"""
+    import ast
+    import oe.license
+    from fnmatch import fnmatchcase as fnmatch
+
+    if oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crossdk'):
+        # not a target recipe
+        return
+
+    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
+    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
+
+    def include_license(license):
+        if any(fnmatch(license, pattern) for pattern in exclude):
+            return False
+        if any(fnmatch(license, pattern) for pattern in include):
+            return True
+        return False
+
+    def choose_licenses(a, b):
+        """Select the left option in an OR if all its licenses are to be included"""
+        if all(include_license(lic) for lic in a):
+            return a
+        else:
+            return b
+
+    try:
+        licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+    except oe.license.InvalidLicense as exc:
+        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+
+    return all(include_license(lic) for lic in licenses)
+
+python do_prepare_copyleft_sources () {
+    """Populate a tree of the recipe sources and emit patch series files"""
+    import os.path
+    import shutil
+
+    if not copyleft_should_include(d):
+        return
+
+    sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', 1)
+    src_uri = d.getVar('SRC_URI', 1).split()
+    fetch = bb.fetch2.Fetch(src_uri, d)
+    ud = fetch.ud
+
+    locals = (fetch.localpath(url) for url in fetch.urls)
+    localpaths = [local for local in locals if not local.endswith('.bb')]
+    if not localpaths:
+        return
+
+    pf = d.getVar('PF', True)
+    dest = os.path.join(sources_dir, pf)
+    shutil.rmtree(dest, ignore_errors=True)
+    bb.mkdirhier(dest)
+
+    for path in localpaths:
+        os.symlink(path, os.path.join(dest, os.path.basename(path)))
+
+    patches = src_patches(d)
+    for patch in patches:
+        _, _, local, _, _, parm = bb.decodeurl(patch)
+        patchdir = parm.get('patchdir')
+        if patchdir:
+            series = os.path.join(dest, 'series.subdir.%s' % patchdir.replace('/', '_'))
+        else:
+            series = os.path.join(dest, 'series')
+
+        with open(series, 'a') as s:
+            s.write('%s -p%s\n' % (os.path.basename(local), parm['striplevel']))
+}
+
+addtask prepare_copyleft_sources after do_fetch before do_build
+do_build[recrdeptask] += 'do_prepare_copyleft_sources'
-- 
1.7.8



