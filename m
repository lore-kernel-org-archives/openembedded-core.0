Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 68A5A731E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 23:03:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 05 Jan 2016 15:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,526,1444719600"; d="scan'208,223";a="24201064"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.151])
	([10.219.5.151])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jan 2016 15:03:16 -0800
To: Matt Madison <matt@madison.systems>
References: <1450449271-28582-1-git-send-email-matt@madison.systems>
	<568ADC82.4040009@linux.intel.com>
	<CAGgRHJp9ERz00TSoTB1sYUT=M=1XRN-+v5YAuiG0XwdHj2d3Xw@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <568C4C15.9000808@linux.intel.com>
Date: Tue, 5 Jan 2016 17:04:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJp9ERz00TSoTB1sYUT=M=1XRN-+v5YAuiG0XwdHj2d3Xw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Debian multilib packaging fixes
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
X-List-Received-Date: Tue, 05 Jan 2016 23:03:18 -0000
X-Groupsio-MsgNum: 75482
Content-Type: multipart/mixed; boundary="------------010508060508050900080002"

--------------010508060508050900080002
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

I fixed the problem and add a 4 patch and sign-off your first tree
patches also i tested your changes building images in machines: x86-64
(sato, minimal, multilib), x86(minimal), arm(minimal) and mips(minimal).
Details below...

Can you send the 4 patches again?

	alimon

On 01/05/2016 11:00 AM, Matt Madison wrote:
> On Mon, Jan 4, 2016 at 12:56 PM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> Hi Matt,
>>
>> Sorry for the delay in the response, i'll test again your patches with
>> the new one and the same error appears when build
>> core-image-full-cmdline or core-image-sato.
> 
> No problem, I figured things would be slow around the holidays.
> 
> I think the problem with this specific configuration has to do with
> trying to add lib32-connman to an image build that already had a
> dependency on connman (from packagegroup-core-x11-sato-base, for
> example).  I modified the DpkgPM class in package-manager.py to run an
> 'apt-get -f install' to fix the dependencies that APT thinks are
> broken if the initial installation attempt fails.  That appears to
> work around the issue adequately, and I see APT reporting


I figured out the issue is related to addition of log check feature into
rootfs image (that's good) but i didn't take into account DpkgPM because
it assumes that can be missing dependencies and executes apt-get -f
install, see the final patch attached.

I'll make the changes to the AB multilib buildset for add package_deb to
the CI cycle.


> 
>    ignore old unsatisfied important dependency on connman-conf:amd64
> 
> which is there because it cannot install both connman-conf and
> lib32-connman-conf, since PACKAGE_ARCH is ${MACHINE_ARCH} in the
> connman-conf recipe.
> 
> For my particular application, I didn't have any conflicts between
> 32-bit and 64-bit packages, so the patches I submitted were enough.
> 
> I'm not sure what the right answer for this should be; hacking in the
> additional 'apt-get -f install' works around the problem here, but I'm
> not sure it solves the general problem correctly.   APT implements the
> Debian policy, and it's complicated - to do it "right" , we'd have to
> ensure that all of the packages get tagged with the right combination
> of Architecture and Multi-Arch headers, and I think we'd have to
> change how we write dependencies in the control files to use the
> '<pkg>:any' notation when that's appropriate.  I'm not even sure if
> that could be computed automatically; it could require a significant
> amount of manual review.

I agree, there are work here to do to make consistent with debian way
but for now is a good start.

> 
> Thanks,
> -Matt
> 
>>
>>         MACHINE ??= "qemux86-64"
>>
>>         IMAGE_INSTALL_append = " lib32-connman"
>>         require conf/multilib.conf
>>         MULTILIBS = "multilib:lib32"
>>         DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>>
>> I'm reviewing if this an error in the meta data (because
>> core-image-minimal builds) or in the class.
>>
>> Best regards,
>>         alimon
>>
>> On 12/18/2015 08:34 AM, Matt Madison wrote:
>>> This adds a third patch that fixes the problem where APT couldn't
>>> resolve dependencies between when two packages of different architectures
>>> both depended on an allarch package.
>>>
>>> Matt Madison (3):
>>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>>     function
>>>   package_manager.py: fixes for multilib deb packaging builds
>>>   package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages
>>>
>>>  meta/classes/cross-canadian.bbclass |  2 +-
>>>  meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++----------
>>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>>  3 files changed, 39 insertions(+), 17 deletions(-)
>>>

--------------010508060508050900080002
Content-Type: text/x-diff;
 name="0001-package_deb.bbclass-cross-canadian.bbclass-DPKG_ARCH.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-package_deb.bbclass-cross-canadian.bbclass-DPKG_ARCH.pa";
 filename*1="tch"

From 059def3b1ee80c47dec9e7614f9f5df0bccf0385 Mon Sep 17 00:00:00 2001
From: Matt Madison <matt@madison.systems>
Date: Fri, 18 Dec 2015 06:34:29 -0800
Subject: [PATCH 1/4] package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH
 mapping function
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have DPKG_ARCH set by directly invoking a mapping function, rather
than using an anonymous Python function modify the variable under
the hood, so we can have proper handling of overrides.

Also bring in some additional mappings to Debian architecture names
that weren't being handled.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/cross-canadian.bbclass |  2 +-
 meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 7b26ed6..e07b1bd 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -103,7 +103,7 @@ HOST_LD_ARCH = "${SDK_LD_ARCH}"
 HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
 #assign DPKG_ARCH
-DPKG_ARCH = "${SDK_ARCH}"
+DPKG_ARCH = "${@debian_arch_map(d.getVar('SDK_ARCH', True), '')}"
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5feeeb0..8d27adf 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -6,7 +6,7 @@ inherit package
 
 IMAGE_PKGTYPE ?= "deb"
 
-DPKG_ARCH ?= "${TARGET_ARCH}" 
+DPKG_ARCH ?= "${@debian_arch_map(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True))}"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
@@ -14,6 +14,28 @@ APTCONF_TARGET = "${WORKDIR}"
 
 APT_ARGS = "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
 
+def debian_arch_map(arch, tune):
+    tune_features = tune.split()
+    if arch in ["i586", "i686"]:
+        return "i386"
+    if arch == "x86_64":
+        if "mx32" in tune_features:
+            return "x32"
+        return "amd64"
+    if arch.startswith("mips"):
+        endian = ["el", ""]["bigendian" in tune_features]
+        if "n64" in tune_features:
+            return "mips64" + endian
+        if "n32" in tune_features:
+            return "mipsn32" + endian
+        return "mips" + endian
+    if arch == "powerpc":
+        return arch + ["", "spe"]["spe" in tune_features]
+    if arch == "aarch64":
+        return "arm64"
+    if arch == "arm":
+        return arch + ["el", "hf"]["callconvention-hard" in tune_features]
+    return arch
 #
 # install a bunch of packages using apt
 # the following shell variables needs to be set before calling this func:
@@ -288,6 +310,8 @@ python do_package_deb () {
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 }
+# Indirect references to these vars
+do_package_write_deb[vardeps] += "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE"
 # Otherwise allarch packages may change depending on override configuration
 do_package_deb[vardepsexclude] = "OVERRIDES"
 
@@ -311,15 +335,6 @@ python () {
         deps = ' dpkg-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_deb', 'depends', deps)
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
-
-    # Map TARGET_ARCH to Debian's ideas about architectures
-    darch = d.getVar('DPKG_ARCH', True)
-    if darch in ["x86", "i486", "i586", "i686", "pentium"]:
-         d.setVar('DPKG_ARCH', 'i386')
-    elif darch == "x86_64":
-         d.setVar('DPKG_ARCH', 'amd64')
-    elif darch == "arm":
-         d.setVar('DPKG_ARCH', 'armel')
 }
 
 python do_package_write_deb () {
-- 
2.1.4


--------------010508060508050900080002
Content-Type: text/x-diff;
 name="0002-package_manager.py-fixes-for-multilib-deb-packaging-.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0002-package_manager.py-fixes-for-multilib-deb-packaging-.pa";
 filename*1="tch"

From e526b852a185bcdde6484eb3a88ff8ea7c08e24d Mon Sep 17 00:00:00 2001
From: Matt Madison <matt@madison.systems>
Date: Fri, 18 Dec 2015 06:34:30 -0800
Subject: [PATCH 2/4] package_manager.py: fixes for multilib deb packaging
 builds
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* tmp/deploy/deb subdirectories do not get hyphens replaced
  with underscores, so don't do that translation when building
  the sources list.

* Fix MULTILIB_VARIANTS handling to be more general and
  work for all architectures

* Also include a fix for a warning generated by apt
  due to missing apt/preferences.d directory.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 32afeaf..bc39721 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -247,7 +247,7 @@ class DpkgIndexer(Indexer):
                 if a not in pkg_archs:
                     arch_list.append(a)
 
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").split()
         arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in arch_list)
 
         apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
@@ -1775,7 +1775,7 @@ class DpkgPM(PackageManager):
         self.apt_args = d.getVar("APT_ARGS", True)
 
         self.all_arch_list = archs.split()
-        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").split()
         self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
 
         self._create_configs(archs, base_archs)
@@ -1966,6 +1966,7 @@ class DpkgPM(PackageManager):
         bb.utils.mkdirhier(self.apt_conf_dir)
         bb.utils.mkdirhier(self.apt_conf_dir + "/lists/partial/")
         bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
+        bb.utils.mkdirhier(self.apt_conf_dir + "/preferences.d/")
 
         arch_list = []
         for arch in self.all_arch_list:
@@ -2000,10 +2001,14 @@ class DpkgPM(PackageManager):
         base_arch_list = base_archs.split()
         multilib_variants = self.d.getVar("MULTILIB_VARIANTS", True);
         for variant in multilib_variants.split():
-            if variant == "lib32":
-                base_arch_list.append("i386")
-            elif variant == "lib64":
-                base_arch_list.append("amd64")
+            localdata = bb.data.createCopy(self.d)
+            variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
+            orig_arch = localdata.getVar("DPKG_ARCH", True)
+            localdata.setVar("DEFAULTTUNE", variant_tune)
+            bb.data.update_data(localdata)
+            variant_arch = localdata.getVar("DPKG_ARCH", True)
+            if variant_arch not in base_arch_list:
+                base_arch_list.append(variant_arch)
 
         with open(self.apt_conf_file, "w+") as apt_conf:
             with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
-- 
2.1.4


--------------010508060508050900080002
Content-Type: text/x-diff;
 name="0003-package_deb.bbclass-add-Multi-Arch-foreign-tag-to-al.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0003-package_deb.bbclass-add-Multi-Arch-foreign-tag-to-al.pa";
 filename*1="tch"

From 22a2a8425982403bed9cbde3e1d43db450b071da Mon Sep 17 00:00:00 2001
From: Matt Madison <matt@madison.systems>
Date: Fri, 18 Dec 2015 06:34:31 -0800
Subject: [PATCH 3/4] package_deb.bbclass: add 'Multi-Arch: foreign' tag to
 allarch packages
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This tells APT that it can use such packages to resolve dependencies
from packages of any architecture in a multilib build.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8d27adf..25218d0 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -161,6 +161,8 @@ python do_package_deb () {
             return l2
 
         ctrlfile.write("Package: %s\n" % pkgname)
+        if d.getVar('PACKAGE_ARCH', True) == "all":
+            ctrlfile.write("Multi-Arch: foreign\n")
         # check for required fields
         try:
             for (c, fs) in fields:
-- 
2.1.4


--------------010508060508050900080002
Content-Type: text/x-diff;
 name="0004-DpkgRootfs-Fix-logcheck_error-false-positive-when-us.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0004-DpkgRootfs-Fix-logcheck_error-false-positive-when-us.pa";
 filename*1="tch"

From b467e9813fd5ce414e3f4a449f02a0208dc408e4 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
Date: Tue, 5 Jan 2016 11:38:42 -0600
Subject: [PATCH 4/4] DpkgRootfs: Fix logcheck_error false-positive when use
 multilib
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rootfs with dpkg was failing due to false-positive in logcheck_error
because current logic of DpkgPM handles missing dependencies failure
using apt-get -f install [1][2].

This support was broken due to addition of logcheck and don't take into
account dpkgpm cases, in order to fix add an attr for specify expected
errors regex'es by package manager.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oe/rootfs.py#n659
[2] http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oe/package_manager.py#n2038

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a2af332..f677d03 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -63,6 +63,15 @@ class Rootfs(object):
                 if 'log_check' in line:
                     continue
 
+                if hasattr(self, 'log_check_expected_errors_regexes'):
+                    m = None
+                    for ee in self.log_check_expected_errors_regexes:
+                        m = re.search(ee, line)
+                        if m:
+                            break
+                    if m:
+                        continue
+
                 m = r.search(line)
                 if m:
                     found_error = 1
@@ -623,6 +632,10 @@ class DpkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir):
         super(DpkgRootfs, self).__init__(d)
         self.log_check_regex = '^E:'
+        self.log_check_expected_errors_regexes = \
+        [
+            "^E: Unmet dependencies."
+        ]
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
-- 
2.1.4


--------------010508060508050900080002--
