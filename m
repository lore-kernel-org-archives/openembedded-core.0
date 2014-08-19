Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7E6965DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:25:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J3P8tE012396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Aug 2014 20:25:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 20:25:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 11:24:57 +0800
Message-ID: <1693469219ba2d9c79213778ca5b0b80545d7894.1408417518.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408417518.git.hongxu.jia@windriver.com>
References: <cover.1408417518.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] classes/compress_doc.bbclass: compress man/info pages
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
X-List-Received-Date: Tue, 19 Aug 2014 03:25:09 -0000
Content-Type: text/plain

A distribution compression policy should be established, and used by all
packages. It compressed man pages in ${mandir} and info pages in ${infodir}

1. The doc will be compressed to gz format by default, which is configured
in ${DOC_COMPRESS}

2. It will automatically correct the compressed doc which is not
in ${DOC_COMPRESS} but in ${DOC_COMPRESS_LIST} to the format
of ${DOC_COMPRESS} policy

3. It is easy to add a new type compression by editing
local.conf, such as:
...
DOC_COMPRESS_LIST_append = ' abc'
DOC_COMPRESS = 'abc'
DOC_COMPRESS_CMD[abc] = 'abc compress cmd ***'
DOC_DECOMPRESS_CMD[abc] = 'abc decompress cmd ***'
...

[#YOCTO #1238]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/compress_doc.bbclass | 224 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)
 create mode 100644 meta/classes/compress_doc.bbclass

diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
new file mode 100644
index 0000000..233326b
--- /dev/null
+++ b/meta/classes/compress_doc.bbclass
@@ -0,0 +1,224 @@
+# Compress man pages in ${mandir} and info pages in ${infodir}
+#
+# 1. The doc will be compressed to gz format by default.
+#
+# 2. It will automatically correct the compressed doc which is not
+# in ${DOC_COMPRESS} but in ${DOC_COMPRESS_LIST} to the format
+# of ${DOC_COMPRESS} policy
+#
+# 3. It is easy to add a new type compression by editing
+# local.conf, such as:
+# DOC_COMPRESS_LIST_append = ' abc'
+# DOC_COMPRESS = 'abc'
+# DOC_COMPRESS_CMD[abc] = 'abc compress cmd ***'
+# DOC_DECOMPRESS_CMD[abc] = 'abc decompress cmd ***'
+
+# All supported compression policy
+DOC_COMPRESS_LIST ?= "gz xz bz2"
+
+# Compression policy, must be one of ${DOC_COMPRESS_LIST}
+DOC_COMPRESS ?= "gz"
+
+# Compression shell command
+DOC_COMPRESS_CMD[gz] ?= 'gzip -v -9 -n'
+DOC_COMPRESS_CMD[bz2] ?= "bzip2 -v -9"
+DOC_COMPRESS_CMD[xz] ?= "xz -v"
+
+# Decompression shell command
+DOC_DECOMPRESS_CMD[gz] ?= 'gunzip -v'
+DOC_DECOMPRESS_CMD[bz2] ?= "bunzip2 -v"
+DOC_DECOMPRESS_CMD[xz] ?= "unxz -v"
+
+PACKAGE_PREPROCESS_FUNCS += "package_do_compress_doc"
+python package_do_compress_doc() {
+    compress_mode = d.getVar('DOC_COMPRESS', True) or ''
+    compress_list = (d.getVar('DOC_COMPRESS_LIST', True) or '').split()
+    if compress_mode not in compress_list:
+        bb.fatal('Compression policy %s not supported (not listed in %s)\n' % (compress_mode, compress_list))
+
+    dvar = d.getVar('PKGD', True)
+    # We want:
+    # compress_cmds = {
+    #     'gz' : d.getVarFlag('DOC_COMPRESS_CMD', 'gz') or '',
+    #     'xz' : d.getVarFlag('DOC_COMPRESS_CMD', 'xz') or '' ,
+    #     'bz2': d.getVarFlag('DOC_COMPRESS_CMD', 'bz2') or ''
+    # }
+    # decompress_cmds = {
+    #     'gz' : d.getVarFlag('DOC_DECOMPRESS_CMD', 'gz') or '',
+    #     'xz' : d.getVarFlag('DOC_DECOMPRESS_CMD', 'xz') or '' ,
+    #     'bz2': d.getVarFlag('DOC_DECOMPRESS_CMD', 'bz2') or ''
+    # }
+    compress_cmds = {}
+    decompress_cmds = {}
+    for mode in compress_list:
+        compress_cmds[mode] = d.getVarFlag('DOC_COMPRESS_CMD', mode) or ''
+        decompress_cmds[mode] = d.getVarFlag('DOC_DECOMPRESS_CMD', mode) or ''
+
+    mandir = os.path.abspath(dvar + os.sep + d.getVar("mandir", True))
+    if os.path.exists(mandir):
+        # Decompress doc files which format is not compress_mode
+        decompress_doc(mandir, compress_mode, decompress_cmds)
+        compress_doc(mandir, compress_mode, compress_cmds)
+
+    infodir = os.path.abspath(dvar + os.sep + d.getVar("infodir", True))
+    if os.path.exists(infodir):
+        # Decompress doc files which format is not compress_mode
+        decompress_doc(infodir, compress_mode, decompress_cmds)
+        compress_doc(infodir, compress_mode, compress_cmds)
+}
+
+def _get_compress_format(file, compress_format_list):
+    for compress_format in compress_format_list:
+        compress_suffix = '.' + compress_format
+        if file.endswith(compress_suffix):
+            return compress_format
+
+    return ''
+
+# Collect hardlinks to dict, each element in dict lists hardlinks
+# which points to the same doc file.
+# {hardlink10: [hardlink11, hardlink12],,,}
+# The hardlink10, hardlink11 and hardlink12 are the same file.
+def _collect_hardlink(hardlink_dict, file):
+    for hardlink in hardlink_dict:
+        # Add to the existed hardlink
+        if os.path.samefile(hardlink, file):
+            hardlink_dict[hardlink].append(file)
+            return hardlink_dict
+
+    hardlink_dict[file] = []
+    return hardlink_dict
+
+def _process_hardlink(hardlink_dict, compress_mode, shell_cmds, decompress=False):
+    for target in hardlink_dict:
+        if decompress:
+            compress_format = _get_compress_format(target, shell_cmds.keys())
+            cmd = "%s -f %s" % (shell_cmds[compress_format], target)
+            bb.note('decompress hardlink %s' % target)
+        else:
+            cmd = "%s -f %s" % (shell_cmds[compress_mode], target)
+            bb.note('compress hardlink %s' % target)
+        (retval, output) = oe.utils.getstatusoutput(cmd)
+        if retval:
+            bb.warn("de/compress file failed %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+            return
+
+        for hardlink_dup in hardlink_dict[target]:
+            if decompress:
+                # Remove compress suffix
+                compress_suffix = '.' + compress_format
+                new_hardlink = hardlink_dup[:-len(compress_suffix)]
+                new_target = target[:-len(compress_suffix)]
+            else:
+                # Append compress suffix
+                compress_suffix = '.' + compress_mode
+                new_hardlink = hardlink_dup + compress_suffix
+                new_target = target + compress_suffix
+
+            bb.note('hardlink %s-->%s' % (new_hardlink, new_target))
+            if not os.path.exists(new_hardlink):
+                os.link(new_target, new_hardlink)
+            if os.path.exists(hardlink_dup):
+                os.unlink(hardlink_dup)
+
+def _process_symlink(file, compress_format, decompress=False):
+    compress_suffix = '.' + compress_format
+    if decompress:
+        # Remove compress suffix
+        new_linkname = file[:-len(compress_suffix)]
+        new_source = os.readlink(file)[:-len(compress_suffix)]
+    else:
+        # Append compress suffix
+        new_linkname = file + compress_suffix
+        new_source = os.readlink(file) + compress_suffix
+
+    bb.note('symlink %s-->%s' % (new_linkname, new_source))
+    if not os.path.exists(new_linkname):
+        os.symlink(new_source, new_linkname)
+
+    os.unlink(file)
+
+def _is_info(file):
+    flags = '.info .info-'.split()
+    for flag in flags:
+        if flag in os.path.basename(file):
+            return True
+
+    return False
+
+def _is_man(file):
+    # It refers MANSECT-var in man(1.6g)'s man.config
+    flags = '.1:.1p:.8:.2:.3:.3p:.4:.5:.6:.7:.9:.0p:.tcl:.n:.l:.p:.o'.split(':')
+    for flag in flags:
+        if os.path.basename(file).endswith(flag):
+            return True
+
+    return False
+
+def _is_compress_doc(file, compress_format_list):
+    compress_format = _get_compress_format(file, compress_format_list)
+    compress_suffix = '.' + compress_format
+    if file.endswith(compress_suffix):
+        # Remove the compress suffix
+        uncompress_file = file[:-len(compress_suffix)]
+        if _is_info(uncompress_file) or _is_man(uncompress_file):
+            return True, compress_format
+
+    return False, ''
+
+def compress_doc(topdir, compress_mode, compress_cmds):
+    hardlink_dict = {}
+    for root, dirs, files in os.walk(topdir):
+        for f in files:
+            file = os.path.join(root, f)
+            if os.path.isdir(file):
+                continue
+
+            if _is_info(file) or _is_man(file):
+                # Symlink
+                if os.path.islink(file):
+                    _process_symlink(file, compress_mode)
+                # Hardlink
+                elif os.lstat(file).st_nlink > 1:
+                    _collect_hardlink(hardlink_dict, file)
+                # Normal file
+                elif os.path.isfile(file):
+                    cmd = "%s %s" % (compress_cmds[compress_mode], file)
+                    (retval, output) = oe.utils.getstatusoutput(cmd)
+                    if retval:
+                        bb.warn("compress failed %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+                        continue
+                    bb.note('compress file %s' % file)
+
+    _process_hardlink(hardlink_dict, compress_mode, compress_cmds)
+
+# Decompress doc files which format is not compress_mode
+def decompress_doc(topdir, compress_mode, decompress_cmds):
+    hardlink_dict = {}
+    decompress = True
+    for root, dirs, files in os.walk(topdir):
+        for f in files:
+            file = os.path.join(root, f)
+            if os.path.isdir(file):
+                continue
+
+            res, compress_format = _is_compress_doc(file, decompress_cmds.keys())
+            # Decompress files which format is not compress_mode
+            if res and compress_mode!=compress_format:
+                # Symlink
+                if os.path.islink(file):
+                    _process_symlink(file, compress_format, decompress)
+                # Hardlink
+                elif os.lstat(file).st_nlink > 1:
+                    _collect_hardlink(hardlink_dict, file)
+                # Normal file
+                elif os.path.isfile(file):
+                    cmd = "%s %s" % (decompress_cmds[compress_format], file)
+                    (retval, output) = oe.utils.getstatusoutput(cmd)
+                    if retval:
+                        bb.warn("decompress failed %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+                        continue
+                    bb.note('decompress file %s' % file)
+
+    _process_hardlink(hardlink_dict, compress_mode, decompress_cmds, decompress)
+
-- 
1.9.1


