Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.7651.1593081803269015043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kZ78O0m5;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id k4so1634078otr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=to9goDxXpKBihMyK7eWfGMILqCnYjMPP+tnFJgUx29E=;
        b=kZ78O0m5XUaca4AS0AFojEOFkPUP/epcnFfCnkZBWRUfFjDnOC4lY4NuqjLCMAVmgZ
         WYB3mtkjRcqX52MbczHksfpoW+4FCjKrIZroY3JGGGqrU6+zaQ7mCcrU+iPsCodA90lR
         m9aOlztAElTXhlek34yU0kurISdX9vSQyGWIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=to9goDxXpKBihMyK7eWfGMILqCnYjMPP+tnFJgUx29E=;
        b=dgsmYV9Dnkti/BGHrpHn4grl45fspZXPzswTF0YoXA76VthaexEyGIBMtsYt4TC8dQ
         P3lgbC3rhrHzXgi7EiO/cD33D9uPpKR/73OPjC5yHA/i0xb4yCjUi8i+G5znY8LNzbGs
         WBfwvEWZ8N0z1isF6k/z76GeOMFK9pi8W+rK2+hiPPqlTz1oVTRmu6KQHirAnnIxgh/D
         vyFl5+o1yT21BNe5g8kXAirWIbN6juv+hu9ncnhk2eHiaoo/fNqIWTDE/TB/tUSmWaJB
         1u/xjuN7/oFpGfx/0hoVLjwmxCU8di4KVoj3M2sgxkdHGIwWzJZEXAvKN4HjRp7FQf8e
         yMPg==
X-Gm-Message-State: AOAM533DWlenOIxurRyEsWRkPoncvUv3bBRJi+JLhN4Zqpp4lWMPK1Ko
	cjEmJuoiDciA2qJgd4RhFpv11who5l9/tcKOFtmtOQ==
X-Google-Smtp-Source: ABdhPJygJSkljTTYl0U42mxlzCM0SbB2y2jR1mO0hWbkzehnS7LfTycyyegYkDmndasBozu57H9eS+/I++mADVDNYRw=
X-Received: by 2002:a9d:6c02:: with SMTP id f2mr11493564otq.258.1593081802546;
 Thu, 25 Jun 2020 03:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-27-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-27-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:43:12 +0100
Message-ID: <CAM9ZRVtvVPF6qafmfNRz8x_usK5LErx_2pcVREWinNPv8UQq8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 26/26] package_manager: Rename PkgsList classes
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Rename all *PkgsList classeds to PkgsList to enable dynamic calling.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  .../oe/package_managers/deb/package_manager.py    |  4 ++--
>  .../oe/package_managers/ipk/package_manager.py    | 12 +++++++-----
>  .../oe/package_managers/rpm/package_manager.py    |  2 +-
>  meta/lib/oe/rootfs.py                             | 12 ++----------
>  meta/lib/oe/sdk.py                                | 15 ++-------------
>  5 files changed, 14 insertions(+), 31 deletions(-)
>
> diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
> index 0ef8e91eea..f33390d1cb 100644
> --- a/meta/lib/oe/package_managers/deb/package_manager.py
> +++ b/meta/lib/oe/package_managers/deb/package_manager.py
> @@ -367,7 +367,7 @@ class PkgPM(OpkgDpkgPM):
>                       "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
>
>      def list_installed(self):
> -        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
> +        return PkgsList(self.d, self.target_rootfs).list_pkgs()
>
>      def package_info(self, pkg):
>          """
> @@ -538,7 +538,7 @@ def opkg_query(cmd_output):
>
>      return output
>
> -class DpkgPkgsList(PkgsList):
> +class PkgsList(PkgsList):
>
>      def list_pkgs(self):
>          cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
> diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
> index 8e47003c93..e46b14ab31 100644
> --- a/meta/lib/oe/package_managers/ipk/package_manager.py
> +++ b/meta/lib/oe/package_managers/ipk/package_manager.py
> @@ -333,7 +333,7 @@ class PkgPM(OpkgDpkgPM):
>              bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
>
>      def list_installed(self):
> -        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
> +        return PkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
>
>      def dummy_install(self, pkgs):
>          """
> @@ -539,10 +539,12 @@ def opkg_query(cmd_output):
>
>      return output
>
> -class OpkgPkgsList(PkgsList):
> -    def __init__(self, d, rootfs_dir, config_file):
> -        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
> -
> +class PkgsList(PkgsList):
> +    def __init__(self, d, rootfs_dir, config_file = ""):
> +        super(PkgsList, self).__init__(d, rootfs_dir)
> +
> +        if config_file == "":
> +            config_file = self.d.getVar('IPKGCONF_TARGET')
>          self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
>          self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
>          self.opkg_args += self.d.getVar("OPKG_ARGS")
> diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
> index 57a5c9ec38..06b1921676 100644
> --- a/meta/lib/oe/package_managers/rpm/package_manager.py
> +++ b/meta/lib/oe/package_managers/rpm/package_manager.py
> @@ -400,7 +400,7 @@ class PkgIndexer(RpmIndexer):
>                          self.do_write_index(dir_path)
>
>
> -class RpmPkgsList(PkgsList):
> +class PkgsList(PkgsList):
>      def list_pkgs(self):
>          return PkgPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index b71c93cf54..1f56225a18 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -370,16 +370,8 @@ def image_list_installed_packages(d, rootfs_dir=None):
>      if not rootfs_dir:
>          rootfs_dir = d.getVar('IMAGE_ROOTFS')
>
> -    img_type = d.getVar('IMAGE_PKGTYPE')
> -    from oe.package_managers.rpm.package_manager import RpmPkgsList
> -    from oe.package_managers.ipk.package_manager import OpkgPkgsList
> -    from oe.package_managers.deb.package_manager import DpkgPkgsList
> -    if img_type == "rpm":
> -        return RpmPkgsList(d, rootfs_dir).list_pkgs()
> -    elif img_type == "ipk":
> -        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET")).list_pkgs()
> -    elif img_type == "deb":
> -        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
> +    import importlib
> +    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgsList(d, rootfs_dir).list_pkgs()
>
>  if __name__ == "__main__":
>      """
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 1fac0bed5b..7b17afde78 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -116,19 +116,8 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
>
>          rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
>
> -    from oe.package_managers.rpm.package_manager import RpmPkgsList
> -    from oe.package_managers.ipk.package_manager import OpkgPkgsList
> -    from oe.package_managers.deb.package_manager import DpkgPkgsList
> -    img_type = d.getVar('IMAGE_PKGTYPE')
> -    if img_type == "rpm":
> -        arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
> -        os_var = ["SDK_OS", None][target is True]
> -        return RpmPkgsList(d, rootfs_dir).list_pkgs()
> -    elif img_type == "ipk":
> -        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
> -        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
> -    elif img_type == "deb":
> -        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
> +    import importlib
> +    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgsList(d, rootfs_dir).list_pkgs()
>
>  def populate_sdk(d, manifest_dir=None):
>      env_bkp = os.environ.copy()

Same as my previous comments, let's just do a move first and add the
dynamic loading & class renaming later.


--
Paul Barker
Konsulko Group
