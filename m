Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F04C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:56:17 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35394.1788789376934216959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=W7Pf3vlq;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.228.140, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25085f2422so31374466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788789375; x=1789394175; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ymzeDbD6AdRsNz3lxB8usfJfD84Wyc2aaNIUHLYr4c=;
        b=W7Pf3vlqhinFJ87b33cMLQzbaME8KO90GFZDVC9wUpPCzlmmdQdiH3lXBGLxMEaLKz
         uxyi+y6sqEKxaAy40B+Cksm9NXf1sAMDvXnHwOCK6x/YIUabVcyPxMMpKa+XRwGnEll4
         +3OeVtp6lMiGEe7uIL+O+iIkX4R1IMhsXzir4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789375; x=1789394175;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ymzeDbD6AdRsNz3lxB8usfJfD84Wyc2aaNIUHLYr4c=;
        b=nUkznUsX34gimLZlukNGPd+Y/QH79KKJzH33VXZzSAwp68YtyhkQ1WAUZhLB3s32sd
         DbTi4iir4v07g47mKw1NHrO3rRawSiJXxspA/FaRKsbXE1zwBNQzKDPmEAnkbxGD0kVc
         0WGZj2qqdV+wvGpZ85ZA0VJoiCtn2RicCr5MVmgnmyTDdIQtWEYEjx9xUfyq7bdut7KA
         sX2twaBwXgjowrsKxuCdMjFZy/R2bTFEmOcwqJzGI3GTshNRko5LZKRcUkHv2gHJ3jLi
         bEHUEDeW3uUWUvdnTTrMnmdUyhzPTyH9v3VNciHTdGwkHBSjvR7B2UxKq2Wfo3C9IUSq
         uNRA==
X-Gm-Message-State: AFuF++lGDrDdlyozIK985F/uNLe/IonpelxPz7jJ4dgWD77sxTzYnrba
	WBE5Jy6w4vVNfqvue26RQAh0EiB9lRigLG4/wCzf3AnajVFfyzKQtiZYHrxLyglklFBlrxt0GVc
	VeS7CwV8=
X-Gm-Gg: AYBFou0uD0uzezVX1banxQ9tWtqUK/7NqmYd1AVG2R6/63o3tAnfFn6NywsrgB1uffC
	fj5Jk7nR+GF4f2/ZWJMoBuV7xzrVMLfd8xnrfkJfCG0V9eQ5X0V6lWTcu3uuR/NrWyv3mCRI/MH
	WBvbOhyA6CpEPOmWRUcPspQC2rfc/hk/nDkY4SKkaX2FG6DFnsv6W82saWCxwBlfFdaRI8CsZ+g
	+Dk8NvXQeNRiDjUXwYPJkzg5E4oH7eHJUT94F7xh201hbEzMRcASsRVXRYtlMFd455nPA1B9OqM
	LX6Drfqpn04/9jzL9d+ktgsS12fxBmavkkLeMJnGwbPz3dLQj40CfTGnsAnOm0BKP0+hIrn43sE
	amZ5MIBMJffr6ZVWRKrmnJNxPv6b3+EuWTx+c55X9xBXbvDpyRdZysEjLYVzEfu652oZNTDnV5g
	7Dfcg9iHmjyBMdRKvT1FZ858kweZB/6ZWOFsU1f0txAOJvPuHSIx1+YHfkbaeBc+5mA3qlVNQv1
	29pcQTjHHDZxJHKc9kqUgOiLrXfD7CnM/yZlSG3ktimQPqIySjxgzb37gqkAbYRjV5FhcLZwlR2
	/FvjznGnPZPVL86kkUTWSQGU6wU6142D5SEjUOrRjljksT9Y3DQBul3evh2yvgNKwAM=
X-Received: by 2002:a17:906:7953:b0:c20:c5f4:e19f with SMTP id a640c23a62f3a-c26250a363fmr631059366b.4.1788789374478;
        Mon, 07 Sep 2026 06:56:14 -0700 (PDT)
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm478290566b.34.2026.09.07.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:56:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v9 4/5] dnf: Upgrade to 5.4.4.0
Date: Mon,  7 Sep 2026 15:56:03 +0200
Message-ID: <20260907135607.4132821-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
References: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245297

Completely rewritten in C++, there are several changes needed
to facilitate moving from DNF4 to DNF5. Below are some significant
items to note:

    - Added a negative lookahead filter for the following warning if
      RPM_SIGN_PACKAGES != '1': "Warning: skipped OpenPGP checks"
      This warning is hard-coded and piped to stderr if gpg checks
      are disabled. However, most users do not sign their RPM packages
      and use dnf to simply construct the rootfs.

    - The "-v/--verbose" cli option is removed. As such, remove the argument
    everywhere it was called.[1]

    - the rpmverbosity cli option is replaced with --setopt=rpmverbosity

    - Change gpgcheck to pkg_gpgcheck as this is what the documentation
    recommends.[2]

    - --nogpgcheck is now --no-gpgchecks

    - --setopt=protect_running_kernel=False has to be set or else every dnf
    transaction complains that /boot/vmlinuz-${kernel_version} does not
    exist in /var/log/dnf5.log. There is an open issue on github[3] to enable
    the currently not-yet implemented `autocheck_running_kernel option`, but
    it has been open for quite some time and the protect_running_kernel
    option supresses the message.

    - Move --skip-broken to after the install argument as the global
      --skip-broken argument is removed.

    - /var/cache/dnf is replaced with /var/cache/libdnf5

    - Add `features += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'`
          `features += 'PACKAGECONFIG:append:pn-librepo = " sequoia"\n'`
      to test_testimage_dnf as librepo currently does not work
      with gpgme.

    - Change `if e_output.startswith("Error in POSTIN scriptlet in rpm package"):`
      to `if "%post(" in e_output and "scriptlet failed" in e_output.

While DNF5 has many config options, unfortunately, the majority
of them depends on sdbus-c++, which is not included in OE-core.
However, the package is included in meta-openembedded, so it's
best to include the PACKAGECONFIG options in the recipe and
leave them off by default.

1: https://github.com/rpm-software-management/dnf5/issues/464
2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
3: https://github.com/rpm-software-management/dnf5/issues/1255

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../lib/oeqa/runtime/cases/dnf_runtime.py     |   6 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |  26 +-
 meta/lib/oe/package_manager/rpm/rootfs.py     |   3 +
 meta/lib/oeqa/runtime/cases/dnf.py            |  16 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   5 +
 ...tly-install-tmpfiles.d-configuration.patch |  18 --
 ...ode-etc-and-systemd-unit-directories.patch |  26 --
 ...-hardcode-the-systemd-unit-directory.patch |  29 +++
 .../0001-dnf-write-the-log-lock-to-root.patch |  29 ---
 .../0001-lock.py-fix-Exception-handling.patch |  62 -----
 ...et-python-path-for-completion_helper.patch |  21 --
 .../dnf/0002-cmake-set-CMP0190-to-OLD.patch   |  51 ++++
 ...0003-Do-not-hardcode-system_cachedir.patch |  36 +++
 ...004-add-support-for-gcc-12-and-below.patch |  97 +++++++
 ...Do-not-prepend-installroot-to-logdir.patch |  28 --
 ...rm-arch-mapping-issues-for-qemuarmv5.patch |  59 +++++
 ...ude-cstring-where-std-strcmp-is-used.patch | 242 ++++++++++++++++++
 ...PYTHON_INSTALL_DIR-by-running-python.patch |  24 --
 .../0030-Run-python-scripts-using-env.patch   |  34 ---
 meta/recipes-devtools/dnf/dnf_4.24.0.bb       |  96 -------
 meta/recipes-devtools/dnf/dnf_5.4.4.0.bb      | 181 +++++++++++++
 22 files changed, 731 insertions(+), 360 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0006-include-cstring-where-std-strcmp-is-used.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf_4.24.0.bb
 create mode 100644 meta/recipes-devtools/dnf/dnf_5.4.4.0.bb

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index d2f0f88f7d..27158b5193 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -41,11 +41,11 @@ class DnfSelftest(DnfTest):
 
         import re
         # Use '-y' for non-interactive mode: automatically import the feed signing key
-        output_makecache = self.dnf('-vy makecache')
+        output_makecache = self.dnf('-y makecache')
         self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
         self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
 
-        output_repoinfo = self.dnf('-v repoinfo')
-        matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
+        output_repoinfo = self.dnf('repoinfo')
+        matchobj = re.match(r".*Total packages\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
         self.assertTrue(matchobj is not None, msg = "Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
         self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg = "Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8f47ea6001..f29ab6d84e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -157,7 +157,7 @@ RECIPE_MAINTAINER:pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc-config = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dmidecode = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-dnf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-dnf = "Adam Duskett <adam.duskett@amarulasolutions.com>"
 RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index ccb4316bd0..46c8ea484e 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -163,7 +163,7 @@ class RpmPM(PackageManager):
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
 
         if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
-            gpg_opts += 'gpgcheck=0\n'
+            gpg_opts += 'pkg_gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
@@ -200,11 +200,11 @@ class RpmPM(PackageManager):
         package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
         exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exclude.split() if package_exclude else [])
 
-        output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
-                         (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
+        output = self._invoke_dnf((["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
                          (["--setopt=install_weak_deps=False"] if (hard_depends_only or self.d.getVar('NO_RECOMMENDATIONS') == "1") else []) +
-                         (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
+                         (["--no-gpgchecks"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=pkg_gpgcheck=True"]) +
                          ["install"] +
+                         (["--skip-broken"] if attempt_only else []) +
                          pkgs)
 
         failed_scriptlets_pkgnames = collections.OrderedDict()
@@ -212,8 +212,9 @@ class RpmPM(PackageManager):
             if line.startswith("Error: Systemctl"):
                 bb.error(line)
 
-            if line.startswith("Error in POSTIN scriptlet in rpm package"):
-                failed_scriptlets_pkgnames[line.split()[-1]] = True
+            if "%post(" in line and "scriptlet failed" in line:
+                package_name = re.search(r'\((.*?)\)', line).group(1)
+                failed_scriptlets_pkgnames[package_name] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
             failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
@@ -313,10 +314,15 @@ class RpmPM(PackageManager):
     def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
+        # Set XDG_CACHE_HOME to avoid dnf attempting to install oe-repo system cache to a /tmp/ directory on the host.
+        os.environ['XDG_CACHE_HOME'] = oe.path.join(os.path.join(self.target_rootfs, "var/cache/libdnf5"))
+
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
-                             "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
+        standard_dnf_args = ["-y",
+                             "--config", os.path.join(self.d.getVar('STAGING_DIR_NATIVE'), "etc/dnf/dnf.conf"),
+                             "--setopt=rpmverbosity=info",
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
+                             "--setopt=pluginconfpath=%s" %(os.path.join(self.d.getVar('STAGING_DIR_NATIVE'), "etc/dnf/dnf.conf")),
                              "--installroot=%s" % (self.target_rootfs),
                              "--setopt=logdir=%s" % (self.d.getVar('T')),
                              "--setopt=optional_metadata_types=filelists",
@@ -335,9 +341,9 @@ class RpmPM(PackageManager):
                 e_output = e.output.decode("utf-8")
                 # RPM 6 fails the entire transaction when a %post scriptlet
                 # fails, causing dnf to exit non-zero. Let install_pkgs handle
-                # scriptlet failures via its existing "Error in POSTIN scriptlet"
+                # scriptlet failures via its existing "Error in %post scriptlet:"
                 # scanning rather than treating this as a fatal dnf invocation error.
-                if "Error in POSTIN scriptlet in rpm package" in e_output:
+                if "%post(" in e_output and "scriptlet failed" in e_output:
                     bb.note(e_output)
                     return e_output
                 extra_info = ""
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 698685c067..8d54b5ab48 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -17,6 +17,9 @@ class PkgRootfs(Rootfs):
                                r'|exit 1\b|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
 
+        if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
+            self.warn_check_regex = r'^(?!.*Warning: skipped OpenPGP checks)(warn|Warn|WARNING:)'
+
         self.manifest = PkgManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 3ccb18ce83..1becc8d8a0 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -17,7 +17,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class DnfTest(OERuntimeTestCase):
 
     def dnf(self, command, expected = 0):
-        command = 'dnf %s' % command
+        command = 'dnf --setopt=protect_running_kernel=False %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
@@ -48,7 +48,7 @@ class DnfBasicTest(DnfTest):
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     def test_dnf_history(self):
-        self.dnf('history')
+        self.dnf('history list')
 
 class DnfRepoTest(DnfTest):
 
@@ -68,7 +68,7 @@ class DnfRepoTest(DnfTest):
         deploy_url = 'http://%s:%s/' %(self.target.server_ip, self.repo_server.port)
         cmdlinerepoopts = ["--repofrompath=oe-testimage-repo-%s,%s%s" %(arch, deploy_url, arch) for arch in pkgarchs]
 
-        output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
+        output = self.dnf(" ".join(cmdlinerepoopts) + " --no-gpgchecks " + command)
         return output
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
@@ -96,7 +96,7 @@ class DnfRepoTest(DnfTest):
     def test_dnf_install_from_disk(self):
         self.dnf_with_repo('remove -y dnf-test-dep')
         self.dnf_with_repo('install -y --downloadonly dnf-test-dep')
-        status, output = self.target.run('find /var/cache/dnf -name dnf-test-dep*rpm')
+        status, output = self.target.run('find /var/cache/libdnf5 -name dnf-test-dep*rpm')
         self.assertEqual(status, 0, output)
         self.dnf_with_repo('install -y %s' % output)
 
@@ -134,8 +134,8 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
         self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
-        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
-        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        self.dnf_with_repo('install --installroot=%s -y busybox' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/libdnf5' % rootpath, 1500)
         self.assertEqual(0, status, output)
         status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
         self.assertEqual(0, status, output)
@@ -158,8 +158,8 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath)
         self.target.run('cp /bin/busybox %s/bin/sh' % rootpath)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath)
-        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
-        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath)
+        self.dnf_with_repo('install --installroot=%s -y busybox' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/libdnf5' % rootpath)
         self.assertEqual(0, status, output)
         status, output = self.target.run('test -e %s/bin/busybox' % rootpath)
         self.assertEqual(0, status, output)
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index a3c3126036..e37fbae855 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -164,6 +164,11 @@ TEST_RUNQEMUPARAMS += " slirp"
         features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
         features += 'PACKAGE_CLASSES = "package_rpm"\n'
 
+        # librepo and rpm require sequoia
+        # https://github.com/rpm-software-management/dnf5/issues/2539
+        features += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
+        features += 'PACKAGECONFIG:append:pn-librepo = " sequoia"\n'
+
         bitbake('gnupg-native -c addto_recipe_sysroot')
 
         # Enable package feed signing
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
deleted file mode 100644
index fd942228b9..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 26 Jan 2017 16:36:20 +0200
-Subject: [PATCH] Corretly install tmpfiles.d configuration
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- etc/tmpfiles.d/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/etc/tmpfiles.d/CMakeLists.txt b/etc/tmpfiles.d/CMakeLists.txt
-index f69c773e..3eb6d0e8 100644
---- a/etc/tmpfiles.d/CMakeLists.txt
-+++ b/etc/tmpfiles.d/CMakeLists.txt
-@@ -1 +1 @@
--INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
-+INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
deleted file mode 100644
index 9d978cdc5f..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c2b2b91b58f4531d4baf0a01f5d868d71e577a84 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 26 Jan 2017 16:25:47 +0200
-Subject: [PATCH] Do not hardcode /etc and systemd unit directories
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e71e9517..8fcb2069 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ PROJECT (dnf NONE)
- 
- INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
- 
--SET( SYSCONFDIR /etc)
--SET( SYSTEMD_DIR /usr/lib/systemd/system)
-+SET( SYSCONFDIR ${CMAKE_INSTALL_SYSCONFDIR})
-+SET( SYSTEMD_DIR $ENV{systemd_system_unitdir})
- 
- IF (NOT PYTHON_DESIRED)
-     FIND_PACKAGE (PythonInterp REQUIRED)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
new file mode 100644
index 0000000000..b8abe9a812
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
@@ -0,0 +1,29 @@
+From 0987f45ca3d57e11a561232abbdd4a352f6ea22f Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 27 Nov 2025 11:07:48 +0100
+Subject: [PATCH] Do not hardcode the systemd unit directory
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Rebased for 5.4.3.0
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e98c5a974..bdbbb034b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ project(dnf5 LANGUAGES CXX C VERSION ${VERSION_PRIME}.${VERSION_MAJOR}.${VERSION
+ cmake_policy(VERSION ${CMAKE_VERSION})
+ 
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
+-set(SYSTEMD_DIR "/usr/lib/systemd/system" CACHE PATH "Directory for systemd unit files")
++set(SYSTEMD_DIR $ENV{systemd_system_unitdir} CACHE PATH "Directory for systemd unit files")
+ set(TMPFILES_DIR "/usr/lib/tmpfiles.d" CACHE PATH "Directory for systemd tmpfiles.d files")
+ 
+ message("Building ${PROJECT_NAME} version ${PROJECT_VERSION}")
+-- 
+2.55.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
deleted file mode 100644
index 18f9a30949..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 28 Apr 2020 15:55:00 +0200
-Subject: [PATCH] dnf: write the log lock to root
-
-Writing it to /var/log appears to be racing with installation
-of base-files, and if lock is created first, base-files
-will refuse to install (due to the target directory
-already existing, and base-files creating it as a symlink).
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/logging.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/logging.py b/dnf/logging.py
-index ef0b25f3..94610af6 100644
---- a/dnf/logging.py
-+++ b/dnf/logging.py
-@@ -118,7 +118,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
-     def __init__(self, filename, mode='a', maxBytes=0, backupCount=0, encoding=None, delay=False):
-         super(MultiprocessRotatingFileHandler, self).__init__(
-             filename, mode, maxBytes, backupCount, encoding, delay)
--        self.rotate_lock = dnf.lock.build_log_lock("/var/log/", True)
-+        self.rotate_lock = dnf.lock.build_log_lock("/", True)
- 
-     def emit(self, record):
-         while True:
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
deleted file mode 100644
index 6bffe9af0a..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 13 Mar 2024 11:22:05 +0800
-Subject: [PATCH] lock.py: fix Exception handling
-
-Before, when logdir is not writable, _try_lock will raise an Exception
-like "Permission denied: '/var/log/log_lock.pid'", and in this case,
-_unlock_thread will not be called and the variable count will not be
-handled, it maybe cause log_lock.pid not be deleted in case like [1].
-
-For [1], it is an cross compile case, when dnf install some packages to
-rootfs, seems like some threads don't do chroot like work, some threads
-do chroot like work. so for the threads don't do chroot, "Permission denied"
-Exception happend, for the threads that do chroot, log_lock.pid will be
-created under installroot/var/log/log_lock.pid, since variable count not
-handled correct before, log_lock.pid may not be deleted correctly.
-
-So fixed like this, if _try_lock raise Exception, _unlock_thread first,
-then raise the Exception.
-
-[1] https://github.com/rpm-software-management/dnf/issues/1963
-
-Upstream-Status: Submitted [ https://github.com/rpm-software-management/dnf/pull/2065 ]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- dnf/lock.py | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/dnf/lock.py b/dnf/lock.py
-index 6817aac9..5718062a 100644
---- a/dnf/lock.py
-+++ b/dnf/lock.py
-@@ -128,7 +128,11 @@ class ProcessLock(object):
-         self._lock_thread()
-         prev_pid = -1
-         my_pid = os.getpid()
--        pid = self._try_lock(my_pid)
-+        try:
-+            pid = self._try_lock(my_pid)
-+        except Exception:
-+            self._unlock_thread()
-+            raise
-         while pid != my_pid:
-             if pid != -1:
-                 if not self.blocking:
-@@ -140,7 +144,11 @@ class ProcessLock(object):
-                     logger.info(msg)
-                     prev_pid = pid
-             time.sleep(1)
--            pid = self._try_lock(my_pid)
-+            try:
-+                pid = self._try_lock(my_pid)
-+            except Exception:
-+                self._unlock_thread()
-+                raise
- 
-     def __exit__(self, *exc_args):
-         if self.count == 1:
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
deleted file mode 100644
index fcd970a7ae..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Wed, 11 Mar 2020 22:10:02 +0000
-Subject: [PATCH] set python path for completion_helper
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
----
- dnf/cli/completion_helper.py.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/cli/completion_helper.py.in b/dnf/cli/completion_helper.py.in
-index 0da0f2a2..9330d15b 100644
---- a/dnf/cli/completion_helper.py.in
-+++ b/dnf/cli/completion_helper.py.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- #
- # This file is part of dnf.
- #
diff --git a/meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch b/meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch
new file mode 100644
index 0000000000..3ac3923956
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch
@@ -0,0 +1,51 @@
+From 8eb5a6208fd9edfa7796d974b2e5256b05ffe001 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 27 Nov 2025 11:49:43 +0100
+Subject: [PATCH] cmake: set CMP0190 to OLD
+
+Starting with CMake 4.1, cross-compiling python3 requires setting
+-DCMAKE_CROSSCOMPILING_EMULATOR which can be done by inheriting
+cmake-qemu. However, this leads to the following error:
+Interpreter: Cannot run the interpreter ".../python3-native/python3"
+
+This is due to the target sysroot python3 binary not being installed
+because it can't be executed.
+
+Set CMP0190 to old to force the old behavior.
+
+https://cmake.org/cmake/help/latest/policy/CMP0190.html
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ bindings/python3/CMakeLists.txt                      | 1 +
+ libdnf5-plugins/python_plugins_loader/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/bindings/python3/CMakeLists.txt b/bindings/python3/CMakeLists.txt
+index fa7033d..4bfa434 100644
+--- a/bindings/python3/CMakeLists.txt
++++ b/bindings/python3/CMakeLists.txt
+@@ -6,6 +6,7 @@ endif()
+ message("Building bindings for python3")
+ 
+ 
++cmake_policy(SET CMP0190 OLD)
+ find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
+ include_directories(${Python3_INCLUDE_DIRS})
+ 
+diff --git a/libdnf5-plugins/python_plugins_loader/CMakeLists.txt b/libdnf5-plugins/python_plugins_loader/CMakeLists.txt
+index 5454a5d..d4a9915 100644
+--- a/libdnf5-plugins/python_plugins_loader/CMakeLists.txt
++++ b/libdnf5-plugins/python_plugins_loader/CMakeLists.txt
+@@ -6,6 +6,7 @@ if(NOT WITH_PYTHON_PLUGINS_LOADER)
+     return()
+ endif()
+ 
++cmake_policy(SET CMP0190 OLD)
+ find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
+ find_package(SWIG REQUIRED)
+ include_directories(${Python3_INCLUDE_DIRS})
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch b/meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch
new file mode 100644
index 0000000000..e8e370e21c
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch
@@ -0,0 +1,36 @@
+From d0718ed10c1c255850fff5922f533bceef10f659 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 27 Nov 2025 11:50:20 +0100
+Subject: [PATCH] Do not hardcode system_cachedir
+
+Because dnf is ran in a fakeroot environment, the UID of the
+"user" is 0, and the hardcoded paths to the host system are
+attempted, leading to the following error:
+
+[log_check] DEBUG: Failed to expire repository cache in path "/var/cache/libdnf5/
+
+Remove the check for geteuid() == 0 and rely only on the
+user cache dir.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5/conf/config_main.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libdnf5/conf/config_main.cpp b/libdnf5/conf/config_main.cpp
+index a83e4a2..ebdea4d 100644
+--- a/libdnf5/conf/config_main.cpp
++++ b/libdnf5/conf/config_main.cpp
+@@ -244,7 +244,7 @@ class ConfigMain::Impl {
+     // Repo main config
+ 
+     OptionNumber<std::uint32_t> retries{10};
+-    OptionPath cachedir{geteuid() == 0 ? SYSTEM_CACHEDIR : libdnf5::xdg::get_user_cache_dir() / "libdnf5"};
++    OptionPath cachedir{libdnf5::xdg::get_user_cache_dir() / "libdnf5"};
+     OptionBool fastestmirror{false};
+     OptionStringAppendList excludeenvs{std::vector<std::string>{}};
+     OptionStringAppendList excludegroups{std::vector<std::string>{}};
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch b/meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch
new file mode 100644
index 0000000000..a3be14f3c6
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch
@@ -0,0 +1,97 @@
+From 930b075be572a04c5da78b002d2258b1dab85321 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 17 Feb 2026 17:03:46 +0100
+Subject: [PATCH] add support for gcc 12 and below
+
+  - Add missing headers for gcc <= 12
+  - Add support for libfmt if the format header is not found
+
+Note: This patch should be removed once the minimum GCC version
+for Yocto is >= 13.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5/CMakeLists.txt                  | 9 +++++++++
+ libdnf5/base/goal_elements.cpp          | 2 +-
+ libdnf5/conf/config_main.cpp            | 8 ++++++++
+ libdnf5/logger/memory_buffer_logger.cpp | 1 +
+ 4 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/libdnf5/CMakeLists.txt b/libdnf5/CMakeLists.txt
+index 770fc86..cf27081 100644
+--- a/libdnf5/CMakeLists.txt
++++ b/libdnf5/CMakeLists.txt
+@@ -7,6 +7,9 @@ if (NOT WITH_MODULEMD)
+     list(REMOVE_ITEM LIBDNF5_SOURCES ${LIBDNF5_SOURCES_MODULES})
+ endif()
+ 
++include(CheckIncludeFileCXX)
++check_include_file_cxx("format" CXX_FORMAT_SUPPORT)
++
+ # gather all pkg-config requires and write them to a .pc file later
+ list(APPEND LIBDNF5_PC_REQUIRES)
+ list(APPEND LIBDNF5_PC_REQUIRES_PRIVATE)
+@@ -45,6 +48,12 @@ set_target_properties(libdnf5 PROPERTIES SOVERSION ${DNF_SO_VERSION})
+ # required to have dlopen symbol
+ target_link_libraries(libdnf5 PUBLIC ${CMAKE_DL_LIBS})
+ 
++if (NOT CXX_FORMAT_SUPPORT)
++    find_package(fmt REQUIRED)
++    target_link_libraries(libdnf5_obj PRIVATE fmt::fmt)
++    target_compile_definitions(libdnf5_obj PUBLIC USE_FMTLIB)
++endif()
++
+ # required by clang
+ target_link_libraries(libdnf5 PUBLIC stdc++)
+ 
+diff --git a/libdnf5/base/goal_elements.cpp b/libdnf5/base/goal_elements.cpp
+index 054232a..87a1fca 100644
+--- a/libdnf5/base/goal_elements.cpp
++++ b/libdnf5/base/goal_elements.cpp
+@@ -17,7 +17,7 @@
+ // You should have received a copy of the GNU Lesser General Public License
+ // along with libdnf.  If not, see <https://www.gnu.org/licenses/>.
+ 
+-
++#include <optional>
+ #include "libdnf5/base/goal_elements.hpp"
+ 
+ #include "libdnf5/common/exception.hpp"
+diff --git a/libdnf5/conf/config_main.cpp b/libdnf5/conf/config_main.cpp
+index 1f0b64b..a926dd5 100644
+--- a/libdnf5/conf/config_main.cpp
++++ b/libdnf5/conf/config_main.cpp
+@@ -37,9 +37,17 @@
+ #include <algorithm>
+ #include <array>
+ #include <cctype>
++#include <optional>
+ #include <sstream>
+ #include <utility>
+ 
++#ifdef USE_FMTLIB
++#include <fmt/core.h>
++namespace std {
++    using fmt::format;
++}
++#endif
++
+ namespace libdnf5 {
+ 
+ /// @brief Converts a friendly bandwidth option to bytes
+diff --git a/libdnf5/logger/memory_buffer_logger.cpp b/libdnf5/logger/memory_buffer_logger.cpp
+index 85bf707..89307e9 100644
+--- a/libdnf5/logger/memory_buffer_logger.cpp
++++ b/libdnf5/logger/memory_buffer_logger.cpp
+@@ -20,6 +20,7 @@
+ #include "libdnf5/logger/memory_buffer_logger.hpp"
+ 
+ #include <mutex>
++#include <vector>
+ 
+ namespace libdnf5 {
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
deleted file mode 100644
index a1c58d6563..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH] Do not prepend installroot to logdir.
-
-This would otherwise write the logs into rootfs/var/log
-(whereas we want them in $T),
-and will break installation of base-files rpm.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/cli/cli.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
---- a/dnf/cli/cli.py
-+++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
-             logger.warning(_("Unable to detect release version (use '--releasever' to specify "
-                              "release version)"))
- 
--        for opt in ('cachedir', 'logdir', 'persistdir'):
-+        for opt in ('cachedir', 'persistdir'):
-             conf.prepend_installroot(opt)
- 
-         self.base._logging._setup_from_dnf_conf(conf)
diff --git a/meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch b/meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch
new file mode 100644
index 0000000000..213382a4df
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch
@@ -0,0 +1,59 @@
+From 32e926c627a3d0e81ce14890464abc5e5be74558 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 27 Nov 2025 11:48:43 +0100
+Subject: [PATCH] libdnf: fix arm arch mapping issues for qemuarmv5
+
+We change the way rpm architectures work, we make the machine name the default
+machine specific package architecture.
+
+This arm mapping code can work or in the case of qemuarmv5, it doesn't as it
+creates armv5hl which doesn't exist and causes errrors. We can simply remove
+it, we don't need it.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Rebased for 5.3.0.0
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5/utils/system.cpp | 24 ------------------------
+ 1 file changed, 24 deletions(-)
+
+diff --git a/libdnf5/utils/system.cpp b/libdnf5/utils/system.cpp
+index ecdc57e..35d8801 100644
+--- a/libdnf5/utils/system.cpp
++++ b/libdnf5/utils/system.cpp
+@@ -52,30 +52,6 @@ std::string detect_arch() {
+         throw RuntimeError(M_("Failed to execute uname()"));
+     }
+ 
+-    if (!strncmp(un.machine, "armv", 4)) {
+-        /* un.machine is armvXE, where X is version number and E is
+-         * endianness (b or l); we need to add modifiers such as
+-         * h (hardfloat), n (neon). Neon is a requirement of armv8 so
+-         * as far as rpm is concerned armv8l is the equivalent of armv7hnl
+-         * (or 7hnb) so we don't explicitly add 'n' for 8+ as it's expected. */
+-        char endian = un.machine[strlen(un.machine) - 1];
+-        char * modifier = un.machine + 5;
+-        while (isdigit(*modifier)) /* keep armv7, armv8, armv9, armv10, armv100, ... */
+-            modifier++;
+-        if (getauxval(AT_HWCAP) & HWCAP_ARM_VFP)
+-            *modifier++ = 'h';
+-        if ((atoi(un.machine + 4) == 7) && (getauxval(AT_HWCAP) & HWCAP_ARM_NEON))
+-            *modifier++ = 'n';
+-        *modifier++ = endian;
+-        *modifier = 0;
+-    }
+-#ifdef __MIPSEL__
+-    // support for little endian MIPS
+-    if (!strcmp(un.machine, "mips"))
+-        strcpy(un.machine, "mipsel");
+-    else if (!strcmp(un.machine, "mips64"))
+-        strcpy(un.machine, "mips64el");
+-#endif
+     return un.machine;
+ }
+ 
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0006-include-cstring-where-std-strcmp-is-used.patch b/meta/recipes-devtools/dnf/dnf/0006-include-cstring-where-std-strcmp-is-used.patch
new file mode 100644
index 0000000000..3cfbb2b3cb
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0006-include-cstring-where-std-strcmp-is-used.patch
@@ -0,0 +1,242 @@
+From 10b3ea5df53349511df179eee8dbe3b7a77e8ba4 Mon Sep 17 00:00:00 2001
+From: Ondrej Mosnáček <omosnacek@gmail.com>
+Date: Fri, 14 Aug 2026 09:04:38 +0200
+Subject: [PATCH] Include <cstring> wherever std::strcmp() is used
+
+There are many places where this function is used that don't include the
+appropriate header. This actually causes a build failure with fmt
+12.2.0, because it removed some includes from its headers.
+
+Fix it by including <cstring> at least where std::strcmp() is used.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/dnf5/commit/10b3ea5df53349511df179eee8dbe3b7a77e8ba4]
+Signed-off-by: Ondrej Mosnáček <omosnacek@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ dnf5-plugins/automatic_plugin/automatic_cmd_plugin.cpp        | 1 +
+ dnf5-plugins/builddep_plugin/builddep_cmd_plugin.cpp          | 1 +
+ dnf5-plugins/changelog_plugin/changelog_cmd_plugin.cpp        | 1 +
+ .../config-manager_plugin/config-manager_cmd_plugin.cpp       | 1 +
+ dnf5-plugins/copr_plugin/copr_cmd_plugin.cpp                  | 2 ++
+ dnf5-plugins/manifest_plugin/manifest_cmd_plugin.cpp          | 2 ++
+ .../needs_restarting_plugin/needs_restarting_cmd_plugin.cpp   | 1 +
+ dnf5-plugins/repoclosure_plugin/repoclosure_cmd_plugin.cpp    | 1 +
+ dnf5-plugins/repomanage_plugin/repomanage_cmd_plugin.cpp      | 2 ++
+ dnf5-plugins/reposync_plugin/reposync_cmd_plugin.cpp          | 1 +
+ libdnf5-plugins/appstream/appstream.cpp                       | 1 +
+ libdnf5-plugins/expired-pgp-keys/expired-pgp-keys.cpp         | 4 ++--
+ libdnf5-plugins/local/local.cpp                               | 1 +
+ libdnf5-plugins/rhsm/rhsm.cpp                                 | 1 +
+ test/tutorial-templates/dnf5-plugin/template_cmd_plugin.cpp   | 2 ++
+ test/tutorial-templates/libdnf5-plugin/template.cpp           | 1 +
+ 16 files changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/dnf5-plugins/automatic_plugin/automatic_cmd_plugin.cpp b/dnf5-plugins/automatic_plugin/automatic_cmd_plugin.cpp
+index a9dd59ff2c..363a6c344f 100644
+--- a/dnf5-plugins/automatic_plugin/automatic_cmd_plugin.cpp
++++ b/dnf5-plugins/automatic_plugin/automatic_cmd_plugin.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/dnf5-plugins/builddep_plugin/builddep_cmd_plugin.cpp b/dnf5-plugins/builddep_plugin/builddep_cmd_plugin.cpp
+index 7c7ca9d439..de703390f8 100644
+--- a/dnf5-plugins/builddep_plugin/builddep_cmd_plugin.cpp
++++ b/dnf5-plugins/builddep_plugin/builddep_cmd_plugin.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/dnf5-plugins/changelog_plugin/changelog_cmd_plugin.cpp b/dnf5-plugins/changelog_plugin/changelog_cmd_plugin.cpp
+index 3744363e3c..52a6685ed9 100644
+--- a/dnf5-plugins/changelog_plugin/changelog_cmd_plugin.cpp
++++ b/dnf5-plugins/changelog_plugin/changelog_cmd_plugin.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/dnf5-plugins/config-manager_plugin/config-manager_cmd_plugin.cpp b/dnf5-plugins/config-manager_plugin/config-manager_cmd_plugin.cpp
+index 153517cbb8..d40d8b6f81 100644
+--- a/dnf5-plugins/config-manager_plugin/config-manager_cmd_plugin.cpp
++++ b/dnf5-plugins/config-manager_plugin/config-manager_cmd_plugin.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/dnf5-plugins/copr_plugin/copr_cmd_plugin.cpp b/dnf5-plugins/copr_plugin/copr_cmd_plugin.cpp
+index 99b31327e3..da1f11a5d8 100644
+--- a/dnf5-plugins/copr_plugin/copr_cmd_plugin.cpp
++++ b/dnf5-plugins/copr_plugin/copr_cmd_plugin.cpp
+@@ -21,6 +21,8 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
++
+ using namespace dnf5;
+ 
+ namespace {
+diff --git a/dnf5-plugins/manifest_plugin/manifest_cmd_plugin.cpp b/dnf5-plugins/manifest_plugin/manifest_cmd_plugin.cpp
+index 7cd61a88bd..f9f658727f 100644
+--- a/dnf5-plugins/manifest_plugin/manifest_cmd_plugin.cpp
++++ b/dnf5-plugins/manifest_plugin/manifest_cmd_plugin.cpp
+@@ -5,6 +5,8 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
++
+ using namespace dnf5;
+ 
+ namespace {
+diff --git a/dnf5-plugins/needs_restarting_plugin/needs_restarting_cmd_plugin.cpp b/dnf5-plugins/needs_restarting_plugin/needs_restarting_cmd_plugin.cpp
+index 92c62e4eb1..175657e861 100644
+--- a/dnf5-plugins/needs_restarting_plugin/needs_restarting_cmd_plugin.cpp
++++ b/dnf5-plugins/needs_restarting_plugin/needs_restarting_cmd_plugin.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/dnf5-plugins/repoclosure_plugin/repoclosure_cmd_plugin.cpp b/dnf5-plugins/repoclosure_plugin/repoclosure_cmd_plugin.cpp
+index 6dddd041ba..c2ecabb707 100644
+--- a/dnf5-plugins/repoclosure_plugin/repoclosure_cmd_plugin.cpp
++++ b/dnf5-plugins/repoclosure_plugin/repoclosure_cmd_plugin.cpp
+@@ -21,6 +21,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/dnf5-plugins/repomanage_plugin/repomanage_cmd_plugin.cpp b/dnf5-plugins/repomanage_plugin/repomanage_cmd_plugin.cpp
+index e91e3e137f..a066e475cb 100644
+--- a/dnf5-plugins/repomanage_plugin/repomanage_cmd_plugin.cpp
++++ b/dnf5-plugins/repomanage_plugin/repomanage_cmd_plugin.cpp
+@@ -21,6 +21,8 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
++
+ using namespace dnf5;
+ 
+ namespace {
+diff --git a/dnf5-plugins/reposync_plugin/reposync_cmd_plugin.cpp b/dnf5-plugins/reposync_plugin/reposync_cmd_plugin.cpp
+index 10702cdc21..3c5291146b 100644
+--- a/dnf5-plugins/reposync_plugin/reposync_cmd_plugin.cpp
++++ b/dnf5-plugins/reposync_plugin/reposync_cmd_plugin.cpp
+@@ -21,6 +21,7 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace dnf5;
+diff --git a/libdnf5-plugins/appstream/appstream.cpp b/libdnf5-plugins/appstream/appstream.cpp
+index 4ab91fb550..63871c7165 100644
+--- a/libdnf5-plugins/appstream/appstream.cpp
++++ b/libdnf5-plugins/appstream/appstream.cpp
+@@ -24,6 +24,7 @@
+ #include <libdnf5/repo/repo.hpp>
+ #include <libdnf5/repo/repo_query.hpp>
+ 
++#include <cstring>
+ #include <iostream>
+ 
+ using namespace libdnf5;
+diff --git a/libdnf5-plugins/expired-pgp-keys/expired-pgp-keys.cpp b/libdnf5-plugins/expired-pgp-keys/expired-pgp-keys.cpp
+index 81854b477a..0ca34c2d74 100644
+--- a/libdnf5-plugins/expired-pgp-keys/expired-pgp-keys.cpp
++++ b/libdnf5-plugins/expired-pgp-keys/expired-pgp-keys.cpp
+@@ -34,10 +34,10 @@
+ #include <rpm/rpmpgp.h>
+ #endif
+ #include <rpm/rpmts.h>
+-#include <string.h>
+ 
+ #include <chrono>
+ #include <cstdio>
++#include <cstring>
+ #include <memory>
+ #include <string>
+ 
+@@ -268,7 +268,7 @@ void ExpiredPgpKeys::process_expired_pgp_keys(const libdnf5::base::Transaction &
+         // (Or use lr_gpg_import_key_from_memory() directly?)
+         auto key_tfile = libdnf5::utils::fs::TempFile("key");
+         auto & key_ffile = key_tfile.open_as_file("w+");
+-        key_ffile.write(raw_key, strlen(raw_key));
++        key_ffile.write(raw_key, std::strlen(raw_key));
+         key_ffile.flush();
+         free(raw_key);
+ 
+diff --git a/libdnf5-plugins/local/local.cpp b/libdnf5-plugins/local/local.cpp
+index bc3ab52752..5b11ea4619 100644
+--- a/libdnf5-plugins/local/local.cpp
++++ b/libdnf5-plugins/local/local.cpp
+@@ -14,6 +14,7 @@
+ #include <libdnf5/utils/fs/utils.hpp>
+ #include <sys/wait.h>
+ 
++#include <cstring>
+ 
+ constexpr const char * LOCAL_REPO_NAME_GPGCHECK{"_dnf_local"};
+ constexpr const char * LOCAL_REPO_NAME_NOGPGCHECK{"_dnf_local_nogpgcheck"};
+diff --git a/libdnf5-plugins/rhsm/rhsm.cpp b/libdnf5-plugins/rhsm/rhsm.cpp
+index 9687eeaa79..1a58e4c1a0 100644
+--- a/libdnf5-plugins/rhsm/rhsm.cpp
++++ b/libdnf5-plugins/rhsm/rhsm.cpp
+@@ -24,6 +24,7 @@
+ #include <rhsm/rhsm.h>
+ #include <unistd.h>
+ 
++#include <cstring>
+ 
+ using namespace libdnf5;
+ 
+diff --git a/test/tutorial-templates/dnf5-plugin/template_cmd_plugin.cpp b/test/tutorial-templates/dnf5-plugin/template_cmd_plugin.cpp
+index b2fc7b8ffd..a28fb0eb8e 100644
+--- a/test/tutorial-templates/dnf5-plugin/template_cmd_plugin.cpp
++++ b/test/tutorial-templates/dnf5-plugin/template_cmd_plugin.cpp
+@@ -2,6 +2,8 @@
+ 
+ #include <dnf5/iplugin.hpp>
+ 
++#include <cstring>
++
+ using namespace dnf5;
+ 
+ namespace {
+diff --git a/test/tutorial-templates/libdnf5-plugin/template.cpp b/test/tutorial-templates/libdnf5-plugin/template.cpp
+index 804e055abb..1b3d2cec37 100644
+--- a/test/tutorial-templates/libdnf5-plugin/template.cpp
++++ b/test/tutorial-templates/libdnf5-plugin/template.cpp
+@@ -3,6 +3,7 @@
+ #include <libdnf5/plugin/iplugin.hpp>
+ 
+ #include <algorithm>
++#include <cstring>
+ 
+ using namespace libdnf5;
+ 
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
deleted file mode 100644
index 64ea7874d3..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:29:07 +0200
-Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ ELSE ()
-     MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
- ENDIF()
- 
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('purelib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('purelib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
- 
- ADD_SUBDIRECTORY (dnf)
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
deleted file mode 100644
index eb46113f3a..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:29:37 +0200
-Subject: [PATCH] Run python scripts using env
-
-Otherwise the build tools hardcode the python path into them.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- bin/dnf-automatic.in | 2 +-
- bin/dnf.in           | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 17e35a05..28827e38 100755
---- a/bin/dnf-automatic.in
-+++ b/bin/dnf-automatic.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- # dnf-automatic executable.
- #
- # Copyright (C) 2014-2016 Red Hat, Inc.
-diff --git a/bin/dnf.in b/bin/dnf.in
-index 55ceb3f2..e38973c7 100755
---- a/bin/dnf.in
-+++ b/bin/dnf.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- # The dnf executable script.
- #
- # Copyright (C) 2012-2016 Red Hat, Inc.
diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
deleted file mode 100644
index 31bbb4032b..0000000000
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ /dev/null
@@ -1,96 +0,0 @@
-SUMMARY = "Package manager forked from Yum, using libsolv as a dependency resolver"
-DESCRIPTION = "Software package manager that installs, updates, and removes \
-packages on RPM-based Linux distributions. It automatically computes \
-dependencies and determines the actions required to install packages."
-HOMEPAGE = "https://github.com/rpm-software-management/dnf"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
-                    "
-
-SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https;tag=${PV} \
-           file://0001-Corretly-install-tmpfiles.d-configuration.patch \
-           file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
-           file://0005-Do-not-prepend-installroot-to-logdir.patch \
-           file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0030-Run-python-scripts-using-env.patch \
-           file://0001-set-python-path-for-completion_helper.patch \
-           file://0001-lock.py-fix-Exception-handling.patch \
-           "
-
-SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
-
-SRCREV = "e47634fbe3565d0580e89ec21adb7c1b308642ce"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-
-inherit cmake gettext bash-completion setuptools3-base systemd
-
-DEPENDS += "libdnf librepo libcomps"
-
-# manpages generation requires http://www.sphinx-doc.org/
-EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += " \
-  python3-core \
-  python3-codecs \
-  python3-ctypes \
-  python3-netclient \
-  python3-email \
-  python3-threading \
-  python3-logging \
-  python3-fcntl \
-  librepo \
-  python3-shell \
-  libcomps \
-  libdnf \
-  python3-sqlite3 \
-  python3-compression \
-  python3-rpm \
-  python3-json \
-  python3-curses \
-  python3-misc \
-  "
-
-RDEPENDS:${PN}:class-native = ""
-
-RRECOMMENDS:${PN}:class-target += "gnupg"
-
-# Create a symlink called 'dnf' as 'make install' does not do it, but
-# .spec file in dnf source tree does (and then Fedora and dnf documentation
-# says that dnf binary is plain 'dnf').
-do_install:append() {
-        ln -rs ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
-        ln -rs ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automatic
-}
-
-# Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
-do_install:append:class-native() {
-        create_wrapper ${D}/${bindir}/dnf \
-                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-}
-
-do_install:append:class-nativesdk() {
-        create_wrapper ${D}/${bindir}/dnf \
-                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-}
-
-SYSTEMD_SERVICE:${PN} = "dnf-makecache.service dnf-makecache.timer \
-                         dnf-automatic.service dnf-automatic.timer \
-                         dnf-automatic-download.service dnf-automatic-download.timer \
-                         dnf-automatic-install.service dnf-automatic-install.timer \
-                         dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
-"
-SYSTEMD_AUTO_ENABLE ?= "disable"
-
-SKIP_RECIPE[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
-
-# Packages for testing purposes
-PACKAGES += "${PN}-test-main ${PN}-test-dep"
-ALLOW_EMPTY:${PN}-test-main = "1"
-ALLOW_EMPTY:${PN}-test-dep = "1"
-RRECOMMENDS:${PN}-test-main = "${PN}-test-dep"
diff --git a/meta/recipes-devtools/dnf/dnf_5.4.4.0.bb b/meta/recipes-devtools/dnf/dnf_5.4.4.0.bb
new file mode 100644
index 0000000000..1d2ada961f
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf_5.4.4.0.bb
@@ -0,0 +1,181 @@
+SUMMARY = "DNF package manager rewritten in C++, using libsolv as a dependency resolver"
+DESCRIPTION = "\
+    DNF5 is a command-line package manager that automates the process of \
+    installing, upgrading, configuring, and removing computer programs in a \
+    consistent manner. It supports RPM packages, modulemd modules, and comps \
+    groups and environments. \
+"
+HOMEPAGE = "https://github.com/rpm-software-management/dnf5"
+BUGTRACKER = "https://github.com/rpm-software-management/dnf5/issues"
+CVE_PRODUCT = "rpm:dnf5 rpm-software-management:dnf5"
+SECTION = "base"
+
+LICENSE = "LGPL-2.1-or-later AND GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING.md;md5=9733192df318d0f806fd668b92ba0ba6 \
+    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://lgpl-2.1.txt;md5=4b54a1fd55a448865a0b32d41598759d \
+"
+
+DEPENDS = "\
+    fmt \
+    glib-2.0 \
+    json-c \
+    libmodulemd \
+    librepo \
+    libsolv \
+    libtoml11 \
+    libxml2 \
+    sqlite3 \
+    util-linux \
+"
+
+SRC_URI = "\
+    git://github.com/rpm-software-management/dnf5.git;protocol=https;branch=main;tag=${PV} \
+    file://0002-cmake-set-CMP0190-to-OLD.patch \
+    file://0003-Do-not-hardcode-system_cachedir.patch \
+    file://0004-add-support-for-gcc-12-and-below.patch \
+    file://0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch \
+    file://0006-include-cstring-where-std-strcmp-is-used.patch \
+"
+SRC_URI:append:class-native = " file://0001-Do-not-hardcode-the-systemd-unit-directory.patch"
+SRCREV = "8a8e234809ebb898c488b0efbdde86f1c958a5c4"
+
+inherit bash-completion cmake gettext pkgconfig siteinfo systemd
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3targetconfig', '', d)}
+
+PACKAGECONFIG[acl] = "-DWITH_ACL=ON,-DWITH_ACL=OFF,acl"
+PACKAGECONFIG[dnfdaemon-client] = "-DWITH_DNF5DAEMON_CLIENT=ON,-DWITH_DNF5DAEMON_CLIENT=OFF,sdbus-c++"
+PACKAGECONFIG[dnfdaemon-server] = "-DWITH_DNF5DAEMON_SERVER=ON,-DWITH_DNF5DAEMON_SERVER=OFF,sdbus-c++"
+PACKAGECONFIG[plugins] = "-DWITH_DNF5_PLUGINS=ON,-DWITH_DNF5_PLUGINS=OFF,curl sdbus-c++ zlib"
+PACKAGECONFIG[plugin-actions] = "-DWITH_PLUGIN_ACTIONS=ON,-DWITH_PLUGIN_ACTIONS=OFF"
+PACKAGECONFIG[plugin-appstream] = "-DWITH_PLUGIN_APPSTREAM=ON,-DWITH_PLUGIN_APPSTREAM=OFF,appstream"
+PACKAGECONFIG[plugin-expired-pgp-keys] = "-DWITH_PLUGIN_EXPIRED_PGP_KEYS=ON,-DWITH_PLUGIN_EXPIRED_PGP_KEYS=OFF,gnupg"
+PACKAGECONFIG[plugin-local] = "-DWITH_PLUGIN_LOCAL=ON,-DWITH_PLUGIN_LOCAL=OFF"
+
+# sdbus-c++ and journalctl integration.
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON -DWITH_PLUGIN_SYSTEMD_INHIBIT=ON,-DWITH_SYSTEMD=OFF -DWITH_PLUGIN_SYSTEMD_INHIBIT=OFF,sdbus-c++"
+
+# build options - bindings
+PACKAGECONFIG[python3] = "-DWITH_PYTHON3=ON,-DWITH_PYTHON3=OFF,python3 swig-native"
+
+# No sdbus-c++-native package.
+PACKAGECONFIG:remove:class-native = "\
+    dnfdaemon-client \
+    dnfdaemon-server \
+    plugins \
+    plugin-manifest \
+    systemd \
+"
+
+PACKAGE_BEFORE_PN += "\
+    ${PN}-dnfdaemon-server \
+    ${PN}-plugins \
+    ${PN}-python3 \
+    ${PN}-systemd \
+"
+
+# manpages generation requires http://www.sphinx-doc.org/
+EXTRA_OECMAKE:append = " \
+    -DENABLE_SOLV_FOCUSNEW=ON \
+    -DWITH_DNF5_OBSOLETES_DNF=OFF \
+    -DWITH_DNF5=ON \
+    -DWITH_GO=OFF \
+    -DWITH_HTML=OFF \
+    -DWITH_LIBDNF5_CLI=ON \
+    -DWITH_MAN=OFF \
+    -DWITH_PERL5=OFF \
+    -DWITH_PLUGIN_RHSM=OFF \
+    -DWITH_RUBY=OFF \
+    -DWITH_TESTS=OFF \
+    -DWITH_PLUGIN_MANIFEST=OFF \
+"
+
+# No sdbus-c++-native package exists so remove all options that depend on it.
+EXTRA_OECMAKE:append:class-native = " \
+    -DWITH_DNF5DAEMON_CLIENT=OFF \
+    -DWITH_DNF5DAEMON_SERVER=OFF \
+    -DWITH_DNF5_PLUGINS=OFF \
+    -DWITH_PLUGIN_MANIFEST=OFF \
+    -DWITH_SYSTEMD=OFF \
+"
+
+# Create a symlink called 'dnf' as 'make install' does not do it, but
+# .spec file in dnf source tree does (and then Fedora and dnf documentation
+# says that dnf binary is plain 'dnf').
+do_install:append() {
+    ln -rs ${D}/${bindir}/dnf5 ${D}/${bindir}/dnf
+    install -d ${D}${sysconfdir}/dnf
+
+    # Breaks dnf because the builddep plugin is provided in the
+    # dnf-plugins-core package which is not available in oe-core.
+    rm -f ${D}${datadir}/dnf5/aliases.d/compatibility-plugins.conf
+}
+
+# Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
+do_install:append:class-native() {
+    create_wrapper ${D}/${bindir}/dnf \
+        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
+        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+        RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
+do_install:append:class-nativesdk() {
+    create_wrapper ${D}/${bindir}/dnf \
+        RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
+        RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
+# Packages for testing purposes
+PACKAGES += "${PN}-test-main ${PN}-test-dep"
+
+FILES:${PN} += "\
+    ${bindir}/dnf* \
+    ${datadir}/dbus-1/system-services/org.rpm.dnf.v0.service \
+    ${datadir}/dnf5 \
+    ${datadir}/polkit-1/actions/org.rpm.dnf* \
+    ${datadir}/polkit-1/rules.d/org.rpm.dnf* \
+    ${datadir}/zsh/site-functions/_dnf5 \
+    ${libdir}/dnf5 \
+    ${libdir}/libdnf5* \
+    ${sysconfdir}/dnf \
+"
+
+FILES:${PN}-bash-completion += "\
+    ${datadir}/bash-completion/completions/dnf5 \
+"
+
+FILES:${PN}-dnfdaemon-server += "\
+    ${systemd_system_unitdir}/dnf5daemon-server.service \
+    ${datadir}/dbus-1/interfaces/org.rpm.dnf* \
+    ${datadir}/dbus-1/system.d/org.rpm.dnf* \
+"
+
+FILES:${PN}-plugins += "\
+    ${systemd_system_unitdir}/dnf-automatic.service \
+    ${systemd_system_unitdir}/dnf-automatic.timer \
+    ${systemd_system_unitdir}/dnf5-automatic.service \
+    ${systemd_system_unitdir}/dnf5-automatic.timer \
+"
+
+FILES:${PN}-python3 += "\
+    ${libdir}/${PYTHON_DIR}/site-packages/libdnf* \
+"
+
+FILES:${PN}-systemd += "\
+    ${systemd_system_unitdir}/dnf5-makecache.service \
+    ${systemd_system_unitdir}/dnf5-makecache.timer \
+    ${systemd_system_unitdir}/dnf5-offline-transaction-cleanup.service \
+    ${systemd_system_unitdir}/dnf5-offline-transaction.service \
+"
+
+SYSTEMD_AUTO_ENABLE ?= "disable"
+
+RRECOMMENDS:${PN}:class-target += "bash-completion gnupg"
+RRECOMMENDS:${PN}-test-main = "${PN}-test-dep"
+ALLOW_EMPTY:${PN}-test-main = "1"
+ALLOW_EMPTY:${PN}-test-dep = "1"
+
+SKIP_RECIPE[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due to disabled rpm support in libsolv', d)}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


