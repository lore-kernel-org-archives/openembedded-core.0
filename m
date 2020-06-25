Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7473.1593080529610313350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bB43jtOy;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=32340; q=dns/txt; s=axis-central1;
  t=1593080531; x=1624616531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3OIctgMRqKfskOVzzutzwG605auaAzRUzjy2HAaLzY=;
  b=bB43jtOyoiAjMraZdBA0Uu/s2uZAogm/ekFMi7QjC+2ByiwR/59cXY56
   +FN+lr1jkhVa807bCjLeWZyfxzVBctkSoyT1OVMiYq1WAYH3EkYFudB1J
   zw9TjQrZOwIdUM0URZizFJzsy4iP+9mtpkJGqeEeB1d3og+TzS+V5+GWP
   XXa9P7sPeHrSDsN+Y1SmbxEkjNW5uPKWQmiIknUJPKh4E4EQYgGc7UAlD
   0JyL2xsN1vAbQRdoCeds0nNAWwxCncUpJ189phrOx42bvuHzsx2Jc0zLJ
   B4h6ZZZF0hkwg8FAStJqbiVpAw32x/GbwRfuJaKYIEzAH/DaxKSL7S6OH
   g==;
IronPort-SDR: ftlkMwoPVOAqXATtQVvkOwiT5uBiT4KLkbEmNhcaQ+SUpTSJyLcgvivlh+84Jal440A/9H6nrM
 bzBzMe7pC/VHYtFVooJwfmaXNB8uT6T1f8j+rjbVLR9uc29IOJwlbLJAFslpJGU3b621BThcFk
 I6nFlm6CxE9GQqQXioZUPRMUl2UitD8JVqGw3a46dh01qDfw1QaxsZ+R5ldtZTcQOMoNjXTofE
 owczr4YyBFGoWsFmQUmlUFsW/id1ZeH0ZCpZ8BK5OxHlXF7hoU3UFK7o7OvEaiuqZkC6MDjKNU
 mlA=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893888"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 17/26] package_manager.py: Move OpkgPM
Date: Thu, 25 Jun 2020 12:21:36 +0200
Message-ID: <20200625102145.7139-18-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the package_manager only used by the ipk package manager live in the ipk
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 419 -----------------
 .../package_managers/ipk/package_manager.py   | 426 ++++++++++++++++++
 meta/lib/oe/package_managers/ipk/rootfs.py    |   2 +
 3 files changed, 428 insertions(+), 419 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/ipk/package_manager.py

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a62d2d549d..36e87ded98 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -738,425 +738,6 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
                     else:
                         raise
 
-class OpkgDpkgPM(PackageManager):
-    def __init__(self, d, target_rootfs):
-        """
-        This is an abstract class. Do not instantiate this directly.
-        """
-        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
-
-    def package_info(self, pkg, cmd):
-        """
-        Returns a dictionary with the package info.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-        return opkg_query(output)
-
-    def extract(self, pkg, pkg_info):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
-        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
-        pkg_path = pkg_info[pkg]["filepath"]
-
-        if not os.path.isfile(pkg_path):
-            bb.fatal("Unable to extract package for '%s'."
-                     "File %s doesn't exists" % (pkg, pkg_path))
-
-        tmp_dir = tempfile.mkdtemp()
-        current_dir = os.getcwd()
-        os.chdir(tmp_dir)
-        data_tar = 'data.tar.xz'
-
-        try:
-            cmd = [ar_cmd, 'x', pkg_path]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            cmd = [tar_cmd, 'xf', data_tar]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-        except OSError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
-
-        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
-        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
-        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
-        os.chdir(current_dir)
-
-        return tmp_dir
-
-    def _handle_intercept_failure(self, registered_pkgs):
-        self.mark_packages("unpacked", registered_pkgs.split())
-
-class OpkgPM(OpkgDpkgPM):
-    def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
-        super(OpkgPM, self).__init__(d, target_rootfs)
-
-        self.config_file = config_file
-        self.pkg_archs = archs
-        self.task_name = task_name
-
-        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
-        self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
-        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
-        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
-        self.opkg_args += self.d.getVar("OPKG_ARGS")
-
-        if prepare_index:
-            create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
-
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
-        if opkg_lib_dir[0] == "/":
-            opkg_lib_dir = opkg_lib_dir[1:]
-
-        self.opkg_dir = os.path.join(target_rootfs, opkg_lib_dir, "opkg")
-
-        bb.utils.mkdirhier(self.opkg_dir)
-
-        self.saved_opkg_dir = self.d.expand('${T}/saved/%s' % self.task_name)
-        if not os.path.exists(self.d.expand('${T}/saved')):
-            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
-
-        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
-        if self.from_feeds:
-            self._create_custom_config()
-        else:
-            self._create_config()
-
-        self.indexer = OpkgIndexer(self.d, self.deploy_dir)
-
-    def mark_packages(self, status_tag, packages=None):
-        """
-        This function will change a package's status in /var/lib/opkg/status file.
-        If 'packages' is None then the new_status will be applied to all
-        packages
-        """
-        status_file = os.path.join(self.opkg_dir, "status")
-
-        with open(status_file, "r") as sf:
-            with open(status_file + ".tmp", "w+") as tmp_sf:
-                if packages is None:
-                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
-                                        r"Package: \1\n\2Status: \3%s" % status_tag,
-                                        sf.read()))
-                else:
-                    if type(packages).__name__ != "list":
-                        raise TypeError("'packages' should be a list object")
-
-                    status = sf.read()
-                    for pkg in packages:
-                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
-                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
-                                        status)
-
-                    tmp_sf.write(status)
-
-        os.rename(status_file + ".tmp", status_file)
-
-    def _create_custom_config(self):
-        bb.note("Building from feeds activated!")
-
-        with open(self.config_file, "w+") as config_file:
-            priority = 1
-            for arch in self.pkg_archs.split():
-                config_file.write("arch %s %d\n" % (arch, priority))
-                priority += 5
-
-            for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
-                feed_match = re.match(r"^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
-
-                if feed_match is not None:
-                    feed_name = feed_match.group(1)
-                    feed_uri = feed_match.group(2)
-
-                    bb.note("Add %s feed with URL %s" % (feed_name, feed_uri))
-
-                    config_file.write("src/gz %s %s\n" % (feed_name, feed_uri))
-
-            """
-            Allow to use package deploy directory contents as quick devel-testing
-            feed. This creates individual feed configs for each arch subdir of those
-            specified as compatible for the current machine.
-            NOTE: Development-helper feature, NOT a full-fledged feed.
-            """
-            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
-                for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
-                                                 self.d.getVar("sysconfdir"),
-                                                 "opkg",
-                                                 "local-%s-feed.conf" % arch)
-
-                    with open(cfg_file_name, "w+") as cfg_file:
-                        cfg_file.write("src/gz local-%s %s/%s" %
-                                       (arch,
-                                        self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
-                                        arch))
-
-                        if self.d.getVar('OPKGLIBDIR') != '/var/lib':
-                            # There is no command line option for this anymore, we need to add
-                            # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
-                            # the default value of "/var/lib" as defined in opkg:
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
-                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
-                            cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
-                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
-
-
-    def _create_config(self):
-        with open(self.config_file, "w+") as config_file:
-            priority = 1
-            for arch in self.pkg_archs.split():
-                config_file.write("arch %s %d\n" % (arch, priority))
-                priority += 5
-
-            config_file.write("src oe file:%s\n" % self.deploy_dir)
-
-            for arch in self.pkg_archs.split():
-                pkgs_dir = os.path.join(self.deploy_dir, arch)
-                if os.path.isdir(pkgs_dir):
-                    config_file.write("src oe-%s file:%s\n" %
-                                      (arch, pkgs_dir))
-
-            if self.d.getVar('OPKGLIBDIR') != '/var/lib':
-                # There is no command line option for this anymore, we need to add
-                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
-                # the default value of "/var/lib" as defined in opkg:
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
-                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
-                config_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
-                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
-
-    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
-        if feed_uris == "":
-            return
-
-        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
-                                  % self.target_rootfs)
-
-        os.makedirs('%s/etc/opkg' % self.target_rootfs, exist_ok=True)
-
-        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-        archs = self.pkg_archs.split() if feed_archs is None else feed_archs.split()
-
-        with open(rootfs_config, "w+") as config_file:
-            uri_iterator = 0
-            for uri in feed_uris:
-                if archs:
-                    for arch in archs:
-                        if (feed_archs is None) and (not os.path.exists(oe.path.join(self.deploy_dir, arch))):
-                            continue
-                        bb.note('Adding opkg feed url-%s-%d (%s)' %
-                            (arch, uri_iterator, uri))
-                        config_file.write("src/gz uri-%s-%d %s/%s\n" %
-                                          (arch, uri_iterator, uri, arch))
-                else:
-                    bb.note('Adding opkg feed url-%d (%s)' %
-                        (uri_iterator, uri))
-                    config_file.write("src/gz uri-%d %s\n" %
-                                      (uri_iterator, uri))
-
-                uri_iterator += 1
-
-    def update(self):
-        self.deploy_dir_lock()
-
-        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
-
-        try:
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            self.deploy_dir_unlock()
-            bb.fatal("Unable to update the package index files. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-        self.deploy_dir_unlock()
-
-    def install(self, pkgs, attempt_only=False):
-        if not pkgs:
-            return
-
-        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
-        for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
-            cmd += " --add-exclude %s" % exclude
-        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
-            cmd += " --add-ignore-recommends %s" % bad_recommendation
-        cmd += " install "
-        cmd += " ".join(pkgs)
-
-        os.environ['D'] = self.target_rootfs
-        os.environ['OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
-
-        try:
-            bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
-            bb.note(output)
-            failed_pkgs = []
-            for line in output.split('\n'):
-                if line.endswith("configuration required on target."):
-                    bb.warn(line)
-                    failed_pkgs.append(line.split(".")[0])
-            if failed_pkgs:
-                failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-        except subprocess.CalledProcessError as e:
-            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
-                                              "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output.decode("utf-8")))
-
-    def remove(self, pkgs, with_dependencies=True):
-        if not pkgs:
-            return
-
-        if with_dependencies:
-            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
-        else:
-            cmd = "%s %s --force-depends remove %s" % \
-                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
-
-        try:
-            bb.note(cmd)
-            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
-            bb.note(output)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to remove packages. Command '%s' "
-                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
-
-    def write_index(self):
-        self.deploy_dir_lock()
-
-        result = self.indexer.write_index()
-
-        self.deploy_dir_unlock()
-
-        if result is not None:
-            bb.fatal(result)
-
-    def remove_packaging_data(self):
-        bb.utils.remove(self.opkg_dir, True)
-        # create the directory back, it's needed by PM lock
-        bb.utils.mkdirhier(self.opkg_dir)
-
-    def remove_lists(self):
-        if not self.from_feeds:
-            bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
-
-    def list_installed(self):
-        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
-
-    def dummy_install(self, pkgs):
-        """
-        The following function dummy installs pkgs and returns the log of output.
-        """
-        if len(pkgs) == 0:
-            return
-
-        # Create an temp dir as opkg root for dummy installation
-        temp_rootfs = self.d.expand('${T}/opkg')
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
-        if opkg_lib_dir[0] == "/":
-            opkg_lib_dir = opkg_lib_dir[1:]
-        temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
-        bb.utils.mkdirhier(temp_opkg_dir)
-
-        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
-        opkg_args += self.d.getVar("OPKG_ARGS")
-
-        cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
-        try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to update. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-        # Dummy installation
-        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
-                                                opkg_args,
-                                                ' '.join(pkgs))
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to dummy install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-
-        bb.utils.remove(temp_rootfs, True)
-
-        return output
-
-    def backup_packaging_data(self):
-        # Save the opkglib for increment ipk image generation
-        if os.path.exists(self.saved_opkg_dir):
-            bb.utils.remove(self.saved_opkg_dir, True)
-        shutil.copytree(self.opkg_dir,
-                        self.saved_opkg_dir,
-                        symlinks=True)
-
-    def recover_packaging_data(self):
-        # Move the opkglib back
-        if os.path.exists(self.saved_opkg_dir):
-            if os.path.exists(self.opkg_dir):
-                bb.utils.remove(self.opkg_dir, True)
-
-            bb.note('Recover packaging data')
-            shutil.copytree(self.saved_opkg_dir,
-                            self.opkg_dir,
-                            symlinks=True)
-
-    def package_info(self, pkg):
-        """
-        Returns a dictionary with the package info.
-        """
-        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
-        pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
-
-        pkg_arch = pkg_info[pkg]["arch"]
-        pkg_filename = pkg_info[pkg]["filename"]
-        pkg_info[pkg]["filepath"] = \
-                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
-
-        return pkg_info
-
-    def extract(self, pkg):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-        """
-        pkg_info = self.package_info(pkg)
-        if not pkg_info:
-            bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
-
-        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
-
-        return tmp_dir
-
 def generate_index_files(d):
     classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
 
diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
new file mode 100644
index 0000000000..5d709dd6bc
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/package_manager.py
@@ -0,0 +1,426 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.package_manager import *
+
+class OpkgDpkgPM(PackageManager):
+    def __init__(self, d, target_rootfs):
+        """
+        This is an abstract class. Do not instantiate this directly.
+        """
+        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
+
+    def package_info(self, pkg, cmd):
+        """
+        Returns a dictionary with the package info.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to list available packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+        return opkg_query(output)
+
+    def extract(self, pkg, pkg_info):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
+        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
+        pkg_path = pkg_info[pkg]["filepath"]
+
+        if not os.path.isfile(pkg_path):
+            bb.fatal("Unable to extract package for '%s'."
+                     "File %s doesn't exists" % (pkg, pkg_path))
+
+        tmp_dir = tempfile.mkdtemp()
+        current_dir = os.getcwd()
+        os.chdir(tmp_dir)
+        data_tar = 'data.tar.xz'
+
+        try:
+            cmd = [ar_cmd, 'x', pkg_path]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = [tar_cmd, 'xf', data_tar]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
+        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
+    def _handle_intercept_failure(self, registered_pkgs):
+        self.mark_packages("unpacked", registered_pkgs.split())
+
+class OpkgPM(OpkgDpkgPM):
+    def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
+        super(OpkgPM, self).__init__(d, target_rootfs)
+
+        self.config_file = config_file
+        self.pkg_archs = archs
+        self.task_name = task_name
+
+        self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), ipk_repo_workdir)
+        self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
+        self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
+        self.opkg_args += self.d.getVar("OPKG_ARGS")
+
+        if prepare_index:
+            create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
+
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
+        if opkg_lib_dir[0] == "/":
+            opkg_lib_dir = opkg_lib_dir[1:]
+
+        self.opkg_dir = os.path.join(target_rootfs, opkg_lib_dir, "opkg")
+
+        bb.utils.mkdirhier(self.opkg_dir)
+
+        self.saved_opkg_dir = self.d.expand('${T}/saved/%s' % self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
+
+        self.from_feeds = (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") == "1"
+        if self.from_feeds:
+            self._create_custom_config()
+        else:
+            self._create_config()
+
+        self.indexer = OpkgIndexer(self.d, self.deploy_dir)
+
+    def mark_packages(self, status_tag, packages=None):
+        """
+        This function will change a package's status in /var/lib/opkg/status file.
+        If 'packages' is None then the new_status will be applied to all
+        packages
+        """
+        status_file = os.path.join(self.opkg_dir, "status")
+
+        with open(status_file, "r") as sf:
+            with open(status_file + ".tmp", "w+") as tmp_sf:
+                if packages is None:
+                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
+                                        r"Package: \1\n\2Status: \3%s" % status_tag,
+                                        sf.read()))
+                else:
+                    if type(packages).__name__ != "list":
+                        raise TypeError("'packages' should be a list object")
+
+                    status = sf.read()
+                    for pkg in packages:
+                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
+                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
+                                        status)
+
+                    tmp_sf.write(status)
+
+        os.rename(status_file + ".tmp", status_file)
+
+    def _create_custom_config(self):
+        bb.note("Building from feeds activated!")
+
+        with open(self.config_file, "w+") as config_file:
+            priority = 1
+            for arch in self.pkg_archs.split():
+                config_file.write("arch %s %d\n" % (arch, priority))
+                priority += 5
+
+            for line in (self.d.getVar('IPK_FEED_URIS') or "").split():
+                feed_match = re.match(r"^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
+
+                if feed_match is not None:
+                    feed_name = feed_match.group(1)
+                    feed_uri = feed_match.group(2)
+
+                    bb.note("Add %s feed with URL %s" % (feed_name, feed_uri))
+
+                    config_file.write("src/gz %s %s\n" % (feed_name, feed_uri))
+
+            """
+            Allow to use package deploy directory contents as quick devel-testing
+            feed. This creates individual feed configs for each arch subdir of those
+            specified as compatible for the current machine.
+            NOTE: Development-helper feature, NOT a full-fledged feed.
+            """
+            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
+                for arch in self.pkg_archs.split():
+                    cfg_file_name = os.path.join(self.target_rootfs,
+                                                 self.d.getVar("sysconfdir"),
+                                                 "opkg",
+                                                 "local-%s-feed.conf" % arch)
+
+                    with open(cfg_file_name, "w+") as cfg_file:
+                        cfg_file.write("src/gz local-%s %s/%s" %
+                                       (arch,
+                                        self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
+                                        arch))
+
+                        if self.d.getVar('OPKGLIBDIR') != '/var/lib':
+                            # There is no command line option for this anymore, we need to add
+                            # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                            # the default value of "/var/lib" as defined in opkg:
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
+                            cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                            cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
+                            cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
+
+
+    def _create_config(self):
+        with open(self.config_file, "w+") as config_file:
+            priority = 1
+            for arch in self.pkg_archs.split():
+                config_file.write("arch %s %d\n" % (arch, priority))
+                priority += 5
+
+            config_file.write("src oe file:%s\n" % self.deploy_dir)
+
+            for arch in self.pkg_archs.split():
+                pkgs_dir = os.path.join(self.deploy_dir, arch)
+                if os.path.isdir(pkgs_dir):
+                    config_file.write("src oe-%s file:%s\n" %
+                                      (arch, pkgs_dir))
+
+            if self.d.getVar('OPKGLIBDIR') != '/var/lib':
+                # There is no command line option for this anymore, we need to add
+                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                # the default value of "/var/lib" as defined in opkg:
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
+                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                config_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
+                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
+
+    def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
+        if feed_uris == "":
+            return
+
+        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
+                                  % self.target_rootfs)
+
+        os.makedirs('%s/etc/opkg' % self.target_rootfs, exist_ok=True)
+
+        feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
+        archs = self.pkg_archs.split() if feed_archs is None else feed_archs.split()
+
+        with open(rootfs_config, "w+") as config_file:
+            uri_iterator = 0
+            for uri in feed_uris:
+                if archs:
+                    for arch in archs:
+                        if (feed_archs is None) and (not os.path.exists(oe.path.join(self.deploy_dir, arch))):
+                            continue
+                        bb.note('Adding opkg feed url-%s-%d (%s)' %
+                            (arch, uri_iterator, uri))
+                        config_file.write("src/gz uri-%s-%d %s/%s\n" %
+                                          (arch, uri_iterator, uri, arch))
+                else:
+                    bb.note('Adding opkg feed url-%d (%s)' %
+                        (uri_iterator, uri))
+                    config_file.write("src/gz uri-%d %s\n" %
+                                      (uri_iterator, uri))
+
+                uri_iterator += 1
+
+    def update(self):
+        self.deploy_dir_lock()
+
+        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
+
+        try:
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            self.deploy_dir_unlock()
+            bb.fatal("Unable to update the package index files. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        self.deploy_dir_unlock()
+
+    def install(self, pkgs, attempt_only=False):
+        if not pkgs:
+            return
+
+        cmd = "%s %s" % (self.opkg_cmd, self.opkg_args)
+        for exclude in (self.d.getVar("PACKAGE_EXCLUDE") or "").split():
+            cmd += " --add-exclude %s" % exclude
+        for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
+            cmd += " --add-ignore-recommends %s" % bad_recommendation
+        cmd += " install "
+        cmd += " ".join(pkgs)
+
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
+
+        try:
+            bb.note("Installing the following packages: %s" % ' '.join(pkgs))
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note(output)
+            failed_pkgs = []
+            for line in output.split('\n'):
+                if line.endswith("configuration required on target."):
+                    bb.warn(line)
+                    failed_pkgs.append(line.split(".")[0])
+            if failed_pkgs:
+                failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
+        except subprocess.CalledProcessError as e:
+            (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
+                                              "Command '%s' returned %d:\n%s" %
+                                              (cmd, e.returncode, e.output.decode("utf-8")))
+
+    def remove(self, pkgs, with_dependencies=True):
+        if not pkgs:
+            return
+
+        if with_dependencies:
+            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
+                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+        else:
+            cmd = "%s %s --force-depends remove %s" % \
+                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+
+        try:
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT).decode("utf-8")
+            bb.note(output)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to remove packages. Command '%s' "
+                     "returned %d:\n%s" % (e.cmd, e.returncode, e.output.decode("utf-8")))
+
+    def write_index(self):
+        self.deploy_dir_lock()
+
+        result = self.indexer.write_index()
+
+        self.deploy_dir_unlock()
+
+        if result is not None:
+            bb.fatal(result)
+
+    def remove_packaging_data(self):
+        bb.utils.remove(self.opkg_dir, True)
+        # create the directory back, it's needed by PM lock
+        bb.utils.mkdirhier(self.opkg_dir)
+
+    def remove_lists(self):
+        if not self.from_feeds:
+            bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
+
+    def list_installed(self):
+        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
+
+    def dummy_install(self, pkgs):
+        """
+        The following function dummy installs pkgs and returns the log of output.
+        """
+        if len(pkgs) == 0:
+            return
+
+        # Create an temp dir as opkg root for dummy installation
+        temp_rootfs = self.d.expand('${T}/opkg')
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
+        if opkg_lib_dir[0] == "/":
+            opkg_lib_dir = opkg_lib_dir[1:]
+        temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
+        bb.utils.mkdirhier(temp_opkg_dir)
+
+        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
+        opkg_args += self.d.getVar("OPKG_ARGS")
+
+        cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
+        try:
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to update. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        # Dummy installation
+        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
+                                                opkg_args,
+                                                ' '.join(pkgs))
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to dummy install packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+
+        bb.utils.remove(temp_rootfs, True)
+
+        return output
+
+    def backup_packaging_data(self):
+        # Save the opkglib for increment ipk image generation
+        if os.path.exists(self.saved_opkg_dir):
+            bb.utils.remove(self.saved_opkg_dir, True)
+        shutil.copytree(self.opkg_dir,
+                        self.saved_opkg_dir,
+                        symlinks=True)
+
+    def recover_packaging_data(self):
+        # Move the opkglib back
+        if os.path.exists(self.saved_opkg_dir):
+            if os.path.exists(self.opkg_dir):
+                bb.utils.remove(self.opkg_dir, True)
+
+            bb.note('Recover packaging data')
+            shutil.copytree(self.saved_opkg_dir,
+                            self.opkg_dir,
+                            symlinks=True)
+
+    def package_info(self, pkg):
+        """
+        Returns a dictionary with the package info.
+        """
+        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
+        pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
+
+        pkg_arch = pkg_info[pkg]["arch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_info[pkg]["filepath"] = \
+                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        return pkg_info
+
+    def extract(self, pkg):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+        """
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
+
+        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
+
+        return tmp_dir
+
+
diff --git a/meta/lib/oe/package_managers/ipk/rootfs.py b/meta/lib/oe/package_managers/ipk/rootfs.py
index caa2920e9a..af7cf8484e 100644
--- a/meta/lib/oe/package_managers/ipk/rootfs.py
+++ b/meta/lib/oe/package_managers/ipk/rootfs.py
@@ -125,6 +125,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
 
         self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
+        from oe.package_managers.ipk.package_manager import OpkgPM
         if self._remove_old_rootfs():
             bb.utils.remove(self.image_rootfs, True)
             self.pm = OpkgPM(d,
@@ -231,6 +232,7 @@ class PkgRootfs(DpkgOpkgRootfs):
 
         dirs = [self.image_rootfs]
 
+        from oe.package_managers.ipk.package_manager import OpkgPM
         for variant in self.d.getVar("MULTILIB_VARIANTS").split():
             ml_target_rootfs = os.path.join(ml_temp, variant)
 
-- 
2.20.1

