Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.7908.1593081716317155223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sINKx6aC;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id 64so4796076oti.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ofark3aVY5R+ZrlFLc4Tgwv2IMSIFCV84G5QWz1d8jU=;
        b=sINKx6aChhqF2KxvlldfbtQHcd1cI6yYZEr4i6BQ1o8mpXiYxezVoKOst7JSR2XFXc
         ABLsUKM4wAcNOC69sDBZK8IJFExSa5VpJgci6PwUjRXSLBN+FfuftOotL/XRmapZ+gvH
         GJHhGdORpfjP6GTNdX7BkDFqAF42TihR32vN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ofark3aVY5R+ZrlFLc4Tgwv2IMSIFCV84G5QWz1d8jU=;
        b=LjK8jM4DC6CZ7fhqg5/IlmLaWOB3VYu6drrGaIz21NiZb9E/Pyxd8wSW15OWQdsnnr
         1jJzcqNaNoWy/NL7nxMxq5IW9jdM2fRLiJLbqZUtDua8JrwYUgB92B2FCBgEv0O+Zrxk
         EIoTim8CFeMsT3KvsPo2fWWKItV9S0kyWsnuG/Zn9sI8DRgP0++VAvYAYUgVcXdIHqaz
         fvhRq6xQ1HMDcHuO0JgPxwpfmlYx9vqBYhrFgsFSGjVxf5jTl35Z9L+v9lXHKM/8eDk7
         JZdROOx3UyZbgj2NYyqcbEcGGOiY8St+u3dA3PCpeb4zR5LOui84L0ZoUG1b+KNiBk12
         5lWQ==
X-Gm-Message-State: AOAM533fw4jBm0cudJ8MdQvcdAiluVWrPoRL2jCT51K9qJ7LjxfWXG4M
	c8mhOSgJt1Gnc0EZnlszKyAiX3wnTJjuD3I9hSIAtQ==
X-Google-Smtp-Source: ABdhPJyZXVaPZZu3CA+23bfU22iyc8dZM1xx7txyqKwIxaCY9RBWHJlLO9h+n665zs90+6WJpefNF4+scaSPLzY26+c=
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr26989012otc.92.1593081715605;
 Thu, 25 Jun 2020 03:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-11-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-11-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:41:45 +0100
Message-ID: <CAM9ZRVs5tfY8BDSGW3qd_JSpMk1U=VNfKzv4fbQTDni0GC533A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 10/26] sdk.py: Dynamic load of sdk
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Decide which sdk we should load in run time without any hard coded
> values but look at which package type that is used.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/lib/oe/package_managers/deb/sdk.py |  4 ++--
>  meta/lib/oe/package_managers/ipk/sdk.py |  4 ++--
>  meta/lib/oe/package_managers/rpm/sdk.py |  4 ++--
>  meta/lib/oe/sdk.py                      | 13 ++-----------
>  4 files changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/meta/lib/oe/package_managers/deb/sdk.py b/meta/lib/oe/package_managers/deb/sdk.py
> index 154ec5ab17..950455988a 100644
> --- a/meta/lib/oe/package_managers/deb/sdk.py
> +++ b/meta/lib/oe/package_managers/deb/sdk.py
> @@ -5,9 +5,9 @@
>  from oe.sdk import *
>  from oe.package_managers.deb.manifest import *
>
> -class DpkgSdk(Sdk):
> +class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
> -        super(DpkgSdk, self).__init__(d, manifest_dir)
> +        super(PkgSdk, self).__init__(d, manifest_dir)
>
>          self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
>          self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
> diff --git a/meta/lib/oe/package_managers/ipk/sdk.py b/meta/lib/oe/package_managers/ipk/sdk.py
> index 4862616c08..bd7bab6ebe 100644
> --- a/meta/lib/oe/package_managers/ipk/sdk.py
> +++ b/meta/lib/oe/package_managers/ipk/sdk.py
> @@ -5,9 +5,9 @@
>  from oe.sdk import *
>  from oe.package_managers.ipk.manifest import *
>
> -class OpkgSdk(Sdk):
> +class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
> -        super(OpkgSdk, self).__init__(d, manifest_dir)
> +        super(PkgSdk, self).__init__(d, manifest_dir)
>
>          self.target_conf = self.d.getVar("IPKGCONF_TARGET")
>          self.host_conf = self.d.getVar("IPKGCONF_SDK")
> diff --git a/meta/lib/oe/package_managers/rpm/sdk.py b/meta/lib/oe/package_managers/rpm/sdk.py
> index fc120b6171..d2f7447657 100644
> --- a/meta/lib/oe/package_managers/rpm/sdk.py
> +++ b/meta/lib/oe/package_managers/rpm/sdk.py
> @@ -5,9 +5,9 @@
>  from oe.sdk import *
>  from oe.package_managers.rpm.manifest import *
>
> -class RpmSdk(Sdk):
> +class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
> -        super(RpmSdk, self).__init__(d, manifest_dir)
> +        super(PkgSdk, self).__init__(d, manifest_dir)
>
>          self.target_manifest = PkgManifest(d, self.manifest_dir,
>                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index d8a00c04d1..3b7869f071 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -130,17 +130,8 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
>  def populate_sdk(d, manifest_dir=None):
>      env_bkp = os.environ.copy()
>
> -    img_type = d.getVar('IMAGE_PKGTYPE')
> -
> -    from oe.package_managers.rpm.sdk import RpmSdk
> -    from oe.package_managers.ipk.sdk import OpkgSdk
> -    from oe.package_managers.deb.sdk import DpkgSdk
> -    if img_type == "rpm":
> -        RpmSdk(d, manifest_dir).populate()
> -    elif img_type == "ipk":
> -        OpkgSdk(d, manifest_dir).populate()
> -    elif img_type == "deb":
> -        DpkgSdk(d, manifest_dir).populate()
> +    import importlib
> +    importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.sdk').PkgSdk(d, manifest_dir).populate()
>
>      os.environ.clear()
>      os.environ.update(env_bkp)

See my comments on the patch to add dynamic loading of the manifest
class - the same comments apply here.


--
Paul Barker
Konsulko Group
