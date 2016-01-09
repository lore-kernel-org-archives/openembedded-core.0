Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f194.google.com (mail-lb0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id B356C60762
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 23:55:18 +0000 (UTC)
Received: by mail-lb0-f194.google.com with SMTP id bc4so15882674lbc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 15:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ot8q53kYXNYF0zJUlIvDDsJOw91E9Jaupx5oc2MrHUY=;
	b=Pg14HN4fLXGxCpGJufZ/3z+HAUyo5hijDclJ0ByvY720aZuq8+AyBoJcK3A9+poyNb
	SSIn8CoXf3hrLyVtxjsFG/ItYFSWvr3OPxwmOcAD+LFbi5spHqShMZ1nAa9WgtwCOevp
	1DMK9gpeXwQpKmIjBKIJLZYsewu35arZ5yALnQ/3+z0wj7w+iy3FzdBGK5GzrTMQKmtZ
	NZHYB5qjYpECcqzPR+pB4oeQuFVSioM2LTsP2xAlZeOyd3BcN2sNoV82/pqoDdIoPcy0
	BRr69L+AR5IWGkkvTkgmf3C5B0ydiE82RLCcbfJfuOcfo/TiGMOsar0zHLpN4WpIH8Wr
	hgEg==
MIME-Version: 1.0
X-Received: by 10.112.167.104 with SMTP id zn8mr3353874lbb.91.1452383718064;
	Sat, 09 Jan 2016 15:55:18 -0800 (PST)
Received: by 10.25.158.193 with HTTP; Sat, 9 Jan 2016 15:55:18 -0800 (PST)
In-Reply-To: <f6edbeb62feb634b8636529af4fd7a982146568f.1452191688.git.mariano.lopez@linux.intel.com>
References: <cover.1452191688.git.mariano.lopez@linux.intel.com>
	<f6edbeb62feb634b8636529af4fd7a982146568f.1452191688.git.mariano.lopez@linux.intel.com>
Date: Sun, 10 Jan 2016 00:55:18 +0100
Message-ID: <CAEGpDuZ4V5P7C+w_PxeQ=Yd_jbX4rbUasRf1NPg2TrBbsBB7SA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: mariano.lopez@linux.intel.com
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
X-List-Received-Date: Sat, 09 Jan 2016 23:55:19 -0000
Content-Type: multipart/alternative; boundary=001a11c25aee97ce7a0528ef6fc5

--001a11c25aee97ce7a0528ef6fc5
Content-Type: text/plain; charset=UTF-8

Hi,

I don't have the env to test the patch anymore.

However, I have a question on this patch. I inline the comment in the code
here, below the related lines:

2016-01-07 21:07 GMT+01:00 <mariano.lopez@linux.intel.com>:

> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
> This patch changes the use list_pkgs() instead of list()
> from class RpmPkgsList. The change is in two functions,
> image_list_installed_packages from rootfs.py and
> sdk_list_installed_packages from sdk.py.
>
> With this change the functions calling the functions
> listed above, must format the output as they required.
> The formatting can be done using format_pkg_list() from
> oe.utils.
>
> The classes calling the afected functions are changed too
> with this patch, to keep the same functionality using the
> new data structure.
>
> [YOCTO #7427]
>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/buildhistory.bbclass        | 11 +++++++----
>  meta/classes/license.bbclass             |  8 ++++++--
>  meta/classes/populate_sdk_base.bbclass   |  8 ++++++--
>  meta/classes/rootfs-postcommands.bbclass |  5 +++--
>  meta/lib/oe/package_manager.py           | 18 ++++++++++--------
>  meta/lib/oe/rootfs.py                    |  8 ++++----
>  meta/lib/oe/sdk.py                       |  8 ++++----
>  7 files changed, 40 insertions(+), 26 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 4153e58..a2f8ac7 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -337,18 +337,21 @@ def write_pkghistory(pkginfo, d):
>  def buildhistory_list_installed(d, rootfs_type="image"):
>      from oe.rootfs import image_list_installed_packages
>      from oe.sdk import sdk_list_installed_packages
> +    from oe.utils import format_pkg_list
>
>      process_list = [('file', 'bh_installed_pkgs.txt'),\
>                      ('deps', 'bh_installed_pkgs_deps.txt')]
>
> +    if rootfs_type == "image":
> +        pkgs = image_list_installed_packages(d)
> +    else:
> +        pkgs = sdk_list_installed_packages(d, rootfs_type == "sdk_target")
> +
>      for output_type, output_file in process_list:
>          output_file_full = os.path.join(d.getVar('WORKDIR', True),
> output_file)
>
>          with open(output_file_full, 'w') as output:
> -            if rootfs_type == "image":
> -                output.write(image_list_installed_packages(d,
> output_type))
> -            else:
> -                output.write(sdk_list_installed_packages(d, rootfs_type
> == "sdk_target", output_type))
> +            output.write(format_pkg_list(pkgs, output_type))
>
>  python buildhistory_list_installed_image() {
>      buildhistory_list_installed(d)
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 6651d55..fed42ca 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -21,8 +21,12 @@ python write_package_manifest() {
>      license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
>      bb.utils.mkdirhier(license_image_dir)
>      from oe.rootfs import image_list_installed_packages
> +    from oe.utils import format_pkg_list
> +
> +    pkgs = image_list_installed_packages(d)
> +    output = format_pkg_list(pkgs)
>      open(os.path.join(license_image_dir, 'package.manifest'),
> -        'w+').write(image_list_installed_packages(d))
> +        'w+').write(output)
>  }
>
>  python write_deploy_manifest() {
> @@ -38,7 +42,7 @@ python license_create_manifest() {
>          return 0
>
>      pkg_dic = {}
> -    for pkg in image_list_installed_packages(d).splitlines():
> +    for pkg in sorted(image_list_installed_packages(d)):
>          pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
>                                  'runtime-reverse', pkg)
>          pkg_name = os.path.basename(os.readlink(pkg_info))
> diff --git a/meta/classes/populate_sdk_base.bbclass
> b/meta/classes/populate_sdk_base.bbclass
> index 23dc115..26e06a5 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -62,20 +62,24 @@ SDK_TARGET_MANIFEST =
> "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
>  SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
>  python write_target_sdk_manifest () {
>      from oe.sdk import sdk_list_installed_packages
> +    from oe.utils import format_pkg_list
>      sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST",
> True))
> +    pkgs = sdk_list_installed_packages(d, True)
>      if not os.path.exists(sdkmanifestdir):
>          bb.utils.mkdirhier(sdkmanifestdir)
>      with open(d.getVar('SDK_TARGET_MANIFEST', True), 'w') as output:
> -        output.write(sdk_list_installed_packages(d, True, 'ver'))
> +        output.write(format_pkg_list(pkgs, 'ver'))
>  }
>
>  python write_host_sdk_manifest () {
>      from oe.sdk import sdk_list_installed_packages
> +    from oe.utils import format_pkg_list
>      sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST", True))
> +    pkgs = sdk_list_installed_packages(d, False)
>      if not os.path.exists(sdkmanifestdir):
>          bb.utils.mkdirhier(sdkmanifestdir)
>      with open(d.getVar('SDK_HOST_MANIFEST', True), 'w') as output:
> -        output.write(sdk_list_installed_packages(d, False, 'ver'))
> +        output.write(format_pkg_list(pkgs, 'ver'))
>  }
>
>  POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index 96d3051..fe664b7 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -207,14 +207,15 @@ insert_feed_uris () {
>
>  python write_image_manifest () {
>      from oe.rootfs import image_list_installed_packages
> +    from oe.utils import format_pkg_list
>
>      deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
>      link_name = d.getVar('IMAGE_LINK_NAME', True)
>      manifest_name = d.getVar('IMAGE_MANIFEST', True)
>
> +    pkgs = image_list_installed_packages(d)
>      with open(manifest_name, 'w+') as image_manifest:
> -        image_manifest.write(image_list_installed_packages(d, 'ver'))
> -        image_manifest.write("\n")
> +        image_manifest.write(format_pkg_list(pkgs, "ver"))
>
>
As far as I understand from patch 2/4 in this series, you get something
like "pkgInfo0\npkgInfoX\npkInfoLast" when using join() from inside
format_pkg_list(), so you get no "\n" at the end of the file, and still you
are also removing the line which adds the "\n" at the end. That would break
the workaround which was added to fix bug #7427 in yocto right? Or am I
missing something?


>      if manifest_name is not None and os.path.exists(manifest_name):
>          manifest_link = deploy_dir + "/" + link_name + ".manifest"
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index 95e7ae7..522cbf7 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -693,7 +693,7 @@ class PackageManager(object):
>          pass
>
>      @abstractmethod
> -    def list_installed(self, format=None):
> +    def list_installed(self):
>          pass
>
>      @abstractmethod
> @@ -713,7 +713,9 @@ class PackageManager(object):
>          installed_pkgs_file = os.path.join(self.d.getVar('WORKDIR', True),
>                                             "installed_pkgs.txt")
>          with open(installed_pkgs_file, "w+") as installed_pkgs:
> -            installed_pkgs.write(self.list_installed("arch"))
> +            pkgs = self.list_installed()
> +            output = oe.utils.format_pkg_list(pkgs, "arch")
> +            installed_pkgs.write(output)
>
>          if globs is None:
>              globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY', True)
> @@ -1417,8 +1419,8 @@ class RpmPM(PackageManager):
>                              self.image_rpmlib,
>                              symlinks=True)
>
> -    def list_installed(self, format=None):
> -        return self.pkgs_list.list(format)
> +    def list_installed(self):
> +        return self.pkgs_list.list_pkgs()
>
>      '''
>      If incremental install, we need to determine what we've got,
> @@ -1782,8 +1784,8 @@ class OpkgPM(PackageManager):
>          # create the directory back, it's needed by PM lock
>          bb.utils.mkdirhier(self.opkg_dir)
>
> -    def list_installed(self, format=None):
> -        return OpkgPkgsList(self.d, self.target_rootfs,
> self.config_file).list(format)
> +    def list_installed(self):
> +        return OpkgPkgsList(self.d, self.target_rootfs,
> self.config_file).list_pkgs()
>
>      def handle_bad_recommendations(self):
>          bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True)
> or ""
> @@ -2166,8 +2168,8 @@ class DpkgPM(PackageManager):
>              bb.fatal("Cannot fix broken dependencies. Command '%s' "
>                       "returned %d:\n%s" % (cmd, e.returncode, e.output))
>
> -    def list_installed(self, format=None):
> -        return DpkgPkgsList(self.d, self.target_rootfs).list()
> +    def list_installed(self):
> +        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
>
>
>  def generate_index_files(d):
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index a2af332..45a88fb 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -963,17 +963,17 @@ def create_rootfs(d, manifest_dir=None):
>      os.environ.update(env_bkp)
>
>
> -def image_list_installed_packages(d, format=None, rootfs_dir=None):
> +def image_list_installed_packages(d, rootfs_dir=None):
>      if not rootfs_dir:
>          rootfs_dir = d.getVar('IMAGE_ROOTFS', True)
>
>      img_type = d.getVar('IMAGE_PKGTYPE', True)
>      if img_type == "rpm":
> -        return RpmPkgsList(d, rootfs_dir).list(format)
> +        return RpmPkgsList(d, rootfs_dir).list_pkgs()
>      elif img_type == "ipk":
> -        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET",
> True)).list(format)
> +        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET",
> True)).list_pkgs()
>      elif img_type == "deb":
> -        return DpkgPkgsList(d, rootfs_dir).list(format)
> +        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
>
>  if __name__ == "__main__":
>      """
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 6affa40..b308aea 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -345,7 +345,7 @@ class DpkgSdk(Sdk):
>
>
>
> -def sdk_list_installed_packages(d, target, format=None, rootfs_dir=None):
> +def sdk_list_installed_packages(d, target, rootfs_dir=None):
>      if rootfs_dir is None:
>          sdk_output = d.getVar('SDK_OUTPUT', True)
>          target_path = d.getVar('SDKTARGETSYSROOT', True).strip('/')
> @@ -356,12 +356,12 @@ def sdk_list_installed_packages(d, target,
> format=None, rootfs_dir=None):
>      if img_type == "rpm":
>          arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
>          os_var = ["SDK_OS", None][target is True]
> -        return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list(format)
> +        return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list_pkgs()
>      elif img_type == "ipk":
>          conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is
> True]
> -        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var,
> True)).list(format)
> +        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var,
> True)).list_pkgs()
>      elif img_type == "deb":
> -        return DpkgPkgsList(d, rootfs_dir).list(format)
> +        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
>
>  def populate_sdk(d, manifest_dir=None):
>      env_bkp = os.environ.copy()
> --
> 1.8.4.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

Thanks for your time spent on this,
Pau

--001a11c25aee97ce7a0528ef6fc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I don&#39;t have the env to tes=
t the patch anymore.<br><br></div><div>However, I have a question on this p=
atch. I inline the comment in the code here, below the related lines:<br></=
div><div><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">2016-01-07 21:07 GMT+01:00  <span dir=3D"ltr">&lt;<a href=3D"mailto:maria=
no.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</=
a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: M=
ariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.intel.com">mariano.l=
opez@linux.intel.com</a>&gt;<br>
<br>
This patch changes the use list_pkgs() instead of list()<br>
from class RpmPkgsList. The change is in two functions,<br>
image_list_installed_packages from rootfs.py and<br>
sdk_list_installed_packages from sdk.py.<br>
<br>
With this change the functions calling the functions<br>
listed above, must format the output as they required.<br>
The formatting can be done using format_pkg_list() from<br>
oe.utils.<br>
<br>
The classes calling the afected functions are changed too<br>
with this patch, to keep the same functionality using the<br>
new data structure.<br>
<br>
[YOCTO #7427]<br>
<br>
Signed-off-by: Mariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.inte=
l.com">mariano.lopez@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/buildhistory.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++=
++++----<br>
=C2=A0meta/classes/license.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 8 ++++++--<br>
=C2=A0meta/classes/populate_sdk_base.bbclass=C2=A0 =C2=A0|=C2=A0 8 ++++++--=
<br>
=C2=A0meta/classes/rootfs-postcommands.bbclass |=C2=A0 5 +++--<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 18 ++++++++++--------<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0meta/lib/oe/sdk.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A07 files changed, 40 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass<br>
index 4153e58..a2f8ac7 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -337,18 +337,21 @@ def write_pkghistory(pkginfo, d):<br>
=C2=A0def buildhistory_list_installed(d, rootfs_type=3D&quot;image&quot;):<=
br>
=C2=A0 =C2=A0 =C2=A0from oe.rootfs import image_list_installed_packages<br>
=C2=A0 =C2=A0 =C2=A0from oe.sdk import sdk_list_installed_packages<br>
+=C2=A0 =C2=A0 from oe.utils import format_pkg_list<br>
<br>
=C2=A0 =C2=A0 =C2=A0process_list =3D [(&#39;file&#39;, &#39;bh_installed_pk=
gs.txt&#39;),\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(&#39;deps&#39;, &#39;bh_installed_pkgs_deps.txt&#39;)]<br>
<br>
+=C2=A0 =C2=A0 if rootfs_type =3D=3D &quot;image&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs =3D image_list_installed_packages(d)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs =3D sdk_list_installed_packages(d, rootfs=
_type =3D=3D &quot;sdk_target&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0for output_type, output_file in process_list:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_file_full =3D os.path.join(d.getVa=
r(&#39;WORKDIR&#39;, True), output_file)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(output_file_full, &#39;w&#39;) =
as output:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rootfs_type =3D=3D &quot;imag=
e&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(image=
_list_installed_packages(d, output_type))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(sdk_l=
ist_installed_packages(d, rootfs_type =3D=3D &quot;sdk_target&quot;, output=
_type))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(format_pkg_list(pkg=
s, output_type))<br>
<br>
=C2=A0python buildhistory_list_installed_image() {<br>
=C2=A0 =C2=A0 =C2=A0buildhistory_list_installed(d)<br>
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<br=
>
index 6651d55..fed42ca 100644<br>
--- a/meta/classes/license.bbclass<br>
+++ b/meta/classes/license.bbclass<br>
@@ -21,8 +21,12 @@ python write_package_manifest() {<br>
=C2=A0 =C2=A0 =C2=A0license_image_dir =3D d.expand(&#39;${LICENSE_DIRECTORY=
}/${IMAGE_NAME}&#39;)<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(license_image_dir)<br>
=C2=A0 =C2=A0 =C2=A0from oe.rootfs import image_list_installed_packages<br>
+=C2=A0 =C2=A0 from oe.utils import format_pkg_list<br>
+<br>
+=C2=A0 =C2=A0 pkgs =3D image_list_installed_packages(d)<br>
+=C2=A0 =C2=A0 output =3D format_pkg_list(pkgs)<br>
=C2=A0 =C2=A0 =C2=A0open(os.path.join(license_image_dir, &#39;package.manif=
est&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;w+&#39;).write(image_list_installed_packa=
ges(d))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;w+&#39;).write(output)<br>
=C2=A0}<br>
<br>
=C2=A0python write_deploy_manifest() {<br>
@@ -38,7 +42,7 @@ python license_create_manifest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
=C2=A0 =C2=A0 =C2=A0pkg_dic =3D {}<br>
-=C2=A0 =C2=A0 for pkg in image_list_installed_packages(d).splitlines():<br=
>
+=C2=A0 =C2=A0 for pkg in sorted(image_list_installed_packages(d)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_info =3D os.path.join(d.getVar(&#39;P=
KGDATA_DIR&#39;, True),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;runtime-reverse&#39;, pkg=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_name =3D os.path.basename(os.readlink=
(pkg_info))<br>
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate=
_sdk_base.bbclass<br>
index 23dc115..26e06a5 100644<br>
--- a/meta/classes/populate_sdk_base.bbclass<br>
+++ b/meta/classes/populate_sdk_base.bbclass<br>
@@ -62,20 +62,24 @@ SDK_TARGET_MANIFEST =3D &quot;${SDK_DEPLOY}/${TOOLCHAIN=
_OUTPUTNAME}.target.manifest&quot;<br>
=C2=A0SDK_HOST_MANIFEST =3D &quot;${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.hos=
t.manifest&quot;<br>
=C2=A0python write_target_sdk_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0from oe.sdk import sdk_list_installed_packages<br>
+=C2=A0 =C2=A0 from oe.utils import format_pkg_list<br>
=C2=A0 =C2=A0 =C2=A0sdkmanifestdir =3D os.path.dirname(d.getVar(&quot;SDK_T=
ARGET_MANIFEST&quot;, True))<br>
+=C2=A0 =C2=A0 pkgs =3D sdk_list_installed_packages(d, True)<br>
=C2=A0 =C2=A0 =C2=A0if not os.path.exists(sdkmanifestdir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(sdkmanifestdir)<br>
=C2=A0 =C2=A0 =C2=A0with open(d.getVar(&#39;SDK_TARGET_MANIFEST&#39;, True)=
, &#39;w&#39;) as output:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(sdk_list_installed_packages(d, Tr=
ue, &#39;ver&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(format_pkg_list(pkgs, &#39;ver&#3=
9;))<br>
=C2=A0}<br>
<br>
=C2=A0python write_host_sdk_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0from oe.sdk import sdk_list_installed_packages<br>
+=C2=A0 =C2=A0 from oe.utils import format_pkg_list<br>
=C2=A0 =C2=A0 =C2=A0sdkmanifestdir =3D os.path.dirname(d.getVar(&quot;SDK_H=
OST_MANIFEST&quot;, True))<br>
+=C2=A0 =C2=A0 pkgs =3D sdk_list_installed_packages(d, False)<br>
=C2=A0 =C2=A0 =C2=A0if not os.path.exists(sdkmanifestdir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(sdkmanifestdir)<br>
=C2=A0 =C2=A0 =C2=A0with open(d.getVar(&#39;SDK_HOST_MANIFEST&#39;, True), =
&#39;w&#39;) as output:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(sdk_list_installed_packages(d, Fa=
lse, &#39;ver&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output.write(format_pkg_list(pkgs, &#39;ver&#3=
9;))<br>
=C2=A0}<br>
<br>
=C2=A0POPULATE_SDK_POST_TARGET_COMMAND_append =3D &quot; write_target_sdk_m=
anifest ; &quot;<br>
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass<br>
index 96d3051..fe664b7 100644<br>
--- a/meta/classes/rootfs-postcommands.bbclass<br>
+++ b/meta/classes/rootfs-postcommands.bbclass<br>
@@ -207,14 +207,15 @@ insert_feed_uris () {<br>
<br>
=C2=A0python write_image_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0from oe.rootfs import image_list_installed_packages<br>
+=C2=A0 =C2=A0 from oe.utils import format_pkg_list<br>
<br>
=C2=A0 =C2=A0 =C2=A0deploy_dir =3D d.getVar(&#39;DEPLOY_DIR_IMAGE&#39;, Tru=
e)<br>
=C2=A0 =C2=A0 =C2=A0link_name =3D d.getVar(&#39;IMAGE_LINK_NAME&#39;, True)=
<br>
=C2=A0 =C2=A0 =C2=A0manifest_name =3D d.getVar(&#39;IMAGE_MANIFEST&#39;, Tr=
ue)<br>
<br>
+=C2=A0 =C2=A0 pkgs =3D image_list_installed_packages(d)<br>
=C2=A0 =C2=A0 =C2=A0with open(manifest_name, &#39;w+&#39;) as image_manifes=
t:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_manifest.write(image_list_installed_pack=
ages(d, &#39;ver&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_manifest.write(&quot;\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_manifest.write(format_pkg_list(pkgs, &qu=
ot;ver&quot;))<br>
<br></blockquote><div><br></div><div>As far as I understand from patch 2/4 =
in this series, you get something like &quot;pkgInfo0\npkgInfoX\npkInfoLast=
&quot; when using join() from inside format_pkg_list(), so you get no &quot=
;\n&quot; at the end of the file, and still you are also removing the line =
which adds the &quot;\n&quot; at the end. That would break the workaround w=
hich was added to fix bug #7427 in yocto right? Or am I missing something?<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
=C2=A0 =C2=A0 =C2=A0if manifest_name is not None and os.path.exists(manifes=
t_name):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_link =3D deploy_dir + &quot;/&qu=
ot; + link_name + &quot;.manifest&quot;<br>
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.p=
y<br>
index 95e7ae7..522cbf7 100644<br>
--- a/meta/lib/oe/package_manager.py<br>
+++ b/meta/lib/oe/package_manager.py<br>
@@ -693,7 +693,7 @@ class PackageManager(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
=C2=A0 =C2=A0 =C2=A0@abstractmethod<br>
-=C2=A0 =C2=A0 def list_installed(self, format=3DNone):<br>
+=C2=A0 =C2=A0 def list_installed(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
=C2=A0 =C2=A0 =C2=A0@abstractmethod<br>
@@ -713,7 +713,9 @@ class PackageManager(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0installed_pkgs_file =3D os.path.join(self=
.d.getVar(&#39;WORKDIR&#39;, True),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;installed_pkgs.txt&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(installed_pkgs_file, &quot;w+&q=
uot;) as installed_pkgs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 installed_pkgs.write(self.list_i=
nstalled(&quot;arch&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs =3D self.list_installed()<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D oe.utils.format_pkg_l=
ist(pkgs, &quot;arch&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 installed_pkgs.write(output)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if globs is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0globs =3D self.d.getVar(&#3=
9;IMAGE_INSTALL_COMPLEMENTARY&#39;, True)<br>
@@ -1417,8 +1419,8 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.image_rpmlib,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlinks=3DTrue)<br>
<br>
-=C2=A0 =C2=A0 def list_installed(self, format=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pkgs_list.list(format)<br>
+=C2=A0 =C2=A0 def list_installed(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.pkgs_list.list_pkgs()<br>
<br>
=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0If incremental install, we need to determine what we&#3=
9;ve got,<br>
@@ -1782,8 +1784,8 @@ class OpkgPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# create the directory back, it&#39;s nee=
ded by PM lock<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(self.opkg_dir)<br>
<br>
-=C2=A0 =C2=A0 def list_installed(self, format=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OpkgPkgsList(self.d, self.target_rootfs=
, self.config_file).list(format)<br>
+=C2=A0 =C2=A0 def list_installed(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OpkgPkgsList(self.d, self.target_rootfs=
, self.config_file).list_pkgs()<br>
<br>
=C2=A0 =C2=A0 =C2=A0def handle_bad_recommendations(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bad_recommendations =3D self.d.getVar(&qu=
ot;BAD_RECOMMENDATIONS&quot;, True) or &quot;&quot;<br>
@@ -2166,8 +2168,8 @@ class DpkgPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;Cannot fix b=
roken dependencies. Command &#39;%s&#39; &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;returned %d:\n%s&quot; % (cmd, e.returncode, e.output))<br>
<br>
-=C2=A0 =C2=A0 def list_installed(self, format=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DpkgPkgsList(self.d, self.target_rootfs=
).list()<br>
+=C2=A0 =C2=A0 def list_installed(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DpkgPkgsList(self.d, self.target_rootfs=
).list_pkgs()<br>
<br>
<br>
=C2=A0def generate_index_files(d):<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
index a2af332..45a88fb 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -963,17 +963,17 @@ def create_rootfs(d, manifest_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0os.environ.update(env_bkp)<br>
<br>
<br>
-def image_list_installed_packages(d, format=3DNone, rootfs_dir=3DNone):<br=
>
+def image_list_installed_packages(d, rootfs_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0if not rootfs_dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_dir =3D d.getVar(&#39;IMAGE_ROOTFS=
&#39;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0img_type =3D d.getVar(&#39;IMAGE_PKGTYPE&#39;, True)<br=
>
=C2=A0 =C2=A0 =C2=A0if img_type =3D=3D &quot;rpm&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RpmPkgsList(d, rootfs_dir).list(format)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RpmPkgsList(d, rootfs_dir).list_pkgs()<=
br>
=C2=A0 =C2=A0 =C2=A0elif img_type =3D=3D &quot;ipk&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OpkgPkgsList(d, rootfs_dir, d.getVar(&q=
uot;IPKGCONF_TARGET&quot;, True)).list(format)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OpkgPkgsList(d, rootfs_dir, d.getVar(&q=
uot;IPKGCONF_TARGET&quot;, True)).list_pkgs()<br>
=C2=A0 =C2=A0 =C2=A0elif img_type =3D=3D &quot;deb&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DpkgPkgsList(d, rootfs_dir).list(format=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DpkgPkgsList(d, rootfs_dir).list_pkgs()=
<br>
<br>
=C2=A0if __name__ =3D=3D &quot;__main__&quot;:<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py<br>
index 6affa40..b308aea 100644<br>
--- a/meta/lib/oe/sdk.py<br>
+++ b/meta/lib/oe/sdk.py<br>
@@ -345,7 +345,7 @@ class DpkgSdk(Sdk):<br>
<br>
<br>
<br>
-def sdk_list_installed_packages(d, target, format=3DNone, rootfs_dir=3DNon=
e):<br>
+def sdk_list_installed_packages(d, target, rootfs_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0if rootfs_dir is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdk_output =3D d.getVar(&#39;SDK_OUTPUT&#=
39;, True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_path =3D d.getVar(&#39;SDKTARGETSY=
SROOT&#39;, True).strip(&#39;/&#39;)<br>
@@ -356,12 +356,12 @@ def sdk_list_installed_packages(d, target, format=3DN=
one, rootfs_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0if img_type =3D=3D &quot;rpm&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch_var =3D [&quot;SDK_PACKAGE_ARCHS&quo=
t;, None][target is True]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os_var =3D [&quot;SDK_OS&quot;, None][tar=
get is True]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RpmPkgsList(d, rootfs_dir, arch_var, os=
_var).list(format)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RpmPkgsList(d, rootfs_dir, arch_var, os=
_var).list_pkgs()<br>
=C2=A0 =C2=A0 =C2=A0elif img_type =3D=3D &quot;ipk&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf_file_var =3D [&quot;IPKGCONF_SDK&quo=
t;, &quot;IPKGCONF_TARGET&quot;][target is True]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OpkgPkgsList(d, rootfs_dir, d.getVar(co=
nf_file_var, True)).list(format)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OpkgPkgsList(d, rootfs_dir, d.getVar(co=
nf_file_var, True)).list_pkgs()<br>
=C2=A0 =C2=A0 =C2=A0elif img_type =3D=3D &quot;deb&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DpkgPkgsList(d, rootfs_dir).list(format=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DpkgPkgsList(d, rootfs_dir).list_pkgs()=
<br>
<br>
=C2=A0def populate_sdk(d, manifest_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0env_bkp =3D os.environ.copy()<br>
<span class=3D""><font color=3D"#888888">--<br>
1.8.4.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">Thank=
s for your time spent on this,<br></div><div class=3D"gmail_extra">Pau<br><=
/div></div></div></div></div>

--001a11c25aee97ce7a0528ef6fc5--
