Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.7903.1593081695902054454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U4O6JcIT;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id a3so4552300oid.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XFKX1AQzsqGY4a0T45XUFFMqMhR6EJREP4zHTqvchAs=;
        b=U4O6JcIThWT9z58SqYB8hejR5SLe2ufmZG2KqAR5z0YFGAT93YtldWg8Rs6+3HWDuw
         qCyLyf+MxpMHlAcYf0NrsbTu7/SD7cwNmxR4JGRH0MI8a+/AB/6d2WTNfp3OcoU03it/
         y9hFNcJvlXy+94ZTfDYmDX3jg9U87Omn/CHTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XFKX1AQzsqGY4a0T45XUFFMqMhR6EJREP4zHTqvchAs=;
        b=K2BRkcEWl2JBYMGYPLHcdTx2EKjku9RT6omQTmmJNsMlRxC4TRm+2dJeny10vTkhoj
         UPl4sbLavHs9MctjtWqdzJAovRaB5vF6ryNF4o+0ia7e23f+Fg0Lqyfb65g+ysZKvalo
         9LQjsy17lc8XuWKAtJSvM9g5IHgffXrjIS6vPJRzxbHdpl+Ynce2oLXsWojp/ReurtyE
         P3duk3uRjJd5hVJChguQhwKKmx7gWnwIQoQUWmSpXWtYwAAtqHzVFJ/lW67rEouclxLX
         zQHqCduqPVcIV/YRyXcwhlscF8stq2i1QP2b1mO62c5nubz+crZVx4ouFLo1wuvYB40G
         o4NA==
X-Gm-Message-State: AOAM532OTG2qGWgit4AI9hfBTqTbvM/fPKDkbvJJDDkL76HtRjmwI3/p
	fNl0sY4e/3BRcf7C1oRCgn8rItfx2TpTWQBDmY1HoA==
X-Google-Smtp-Source: ABdhPJxQkqLQUYu3z9rhwWijyMNunwf6GyYCCiU6nlBbPDg2nt0dSPksz/2v/QC3p17QngznchBBbZzPU+sNkW/UysM=
X-Received: by 2002:aca:df04:: with SMTP id w4mr1604159oig.27.1593081695121;
 Thu, 25 Jun 2020 03:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-7-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-7-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:41:24 +0100
Message-ID: <CAM9ZRVtx0aFsLstKihrvFQ9sYuvaMzJUDNRuiUW5RmE7heYqmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 06/26] manifest.py: Dynamic load of manifest
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Decide which manifest we should load in run time without any hard coded
> values but look at which package type that is used.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/lib/oe/manifest.py                      | 10 ++------
>  meta/lib/oe/package_managers/deb/manifest.py |  2 +-
>  meta/lib/oe/package_managers/ipk/manifest.py |  2 +-
>  meta/lib/oe/package_managers/rpm/manifest.py |  2 +-
>  meta/lib/oe/rootfs.py                        | 13 +++++-----
>  meta/lib/oe/sdk.py                           | 27 +++++++-------------
>  6 files changed, 20 insertions(+), 36 deletions(-)
>
> diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
> index d93edfcac5..a8d14244c0 100644
> --- a/meta/lib/oe/manifest.py
> +++ b/meta/lib/oe/manifest.py
> @@ -190,14 +190,8 @@ class Manifest(object, metaclass=ABCMeta):
>
>  def create_manifest(d, final_manifest=False, manifest_dir=None,
>                      manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
> -    from oe.package_managers.rpm.manifest import RpmManifest
> -    from oe.package_managers.ipk.manifest import OpkgManifest
> -    from oe.package_managers.deb.manifest import DpkgManifest
> -    manifest_map = {'rpm': RpmManifest,
> -                    'ipk': OpkgManifest,
> -                    'deb': DpkgManifest}
> -
> -    manifest = manifest_map[d.getVar('IMAGE_PKGTYPE')](d, manifest_dir, manifest_type)
> +    import importlib
> +    manifest = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.manifest').PkgManifest(d, manifest_dir, manifest_type)
>
>      if final_manifest:
>          manifest.create_final()
> diff --git a/meta/lib/oe/package_managers/deb/manifest.py b/meta/lib/oe/package_managers/deb/manifest.py
> index 9b186555dc..5daf709e6c 100644
> --- a/meta/lib/oe/package_managers/deb/manifest.py
> +++ b/meta/lib/oe/package_managers/deb/manifest.py
> @@ -4,7 +4,7 @@
>
>  from oe.manifest import *
>
> -class DpkgManifest(Manifest):
> +class PkgManifest(Manifest):
>      def create_initial(self):
>          with open(self.initial_manifest, "w+") as manifest:
>              manifest.write(self.initial_manifest_file_header)
> diff --git a/meta/lib/oe/package_managers/ipk/manifest.py b/meta/lib/oe/package_managers/ipk/manifest.py
> index be87f3d1b7..cf3097224f 100644
> --- a/meta/lib/oe/package_managers/ipk/manifest.py
> +++ b/meta/lib/oe/package_managers/ipk/manifest.py
> @@ -4,7 +4,7 @@
>
>  from oe.manifest import *
>
> -class OpkgManifest(Manifest):
> +class PkgManifest(Manifest):
>      """
>      Returns a dictionary object with mip and mlp packages.
>      """
> diff --git a/meta/lib/oe/package_managers/rpm/manifest.py b/meta/lib/oe/package_managers/rpm/manifest.py
> index a225ee7a23..801e50e8b6 100644
> --- a/meta/lib/oe/package_managers/rpm/manifest.py
> +++ b/meta/lib/oe/package_managers/rpm/manifest.py
> @@ -4,7 +4,7 @@
>
>  from oe.manifest import *
>
> -class RpmManifest(Manifest):
> +class PkgManifest(Manifest):
>      """
>      Returns a dictionary object with mip and mlp packages.
>      """
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index ab10edfec0..c3cfb58493 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -12,7 +12,6 @@ import os
>  import subprocess
>  import re
>
> -
>  class Rootfs(object, metaclass=ABCMeta):
>      """
>      This is an abstract class. Do not instantiate this directly.
> @@ -359,8 +358,8 @@ class RpmRootfs(Rootfs):
>          self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
>                                 r'|exit 1|ERROR: |Error: |Error |ERROR '\
>                                 r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
> -        from oe.package_managers.rpm.manifest import RpmManifest
> -        self.manifest = RpmManifest(d, manifest_dir)
> +        import importlib
> +        self.manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, manifest_dir)
>
>          self.pm = RpmPM(d,
>                          d.getVar('IMAGE_ROOTFS'),
> @@ -614,8 +613,8 @@ class DpkgRootfs(DpkgOpkgRootfs):
>
>          bb.utils.remove(self.image_rootfs, True)
>          bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
> -        from oe.package_managers.deb.manifest import DpkgManifest
> -        self.manifest = DpkgManifest(d, manifest_dir)
> +        import importlib
> +        self.manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, manifest_dir)
>          self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
>                           d.getVar('PACKAGE_ARCHS'),
>                           d.getVar('DPKG_ARCH'))
> @@ -699,8 +698,8 @@ class OpkgRootfs(DpkgOpkgRootfs):
>          super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
>          self.log_check_regex = '(exit 1|Collected errors)'
>
> -        from oe.package_managers.ipk.manifest import OpkgManifest
> -        self.manifest = OpkgManifest(d, manifest_dir)
> +        import importlib
> +        self.manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, manifest_dir)
>          self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
>          self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
>
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 70451a0b3a..18f6c16bd2 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -114,11 +114,9 @@ class RpmSdk(Sdk):
>      def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
>          super(RpmSdk, self).__init__(d, manifest_dir)
>
> -        from oe.package_managers.rpm.manifest import RpmManifest
> -        self.target_manifest = RpmManifest(d, self.manifest_dir,
> -                                           Manifest.MANIFEST_TYPE_SDK_TARGET)
> -        self.host_manifest = RpmManifest(d, self.manifest_dir,
> -                                         Manifest.MANIFEST_TYPE_SDK_HOST)
> +        import importlib
> +        self.target_manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
> +        self.host_manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
>
>          rpm_repo_workdir = "oe-sdk-repo"
>          if "sdk_ext" in d.getVar("BB_RUNTASK"):
> @@ -232,14 +230,9 @@ class OpkgSdk(Sdk):
>          if "sdk_ext" in d.getVar("BB_RUNTASK"):
>              ipk_repo_workdir = "oe-sdk-ext-repo"
>
> -        from oe.package_managers.ipk.manifest import OpkgManifest
> -        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
> -                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),
> -                                ipk_repo_workdir=ipk_repo_workdir)
> -
> -        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
> -                              self.d.getVar("SDK_PACKAGE_ARCHS"),
> -                                ipk_repo_workdir=ipk_repo_workdir)
> +        import importlib
> +        self.target_manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, self.sdk_target_sysroot, self.target_conf, self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), ipk_repo_workdir=ipk_repo_workdir)
> +        self.host_manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, self.sdk_host_sysroot, self.host_conf, self.d.getVar("SDK_PACKAGE_ARCHS"), ipk_repo_workdir=ipk_repo_workdir)
>
>      def _populate_sysroot(self, pm, manifest):
>          pkgs_to_install = manifest.parse_initial_manifest()
> @@ -310,11 +303,9 @@ class DpkgSdk(Sdk):
>          self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
>          self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
>
> -        from oe.package_managers.deb.manifest import DpkgManifest
> -        self.target_manifest = DpkgManifest(d, self.manifest_dir,
> -                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
> -        self.host_manifest = DpkgManifest(d, self.manifest_dir,
> -                                          Manifest.MANIFEST_TYPE_SDK_HOST)
> +        import importlib
> +        self.target_manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
> +        self.host_manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
>
>          deb_repo_workdir = "oe-sdk-repo"
>          if "sdk_ext" in d.getVar("BB_RUNTASK"):
> --
> 2.20.1

This is a functional change rather than just moving code. I recommend
the first patch series here just moves the relevant code and adds
additional imports, redirection, etc as needed. Once that's reviewed
and merged then we can look at a follow up series to make things more
dynamic and support package managers being added by other layers.

Mixing the functional changes and the code moves in a single series
makes review & testing difficult.

I also think we'd need a test case for this. Perhaps a dummy package
manager can be added in the meta-selftest layer and a selftest case
can confirm that this is loaded.


--
Paul Barker
Konsulko Group
