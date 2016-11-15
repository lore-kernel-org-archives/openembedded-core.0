Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3F20D719E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 14:29:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 15 Nov 2016 06:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,495,1473145200"; d="scan'208";a="1059739180"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga001.jf.intel.com with ESMTP; 15 Nov 2016 06:29:38 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 06:28:42 -0800
Message-Id: <20161115142842.75276-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161115142842.75276-1-stephano.cetola@linux.intel.com>
References: <20161115142842.75276-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V3] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Tue, 15 Nov 2016 14:29:40 -0000

When using subprocess call and check_output, it is better to use arrays
rather than strings when possible to avoid whitespace and quoting
problems.

[ YOCTO #9342 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/package.py         |  13 +--
 meta/lib/oe/package_manager.py | 229 ++++++++++++++++++++---------------------
 2 files changed, 118 insertions(+), 124 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 02642f2..ae60a58 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -18,23 +18,24 @@ def runstrip(arg):
         newmode = origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
 
-    extraflags = ""
+    stripcmd = [strip]
 
     # kernel module    
     if elftype & 16:
-        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+        stripcmd.extend(["--strip-debug", "--remove-section=.comment",
+            "--remove-section=.note", "--preserve-dates"])
     # .so and shared library
     elif ".so" in file and elftype & 8:
-        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+        stripcmd.extend(["--remove-section=.comment", "--remove-section=.note", "--strip-unneeded"])
     # shared or executable:
     elif elftype & 8 or elftype & 4:
-        extraflags = "--remove-section=.comment --remove-section=.note"
+        stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
 
-    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
+    stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     try:
-        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT, shell=True)
+        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
     except subprocess.CalledProcessError as e:
         bb.error("runstrip: '%s' strip command failed with %s (%s)" % (stripcmd, e.returncode, e.output))
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a9d216a..5fbfa7a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -358,12 +358,11 @@ class RpmPkgsList(PkgsList):
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
 
         # Determine rpm version
-        cmd = "%s --version" % self.rpm_cmd
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+            output = subprocess.check_output([self.rpm_cmd, "--version"], stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Getting rpm version failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (self.rpm_cmd, e.returncode, e.output.decode("utf-8")))
 
     '''
     Translate the RPM/Smart format names to the OE multilib format names
@@ -412,16 +411,15 @@ class RpmPkgsList(PkgsList):
         return output
 
     def list_pkgs(self):
-        cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
-        cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
+        cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
+        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
+        cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'])
 
         try:
-            # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip().decode("utf-8")
+            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         output = dict()
         deps = dict()
@@ -672,11 +670,11 @@ class RpmPM(PackageManager):
         # 2 = --log-level=debug
         # 3 = --log-level=debug plus dumps of scriplet content and command invocation
         self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG', True) or "0")
-        self.smart_opt = "--log-level=%s --data-dir=%s" % \
+        self.smart_opt = ["--log-level=%s" %
                          ("warning" if self.debug_level == 0 else
                           "info" if self.debug_level == 1 else
-                          "debug",
-                          os.path.join(target_rootfs, 'var/lib/smart'))
+                          "debug"), "--data-dir=%s" %
+                          os.path.join(target_rootfs, 'var/lib/smart')]
         self.scriptlet_wrapper = self.d.expand('${WORKDIR}/scriptlet_wrapper')
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
@@ -732,18 +730,18 @@ class RpmPM(PackageManager):
                 for arch in arch_list:
                     bb.note('Adding Smart channel url%d%s (%s)' %
                             (uri_iterator, arch, channel_priority))
-                    self._invoke_smart('channel --add url%d-%s type=rpm-md baseurl=%s/%s -y'
-                                       % (uri_iterator, arch, uri, arch))
-                    self._invoke_smart('channel --set url%d-%s priority=%d' %
-                                       (uri_iterator, arch, channel_priority))
+                    self._invoke_smart(['channel', '--add', 'url%d-%s' % (uri_iterator, arch),
+                        'type=rpm-md', 'baseurl=%s/%s' % (uri, arch), '-y'])
+                    self._invoke_smart(['channel', '--set', 'url%d-%s' % (uri_iterator, arch),
+                        'priority=%d' % channel_priority])
                     channel_priority -= 5
             else:
                 bb.note('Adding Smart channel url%d (%s)' %
                         (uri_iterator, channel_priority))
-                self._invoke_smart('channel --add url%d type=rpm-md baseurl=%s -y'
-                                   % (uri_iterator, uri))
-                self._invoke_smart('channel --set url%d priority=%d' %
-                                   (uri_iterator, channel_priority))
+                self._invoke_smart(['channel', '--add', 'url%d' % uri_iterator,
+                    'type=rpm-md', 'baseurl=%s' % uri, '-y'])
+                self._invoke_smart(['channel', '--set', 'url%d' % uri_iterator, 
+                    'priority=%d' % channel_priority])
                 channel_priority -= 5
 
             uri_iterator += 1
@@ -774,18 +772,17 @@ class RpmPM(PackageManager):
 
         self._create_configs(platform, platform_extra)
 
+    #takes array args
     def _invoke_smart(self, args):
-        cmd = "%s %s %s" % (self.smart_cmd, self.smart_opt, args)
+        cmd = [self.smart_cmd] + self.smart_opt + args
         # bb.note(cmd)
         try:
-            complementary_pkgs = subprocess.check_output(cmd,
-                                                         stderr=subprocess.STDOUT,
-                                                         shell=True).decode("utf-8")
+            complementary_pkgs = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
             # bb.note(complementary_pkgs)
             return complementary_pkgs
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not invoke smart. Command "
-                     "'%s' returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "'%s' returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
     def _search_pkg_name_in_feeds(self, pkg, feed_archs):
         for arch in feed_archs:
@@ -800,19 +797,23 @@ class RpmPM(PackageManager):
 
         # Search provides if not found by pkgname.
         bb.note('Not found %s by name, searching provides ...' % pkg)
-        cmd = "%s %s query --provides %s --show-format='$name-$version'" % \
-                (self.smart_cmd, self.smart_opt, pkg)
-        cmd += " | sed -ne 's/ *Provides://p'"
-        bb.note('cmd: %s' % cmd)
-        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        # Found a provider
-        if output:
-            bb.note('Found providers for %s: %s' % (pkg, output))
-            for p in output.split():
-                for arch in feed_archs:
-                    arch = arch.replace('-', '_')
-                    if p.rstrip().endswith('@' + arch):
-                        return p
+        cmd = [self.smart_cmd] + self.smart_opt + ["query", "--provides", pkg,
+                "--show-format='$name-$version'"]
+        bb.note('cmd: %s' % ' '.join(cmd))
+        ps = subprocess.Popen(cmd, stdout=subprocess.PIPE)
+        try:
+            output = subprocess.check_output(["sed", "-ne", "s/ *Provides://p"],
+                stdin=ps.stdout, stderr=subprocess.STDOUT).decode("utf-8")
+            # Found a provider
+            if output:
+                bb.note('Found providers for %s: %s' % (pkg, output))
+                for p in output.split():
+                    for arch in feed_archs:
+                        arch = arch.replace('-', '_')
+                        if p.rstrip().endswith('@' + arch):
+                            return p
+        except subprocess.CalledProcessError as e:
+            bb.error("Failed running smart query on package %s." % pkg)
 
         return ""
 
@@ -949,30 +950,32 @@ class RpmPM(PackageManager):
             open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
-        opt = "-qa"
-        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
-              self.rpm_cmd, self.target_rootfs, opt)
+        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '-qa']
         try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Create rpm database failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
-            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s > /dev/null" % (
-                  self.rpm_cmd, self.target_rootfs, pubkey_path)
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '--import', pubkey_path]
+            try:
+                subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Import GPG key failed. Command '%s' "
+                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
 
         # Configure smart
         bb.note("configuring Smart settings")
         bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
                         True)
-        self._invoke_smart('config --set rpm-root=%s' % self.target_rootfs)
-        self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
-        self._invoke_smart('config --set rpm-extra-macros._var=%s' %
-                           self.d.getVar('localstatedir', True))
-        cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" % (self.install_dir_name)
+        self._invoke_smart(['config', '--set', 'rpm-root=%s' % self.target_rootfs])
+        self._invoke_smart(['config', '--set', 'rpm-dbpath=/var/lib/rpm'])
+        self._invoke_smart(['config', '--set', 'rpm-extra-macros._var=%s' %
+                           self.d.getVar('localstatedir', True)])
+        cmd = ["config", "--set", "rpm-extra-macros._tmppath=/%s/tmp" % self.install_dir_name]
 
         prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH', True)
         if prefer_color:
@@ -986,32 +989,32 @@ class RpmPM(PackageManager):
                                     ['mips64', 'mips64el']:
                 bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
                          "only.")
-            self._invoke_smart('config --set rpm-extra-macros._prefer_color=%s'
-                        % prefer_color)
+            self._invoke_smart(['config', '--set', 'rpm-extra-macros._prefer_color=%s'
+                        % prefer_color])
 
         self._invoke_smart(cmd)
-        self._invoke_smart('config --set rpm-ignoresize=1')
+        self._invoke_smart(['config', '--set', 'rpm-ignoresize=1'])
 
         # Write common configuration for host and target usage
-        self._invoke_smart('config --set rpm-nolinktos=1')
-        self._invoke_smart('config --set rpm-noparentdirs=1')
+        self._invoke_smart(['config', '--set', 'rpm-nolinktos=1'])
+        self._invoke_smart(['config', '--set', 'rpm-noparentdirs=1'])
         check_signature = self.d.getVar('RPM_CHECK_SIGNATURES', True)
         if check_signature and check_signature.strip() == "0":
-            self._invoke_smart('config --set rpm-check-signatures=false')
+            self._invoke_smart(['config', '--set rpm-check-signatures=false'])
         for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
-            self._invoke_smart('flag --set ignore-recommends %s' % i)
+            self._invoke_smart(['flag', '--set', 'ignore-recommends', i])
 
         # Do the following configurations here, to avoid them being
         # saved for field upgrade
         if self.d.getVar('NO_RECOMMENDATIONS', True).strip() == "1":
-            self._invoke_smart('config --set ignore-all-recommends=1')
+            self._invoke_smart(['config', '--set', 'ignore-all-recommends=1'])
         pkg_exclude = self.d.getVar('PACKAGE_EXCLUDE', True) or ""
         for i in pkg_exclude.split():
-            self._invoke_smart('flag --set exclude-packages %s' % i)
+            self._invoke_smart(['flag', '--set', 'exclude-packages', i])
 
         # Optional debugging
-        # self._invoke_smart('config --set rpm-log-level=debug')
-        # cmd = 'config --set rpm-log-file=/tmp/smart-debug-logfile'
+        # self._invoke_smart(['config', '--set', 'rpm-log-level=debug'])
+        # cmd = ['config', '--set', 'rpm-log-file=/tmp/smart-debug-logfile']
         # self._invoke_smart(cmd)
         ch_already_added = []
         for canonical_arch in platform_extra:
@@ -1030,16 +1033,16 @@ class RpmPM(PackageManager):
             if not arch in ch_already_added:
                 bb.note('Adding Smart channel %s (%s)' %
                         (arch, channel_priority))
-                self._invoke_smart('channel --add %s type=rpm-md baseurl=%s -y'
-                                   % (arch, arch_channel))
-                self._invoke_smart('channel --set %s priority=%d' %
-                                   (arch, channel_priority))
+                self._invoke_smart(['channel', '--add', arch, 'type=rpm-md',
+                    'baseurl=%s' % arch_channel, '-y'])
+                self._invoke_smart(['channel', '--set', arch, 'priority=%d' %
+                                   channel_priority])
                 channel_priority -= 5
 
                 ch_already_added.append(arch)
 
         bb.note('adding Smart RPM DB channel')
-        self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
+        self._invoke_smart(['channel', '--add', 'rpmsys', 'type=rpm-sys', '-y'])
 
         # Construct install scriptlet wrapper.
         # Scripts need to be ordered when executed, this ensures numeric order.
@@ -1102,15 +1105,15 @@ class RpmPM(PackageManager):
 
         bb.note("configuring RPM cross-install scriptlet_wrapper")
         os.chmod(self.scriptlet_wrapper, 0o755)
-        cmd = 'config --set rpm-extra-macros._cross_scriptlet_wrapper=%s' % \
-              self.scriptlet_wrapper
+        cmd = ['config', '--set', 'rpm-extra-macros._cross_scriptlet_wrapper=%s' %
+              self.scriptlet_wrapper]
         self._invoke_smart(cmd)
 
         # Debug to show smart config info
-        # bb.note(self._invoke_smart('config --show'))
+        # bb.note(self._invoke_smart(['config', '--show']))
 
     def update(self):
-        self._invoke_smart('update rpmsys')
+        self._invoke_smart(['update', 'rpmsys'])
 
     def get_rdepends_recursively(self, pkgs):
         # pkgs will be changed during the loop, so use [:] to make a copy.
@@ -1207,20 +1210,19 @@ class RpmPM(PackageManager):
             return
         if not attempt_only:
             bb.note('to be installed: %s' % ' '.join(pkgs))
-            cmd = "%s %s install -y %s" % \
-                  (self.smart_cmd, self.smart_opt, ' '.join(pkgs))
-            bb.note(cmd)
+            cmd = [self.smart_cmd] + self.smart_opt + ["install", "-y"] + pkgs
+            bb.note(' '.join(cmd))
         else:
             bb.note('installing attempt only packages...')
             bb.note('Attempting %s' % ' '.join(pkgs))
-            cmd = "%s %s install --attempt -y %s" % \
-                  (self.smart_cmd, self.smart_opt, ' '.join(pkgs))
+            cmd = [self.smart_cmd] + self.smart_opt + ["install", "--attempt",
+                    "-y"] + pkgs
         try:
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
     '''
     Remove pkgs with smart, the pkg name is smart/rpm format
@@ -1229,24 +1231,19 @@ class RpmPM(PackageManager):
         bb.note('to be removed: ' + ' '.join(pkgs))
 
         if not with_dependencies:
-            cmd = "%s -e --nodeps " % self.rpm_cmd
-            cmd += "--root=%s " % self.target_rootfs
-            cmd += "--dbpath=/var/lib/rpm "
-            cmd += "--define='_cross_scriptlet_wrapper %s' " % \
-                   self.scriptlet_wrapper
-            cmd += "--define='_tmppath /%s/tmp' %s" % (self.install_dir_name, ' '.join(pkgs))
+            cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
+                    self.target_rootfs, "--dbpath=/var/lib/rpm",
+                    "--define='_cross_scriptlet_wrapper %s'" %
+                    self.scriptlet_wrapper,
+                    "--define='_tmppath /%s/tmp'" % self.install_dir_name] + pkgs
         else:
             # for pkg in pkgs:
             #   bb.note('Debug: What required: %s' % pkg)
-            #   bb.note(self._invoke_smart('query %s --show-requiredby' % pkg))
-
-            cmd = "%s %s remove -y %s" % (self.smart_cmd,
-                                          self.smart_opt,
-                                          ' '.join(pkgs))
-
+            #   bb.note(self._invoke_smart(['query', pkg, '--show-requiredby']))
+            cmd = [self.smart_cmd] + self.smart_opt + ["remove", "-y"] + pkgs
         try:
-            bb.note(cmd)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+            bb.note(' '.join(cmd))
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.note("Unable to remove packages. Command '%s' "
@@ -1254,7 +1251,7 @@ class RpmPM(PackageManager):
 
     def upgrade(self):
         bb.note('smart upgrade')
-        self._invoke_smart('upgrade')
+        self._invoke_smart(['upgrade'])
 
     def write_index(self):
         result = self.indexer.write_index()
@@ -1307,16 +1304,13 @@ class RpmPM(PackageManager):
         pkgs = self._pkg_translate_oe_to_smart(pkgs, False)
         install_pkgs = list()
 
-        cmd = "%s %s install -y --dump %s 2>%s" %  \
-              (self.smart_cmd,
-               self.smart_opt,
-               ' '.join(pkgs),
-               self.solution_manifest)
+        cmd = [self.smart_cmd] + self.smart_opt + ['install', '-y', '--dump',
+                self.solution_manifest]
         try:
             # Disable rpmsys channel for the fake install
-            self._invoke_smart('channel --disable rpmsys')
+            self._invoke_smart(['channel', '--disable', 'rpmsys'])
 
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
             with open(self.solution_manifest, 'r') as manifest:
                 for pkg in manifest.read().split('\n'):
                     if '@' in pkg:
@@ -1325,7 +1319,7 @@ class RpmPM(PackageManager):
             bb.note("Unable to dump install packages. Command '%s' "
                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
         # Recovery rpmsys channel
-        self._invoke_smart('channel --enable rpmsys')
+        self._invoke_smart(['channel', '--enable', 'rpmsys'])
         return install_pkgs
 
     '''
@@ -1355,17 +1349,16 @@ class RpmPM(PackageManager):
     def dump_all_available_pkgs(self):
         available_manifest = self.d.expand('${T}/saved/available_pkgs.txt')
         available_pkgs = list()
-        cmd = "%s %s query --output %s" %  \
-              (self.smart_cmd, self.smart_opt, available_manifest)
+        cmd = [self.smart_cmd] + self.smart_opt + ['query', '--output', available_manifest]
         try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
             with open(available_manifest, 'r') as manifest:
                 for pkg in manifest.read().split('\n'):
                     if '@' in pkg:
                         available_pkgs.append(pkg.strip())
         except subprocess.CalledProcessError as e:
             bb.note("Unable to list all available packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                    "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         self.fullpkglist = available_pkgs
 
@@ -1404,11 +1397,11 @@ class RpmPM(PackageManager):
         bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
                         True)
 
-        self._invoke_smart('config --set rpm-nolinktos=1')
-        self._invoke_smart('config --set rpm-noparentdirs=1')
+        self._invoke_smart(['config', '--set', 'rpm-nolinktos=1'])
+        self._invoke_smart(['config', '--set', 'rpm-noparentdirs=1'])
         for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
-            self._invoke_smart('flag --set ignore-recommends %s' % i)
-        self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
+            self._invoke_smart(['flag', '--set', 'ignore-recommends', i])
+        self._invoke_smart(['channel', '--add', 'rpmsys', 'type=rpm-sys', '-y'])
 
     '''
     The rpm db lock files were produced after invoking rpm to query on
@@ -1425,12 +1418,12 @@ class RpmPM(PackageManager):
     Returns a dictionary with the package info.
     """
     def package_info(self, pkg):
-        cmd = "%s %s info --urls %s" % (self.smart_cmd, self.smart_opt, pkg)
+        cmd = [self.smart_cmd] + self.smart_opt + ['info', '--urls', pkg]
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         # Set default values to avoid UnboundLocalError
         arch = ""
@@ -1550,18 +1543,18 @@ class OpkgDpkgPM(PackageManager):
         os.chdir(tmp_dir)
 
         try:
-            cmd = "%s x %s" % (ar_cmd, pkg_path)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-            cmd = "%s xf data.tar.*" % tar_cmd
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            cmd = [ar_cmd, 'x', pkg_path]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = [tar_cmd, 'xf', 'data.tar.*']
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
         except OSError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, cmd, e.errno, e.strerror, e.filename))
+                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
 
         bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
         bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
-- 
2.10.2


