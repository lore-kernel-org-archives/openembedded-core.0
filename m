Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CDE8774BCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:53:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id h20-v6so2046871wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=suuQ9/s60H4S2RXxeVqmBX0K7YX22GL37AHhRCOSpII=;
	b=TYzthQq7xTSmSP6XFsOD2h2r+Sr9A5TvN02cM+OFJiztVXuB9OIv+elOCg4AAxytgp
	KNU1OPo/KC55/m4zGxfagABFiMOJSMOvym9+x0cMXK3CCjgMyD7mhr5kVstiGLFsczfc
	S0ZrvEVK7TcF49JvXQH+MCGRohowQqFJh/WGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=suuQ9/s60H4S2RXxeVqmBX0K7YX22GL37AHhRCOSpII=;
	b=J1UCqyxYoZ+pkvZ/yPm1UAL15wBtK+TVNDogXT36j8TcsUKqFyFA1vkXlBSs0DzQMS
	in1aNGjf/puCVkUDj6fvfPnxcldMJ5Gw/neQkIGwmIqsPaTU9VawM8ps4qIpvZA+m1pR
	NhRXvm3UXOOeFzL7kTZ9GPi2qGlKRmKz1wF18rXU6BSFZqfV85HeNFd3BydhiRiq3hZL
	Ea4Sr3iN65scxCVYwvy1o4X3pbPc7Y5xc+4UzcXHko7eASVV+XmiUMKjOhFMUnzcI+0T
	ydJFJGRSLbqA5uUcY0ql+UfQRLD9Z3s7L0g0nYgr4a4BCvtqGdwzKZ9sonewwD8962y/
	YbYw==
X-Gm-Message-State: AOUpUlHecolrh2QuHGHg+gu/0Rr/w3q4X5WK3bSk37fMvJIEULeEpUVP
	RwHGvaJMF5lQhynXBpp8KGeGdrX4+iPzHQ==
X-Google-Smtp-Source: AAOMgpfyB85J4/thb2dGdhEZdywUXm0Zu8x14e/HvzUnZIrOl2lUX7PsHeIH8u9P2de5asF/N1VZBA==
X-Received: by 2002:a1c:8952:: with SMTP id l79-v6mr1544033wmd.7.1532429602802;
	Tue, 24 Jul 2018 03:53:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm2037488wmh.19.2018.07.24.03.53.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 03:53:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 11:53:14 +0100
Message-Id: <20180724105316.2085-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
References: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] license: Split image license functions to a separate class
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
X-List-Received-Date: Tue, 24 Jul 2018 10:53:23 -0000

This means the image code is only included in image recipes through
the IMAGE_CLASSES variable.

This sets things up to allow us to fix image deploy dependency problems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass       | 284 +----------------------------
 meta/classes/license_image.bbclass | 284 +++++++++++++++++++++++++++++
 2 files changed, 285 insertions(+), 283 deletions(-)
 create mode 100644 meta/classes/license_image.bbclass

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 141af5de4d3..2ac15a1bc89 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -16,284 +16,6 @@ addtask populate_lic after do_patch before do_build
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
-python write_package_manifest() {
-    # Get list of installed packages
-    license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
-    bb.utils.mkdirhier(license_image_dir)
-    from oe.rootfs import image_list_installed_packages
-    from oe.utils import format_pkg_list
-
-    pkgs = image_list_installed_packages(d)
-    output = format_pkg_list(pkgs)
-    open(os.path.join(license_image_dir, 'package.manifest'),
-        'w+').write(output)
-}
-
-python write_deploy_manifest() {
-    license_deployed_manifest(d)
-}
-
-python license_create_manifest() {
-    import oe.packagedata
-    from oe.rootfs import image_list_installed_packages
-
-    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS')
-    if build_images_from_feeds == "1":
-        return 0
-
-    pkg_dic = {}
-    for pkg in sorted(image_list_installed_packages(d)):
-        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
-                                'runtime-reverse', pkg)
-        pkg_name = os.path.basename(os.readlink(pkg_info))
-
-        pkg_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
-        if not "LICENSE" in pkg_dic[pkg_name].keys():
-            pkg_lic_name = "LICENSE_" + pkg_name
-            pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
-
-    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                        d.getVar('IMAGE_NAME'), 'license.manifest')
-    write_license_files(d, rootfs_license_manifest, pkg_dic)
-}
-
-def write_license_files(d, license_manifest, pkg_dic):
-    import re
-
-    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
-    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
-    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
-
-    with open(license_manifest, "w") as license_file:
-        for pkg in sorted(pkg_dic):
-            if bad_licenses:
-                try:
-                    (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
-                        oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
-                        bad_licenses, canonical_license, d)
-                except oe.license.LicenseError as exc:
-                    bb.fatal('%s: %s' % (d.getVar('P'), exc))
-            else:
-                pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
-                pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
-                pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
-
-            if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
-                # Rootfs manifest
-                license_file.write("PACKAGE NAME: %s\n" % pkg)
-                license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
-                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
-                license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
-
-                # If the package doesn't contain any file, that is, its size is 0, the license
-                # isn't relevant as far as the final image is concerned. So doing license check
-                # doesn't make much sense, skip it.
-                if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
-                    continue
-            else:
-                # Image manifest
-                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
-                license_file.write("VERSION: %s\n" % pkg_dic[pkg]["PV"])
-                license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICENSE"])
-                license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES"])
-
-            for lic in pkg_dic[pkg]["LICENSES"]:
-                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                        pkg_dic[pkg]["PN"], "generic_%s" % 
-                                        re.sub('\+', '', lic))
-                # add explicity avoid of CLOSED license because isn't generic
-                if lic == "CLOSED":
-                   continue
-
-                if not os.path.exists(lic_file):
-                   bb.warn("The license listed %s was not in the "\ 
-                            "licenses collected for recipe %s" 
-                            % (lic, pkg_dic[pkg]["PN"]))
-
-    # Two options here:
-    # - Just copy the manifest
-    # - Copy the manifest and the license directories
-    # With both options set we see a .5 M increase in core-image-minimal
-    copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
-    copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
-    if copy_lic_manifest == "1":
-        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS'), 
-                                'usr', 'share', 'common-licenses')
-        bb.utils.mkdirhier(rootfs_license_dir)
-        rootfs_license_manifest = os.path.join(rootfs_license_dir,
-                os.path.split(license_manifest)[1])
-        if not os.path.exists(rootfs_license_manifest):
-            os.link(license_manifest, rootfs_license_manifest)
-
-        if copy_lic_dirs == "1":
-            for pkg in sorted(pkg_dic):
-                pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
-                bb.utils.mkdirhier(pkg_rootfs_license_dir)
-                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                            pkg_dic[pkg]["PN"]) 
-
-                pkg_manifest_licenses = [canonical_license(d, lic) \
-                        for lic in pkg_dic[pkg]["LICENSES"]]
-
-                licenses = os.listdir(pkg_license_dir)
-                for lic in licenses:
-                    rootfs_license = os.path.join(rootfs_license_dir, lic)
-                    pkg_license = os.path.join(pkg_license_dir, lic)
-                    pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
-
-                    if re.match("^generic_.*$", lic):
-                        generic_lic = canonical_license(d,
-                                re.search("^generic_(.*)$", lic).group(1))
-
-                        # Do not copy generic license into package if isn't
-                        # declared into LICENSES of the package.
-                        if not re.sub('\+$', '', generic_lic) in \
-                                [re.sub('\+', '', lic) for lic in \
-                                 pkg_manifest_licenses]:
-                            continue
-
-                        if oe.license.license_ok(generic_lic,
-                                bad_licenses) == False:
-                            continue
-
-                        if not os.path.exists(rootfs_license):
-                            os.link(pkg_license, rootfs_license)
-
-                        if not os.path.exists(pkg_rootfs_license):
-                            os.symlink(os.path.join('..', lic), pkg_rootfs_license)
-                    else:
-                        if (oe.license.license_ok(canonical_license(d,
-                                lic), bad_licenses) == False or
-                                os.path.exists(pkg_rootfs_license)):
-                            continue
-
-                        os.link(pkg_license, pkg_rootfs_license)
-
-
-def license_deployed_manifest(d):
-    """
-    Write the license manifest for the deployed recipes.
-    The deployed recipes usually includes the bootloader
-    and extra files to boot the target.
-    """
-
-    dep_dic = {}
-    man_dic = {}
-    lic_dir = d.getVar("LICENSE_DIRECTORY")
-
-    dep_dic = get_deployed_dependencies(d)
-    for dep in dep_dic.keys():
-        man_dic[dep] = {}
-        # It is necessary to mark this will be used for image manifest
-        man_dic[dep]["IMAGE_MANIFEST"] = True
-        man_dic[dep]["PN"] = dep
-        man_dic[dep]["FILES"] = \
-            " ".join(get_deployed_files(dep_dic[dep]))
-        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
-            for line in f.readlines():
-                key,val = line.split(": ", 1)
-                man_dic[dep][key] = val[:-1]
-
-    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                    d.getVar('IMAGE_NAME'))
-    bb.utils.mkdirhier(lic_manifest_dir)
-    image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
-    write_license_files(d, image_license_manifest, man_dic)
-
-def get_deployed_dependencies(d):
-    """
-    Get all the deployed dependencies of an image
-    """
-
-    deploy = {}
-    # Get all the dependencies for the current task (rootfs).
-    # Also get EXTRA_IMAGEDEPENDS because the bootloader is
-    # usually in this var and not listed in rootfs.
-    # At last, get the dependencies from boot classes because
-    # it might contain the bootloader.
-    taskdata = d.getVar("BB_TASKDEPDATA", False)
-    depends = list(set([dep[0] for dep
-                    in list(taskdata.values())
-                    if not dep[0].endswith("-native")]))
-    extra_depends = d.getVar("EXTRA_IMAGEDEPENDS")
-    boot_depends = get_boot_dependencies(d)
-    depends.extend(extra_depends.split())
-    depends.extend(boot_depends)
-    depends = list(set(depends))
-
-    # To verify what was deployed it checks the rootfs dependencies against
-    # the SSTATE_MANIFESTS for "deploy" task.
-    # The manifest file name contains the arch. Because we are not running
-    # in the recipe context it is necessary to check every arch used.
-    sstate_manifest_dir = d.getVar("SSTATE_MANIFESTS")
-    archs = list(set(d.getVar("SSTATE_ARCHS").split()))
-    for dep in depends:
-        # Some recipes have an arch on their own, so we try that first.
-        special_arch = d.getVar("PACKAGE_ARCH_pn-%s" % dep)
-        if special_arch:
-            sstate_manifest_file = os.path.join(sstate_manifest_dir,
-                    "manifest-%s-%s.deploy" % (special_arch, dep))
-            if os.path.exists(sstate_manifest_file):
-                deploy[dep] = sstate_manifest_file
-                continue
-
-        for arch in archs:
-            sstate_manifest_file = os.path.join(sstate_manifest_dir,
-                    "manifest-%s-%s.deploy" % (arch, dep))
-            if os.path.exists(sstate_manifest_file):
-                deploy[dep] = sstate_manifest_file
-                break
-
-    return deploy
-get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
-
-def get_boot_dependencies(d):
-    """
-    Return the dependencies from boot tasks
-    """
-
-    depends = []
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-    # Only bootimg includes the depends flag
-    boot_depends_string = d.getVarFlag("do_bootimg", "depends") or ""
-    boot_depends = [dep.split(":")[0] for dep
-                in boot_depends_string.split()
-                if not dep.split(":")[0].endswith("-native")]
-    for dep in boot_depends:
-        info_file = os.path.join(d.getVar("LICENSE_DIRECTORY"),
-                dep, "recipeinfo")
-        # If the recipe and dependency name is the same
-        if os.path.exists(info_file):
-            depends.append(dep)
-        # We need to search for the provider of the dependency
-        else:
-            for taskdep in taskdepdata.values():
-                # The fifth field contains what the task provides
-                if dep in taskdep[4]:
-                    info_file = os.path.join(
-                            d.getVar("LICENSE_DIRECTORY"),
-                            taskdep[0], "recipeinfo")
-                    if os.path.exists(info_file):
-                        depends.append(taskdep[0])
-                        break
-    return depends
-get_boot_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
-
-def get_deployed_files(man_file):
-    """
-    Get the files deployed from the sstate manifest
-    """
-
-    dep_files = []
-    excluded_files = []
-    with open(man_file, "r") as manifest:
-        all_files = manifest.read()
-    for f in all_files.splitlines():
-        if ((not (os.path.islink(f) or os.path.isdir(f))) and
-                not os.path.basename(f) in excluded_files):
-            dep_files.append(os.path.basename(f))
-    return dep_files
-
 python do_populate_lic() {
     """
     Populate LICENSE_DIRECTORY with licenses.
@@ -675,11 +397,7 @@ SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
-do_rootfs[recrdeptask] += "do_populate_lic"
-
-IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
-do_image[recrdeptask] += "do_populate_lic"
+IMAGE_CLASSES_append = " license_image"
 
 python do_populate_lic_setscene () {
     sstate_setscene(d)
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
new file mode 100644
index 00000000000..efeedce519f
--- /dev/null
+++ b/meta/classes/license_image.bbclass
@@ -0,0 +1,284 @@
+python write_package_manifest() {
+    # Get list of installed packages
+    license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
+    bb.utils.mkdirhier(license_image_dir)
+    from oe.rootfs import image_list_installed_packages
+    from oe.utils import format_pkg_list
+
+    pkgs = image_list_installed_packages(d)
+    output = format_pkg_list(pkgs)
+    open(os.path.join(license_image_dir, 'package.manifest'),
+        'w+').write(output)
+}
+
+python write_deploy_manifest() {
+    license_deployed_manifest(d)
+}
+
+python license_create_manifest() {
+    import oe.packagedata
+    from oe.rootfs import image_list_installed_packages
+
+    build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS')
+    if build_images_from_feeds == "1":
+        return 0
+
+    pkg_dic = {}
+    for pkg in sorted(image_list_installed_packages(d)):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
+                                'runtime-reverse', pkg)
+        pkg_name = os.path.basename(os.readlink(pkg_info))
+
+        pkg_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
+        if not "LICENSE" in pkg_dic[pkg_name].keys():
+            pkg_lic_name = "LICENSE_" + pkg_name
+            pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
+
+    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                        d.getVar('IMAGE_NAME'), 'license.manifest')
+    write_license_files(d, rootfs_license_manifest, pkg_dic)
+}
+
+def write_license_files(d, license_manifest, pkg_dic):
+    import re
+
+    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
+    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+
+    with open(license_manifest, "w") as license_file:
+        for pkg in sorted(pkg_dic):
+            if bad_licenses:
+                try:
+                    (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
+                        oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
+                        bad_licenses, canonical_license, d)
+                except oe.license.LicenseError as exc:
+                    bb.fatal('%s: %s' % (d.getVar('P'), exc))
+            else:
+                pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
+                pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
+                pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
+
+            if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
+                # Rootfs manifest
+                license_file.write("PACKAGE NAME: %s\n" % pkg)
+                license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
+                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+                license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
+
+                # If the package doesn't contain any file, that is, its size is 0, the license
+                # isn't relevant as far as the final image is concerned. So doing license check
+                # doesn't make much sense, skip it.
+                if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
+                    continue
+            else:
+                # Image manifest
+                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+                license_file.write("VERSION: %s\n" % pkg_dic[pkg]["PV"])
+                license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICENSE"])
+                license_file.write("FILES: %s\n\n" % pkg_dic[pkg]["FILES"])
+
+            for lic in pkg_dic[pkg]["LICENSES"]:
+                lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                        pkg_dic[pkg]["PN"], "generic_%s" % 
+                                        re.sub('\+', '', lic))
+                # add explicity avoid of CLOSED license because isn't generic
+                if lic == "CLOSED":
+                   continue
+
+                if not os.path.exists(lic_file):
+                   bb.warn("The license listed %s was not in the "\ 
+                            "licenses collected for recipe %s" 
+                            % (lic, pkg_dic[pkg]["PN"]))
+
+    # Two options here:
+    # - Just copy the manifest
+    # - Copy the manifest and the license directories
+    # With both options set we see a .5 M increase in core-image-minimal
+    copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
+    copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
+    if copy_lic_manifest == "1":
+        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS'), 
+                                'usr', 'share', 'common-licenses')
+        bb.utils.mkdirhier(rootfs_license_dir)
+        rootfs_license_manifest = os.path.join(rootfs_license_dir,
+                os.path.split(license_manifest)[1])
+        if not os.path.exists(rootfs_license_manifest):
+            os.link(license_manifest, rootfs_license_manifest)
+
+        if copy_lic_dirs == "1":
+            for pkg in sorted(pkg_dic):
+                pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
+                bb.utils.mkdirhier(pkg_rootfs_license_dir)
+                pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                            pkg_dic[pkg]["PN"]) 
+
+                pkg_manifest_licenses = [canonical_license(d, lic) \
+                        for lic in pkg_dic[pkg]["LICENSES"]]
+
+                licenses = os.listdir(pkg_license_dir)
+                for lic in licenses:
+                    rootfs_license = os.path.join(rootfs_license_dir, lic)
+                    pkg_license = os.path.join(pkg_license_dir, lic)
+                    pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
+
+                    if re.match("^generic_.*$", lic):
+                        generic_lic = canonical_license(d,
+                                re.search("^generic_(.*)$", lic).group(1))
+
+                        # Do not copy generic license into package if isn't
+                        # declared into LICENSES of the package.
+                        if not re.sub('\+$', '', generic_lic) in \
+                                [re.sub('\+', '', lic) for lic in \
+                                 pkg_manifest_licenses]:
+                            continue
+
+                        if oe.license.license_ok(generic_lic,
+                                bad_licenses) == False:
+                            continue
+
+                        if not os.path.exists(rootfs_license):
+                            os.link(pkg_license, rootfs_license)
+
+                        if not os.path.exists(pkg_rootfs_license):
+                            os.symlink(os.path.join('..', lic), pkg_rootfs_license)
+                    else:
+                        if (oe.license.license_ok(canonical_license(d,
+                                lic), bad_licenses) == False or
+                                os.path.exists(pkg_rootfs_license)):
+                            continue
+
+                        os.link(pkg_license, pkg_rootfs_license)
+
+
+def license_deployed_manifest(d):
+    """
+    Write the license manifest for the deployed recipes.
+    The deployed recipes usually includes the bootloader
+    and extra files to boot the target.
+    """
+
+    dep_dic = {}
+    man_dic = {}
+    lic_dir = d.getVar("LICENSE_DIRECTORY")
+
+    dep_dic = get_deployed_dependencies(d)
+    for dep in dep_dic.keys():
+        man_dic[dep] = {}
+        # It is necessary to mark this will be used for image manifest
+        man_dic[dep]["IMAGE_MANIFEST"] = True
+        man_dic[dep]["PN"] = dep
+        man_dic[dep]["FILES"] = \
+            " ".join(get_deployed_files(dep_dic[dep]))
+        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
+            for line in f.readlines():
+                key,val = line.split(": ", 1)
+                man_dic[dep][key] = val[:-1]
+
+    lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                    d.getVar('IMAGE_NAME'))
+    bb.utils.mkdirhier(lic_manifest_dir)
+    image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
+    write_license_files(d, image_license_manifest, man_dic)
+
+def get_deployed_dependencies(d):
+    """
+    Get all the deployed dependencies of an image
+    """
+
+    deploy = {}
+    # Get all the dependencies for the current task (rootfs).
+    # Also get EXTRA_IMAGEDEPENDS because the bootloader is
+    # usually in this var and not listed in rootfs.
+    # At last, get the dependencies from boot classes because
+    # it might contain the bootloader.
+    taskdata = d.getVar("BB_TASKDEPDATA", False)
+    depends = list(set([dep[0] for dep
+                    in list(taskdata.values())
+                    if not dep[0].endswith("-native")]))
+    extra_depends = d.getVar("EXTRA_IMAGEDEPENDS")
+    boot_depends = get_boot_dependencies(d)
+    depends.extend(extra_depends.split())
+    depends.extend(boot_depends)
+    depends = list(set(depends))
+
+    # To verify what was deployed it checks the rootfs dependencies against
+    # the SSTATE_MANIFESTS for "deploy" task.
+    # The manifest file name contains the arch. Because we are not running
+    # in the recipe context it is necessary to check every arch used.
+    sstate_manifest_dir = d.getVar("SSTATE_MANIFESTS")
+    archs = list(set(d.getVar("SSTATE_ARCHS").split()))
+    for dep in depends:
+        # Some recipes have an arch on their own, so we try that first.
+        special_arch = d.getVar("PACKAGE_ARCH_pn-%s" % dep)
+        if special_arch:
+            sstate_manifest_file = os.path.join(sstate_manifest_dir,
+                    "manifest-%s-%s.deploy" % (special_arch, dep))
+            if os.path.exists(sstate_manifest_file):
+                deploy[dep] = sstate_manifest_file
+                continue
+
+        for arch in archs:
+            sstate_manifest_file = os.path.join(sstate_manifest_dir,
+                    "manifest-%s-%s.deploy" % (arch, dep))
+            if os.path.exists(sstate_manifest_file):
+                deploy[dep] = sstate_manifest_file
+                break
+
+    return deploy
+get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
+
+def get_boot_dependencies(d):
+    """
+    Return the dependencies from boot tasks
+    """
+
+    depends = []
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    # Only bootimg includes the depends flag
+    boot_depends_string = d.getVarFlag("do_bootimg", "depends") or ""
+    boot_depends = [dep.split(":")[0] for dep
+                in boot_depends_string.split()
+                if not dep.split(":")[0].endswith("-native")]
+    for dep in boot_depends:
+        info_file = os.path.join(d.getVar("LICENSE_DIRECTORY"),
+                dep, "recipeinfo")
+        # If the recipe and dependency name is the same
+        if os.path.exists(info_file):
+            depends.append(dep)
+        # We need to search for the provider of the dependency
+        else:
+            for taskdep in taskdepdata.values():
+                # The fifth field contains what the task provides
+                if dep in taskdep[4]:
+                    info_file = os.path.join(
+                            d.getVar("LICENSE_DIRECTORY"),
+                            taskdep[0], "recipeinfo")
+                    if os.path.exists(info_file):
+                        depends.append(taskdep[0])
+                        break
+    return depends
+get_boot_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
+
+def get_deployed_files(man_file):
+    """
+    Get the files deployed from the sstate manifest
+    """
+
+    dep_files = []
+    excluded_files = []
+    with open(man_file, "r") as manifest:
+        all_files = manifest.read()
+    for f in all_files.splitlines():
+        if ((not (os.path.islink(f) or os.path.isdir(f))) and
+                not os.path.basename(f) in excluded_files):
+            dep_files.append(os.path.basename(f))
+    return dep_files
+
+ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
+do_rootfs[recrdeptask] += "do_populate_lic"
+
+IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
+do_image[recrdeptask] += "do_populate_lic"
+
-- 
2.17.1


