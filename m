Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F778EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 08:59:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.6075.1687251576631521025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 01:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YZ+aFf0w;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1687251577;
  x=1718787577;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=OjDz20bUdYnXhzGXGS5gdbjG4x0B2nX+l8MJXaD9/b0=;
  b=YZ+aFf0wfqtHnXh8UzXEM4RtKKCS7ejoa0Z1l19mDhUp3LvWMBa9xmCq
   YLptv5pvnlf7rOqXAl7CCFc7a6tpuK8Z0MnkVIEwuFlRJwKgTF02AnJ90
   auiYiH+sztIX6mIs4NIZh0N4GOyNnlR5Cqa8ZgdUSn5wqHa7WsYeZKK+d
   xcyRC1nbOJTspQlIdCq4UGZOlqRxRuQ4hGggBQQi/nml6j0kSZ9jDBss0
   bcJ3Qh/ASFf/zDClVns89KMQ5UgcyiqB11whrhoIOsFuca8ucrwdlxEhe
   bLRC3vKoLFVIyZ0eccQCNbUgZ18xjMo2s4WJ1NhpfUyol3ZTFjzwmgZLq
   Q==;
References: <20230619231343.1683736-1-jose.quaresma@foundries.io>
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, Jose Quaresma
	<jose.quaresma@foundries.io>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
Subject: Re: [PATCH V2 1/2] kernel-module-split: make autoload and probeconf
 distribution specific
Date: Tue, 20 Jun 2023 10:54:10 +0200
Organization: Axis Communications AB
In-Reply-To: <20230619231343.1683736-1-jose.quaresma@foundries.io>
Message-ID: <jwqh6r2bjbf.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183131


On Mon, Jun 19 2023, Jose Quaresma wrote:

> The modules-load.d [1] - Configure kernel modules to load at boot
> should install their configuration files in /usr/lib/modules-load.d.
>
> The modprobe.d [2] - Configuration directory for modprobe
> should install their configuration files in /lib/modprobe.d
>
> [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
>
> [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212
>
> CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>
> V2: use the same location as before on the class and define the new
> location just for systemd.
>
>  .../kernel-module-split.bbclass               | 30 +++++++++----------
>  .../distro/include/init-manager-systemd.inc   |  4 +++
>  2 files changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> index 50882c31a7..ee14bb6910 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -30,8 +30,11 @@ fi
>  
>  PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
>  
> +modulesloaddir ??= "${sysconfdir}/modules-load.d"
> +modprobedir ??= "${sysconfdir}/modprobe.d"
> +
>  do_install:append() {
> -	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
> +	install -d ${D}${modulesloaddir} ${D}${modprobedir}
>  }
>  
>  KERNEL_SPLIT_MODULES ?= "1"
> @@ -93,8 +96,9 @@ python split_kernel_module_packages () {
>  
>          dvar = d.getVar('PKGD')
>  
> -        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
> +        # If autoloading is requested, output ${modulesloaddir}/<name>.conf and append
>          # appropriate modprobe commands to the postinst
> +        autoloadpath = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
>          autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
>          autoload = d.getVar('module_autoload_%s' % basename)
>          if autoload and autoload == basename:
> @@ -102,8 +106,7 @@ python split_kernel_module_packages () {
>          if autoload and basename not in autoloadlist:
>              bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
>          if basename in autoloadlist:
> -            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
> -            f = open(name, 'w')
> +            f = open("%s%s" % (dvar, autoloadpath), 'w')
>              if autoload:
>                  for m in autoload.split():
>                      f.write('%s\n' % m)

You could take the opportunity to rewrite this section to use context
manager to handle the file object:
  with open(...) as f


> @@ -117,23 +120,19 @@ python split_kernel_module_packages () {
>              d.setVar('pkg_postinst:%s' % pkg, postinst)
>  
>          # Write out any modconf fragment
> +        modconfpath = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
>          modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
>          modconf = d.getVar('module_conf_%s' % basename)
>          if modconf and basename in modconflist:
> -            name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
> -            f = open(name, 'w')
> +            f = open("%s%s" % (dvar, modconfpath), 'w')

Same.

>              f.write("%s\n" % modconf)
>              f.close()
>          elif modconf:
>              bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
>  
> -        files = d.getVar('FILES:%s' % pkg)
> -        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
> -        d.setVar('FILES:%s' % pkg, files)
> -
> -        conffiles = d.getVar('CONFFILES:%s' % pkg)
> -        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
> -        d.setVar('CONFFILES:%s' % pkg, conffiles)
> +        appendfiles = " %s %s" % (autoloadpath, modconfpath)
> +        d.appendVar('FILES:%s' % pkg, appendfiles)
> +        d.appendVar('CONFFILES:%s' % pkg, appendfiles)
>  

I think it would be best to use autoloadpath and modconfpath for the
automatic creation of such files, but use all known variants of these
paths for the package splitting.  If the module makefile creates the
files in one of the places the package splitter should find them without
requireing the customization of the recipe. 

>          if "description" in vals:
>              old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
> @@ -169,8 +168,7 @@ python split_kernel_module_packages () {
>      postrm = d.getVar('pkg_postrm:modules')
>  
>      if splitmods != '1':
> -        etcdir = d.getVar('sysconfdir')
> -        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
> +        d.appendVar('FILES:' + metapkg, '%s/ %s/ %s/modules/' % (modulesloaddir, modprobedir, d.getVar("nonarch_base_libdir")))
>          d.appendVar('pkg_postinst:%s' % metapkg, postinst)
>          d.prependVar('pkg_postrm:%s' % metapkg, postrm);
>          return
> @@ -189,7 +187,7 @@ python split_kernel_module_packages () {
>      # avoid warnings. removedirs only raises an OSError if an empty
>      # directory cannot be removed.
>      dvar = d.getVar('PKGD')
> -    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
> +    for dir in ["%s%s" % (dvar, modprobedir), "%s%s" % (dvar, modulesloaddir)]:
>          if len(os.listdir(dir)) == 0:
>              os.rmdir(dir)
>  }

Same.

> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
> index 7867d90028..fc13089764 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -5,3 +5,7 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
>  VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
>  VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
>  VIRTUAL-RUNTIME_dev_manager ??= "systemd"
> +
> +# use autoload and probeconf distribution specific
> +modulesloaddir ?= "${libdir}/modules-load.d"
> +modprobedir ?= "${nonarch_base_libdir}/modprobe.d"


-- 
Ola x Nilsson

