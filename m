Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id B880C6FE7D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 19:02:05 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so1781549lbj.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 12:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=raf3Jp/WGGMC1+P5lvOYfZZWLkV8GnLg2EKp/5dWKCc=;
	b=ezLkpJlRHjdIUjWbu70rcPZUPmrSaoJxbavw7pOhEwH4NkuxXQCvLEISnb2ejpprS2
	UfZ3XRqi1G1JVqs2UPvi3YZRlSMAInpEHk+zUVq1pruKcchDggXviqhxhaA8zr6vpShd
	pK2BU570/0wdU+weI0H51AXxiGEHLxLeGe8NApjyTTS1r9/2vkbfIZ5SNvLaCxyrVHHX
	YCka1yHm8K1RU8oFZ17KaV5bZptbMK3VDqyqxCwRwUt7hnB5zO1j43bbPiObHTsvpG4X
	vS7hPJkePXqGVdr5RUcZoJMyAuYQPz8biK3gw8SyO3uAytl+4Bx5votKDbRWEm6eS1+9
	49uQ==
MIME-Version: 1.0
X-Received: by 10.112.138.37 with SMTP id qn5mr2613233lbb.52.1402686125602;
	Fri, 13 Jun 2014 12:02:05 -0700 (PDT)
Received: by 10.112.124.146 with HTTP; Fri, 13 Jun 2014 12:02:05 -0700 (PDT)
In-Reply-To: <1402674385.29913.6.camel@ted>
References: <1402674385.29913.6.camel@ted>
Date: Fri, 13 Jun 2014 15:02:05 -0400
Message-ID: <CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Fri, 13 Jun 2014 19:02:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 13, 2014 at 11:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The current module_autoload_* and module_conf_* variables are error
> both ugly and error prone. They aren't registered in the task checksums
> so changes to them aren't reflected in the build. This turns out to
> be near impossible to fix with the current variable format in any
> sensible way :(.
>
> This patch replace module_autoload with the list of variables in
> KERNEL_MODULE_AUTOLOAD which is a much simpler and usable API. An
> error is printed if an old style variable is encountered. It should
> be simple to convert to this.
>
> module_conf_* are harder to deal with since there is data associated
> with it, it isn't simply a flag. We need a list of variables that are set
> in order to be able to correctly handle the task checksum so we add
> KERNEL_MODULE_PROBECONF for this purpose and error if the user hasn't
> added a module to it when they should have.

Looks reasonable to me. In my experience, there aren't a lot of users of
the module_* variables, so the transition to the new names and semantics
shouldn't be a big issue.

Cheers,

Bruce

>
> [YOCTO #5786]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> index d43f743..e38a6f6 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -130,8 +130,11 @@ python split_kernel_module_packages () {
>
>          # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
>          # appropriate modprobe commands to the postinst
> +        autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or "").split()
>          autoload = d.getVar('module_autoload_%s' % basename, True)
>          if autoload:
> +            bb.error("KERNEL_MODULE_AUTOLOAD has replaced module_autoload_%s, please replace it!" % basename)
> +        if basename in autoloadlist:
>              name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
>              f = open(name, 'w')
>              for m in autoload.split():
> @@ -144,12 +147,15 @@ python split_kernel_module_packages () {
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>
>          # Write out any modconf fragment
> +        modconflist = (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()
>          modconf = d.getVar('module_conf_%s' % basename, True)
> -        if modconf:
> +        if modconf and basename in modconflist:
>              name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>              f = open(name, 'w')
>              f.write("%s\n" % modconf)
>              f.close()
> +        elif modconf:
> +            bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
>
>          files = d.getVar('FILES_%s' % pkg, True)
>          files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
> @@ -185,3 +191,5 @@ python split_kernel_module_packages () {
>          if len(os.listdir(dir)) == 0:
>              os.rmdir(dir)
>  }
> +
> +do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()))}'
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

