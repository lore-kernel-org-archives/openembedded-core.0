Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 37C7E7F87E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 11:27:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p17so18991886wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2020 03:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N6To2zj4Go4yzMP8x99TvRlo/S/wwrifvJ1CqNtgdU4=;
	b=Vnh2uJnwoET16zri/viqYccAMxp+15LT4pKpP+qSBu8s66XdJB2uACuOsy3sCabVTV
	Gth9KkQiLnnIHPm4tvZfVGsos+S5mCZ5J/VrEJOKMT7bLkJ9cCSZO+TENp9CufnWh3iL
	VCgFea7DF9iTDnbSYTQlyQDM2OtSknxhSjJAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N6To2zj4Go4yzMP8x99TvRlo/S/wwrifvJ1CqNtgdU4=;
	b=nghMqNYDtUOf0woTJ3QVp0UEfxIVTZLKaLLcRlHPqE0B9bEQTbBlFluJWqXyiwlTSp
	gTrr3s5X4O/EJ8rzxrhLbvdyeJCgC01ZVrf+8PcstplIoow6AmrkXU73PRCOinKdNoIf
	jMzuHQh3PBZCHY5rZodLBxaVJ1VOM4LveQ3Qxr5PTdbgyTUqfiv0oQzgn+laDe6+3xpG
	qWxsnq+tM/19Px2oUoqMiDVYrPsAGx//wvyA7owdLIMqjqfHekq60/vCjb+BqVWjOlDG
	qKSLdy7j/nM6FUHoomK0cVesZjkNulhrhEY3CEB5gm7qVGC30Vyctcq6/ND6GXsn5hLN
	sqiA==
X-Gm-Message-State: APjAAAXTa3XBGKzxky6EMV7PEi6K/UoBDQ+LLb0q0bGSU4sfe1HkRZek
	fv2yaCAt0aVM82goAx0ZJInCDYF7nER7LQ==
X-Google-Smtp-Source: APXvYqysg+5Vcr0S+R1HqazGE7DyC8xoVVd87SMk4VJrkuQF3z2zghA+eHXu823ygfDQ2m4JlFaYWg==
X-Received: by 2002:a05:600c:251:: with SMTP id
	17mr38002661wmj.88.1578396456140; 
	Tue, 07 Jan 2020 03:27:36 -0800 (PST)
Received: from arch0.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	r5sm75069879wrt.43.2020.01.07.03.27.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 03:27:35 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 11:27:33 +0000
Message-Id: <20200107112734.2431-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/2] archiver.bbclass: Add new mirror archiver mode
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
X-List-Received-Date: Tue, 07 Jan 2020 11:27:36 -0000
Content-Transfer-Encoding: 8bit

We define a new method of populating a source mirror using the archiver
bbclass instead of simply copying the contents of the downloads
directory. This allows the archiver features such as copyleft license
filtering and recipe type filtering to be used when preparing a source
mirror.

This new archiver mode is selected by setting `ARCHIVE_MODE[src]` to
'mirror'.

The source mirror mode can either be 'split' (default) or 'combined',
controlled by `ARCHIVER_MODE[mirror]`. Additionally, sources can be
excluded as needed by setting `ARCHIVER_MIRROR_EXCLUDE` to a list of
URI prefixes. These options are described in more detail in the new
entries in the header of archiver.bbclass.

New oeqa selftest cases are added to cover the mirror archiver mode.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/archiver.bbclass            | 136 +++++++++++++++++++----
 meta/lib/oeqa/selftest/cases/archiver.py |  59 ++++++++++
 2 files changed, 176 insertions(+), 19 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 7c46cff91f..013195df7d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -2,25 +2,42 @@
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # This bbclass is used for creating archive for:
-# 1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
-# 2) patched source: ARCHIVER_MODE[src] = "patched" (default)
-# 3) configured source: ARCHIVER_MODE[src] = "configured"
-# 4) The patches between do_unpack and do_patch:
-#    ARCHIVER_MODE[diff] = "1"
-#    And you can set the one that you'd like to exclude from the diff:
-#    ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
-# 5) The environment data, similar to 'bitbake -e recipe':
-#    ARCHIVER_MODE[dumpdata] = "1"
-# 6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
-# 7) Whether output the .src.rpm package:
-#    ARCHIVER_MODE[srpm] = "1"
-# 8) Filter the license, the recipe whose license in
-#    COPYLEFT_LICENSE_INCLUDE will be included, and in
-#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
-#    COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
-#    COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
-# 9) The recipe type that will be archived:
-#    COPYLEFT_RECIPE_TYPES = 'target'
+#  1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
+#  2) patched source: ARCHIVER_MODE[src] = "patched" (default)
+#  3) configured source: ARCHIVER_MODE[src] = "configured"
+#  4) source mirror: ARCHIVE_MODE[src] = "mirror"
+#  5) The patches between do_unpack and do_patch:
+#     ARCHIVER_MODE[diff] = "1"
+#     And you can set the one that you'd like to exclude from the diff:
+#     ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
+#  6) The environment data, similar to 'bitbake -e recipe':
+#     ARCHIVER_MODE[dumpdata] = "1"
+#  7) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
+#  8) Whether output the .src.rpm package:
+#     ARCHIVER_MODE[srpm] = "1"
+#  9) Filter the license, the recipe whose license in
+#     COPYLEFT_LICENSE_INCLUDE will be included, and in
+#     COPYLEFT_LICENSE_EXCLUDE will be excluded.
+#     COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
+#     COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
+# 10) The recipe type that will be archived:
+#     COPYLEFT_RECIPE_TYPES = 'target'
+# 11) The source mirror mode:
+#     ARCHIVER_MODE[mirror] = "split" (default): Sources are split into
+#     per-recipe directories in a similar way to other archiver modes.
+#     Post-processing may be required to produce a single mirror directory.
+#     This does however allow inspection of duplicate sources and more
+#     intelligent handling.
+#     ARCHIVER_MODE[mirror] = "combined": All sources are placed into a single
+#     directory suitable for direct use as a mirror. Duplicate sources are
+#     ignored.
+# 12) Source mirror exclusions:
+#     ARCHIVE_MIRROR_EXCLUDE is a list of prefixes to exclude from the mirror.
+#     This may be used for sources which you are already publishing yourself
+#     (e.g. if the URI starts with 'https://mysite.com/' and your mirror is
+#     going to be published to the same site). It may also be used to exclude
+#     local files (with the prefix 'file://') if these will be provided as part
+#     of an archive of the layers themselves.
 #
 
 # Create archive for all the recipe types
@@ -33,6 +50,7 @@ ARCHIVER_MODE[diff] ?= "0"
 ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
 ARCHIVER_MODE[dumpdata] ?= "0"
 ARCHIVER_MODE[recipe] ?= "0"
+ARCHIVER_MODE[mirror] ?= "split"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/deploy-sources"
@@ -41,6 +59,10 @@ ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
 ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
 ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
 
+# When producing a combined mirror directory, allow duplicates for the case
+# where multiple recipes use the same SRC_URI.
+ARCHIVER_COMBINED_MIRRORDIR = "${ARCHIVER_TOPDIR}/mirror"
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}/mirror"
 
 do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
@@ -106,6 +128,8 @@ python () {
         elif hasTask("do_configure"):
             d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
+    elif ar_src == "mirror":
+        d.appendVarFlag('do_deploy_archives', 'depends', '%s:do_ar_mirror' % pn)
 
     elif ar_src:
         bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
@@ -281,6 +305,79 @@ python do_ar_configured() {
         create_tarball(d, srcdir, 'configured', ar_outdir)
 }
 
+python do_ar_mirror() {
+    import subprocess
+
+    src_uri = (d.getVar('SRC_URI') or '').split()
+    if len(src_uri) == 0:
+        return
+
+    dl_dir = d.getVar('DL_DIR')
+    mirror_exclusions = (d.getVar('ARCHIVER_MIRROR_EXCLUDE') or '').split()
+    mirror_mode = d.getVarFlag('ARCHIVER_MODE', 'mirror')
+    have_mirror_tarballs = d.getVar('BB_GENERATE_MIRROR_TARBALLS')
+
+    if mirror_mode == 'combined':
+        destdir = d.getVar('ARCHIVER_COMBINED_MIRRORDIR')
+    elif mirror_mode == 'split':
+        destdir = d.getVar('ARCHIVER_OUTDIR')
+    else:
+        bb.fatal('Invalid ARCHIVER_MODE[mirror]: %s' % (mirror_mode))
+
+    if not have_mirror_tarballs:
+        bb.fatal('Using `ARCHIVER_MODE[src] = "mirror"` depends on setting `BB_GENERATE_MIRROR_TARBALLS = "1"`')
+
+    def is_excluded(url):
+        for prefix in mirror_exclusions:
+            if url.startswith(prefix):
+                return True
+        return False
+
+    bb.note('Archiving the source as a mirror...')
+
+    bb.utils.mkdirhier(destdir)
+
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+
+    for url in fetcher.urls:
+        if is_excluded(url):
+            bb.note('Skipping excluded url: %s' % (url))
+            continue
+
+        bb.note('Archiving url: %s' % (url))
+        ud = fetcher.ud[url]
+        ud.setup_localpath(d)
+        localpath = None
+
+        # Check for mirror tarballs first. We will archive the first mirror
+        # tarball that we find as it's assumed that we just need one.
+        for mirror_fname in ud.mirrortarballs:
+            mirror_path = os.path.join(dl_dir, mirror_fname)
+            if os.path.exists(mirror_path):
+                bb.note('Found mirror tarball: %s' % (mirror_path))
+                localpath = mirror_path
+                break
+
+        if len(ud.mirrortarballs) and not localpath:
+            bb.warn('Mirror tarballs are listed for a source but none are present.' \
+                    'Falling back to original download.\n' \
+                    'SRC_URI = %s' % (url))
+
+        # Check original download
+        if not localpath:
+            bb.note('Using original download: %s' % (ud.localpath))
+            localpath = ud.localpath
+
+        if not localpath or not os.path.exists(localpath):
+            bb.fatal('Original download is missing for a source.\n' \
+                        'SRC_URI = %s' % (url))
+
+        # We now have an appropriate localpath
+        bb.note('Copying source mirror')
+        cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
+        subprocess.check_call(cmd, shell=True)
+}
+
 def exclude_useless_paths(tarinfo):
     if tarinfo.isdir():
         if tarinfo.name.endswith('/temp') or tarinfo.name.endswith('/patches') or tarinfo.name.endswith('/.pc'):
@@ -483,6 +580,7 @@ addtask do_ar_original after do_unpack
 addtask do_unpack_and_patch after do_patch
 addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
+addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives before do_build
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 6bd0e06ec4..fab2f56c39 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -195,3 +195,62 @@ class Archiver(OESelftestTestCase):
 
         self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-showdata.dump',
                                  'ARCHIVER_MODE[dumpdata] = "1"\n')
+
+    def test_archiver_mode_mirror(self):
+        """
+        Test that the archiver works with `ARCHIVER_MODE[src] = "mirror"`.
+        """
+
+        self._test_archiver_mode('mirror', 'ed-1.14.1.tar.lz',
+                                 'BB_GENERATE_MIRROR_TARBALLS = "1"\n')
+
+    def test_archiver_mode_mirror_excludes(self):
+        """
+        Test that the archiver works with `ARCHIVER_MODE[src] = "mirror"` and
+        correctly excludes an archive when its URL matches
+        `ARCHIVER_MIRROR_EXCLUDES`.
+        """
+
+        target='selftest-ed'
+        target_file_name = 'ed-1.14.1.tar.lz'
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "mirror"\n'
+        features += 'BB_GENERATE_MIRROR_TARBALLS = "1"\n'
+        features += 'ARCHIVER_MIRROR_EXCLUDE = "${GNU_MIRROR}"\n'
+        self.write_config(features)
+
+        bitbake('-c clean %s' % (target))
+        bitbake('-c deploy_archives %s' % (target))
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
+        glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'], '%s-*' % (target))
+        glob_result = glob.glob(glob_str)
+        self.assertTrue(glob_result, 'Missing archiver directory for %s' % (target))
+
+        archive_path = os.path.join(glob_result[0], target_file_name)
+        self.assertFalse(os.path.exists(archive_path), 'Failed to exclude archive file %s' % (target_file_name))
+
+    def test_archiver_mode_mirror_combined(self):
+        """
+        Test that the archiver works with `ARCHIVER_MODE[src] = "mirror"`
+        and `ARCHIVER_MODE[mirror] = "combined"`. Archives for multiple recipes
+        should all end up in the 'mirror' directory.
+        """
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "mirror"\n'
+        features += 'ARCHIVER_MODE[mirror] = "combined"\n'
+        features += 'BB_GENERATE_MIRROR_TARBALLS = "1"\n'
+        features += 'COPYLEFT_LICENSE_INCLUDE = "*"\n'
+        self.write_config(features)
+
+        for target in ['selftest-ed', 'selftest-hardlink']:
+            bitbake('-c clean %s' % (target))
+            bitbake('-c deploy_archives %s' % (target))
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
+        for target_file_name in ['ed-1.14.1.tar.lz', 'hello.c']:
+            glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], 'mirror', target_file_name)
+            glob_result = glob.glob(glob_str)
+            self.assertTrue(glob_result, 'Missing archive file %s' % (target_file_name))
-- 
2.24.1


