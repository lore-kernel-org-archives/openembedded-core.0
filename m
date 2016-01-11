Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0AF26FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:14:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2016 12:14:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,554,1444719600"; 
	d="scan'208,217";a="888405483"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.84])
	([10.219.16.84])
	by orsmga002.jf.intel.com with ESMTP; 11 Jan 2016 12:14:04 -0800
To: Pau Espin Pedrol <pespin.shar@gmail.com>
References: <cover.1452191688.git.mariano.lopez@linux.intel.com>
	<f6edbeb62feb634b8636529af4fd7a982146568f.1452191688.git.mariano.lopez@linux.intel.com>
	<CAEGpDuZ4V5P7C+w_PxeQ=Yd_jbX4rbUasRf1NPg2TrBbsBB7SA@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56940D17.6060107@linux.intel.com>
Date: Mon, 11 Jan 2016 14:14:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAEGpDuZ4V5P7C+w_PxeQ=Yd_jbX4rbUasRf1NPg2TrBbsBB7SA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] lib/oe/rootfs: Use list_pkgs() instead of list()
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
X-List-Received-Date: Mon, 11 Jan 2016 20:14:06 -0000
Content-Type: multipart/alternative;
	boundary="------------070603030209030309070902"

--------------070603030209030309070902
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2016 05:55 PM, Pau Espin Pedrol wrote:
> Hi,
>
> I don't have the env to test the patch anymore.
>
> However, I have a question on this patch. I inline the comment in the 
> code here, below the related lines:
>
> 2016-01-07 21:07 GMT+01:00 <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>>:
>
>     From: Mariano Lopez <mariano.lopez@linux.intel.com
>     <mailto:mariano.lopez@linux.intel.com>>
>
>     This patch changes the use list_pkgs() instead of list()
>     from class RpmPkgsList. The change is in two functions,
>     image_list_installed_packages from rootfs.py and
>     sdk_list_installed_packages from sdk.py.
>
>     With this change the functions calling the functions
>     listed above, must format the output as they required.
>     The formatting can be done using format_pkg_list() from
>     oe.utils.
>
>     The classes calling the afected functions are changed too
>     with this patch, to keep the same functionality using the
>     new data structure.
>
>     [YOCTO #7427]
>
>     Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com
>     <mailto:mariano.lopez@linux.intel.com>>
>     ---
>      meta/classes/buildhistory.bbclass        | 11 +++++++----
>      meta/classes/license.bbclass             |  8 ++++++--
>      meta/classes/populate_sdk_base.bbclass   |  8 ++++++--
>      meta/classes/rootfs-postcommands.bbclass |  5 +++--
>      meta/lib/oe/package_manager.py           | 18 ++++++++++--------
>      meta/lib/oe/rootfs.py                    |  8 ++++----
>      meta/lib/oe/sdk.py                       |  8 ++++----
>      7 files changed, 40 insertions(+), 26 deletions(-)
>
>     diff --git a/meta/classes/buildhistory.bbclass
>     b/meta/classes/buildhistory.bbclass
>     index 4153e58..a2f8ac7 100644
>     --- a/meta/classes/buildhistory.bbclass
>     +++ b/meta/classes/buildhistory.bbclass
>     @@ -337,18 +337,21 @@ def write_pkghistory(pkginfo, d):
>      def buildhistory_list_installed(d, rootfs_type="image"):
>          from oe.rootfs import image_list_installed_packages
>          from oe.sdk import sdk_list_installed_packages
>     +    from oe.utils import format_pkg_list
>
>          process_list = [('file', 'bh_installed_pkgs.txt'),\
>                          ('deps', 'bh_installed_pkgs_deps.txt')]
>
>     +    if rootfs_type == "image":
>     +        pkgs = image_list_installed_packages(d)
>     +    else:
>     +        pkgs = sdk_list_installed_packages(d, rootfs_type ==
>     "sdk_target")
>     +
>          for output_type, output_file in process_list:
>              output_file_full = os.path.join(d.getVar('WORKDIR',
>     True), output_file)
>
>              with open(output_file_full, 'w') as output:
>     -            if rootfs_type == "image":
>     - output.write(image_list_installed_packages(d, output_type))
>     -            else:
>     - output.write(sdk_list_installed_packages(d, rootfs_type ==
>     "sdk_target", output_type))
>     +            output.write(format_pkg_list(pkgs, output_type))
>
>      python buildhistory_list_installed_image() {
>          buildhistory_list_installed(d)
>     diff --git a/meta/classes/license.bbclass
>     b/meta/classes/license.bbclass
>     index 6651d55..fed42ca 100644
>     --- a/meta/classes/license.bbclass
>     +++ b/meta/classes/license.bbclass
>     @@ -21,8 +21,12 @@ python write_package_manifest() {
>          license_image_dir =
>     d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
>          bb.utils.mkdirhier(license_image_dir)
>          from oe.rootfs import image_list_installed_packages
>     +    from oe.utils import format_pkg_list
>     +
>     +    pkgs = image_list_installed_packages(d)
>     +    output = format_pkg_list(pkgs)
>          open(os.path.join(license_image_dir, 'package.manifest'),
>     - 'w+').write(image_list_installed_packages(d))
>     +        'w+').write(output)
>      }
>
>      python write_deploy_manifest() {
>     @@ -38,7 +42,7 @@ python license_create_manifest() {
>              return 0
>
>          pkg_dic = {}
>     -    for pkg in image_list_installed_packages(d).splitlines():
>     +    for pkg in sorted(image_list_installed_packages(d)):
>              pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
>                                      'runtime-reverse', pkg)
>              pkg_name = os.path.basename(os.readlink(pkg_info))
>     diff --git a/meta/classes/populate_sdk_base.bbclass
>     b/meta/classes/populate_sdk_base.bbclass
>     index 23dc115..26e06a5 100644
>     --- a/meta/classes/populate_sdk_base.bbclass
>     +++ b/meta/classes/populate_sdk_base.bbclass
>     @@ -62,20 +62,24 @@ SDK_TARGET_MANIFEST =
>     "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
>      SDK_HOST_MANIFEST =
>     "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
>      python write_target_sdk_manifest () {
>          from oe.sdk import sdk_list_installed_packages
>     +    from oe.utils import format_pkg_list
>          sdkmanifestdir =
>     os.path.dirname(d.getVar("SDK_TARGET_MANIFEST", True))
>     +    pkgs = sdk_list_installed_packages(d, True)
>          if not os.path.exists(sdkmanifestdir):
>              bb.utils.mkdirhier(sdkmanifestdir)
>          with open(d.getVar('SDK_TARGET_MANIFEST', True), 'w') as output:
>     -        output.write(sdk_list_installed_packages(d, True, 'ver'))
>     +        output.write(format_pkg_list(pkgs, 'ver'))
>      }
>
>      python write_host_sdk_manifest () {
>          from oe.sdk import sdk_list_installed_packages
>     +    from oe.utils import format_pkg_list
>          sdkmanifestdir =
>     os.path.dirname(d.getVar("SDK_HOST_MANIFEST", True))
>     +    pkgs = sdk_list_installed_packages(d, False)
>          if not os.path.exists(sdkmanifestdir):
>              bb.utils.mkdirhier(sdkmanifestdir)
>          with open(d.getVar('SDK_HOST_MANIFEST', True), 'w') as output:
>     -        output.write(sdk_list_installed_packages(d, False, 'ver'))
>     +        output.write(format_pkg_list(pkgs, 'ver'))
>      }
>
>      POPULATE_SDK_POST_TARGET_COMMAND_append = "
>     write_target_sdk_manifest ; "
>     diff --git a/meta/classes/rootfs-postcommands.bbclass
>     b/meta/classes/rootfs-postcommands.bbclass
>     index 96d3051..fe664b7 100644
>     --- a/meta/classes/rootfs-postcommands.bbclass
>     +++ b/meta/classes/rootfs-postcommands.bbclass
>     @@ -207,14 +207,15 @@ insert_feed_uris () {
>
>      python write_image_manifest () {
>          from oe.rootfs import image_list_installed_packages
>     +    from oe.utils import format_pkg_list
>
>          deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
>          link_name = d.getVar('IMAGE_LINK_NAME', True)
>          manifest_name = d.getVar('IMAGE_MANIFEST', True)
>
>     +    pkgs = image_list_installed_packages(d)
>          with open(manifest_name, 'w+') as image_manifest:
>     - image_manifest.write(image_list_installed_packages(d, 'ver'))
>     -        image_manifest.write("\n")
>     +        image_manifest.write(format_pkg_list(pkgs, "ver"))
>
>
> As far as I understand from patch 2/4 in this series, you get 
> something like "pkgInfo0\npkgInfoX\npkInfoLast" when using join() from 
> inside format_pkg_list(), so you get no "\n" at the end of the file, 
> and still you are also removing the line which adds the "\n" at the 
> end. That would break the workaround which was added to fix bug #7427 
> in yocto right? Or am I missing something?

You are right, I just notice that I sent the incorrect set of patches 
(this one doesn't list the last deb or ipk package). I'll send the 
correct set.

Thanks for notice this.
>
>          if manifest_name is not None and os.path.exists(manifest_name):
>              manifest_link = deploy_dir + "/" + link_name + ".manifest"
>     diff --git a/meta/lib/oe/package_manager.py
>     b/meta/lib/oe/package_manager.py
>     index 95e7ae7..522cbf7 100644
>     --- a/meta/lib/oe/package_manager.py
>     +++ b/meta/lib/oe/package_manager.py
>     @@ -693,7 +693,7 @@ class PackageManager(object):
>              pass
>
>          @abstractmethod
>     -    def list_installed(self, format=None):
>     +    def list_installed(self):
>              pass
>
>          @abstractmethod
>     @@ -713,7 +713,9 @@ class PackageManager(object):
>              installed_pkgs_file =
>     os.path.join(self.d.getVar('WORKDIR', True),
>     "installed_pkgs.txt")
>              with open(installed_pkgs_file, "w+") as installed_pkgs:
>     - installed_pkgs.write(self.list_installed("arch"))
>     +            pkgs = self.list_installed()
>     +            output = oe.utils.format_pkg_list(pkgs, "arch")
>     +            installed_pkgs.write(output)
>
>              if globs is None:
>                  globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY',
>     True)
>     @@ -1417,8 +1419,8 @@ class RpmPM(PackageManager):
>                                  self.image_rpmlib,
>                                  symlinks=True)
>
>     -    def list_installed(self, format=None):
>     -        return self.pkgs_list.list(format)
>     +    def list_installed(self):
>     +        return self.pkgs_list.list_pkgs()
>
>          '''
>          If incremental install, we need to determine what we've got,
>     @@ -1782,8 +1784,8 @@ class OpkgPM(PackageManager):
>              # create the directory back, it's needed by PM lock
>              bb.utils.mkdirhier(self.opkg_dir)
>
>     -    def list_installed(self, format=None):
>     -        return OpkgPkgsList(self.d, self.target_rootfs,
>     self.config_file).list(format)
>     +    def list_installed(self):
>     +        return OpkgPkgsList(self.d, self.target_rootfs,
>     self.config_file).list_pkgs()
>
>          def handle_bad_recommendations(self):
>              bad_recommendations =
>     self.d.getVar("BAD_RECOMMENDATIONS", True) or ""
>     @@ -2166,8 +2168,8 @@ class DpkgPM(PackageManager):
>                  bb.fatal("Cannot fix broken dependencies. Command '%s' "
>                           "returned %d:\n%s" % (cmd, e.returncode,
>     e.output))
>
>     -    def list_installed(self, format=None):
>     -        return DpkgPkgsList(self.d, self.target_rootfs).list()
>     +    def list_installed(self):
>     +        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
>
>
>      def generate_index_files(d):
>     diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>     index a2af332..45a88fb 100644
>     --- a/meta/lib/oe/rootfs.py
>     +++ b/meta/lib/oe/rootfs.py
>     @@ -963,17 +963,17 @@ def create_rootfs(d, manifest_dir=None):
>          os.environ.update(env_bkp)
>
>
>     -def image_list_installed_packages(d, format=None, rootfs_dir=None):
>     +def image_list_installed_packages(d, rootfs_dir=None):
>          if not rootfs_dir:
>              rootfs_dir = d.getVar('IMAGE_ROOTFS', True)
>
>          img_type = d.getVar('IMAGE_PKGTYPE', True)
>          if img_type == "rpm":
>     -        return RpmPkgsList(d, rootfs_dir).list(format)
>     +        return RpmPkgsList(d, rootfs_dir).list_pkgs()
>          elif img_type == "ipk":
>     -        return OpkgPkgsList(d, rootfs_dir,
>     d.getVar("IPKGCONF_TARGET", True)).list(format)
>     +        return OpkgPkgsList(d, rootfs_dir,
>     d.getVar("IPKGCONF_TARGET", True)).list_pkgs()
>          elif img_type == "deb":
>     -        return DpkgPkgsList(d, rootfs_dir).list(format)
>     +        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
>
>      if __name__ == "__main__":
>          """
>     diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
>     index 6affa40..b308aea 100644
>     --- a/meta/lib/oe/sdk.py
>     +++ b/meta/lib/oe/sdk.py
>     @@ -345,7 +345,7 @@ class DpkgSdk(Sdk):
>
>
>
>     -def sdk_list_installed_packages(d, target, format=None,
>     rootfs_dir=None):
>     +def sdk_list_installed_packages(d, target, rootfs_dir=None):
>          if rootfs_dir is None:
>              sdk_output = d.getVar('SDK_OUTPUT', True)
>              target_path = d.getVar('SDKTARGETSYSROOT', True).strip('/')
>     @@ -356,12 +356,12 @@ def sdk_list_installed_packages(d, target,
>     format=None, rootfs_dir=None):
>          if img_type == "rpm":
>              arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
>              os_var = ["SDK_OS", None][target is True]
>     -        return RpmPkgsList(d, rootfs_dir, arch_var,
>     os_var).list(format)
>     +        return RpmPkgsList(d, rootfs_dir, arch_var,
>     os_var).list_pkgs()
>          elif img_type == "ipk":
>              conf_file_var = ["IPKGCONF_SDK",
>     "IPKGCONF_TARGET"][target is True]
>     -        return OpkgPkgsList(d, rootfs_dir,
>     d.getVar(conf_file_var, True)).list(format)
>     +        return OpkgPkgsList(d, rootfs_dir,
>     d.getVar(conf_file_var, True)).list_pkgs()
>          elif img_type == "deb":
>     -        return DpkgPkgsList(d, rootfs_dir).list(format)
>     +        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
>
>      def populate_sdk(d, manifest_dir=None):
>          env_bkp = os.environ.copy()
>     --
>     1.8.4.5
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> Thanks for your time spent on this,
> Pau

-- 
Mariano Lopez

--------------070603030209030309070902
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 01/09/2016 05:55 PM, Pau Espin
      Pedrol wrote:<br>
    </div>
    <blockquote
cite="mid:CAEGpDuZ4V5P7C+w_PxeQ=Yd_jbX4rbUasRf1NPg2TrBbsBB7SA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>Hi,<br>
            <br>
          </div>
          I don't have the env to test the patch anymore.<br>
          <br>
        </div>
        <div>However, I have a question on this patch. I inline the
          comment in the code here, below the related lines:<br>
        </div>
        <div>
          <div>
            <div>
              <div class="gmail_extra"><br>
                <div class="gmail_quote">2016-01-07 21:07 GMT+01:00 <span
                    dir="ltr">&lt;<a moz-do-not-send="true"
                      href="mailto:mariano.lopez@linux.intel.com"
                      target="_blank">mariano.lopez@linux.intel.com</a>&gt;</span>:<br>
                  <blockquote class="gmail_quote" style="margin:0px 0px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">From: Mariano
                    Lopez &lt;<a moz-do-not-send="true"
                      href="mailto:mariano.lopez@linux.intel.com">mariano.lopez@linux.intel.com</a>&gt;<br>
                    <br>
                    This patch changes the use list_pkgs() instead of
                    list()<br>
                    from class RpmPkgsList. The change is in two
                    functions,<br>
                    image_list_installed_packages from rootfs.py and<br>
                    sdk_list_installed_packages from sdk.py.<br>
                    <br>
                    With this change the functions calling the functions<br>
                    listed above, must format the output as they
                    required.<br>
                    The formatting can be done using format_pkg_list()
                    from<br>
                    oe.utils.<br>
                    <br>
                    The classes calling the afected functions are
                    changed too<br>
                    with this patch, to keep the same functionality
                    using the<br>
                    new data structure.<br>
                    <br>
                    [YOCTO #7427]<br>
                    <br>
                    Signed-off-by: Mariano Lopez &lt;<a
                      moz-do-not-send="true"
                      href="mailto:mariano.lopez@linux.intel.com"><a class="moz-txt-link-abbreviated" href="mailto:mariano.lopez@linux.intel.com">mariano.lopez@linux.intel.com</a></a>&gt;<br>
                    ---<br>
                     meta/classes/buildhistory.bbclass        | 11
                    +++++++----<br>
                     meta/classes/license.bbclass             |  8
                    ++++++--<br>
                     meta/classes/populate_sdk_base.bbclass   |  8
                    ++++++--<br>
                     meta/classes/rootfs-postcommands.bbclass |  5 +++--<br>
                     meta/lib/oe/package_manager.py           | 18
                    ++++++++++--------<br>
                     meta/lib/oe/rootfs.py                    |  8
                    ++++----<br>
                     meta/lib/oe/sdk.py                       |  8
                    ++++----<br>
                     7 files changed, 40 insertions(+), 26 deletions(-)<br>
                    <br>
                    diff --git a/meta/classes/buildhistory.bbclass
                    b/meta/classes/buildhistory.bbclass<br>
                    index 4153e58..a2f8ac7 100644<br>
                    --- a/meta/classes/buildhistory.bbclass<br>
                    +++ b/meta/classes/buildhistory.bbclass<br>
                    @@ -337,18 +337,21 @@ def write_pkghistory(pkginfo,
                    d):<br>
                     def buildhistory_list_installed(d,
                    rootfs_type="image"):<br>
                         from oe.rootfs import
                    image_list_installed_packages<br>
                         from oe.sdk import sdk_list_installed_packages<br>
                    +    from oe.utils import format_pkg_list<br>
                    <br>
                         process_list = [('file',
                    'bh_installed_pkgs.txt'),\<br>
                                         ('deps',
                    'bh_installed_pkgs_deps.txt')]<br>
                    <br>
                    +    if rootfs_type == "image":<br>
                    +        pkgs = image_list_installed_packages(d)<br>
                    +    else:<br>
                    +        pkgs = sdk_list_installed_packages(d,
                    rootfs_type == "sdk_target")<br>
                    +<br>
                         for output_type, output_file in process_list:<br>
                             output_file_full =
                    os.path.join(d.getVar('WORKDIR', True), output_file)<br>
                    <br>
                             with open(output_file_full, 'w') as output:<br>
                    -            if rootfs_type == "image":<br>
                    -               
                    output.write(image_list_installed_packages(d,
                    output_type))<br>
                    -            else:<br>
                    -               
                    output.write(sdk_list_installed_packages(d,
                    rootfs_type == "sdk_target", output_type))<br>
                    +            output.write(format_pkg_list(pkgs,
                    output_type))<br>
                    <br>
                     python buildhistory_list_installed_image() {<br>
                         buildhistory_list_installed(d)<br>
                    diff --git a/meta/classes/license.bbclass
                    b/meta/classes/license.bbclass<br>
                    index 6651d55..fed42ca 100644<br>
                    --- a/meta/classes/license.bbclass<br>
                    +++ b/meta/classes/license.bbclass<br>
                    @@ -21,8 +21,12 @@ python write_package_manifest() {<br>
                         license_image_dir =
                    d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')<br>
                         bb.utils.mkdirhier(license_image_dir)<br>
                         from oe.rootfs import
                    image_list_installed_packages<br>
                    +    from oe.utils import format_pkg_list<br>
                    +<br>
                    +    pkgs = image_list_installed_packages(d)<br>
                    +    output = format_pkg_list(pkgs)<br>
                         open(os.path.join(license_image_dir,
                    'package.manifest'),<br>
                    -       
                    'w+').write(image_list_installed_packages(d))<br>
                    +        'w+').write(output)<br>
                     }<br>
                    <br>
                     python write_deploy_manifest() {<br>
                    @@ -38,7 +42,7 @@ python license_create_manifest() {<br>
                             return 0<br>
                    <br>
                         pkg_dic = {}<br>
                    -    for pkg in
                    image_list_installed_packages(d).splitlines():<br>
                    +    for pkg in
                    sorted(image_list_installed_packages(d)):<br>
                             pkg_info =
                    os.path.join(d.getVar('PKGDATA_DIR', True),<br>
                                                     'runtime-reverse',
                    pkg)<br>
                             pkg_name =
                    os.path.basename(os.readlink(pkg_info))<br>
                    diff --git a/meta/classes/populate_sdk_base.bbclass
                    b/meta/classes/populate_sdk_base.bbclass<br>
                    index 23dc115..26e06a5 100644<br>
                    --- a/meta/classes/populate_sdk_base.bbclass<br>
                    +++ b/meta/classes/populate_sdk_base.bbclass<br>
                    @@ -62,20 +62,24 @@ SDK_TARGET_MANIFEST =
                    "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"<br>
                     SDK_HOST_MANIFEST =
                    "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"<br>
                     python write_target_sdk_manifest () {<br>
                         from oe.sdk import sdk_list_installed_packages<br>
                    +    from oe.utils import format_pkg_list<br>
                         sdkmanifestdir =
                    os.path.dirname(d.getVar("SDK_TARGET_MANIFEST",
                    True))<br>
                    +    pkgs = sdk_list_installed_packages(d, True)<br>
                         if not os.path.exists(sdkmanifestdir):<br>
                             bb.utils.mkdirhier(sdkmanifestdir)<br>
                         with open(d.getVar('SDK_TARGET_MANIFEST',
                    True), 'w') as output:<br>
                    -        output.write(sdk_list_installed_packages(d,
                    True, 'ver'))<br>
                    +        output.write(format_pkg_list(pkgs, 'ver'))<br>
                     }<br>
                    <br>
                     python write_host_sdk_manifest () {<br>
                         from oe.sdk import sdk_list_installed_packages<br>
                    +    from oe.utils import format_pkg_list<br>
                         sdkmanifestdir =
                    os.path.dirname(d.getVar("SDK_HOST_MANIFEST", True))<br>
                    +    pkgs = sdk_list_installed_packages(d, False)<br>
                         if not os.path.exists(sdkmanifestdir):<br>
                             bb.utils.mkdirhier(sdkmanifestdir)<br>
                         with open(d.getVar('SDK_HOST_MANIFEST', True),
                    'w') as output:<br>
                    -        output.write(sdk_list_installed_packages(d,
                    False, 'ver'))<br>
                    +        output.write(format_pkg_list(pkgs, 'ver'))<br>
                     }<br>
                    <br>
                     POPULATE_SDK_POST_TARGET_COMMAND_append = "
                    write_target_sdk_manifest ; "<br>
                    diff --git
                    a/meta/classes/rootfs-postcommands.bbclass
                    b/meta/classes/rootfs-postcommands.bbclass<br>
                    index 96d3051..fe664b7 100644<br>
                    --- a/meta/classes/rootfs-postcommands.bbclass<br>
                    +++ b/meta/classes/rootfs-postcommands.bbclass<br>
                    @@ -207,14 +207,15 @@ insert_feed_uris () {<br>
                    <br>
                     python write_image_manifest () {<br>
                         from oe.rootfs import
                    image_list_installed_packages<br>
                    +    from oe.utils import format_pkg_list<br>
                    <br>
                         deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)<br>
                         link_name = d.getVar('IMAGE_LINK_NAME', True)<br>
                         manifest_name = d.getVar('IMAGE_MANIFEST',
                    True)<br>
                    <br>
                    +    pkgs = image_list_installed_packages(d)<br>
                         with open(manifest_name, 'w+') as
                    image_manifest:<br>
                    -       
                    image_manifest.write(image_list_installed_packages(d,
                    'ver'))<br>
                    -        image_manifest.write("\n")<br>
                    +        image_manifest.write(format_pkg_list(pkgs,
                    "ver"))<br>
                    <br>
                  </blockquote>
                  <div><br>
                  </div>
                  <div>As far as I understand from patch 2/4 in this
                    series, you get something like
                    "pkgInfo0\npkgInfoX\npkInfoLast" when using join()
                    from inside format_pkg_list(), so you get no "\n" at
                    the end of the file, and still you are also removing
                    the line which adds the "\n" at the end. That would
                    break the workaround which was added to fix bug
                    #7427 in yocto right? Or am I missing something?<br>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    You are right, I just notice that I sent the incorrect set of
    patches (this one doesn't list the last deb or ipk package). I'll
    send the correct set.<br>
    <br>
    Thanks for notice this.<br>
    <blockquote
cite="mid:CAEGpDuZ4V5P7C+w_PxeQ=Yd_jbX4rbUasRf1NPg2TrBbsBB7SA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div class="gmail_extra">
                <div class="gmail_quote">
                  <div> </div>
                  <blockquote class="gmail_quote" style="margin:0px 0px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">
                         if manifest_name is not None and
                    os.path.exists(manifest_name):<br>
                             manifest_link = deploy_dir + "/" +
                    link_name + ".manifest"<br>
                    diff --git a/meta/lib/oe/package_manager.py
                    b/meta/lib/oe/package_manager.py<br>
                    index 95e7ae7..522cbf7 100644<br>
                    --- a/meta/lib/oe/package_manager.py<br>
                    +++ b/meta/lib/oe/package_manager.py<br>
                    @@ -693,7 +693,7 @@ class PackageManager(object):<br>
                             pass<br>
                    <br>
                         @abstractmethod<br>
                    -    def list_installed(self, format=None):<br>
                    +    def list_installed(self):<br>
                             pass<br>
                    <br>
                         @abstractmethod<br>
                    @@ -713,7 +713,9 @@ class PackageManager(object):<br>
                             installed_pkgs_file =
                    os.path.join(self.d.getVar('WORKDIR', True),<br>
                                                               
                    "installed_pkgs.txt")<br>
                             with open(installed_pkgs_file, "w+") as
                    installed_pkgs:<br>
                    -           
                    installed_pkgs.write(self.list_installed("arch"))<br>
                    +            pkgs = self.list_installed()<br>
                    +            output = oe.utils.format_pkg_list(pkgs,
                    "arch")<br>
                    +            installed_pkgs.write(output)<br>
                    <br>
                             if globs is None:<br>
                                 globs =
                    self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY', True)<br>
                    @@ -1417,8 +1419,8 @@ class RpmPM(PackageManager):<br>
                                                 self.image_rpmlib,<br>
                                                 symlinks=True)<br>
                    <br>
                    -    def list_installed(self, format=None):<br>
                    -        return self.pkgs_list.list(format)<br>
                    +    def list_installed(self):<br>
                    +        return self.pkgs_list.list_pkgs()<br>
                    <br>
                         '''<br>
                         If incremental install, we need to determine
                    what we've got,<br>
                    @@ -1782,8 +1784,8 @@ class OpkgPM(PackageManager):<br>
                             # create the directory back, it's needed by
                    PM lock<br>
                             bb.utils.mkdirhier(self.opkg_dir)<br>
                    <br>
                    -    def list_installed(self, format=None):<br>
                    -        return OpkgPkgsList(self.d,
                    self.target_rootfs, self.config_file).list(format)<br>
                    +    def list_installed(self):<br>
                    +        return OpkgPkgsList(self.d,
                    self.target_rootfs, self.config_file).list_pkgs()<br>
                    <br>
                         def handle_bad_recommendations(self):<br>
                             bad_recommendations =
                    self.d.getVar("BAD_RECOMMENDATIONS", True) or ""<br>
                    @@ -2166,8 +2168,8 @@ class DpkgPM(PackageManager):<br>
                                 bb.fatal("Cannot fix broken
                    dependencies. Command '%s' "<br>
                                          "returned %d:\n%s" % (cmd,
                    e.returncode, e.output))<br>
                    <br>
                    -    def list_installed(self, format=None):<br>
                    -        return DpkgPkgsList(self.d,
                    self.target_rootfs).list()<br>
                    +    def list_installed(self):<br>
                    +        return DpkgPkgsList(self.d,
                    self.target_rootfs).list_pkgs()<br>
                    <br>
                    <br>
                     def generate_index_files(d):<br>
                    diff --git a/meta/lib/oe/rootfs.py
                    b/meta/lib/oe/rootfs.py<br>
                    index a2af332..45a88fb 100644<br>
                    --- a/meta/lib/oe/rootfs.py<br>
                    +++ b/meta/lib/oe/rootfs.py<br>
                    @@ -963,17 +963,17 @@ def create_rootfs(d,
                    manifest_dir=None):<br>
                         os.environ.update(env_bkp)<br>
                    <br>
                    <br>
                    -def image_list_installed_packages(d, format=None,
                    rootfs_dir=None):<br>
                    +def image_list_installed_packages(d,
                    rootfs_dir=None):<br>
                         if not rootfs_dir:<br>
                             rootfs_dir = d.getVar('IMAGE_ROOTFS', True)<br>
                    <br>
                         img_type = d.getVar('IMAGE_PKGTYPE', True)<br>
                         if img_type == "rpm":<br>
                    -        return RpmPkgsList(d,
                    rootfs_dir).list(format)<br>
                    +        return RpmPkgsList(d,
                    rootfs_dir).list_pkgs()<br>
                         elif img_type == "ipk":<br>
                    -        return OpkgPkgsList(d, rootfs_dir,
                    d.getVar("IPKGCONF_TARGET", True)).list(format)<br>
                    +        return OpkgPkgsList(d, rootfs_dir,
                    d.getVar("IPKGCONF_TARGET", True)).list_pkgs()<br>
                         elif img_type == "deb":<br>
                    -        return DpkgPkgsList(d,
                    rootfs_dir).list(format)<br>
                    +        return DpkgPkgsList(d,
                    rootfs_dir).list_pkgs()<br>
                    <br>
                     if __name__ == "__main__":<br>
                         """<br>
                    diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py<br>
                    index 6affa40..b308aea 100644<br>
                    --- a/meta/lib/oe/sdk.py<br>
                    +++ b/meta/lib/oe/sdk.py<br>
                    @@ -345,7 +345,7 @@ class DpkgSdk(Sdk):<br>
                    <br>
                    <br>
                    <br>
                    -def sdk_list_installed_packages(d, target,
                    format=None, rootfs_dir=None):<br>
                    +def sdk_list_installed_packages(d, target,
                    rootfs_dir=None):<br>
                         if rootfs_dir is None:<br>
                             sdk_output = d.getVar('SDK_OUTPUT', True)<br>
                             target_path = d.getVar('SDKTARGETSYSROOT',
                    True).strip('/')<br>
                    @@ -356,12 +356,12 @@ def
                    sdk_list_installed_packages(d, target, format=None,
                    rootfs_dir=None):<br>
                         if img_type == "rpm":<br>
                             arch_var = ["SDK_PACKAGE_ARCHS",
                    None][target is True]<br>
                             os_var = ["SDK_OS", None][target is True]<br>
                    -        return RpmPkgsList(d, rootfs_dir, arch_var,
                    os_var).list(format)<br>
                    +        return RpmPkgsList(d, rootfs_dir, arch_var,
                    os_var).list_pkgs()<br>
                         elif img_type == "ipk":<br>
                             conf_file_var = ["IPKGCONF_SDK",
                    "IPKGCONF_TARGET"][target is True]<br>
                    -        return OpkgPkgsList(d, rootfs_dir,
                    d.getVar(conf_file_var, True)).list(format)<br>
                    +        return OpkgPkgsList(d, rootfs_dir,
                    d.getVar(conf_file_var, True)).list_pkgs()<br>
                         elif img_type == "deb":<br>
                    -        return DpkgPkgsList(d,
                    rootfs_dir).list(format)<br>
                    +        return DpkgPkgsList(d,
                    rootfs_dir).list_pkgs()<br>
                    <br>
                     def populate_sdk(d, manifest_dir=None):<br>
                         env_bkp = os.environ.copy()<br>
                    <span class=""><font color="#888888">--<br>
                        1.8.4.5<br>
                        <br>
                        --<br>
                        _______________________________________________<br>
                        Openembedded-core mailing list<br>
                        <a moz-do-not-send="true"
                          href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                        <a moz-do-not-send="true"
                          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                          rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                      </font></span></blockquote>
                </div>
                <br>
              </div>
              <div class="gmail_extra">Thanks for your time spent on
                this,<br>
              </div>
              <div class="gmail_extra">Pau<br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      Mariano Lopez</div>
  </body>
</html>

--------------070603030209030309070902--
