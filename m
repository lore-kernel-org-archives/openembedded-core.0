Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4E23977334
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslM006905; Wed, 1 Jun 2016 13:35:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OFbH2kKa9-O9; Wed,  1 Jun 2016 13:35:54 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpw4006871
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000kB-6y; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:21 +0100
Message-Id: <1464784540-2786-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/22] classes/lib: Update to use python3 command pipeline decoding
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:57 -0000

In python3, strings are unicode by default. We need to encode/decode
from command pipelines and other places where we interface with the
real world using the correct locales. This patch updates various
call sites to use the correct encoding/decodings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass                  | 12 +--
 meta/classes/chrpath.bbclass                       |  2 +
 meta/classes/externalsrc.bbclass                   |  2 +-
 meta/classes/insane.bbclass                        |  8 +-
 meta/classes/libc-package.bbclass                  |  3 +
 meta/classes/package.bbclass                       |  6 +-
 meta/classes/package_deb.bbclass                   | 26 +++----
 meta/classes/toaster.bbclass                       |  1 +
 meta/lib/oe/gpg_sign.py                            | 10 +--
 meta/lib/oe/package.py                             |  4 +-
 meta/lib/oe/package_manager.py                     | 88 +++++++++++-----------
 meta/lib/oe/packagedata.py                         |  2 +-
 meta/lib/oeqa/oetest.py                            |  4 +-
 meta/lib/oeqa/runtime/parselogs.py                 |  4 +-
 meta/lib/oeqa/runtime/ping.py                      |  2 +-
 meta/lib/oeqa/utils/commands.py                    |  2 +-
 meta/lib/oeqa/utils/qemurunner.py                  | 26 ++++---
 meta/lib/oeqa/utils/qemutinyrunner.py              |  4 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |  1 +
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  5 +-
 20 files changed, 110 insertions(+), 102 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 581d532..e3b5c44 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -233,7 +233,7 @@ python buildhistory_emit_pkghistory() {
                 key = item[0]
                 if key.endswith('_' + pkg):
                     key = key[:-len(pkg)-1]
-                pkgdata[key] = item[1].decode('utf-8').decode('string_escape')
+                pkgdata[key] = item[1]
 
         pkge = pkgdata.get('PKGE', '0')
         pkgv = pkgdata['PKGV']
@@ -288,14 +288,12 @@ python buildhistory_emit_pkghistory() {
 
 
 def write_recipehistory(rcpinfo, d):
-    import codecs
-
     bb.debug(2, "Writing recipe history")
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
     infofile = os.path.join(pkghistdir, "latest")
-    with codecs.open(infofile, "w", encoding='utf8') as f:
+    with open(infofile, "w") as f:
         if rcpinfo.pe != "0":
             f.write(u"PE = %s\n" %  rcpinfo.pe)
         f.write(u"PV = %s\n" %  rcpinfo.pv)
@@ -305,8 +303,6 @@ def write_recipehistory(rcpinfo, d):
 
 
 def write_pkghistory(pkginfo, d):
-    import codecs
-
     bb.debug(2, "Writing package history for package %s" % pkginfo.name)
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
@@ -316,7 +312,7 @@ def write_pkghistory(pkginfo, d):
         bb.utils.mkdirhier(pkgpath)
 
     infofile = os.path.join(pkgpath, "latest")
-    with codecs.open(infofile, "w", encoding='utf8') as f:
+    with open(infofile, "w") as f:
         if pkginfo.pe != "0":
             f.write(u"PE = %s\n" %  pkginfo.pe)
         f.write(u"PV = %s\n" %  pkginfo.pv)
@@ -349,7 +345,7 @@ def write_pkghistory(pkginfo, d):
         filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
         val = pkginfo.filevars[filevar]
         if val:
-            with codecs.open(filevarpath, "w", encoding='utf8') as f:
+            with open(filevarpath, "w") as f:
                 f.write(val)
         else:
             if os.path.exists(filevarpath):
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 9c68855..cdd7f27 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -10,6 +10,8 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     if p.returncode != 0:
         return
 
+    err = err.decode('utf-8')
+
     # Handle RUNPATH as well as RPATH
     err = err.replace("RUNPATH=","RPATH=")
     # Throw away everything other than the rpath list
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index da7eb478..b7140a3 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -145,7 +145,7 @@ def srctree_hash_files(d):
             env = os.environ.copy()
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '.'], cwd=s_dir, env=env)
-            sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env)
+            sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 71999ad..9b2337c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -399,7 +399,7 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
         sysroot_path_usr = sysroot_path + exec_prefix
 
         try:
-            ldd_output = bb.process.Popen(["prelink-rtld", "--root", sysroot_path, path], stdout=sub.PIPE).stdout.read()
+            ldd_output = bb.process.Popen(["prelink-rtld", "--root", sysroot_path, path], stdout=sub.PIPE).stdout.read().decode("utf-8")
         except bb.process.CmdError:
             error_msg = pn + ": prelink-rtld aborted when processing %s" % path
             package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
@@ -986,12 +986,12 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
     return sane
 
 def package_qa_check_encoding(keys, encode, d):
-    def check_encoding(key,enc):
+    def check_encoding(key, enc):
         sane = True
         value = d.getVar(key, True)
         if value:
             try:
-                s = unicode(value, enc)
+                s = value.encode(enc)
             except UnicodeDecodeError as e:
                 error_msg = "%s has non %s characters" % (key,enc)
                 sane = False
@@ -1217,7 +1217,7 @@ Missing inherit gettext?""" % (gt, config))
         try:
             flag = "WARNING: unrecognized options:"
             log = os.path.join(d.getVar('B', True), 'config.log')
-            output = subprocess.check_output(['grep', '-F', flag, log]).replace(', ', ' ')
+            output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ')
             options = set()
             for line in output.splitlines():
                 options |= set(line.partition(flag)[2].split())
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 467d567..70f479b 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -150,6 +150,7 @@ python package_do_split_gconvs () {
         c_re = re.compile('^copy "(.*)"')
         i_re = re.compile('^include "(\w+)".*')
         for l in f.readlines():
+            l = l.decode("latin-1")
             m = c_re.match(l) or i_re.match(l)
             if m:
                 dp = legitimize_package_name('%s%s-gconv-%s' % (mlprefix, bpn, m.group(1)))
@@ -171,6 +172,7 @@ python package_do_split_gconvs () {
         c_re = re.compile('^copy "(.*)"')
         i_re = re.compile('^include "(\w+)".*')
         for l in f.readlines():
+            l = l.decode("latin-1")
             m = c_re.match(l) or i_re.match(l)
             if m:
                 dp = legitimize_package_name('%s%s-charmap-%s' % (mlprefix, bpn, m.group(1)))
@@ -191,6 +193,7 @@ python package_do_split_gconvs () {
         c_re = re.compile('^copy "(.*)"')
         i_re = re.compile('^include "(\w+)".*')
         for l in f.readlines():
+            l = l.decode("latin-1")
             m = c_re.match(l) or i_re.match(l)
             if m:
                 dp = legitimize_package_name(mlprefix+bpn+'-localedata-%s' % m.group(1))
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a4125a0..501004e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -63,7 +63,7 @@ def legitimize_package_name(s):
     def fixutf(m):
         cp = m.group(1)
         if cp:
-            return ('\u%s' % cp).decode('unicode_escape').encode('utf-8')
+            return ('\\u%s' % cp).encode('latin-1').decode('unicode_escape')
 
     # Handle unicode codepoints encoded as <U0123>, as in glibc locale files.
     s = re.sub('<U([0-9A-Fa-f]{1,4})>', fixutf, s)
@@ -1259,8 +1259,8 @@ python emit_pkgdata() {
     def write_if_exists(f, pkg, var):
         def encode(str):
             import codecs
-            c = codecs.getencoder("string_escape")
-            return c(str)[0]
+            c = codecs.getencoder("unicode_escape")
+            return c(str)[0].decode("latin1")
 
         val = d.getVar('%s_%s' % (var, pkg), True)
         if val:
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index bb5220e..e35f427 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -173,7 +173,7 @@ python do_package_deb () {
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
                      summary = localdata.getVar('SUMMARY', True) or localdata.getVar('DESCRIPTION', True) or "."
-                     ctrlfile.write('Description: %s\n' % unicode(summary,'utf-8'))
+                     ctrlfile.write('Description: %s\n' % summary)
                      description = localdata.getVar('DESCRIPTION', True) or "."
                      description = textwrap.dedent(description).strip()
                      if '\\n' in description:
@@ -182,29 +182,25 @@ python do_package_deb () {
                              # We don't limit the width when manually indent, but we do
                              # need the textwrap.fill() to set the initial_indent and
                              # subsequent_indent, so set a large width
-                             ctrlfile.write('%s\n' % unicode(textwrap.fill(t, width=100000, initial_indent=' ', subsequent_indent=' '),'utf-8'))
+                             ctrlfile.write('%s\n' % textwrap.fill(t, width=100000, initial_indent=' ', subsequent_indent=' '))
                      else:
                          # Auto indent
-                         ctrlfile.write('%s\n' % unicode(textwrap.fill(description.strip(), width=74, initial_indent=' ', subsequent_indent=' '),'utf-8'))
+                         ctrlfile.write('%s\n' % textwrap.fill(description.strip(), width=74, initial_indent=' ', subsequent_indent=' '))
 
                 else:
-                     ctrlfile.write(unicode(c % tuple(pullData(fs, localdata)),'utf-8'))
+                     ctrlfile.write(c % tuple(pullData(fs, localdata)))
         except KeyError:
             import sys
             (type, value, traceback) = sys.exc_info()
             bb.utils.unlockfile(lf)
             ctrlfile.close()
             raise bb.build.FuncFailed("Missing field for deb generation: %s" % value)
-        except UnicodeDecodeError:
-            bb.utils.unlockfile(lf)
-            ctrlfile.close()
-            raise bb.build.FuncFailed("Non UTF-8 characters found in one of the fields")
 
         # more fields
 
         custom_fields_chunk = get_package_additional_metadata("deb", localdata)
         if custom_fields_chunk is not None:
-            ctrlfile.write(unicode(custom_fields_chunk))
+            ctrlfile.write(custom_fields_chunk)
             ctrlfile.write("\n")
 
         mapping_rename_hook(localdata)
@@ -255,17 +251,17 @@ python do_package_deb () {
         rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
         debian_cmp_remap(rconflicts)
         if rdepends:
-            ctrlfile.write("Depends: %s\n" % unicode(bb.utils.join_deps(rdepends)))
+            ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
         if rsuggests:
-            ctrlfile.write("Suggests: %s\n" % unicode(bb.utils.join_deps(rsuggests)))
+            ctrlfile.write("Suggests: %s\n" % bb.utils.join_deps(rsuggests))
         if rrecommends:
-            ctrlfile.write("Recommends: %s\n" % unicode(bb.utils.join_deps(rrecommends)))
+            ctrlfile.write("Recommends: %s\n" % bb.utils.join_deps(rrecommends))
         if rprovides:
-            ctrlfile.write("Provides: %s\n" % unicode(bb.utils.join_deps(rprovides)))
+            ctrlfile.write("Provides: %s\n" % bb.utils.join_deps(rprovides))
         if rreplaces:
-            ctrlfile.write("Replaces: %s\n" % unicode(bb.utils.join_deps(rreplaces)))
+            ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
         if rconflicts:
-            ctrlfile.write("Conflicts: %s\n" % unicode(bb.utils.join_deps(rconflicts)))
+            ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
         ctrlfile.close()
 
         for script in ["preinst", "postinst", "prerm", "postrm"]:
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 1a70f14..1878fe0 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -33,6 +33,7 @@ python toaster_layerinfo_dumpdata() {
 
     def _get_git_branch(layer_path):
         branch = subprocess.Popen("git symbolic-ref HEAD 2>/dev/null ", cwd=layer_path, shell=True, stdout=subprocess.PIPE).communicate()[0]
+        branch = branch.decode('utf-8')
         branch = branch.replace('refs/heads/', '').rstrip()
         return branch
 
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index b83ee86..a8a478a 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -24,7 +24,7 @@ class LocalSigner(object):
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
             raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
-                                      (keyid, output))
+                                      (keyid, output.decode("utf-8")))
 
     def sign_rpms(self, files, keyid, passphrase):
         """Sign RPM files"""
@@ -39,7 +39,7 @@ class LocalSigner(object):
 
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
-            raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
+            raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output.decode("utf-8"))
 
     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
         """Create a detached signature of a file"""
@@ -71,11 +71,11 @@ class LocalSigner(object):
                     passphrase = fobj.readline();
 
             job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
-            (_, stderr) = job.communicate(passphrase)
+            (_, stderr) = job.communicate(passphrase.encode("utf-8"))
 
             if job.returncode:
                 raise bb.build.FuncFailed("GPG exited with code %d: %s" %
-                                          (job.returncode, stderr))
+                                          (job.returncode, stderr.decode("utf-8")))
 
         except IOError as e:
             bb.error("IO error (%s): %s" % (e.errno, e.strerror))
@@ -90,7 +90,7 @@ class LocalSigner(object):
         """Return the gpg version"""
         import subprocess
         try:
-            return subprocess.check_output((self.gpg_bin, "--version")).split()[2]
+            return subprocess.check_output((self.gpg_bin, "--version")).split()[2].decode("utf-8")
         except subprocess.CalledProcessError as e:
             raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 252e32d..5bb15bb 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -64,8 +64,8 @@ def filedeprunner(arg):
 
     def process_deps(pipe, pkg, pkgdest, provides, requires):
         for line in pipe:
-            f = line.split(" ", 1)[0].strip()
-            line = line.split(" ", 1)[1].strip()
+            f = line.decode("utf-8").split(" ", 1)[0].strip()
+            line = line.decode("utf-8").split(" ", 1)[1].strip()
 
             if line.startswith("Requires:"):
                 i = requires
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3bc4ebf..abe9f68 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -17,10 +17,10 @@ def create_index(arg):
 
     try:
         bb.note("Executing '%s' ..." % index_cmd)
-        result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True)
+        result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
     except subprocess.CalledProcessError as e:
         return("Index creation command '%s' failed with return code %d:\n%s" %
-               (e.cmd, e.returncode, e.output))
+               (e.cmd, e.returncode, e.output.decode("utf-8")))
 
     if result:
         bb.note(result)
@@ -367,10 +367,10 @@ class RpmPkgsList(PkgsList):
         # Determine rpm version
         cmd = "%s --version" % self.rpm_cmd
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Getting rpm version failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     '''
     Translate the RPM/Smart format names to the OE multilib format names
@@ -411,10 +411,10 @@ class RpmPkgsList(PkgsList):
                "-t", self.image_rpmlib]
 
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the package dependencies. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         return output
 
@@ -425,10 +425,10 @@ class RpmPkgsList(PkgsList):
 
         try:
             # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip().decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         output = dict()
         deps = dict()
@@ -485,6 +485,8 @@ class OpkgPkgsList(PkgsList):
         # output streams separately and check for empty stderr.
         p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
         cmd_output, cmd_stderr = p.communicate()
+        cmd_output = cmd_output.decode("utf-8")
+        cmd_stderr = cmd_stderr.decode("utf-8")
         if p.returncode or cmd_stderr:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
                      "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
@@ -502,10 +504,10 @@ class DpkgPkgsList(PkgsList):
         cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
 
         try:
-            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         return opkg_query(cmd_output)
 
@@ -608,11 +610,11 @@ class PackageManager(object):
         try:
             bb.note("Installing complementary packages ...")
             bb.note('Running %s' % cmd)
-            complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not compute complementary packages list. Command "
                      "'%s' returned %d:\n%s" %
-                     (' '.join(cmd), e.returncode, e.output))
+                     (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
         self.install(complementary_pkgs.split(), attempt_only=True)
         os.remove(installed_pkgs_file)
 
@@ -784,12 +786,12 @@ class RpmPM(PackageManager):
         try:
             complementary_pkgs = subprocess.check_output(cmd,
                                                          stderr=subprocess.STDOUT,
-                                                         shell=True)
+                                                         shell=True).decode("utf-8")
             # bb.note(complementary_pkgs)
             return complementary_pkgs
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not invoke smart. Command "
-                     "'%s' returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "'%s' returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     def _search_pkg_name_in_feeds(self, pkg, feed_archs):
         for arch in feed_archs:
@@ -808,7 +810,7 @@ class RpmPM(PackageManager):
                 (self.smart_cmd, self.smart_opt, pkg)
         cmd += " | sed -ne 's/ *Provides://p'"
         bb.note('cmd: %s' % cmd)
-        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
         # Found a provider
         if output:
             bb.note('Found providers for %s: %s' % (pkg, output))
@@ -956,7 +958,7 @@ class RpmPM(PackageManager):
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Create rpm database failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
@@ -1203,11 +1205,11 @@ class RpmPM(PackageManager):
             cmd = "%s %s install --attempt -y %s" % \
                   (self.smart_cmd, self.smart_opt, ' '.join(pkgs))
         try:
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     '''
     Remove pkgs with smart, the pkg name is smart/rpm format
@@ -1233,11 +1235,11 @@ class RpmPM(PackageManager):
 
         try:
             bb.note(cmd)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.note("Unable to remove packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     def upgrade(self):
         bb.note('smart upgrade')
@@ -1310,7 +1312,7 @@ class RpmPM(PackageManager):
                         install_pkgs.append(pkg)
         except subprocess.CalledProcessError as e:
             bb.note("Unable to dump install packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
         # Recovery rpmsys channel
         self._invoke_smart('channel --enable rpmsys')
         return install_pkgs
@@ -1352,7 +1354,7 @@ class RpmPM(PackageManager):
                         available_pkgs.append(pkg.strip())
         except subprocess.CalledProcessError as e:
             bb.note("Unable to list all available packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         self.fullpkglist = available_pkgs
 
@@ -1379,12 +1381,12 @@ class RpmPM(PackageManager):
 
         try:
             bb.note(cmd)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip().decode("utf-8")
             bb.note(output)
-            os.chmod(saved_dir, 0755)
+            os.chmod(saved_dir, 0o755)
         except subprocess.CalledProcessError as e:
             bb.fatal("Invoke save_rpmpostinst failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     '''Write common configuration for target usage'''
     def rpm_setup_smart_target_config(self):
@@ -1417,7 +1419,7 @@ class RpmPM(PackageManager):
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         # Set default values to avoid UnboundLocalError
         arch = ""
@@ -1482,7 +1484,7 @@ class RpmPM(PackageManager):
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output.decode("utf-8")))
         except OSError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
@@ -1512,7 +1514,7 @@ class OpkgDpkgPM(PackageManager):
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
         return opkg_query(output)
 
     """
@@ -1544,7 +1546,7 @@ class OpkgDpkgPM(PackageManager):
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output.decode("utf-8")))
         except OSError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
@@ -1733,7 +1735,7 @@ class OpkgPM(OpkgDpkgPM):
         except subprocess.CalledProcessError as e:
             self.deploy_dir_unlock()
             bb.fatal("Unable to update the package index files. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         self.deploy_dir_unlock()
 
@@ -1754,12 +1756,12 @@ class OpkgPM(OpkgDpkgPM):
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
             bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output))
+                                              (cmd, e.returncode, e.output.decode("utf-8")))
 
     def remove(self, pkgs, with_dependencies=True):
         if with_dependencies:
@@ -1771,11 +1773,11 @@ class OpkgPM(OpkgDpkgPM):
 
         try:
             bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to remove packages. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
 
     def write_index(self):
         self.deploy_dir_lock()
@@ -1818,10 +1820,10 @@ class OpkgPM(OpkgDpkgPM):
                 pkg_info = cmd + pkg
 
                 try:
-                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip()
+                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip().decode("utf-8")
                 except subprocess.CalledProcessError as e:
                     bb.fatal("Cannot get package info. Command '%s' "
-                             "returned %d:\n%s" % (pkg_info, e.returncode, e.output))
+                             "returned %d:\n%s" % (pkg_info, e.returncode, e.output.decode("utf-8")))
 
                 if output == "":
                     bb.note("Ignored bad recommendation: '%s' is "
@@ -1858,7 +1860,7 @@ class OpkgPM(OpkgDpkgPM):
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to update. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         # Dummy installation
         cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
@@ -1868,7 +1870,7 @@ class OpkgPM(OpkgDpkgPM):
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to dummy install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
         bb.utils.remove(temp_rootfs, True)
 
@@ -2012,7 +2014,7 @@ class DpkgPM(OpkgDpkgPM):
                         subprocess.check_output(p_full, stderr=subprocess.STDOUT)
                     except subprocess.CalledProcessError as e:
                         bb.note("%s for package %s failed with %d:\n%s" %
-                                (suffix[1], pkg_name, e.returncode, e.output))
+                                (suffix[1], pkg_name, e.returncode, e.output.decode("utf-8")))
                         failed_pkgs.append(pkg_name)
                         break
 
@@ -2030,7 +2032,7 @@ class DpkgPM(OpkgDpkgPM):
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to update the package index files. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
 
         self.deploy_dir_unlock()
 
@@ -2049,7 +2051,7 @@ class DpkgPM(OpkgDpkgPM):
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output))
+                                              (cmd, e.returncode, e.output.decode("utf-8")))
 
         # rename *.dpkg-new files/dirs
         for root, dirs, files in os.walk(self.target_rootfs):
@@ -2080,7 +2082,7 @@ class DpkgPM(OpkgDpkgPM):
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to remove packages. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
 
     def write_index(self):
         self.deploy_dir_lock()
@@ -2213,7 +2215,7 @@ class DpkgPM(OpkgDpkgPM):
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot fix broken dependencies. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     def list_installed(self):
         return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index bc0fd06..df1b4c5 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -8,7 +8,7 @@ def read_pkgdatafile(fn):
     pkgdata = {}
 
     def decode(str):
-        c = codecs.getdecoder("string_escape")
+        c = codecs.getdecoder("unicode_escape")
         return c(str)[0]
 
     if os.access(fn, os.R_OK):
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a50f9d8..4211ffc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -132,7 +132,7 @@ class oeSDKTest(oeTest):
         return False
 
     def _run(self, cmd):
-        return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True)
+        return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True).decode("utf-8")
 
 class oeSDKExtTest(oeSDKTest):
     def _run(self, cmd):
@@ -144,7 +144,7 @@ class oeSDKExtTest(oeSDKTest):
         env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
         return subprocess.check_output(". %s > /dev/null;"\
-            " %s;" % (self.tc.sdkenv, cmd), shell=True, env=env)
+            " %s;" % (self.tc.sdkenv, cmd), shell=True, env=env).decode("utf-8")
 
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index a936601..242cd8c 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -238,7 +238,7 @@ class ParseLogsTest(oeRuntimeTest):
             result = None
             thegrep = self.build_grepcmd(errors, ignore_errors, log)
             try:
-                result = subprocess.check_output(thegrep, shell=True)
+                result = subprocess.check_output(thegrep, shell=True).decode("utf-8")
             except:
                 pass
             if (result is not None):
@@ -246,7 +246,7 @@ class ParseLogsTest(oeRuntimeTest):
                 rez = result.splitlines()
                 for xrez in rez:
                     try:
-                        grep_output = subprocess.check_output(['grep', '-F', xrez, '-B', str(lines_before), '-A', str(lines_after), log])
+                        grep_output = subprocess.check_output(['grep', '-F', xrez, '-B', str(lines_before), '-A', str(lines_after), log]).decode("utf-8")
                     except:
                         pass
                     results[log.replace('target_logs/','')][xrez]=grep_output
diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index 80c4601..0f27447 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -14,7 +14,7 @@ class PingTest(oeRuntimeTest):
         endtime = time.time() + 60
         while count < 5 and time.time() < endtime:
             proc = subprocess.Popen("ping -c 1 %s" % self.target.ip, shell=True, stdout=subprocess.PIPE)
-            output += proc.communicate()[0]
+            output += proc.communicate()[0].decode("utf-8")
             if proc.poll() == 0:
                 count += 1
             else:
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 48f6441..9a7c1d1 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -78,7 +78,7 @@ class Command(object):
                 self.process.kill()
                 self.thread.join()
 
-        self.output = self.output.rstrip()
+        self.output = self.output.decode("utf-8").rstrip()
         self.status = self.process.poll()
 
         self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 695402f..f51de99 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -71,7 +71,8 @@ class QemuRunner:
         if self.logfile:
             # It is needed to sanitize the data received from qemu
             # because is possible to have control characters
-            msg = re_control_char.sub('', unicode(msg, 'utf-8'))
+            msg = msg.decode("utf-8")
+            msg = re_control_char.sub('', msg)
             with codecs.open(self.logfile, "a", encoding="utf-8") as f:
                 f.write("%s" % msg)
 
@@ -79,7 +80,7 @@ class QemuRunner:
         import fcntl
         fl = fcntl.fcntl(o, fcntl.F_GETFL)
         fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
-        return os.read(o.fileno(), 1000000)
+        return os.read(o.fileno(), 1000000).decode("utf-8")
 
 
     def handleSIGCHLD(self, signum, frame):
@@ -229,14 +230,19 @@ class QemuRunner:
                         socklist.remove(self.server_socket)
                         logger.info("Connection from %s:%s" % addr)
                     else:
-                        data = sock.recv(1024)
+                        data = data + sock.recv(1024)
                         if data:
-                            bootlog += data
-                            if re.search(".* login:", bootlog):
-                                self.server_socket = qemusock
-                                stopread = True
-                                reachedlogin = True
-                                logger.info("Reached login banner")
+                            try:
+                                data = data.decode("utf-8")
+                                bootlog += data
+                                data = b''
+                                if re.search(".* login:", bootlog):
+                                    self.server_socket = qemusock
+                                    stopread = True
+                                    reachedlogin = True
+                                    logger.info("Reached login banner")
+                            except UnicodeDecodeError:
+                                continue
                         else:
                             socklist.remove(sock)
                             sock.close()
@@ -325,7 +331,7 @@ class QemuRunner:
         # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
         #
         ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
-        processes = ps.split('\n')
+        processes = ps.decode("utf-8").split('\n')
         nfields = len(processes[0].split()) - 1
         pids = {}
         commands = {}
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index d6ce096..054ab0e 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -102,7 +102,7 @@ class QemuTinyRunner(QemuRunner):
             bb.note("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
             output = self.runqemu.stdout
             self.stop()
-            bb.note("Output from runqemu:\n%s" % output.read())
+            bb.note("Output from runqemu:\n%s" % output.read().decode("utf-8"))
             return False
 
         return self.is_alive()
@@ -131,7 +131,7 @@ class QemuTinyRunner(QemuRunner):
         # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
         #
         ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
-        processes = ps.split('\n')
+        processes = ps.decode("utf-8").split('\n')
         nfields = len(processes[0].split()) - 1
         pids = {}
         commands = {}
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index ff88d37..f5d46e0 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -58,6 +58,7 @@ class SSHProcess(object):
                         self.process.stdout.close()
                         eof = True
                     else:
+                        data = data.decode("utf-8")
                         output += data
                         self.log(data)
                         endtime = time.time() + timeout
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 30307bc..371c279 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -168,9 +168,10 @@ python populate_packages_prepend() {
         }
         p = subprocess.Popen(args="pkg-config --variable=%s xorg-server" % abis[name],
                              shell=True, env=newenv, stdout=subprocess.PIPE)
-        output = p.communicate()[0]
+        stdout, stderr = p.communicate()
+        output = stdout.decode("utf-8").split(".")[0]
         mlprefix = d.getVar('MLPREFIX', True) or ''
-        return "%sxorg-abi-%s-%s" % (mlprefix, name, output.split(".")[0])
+        return "%sxorg-abi-%s-%s" % (mlprefix, name, output)
 
     pn = d.getVar("PN", True)
     d.appendVar("RPROVIDES_" + pn, " " + get_abi("input"))
-- 
2.5.0



