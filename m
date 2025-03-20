Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72A3C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 19:22:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.3575.1742498557952993094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 12:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=caG014HJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c3c4ff7d31so181282285a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742498557; x=1743103357; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfQGuDmIJGh/ITSOT4YNszWuZawwGFZvKsfzUbZxJ14=;
        b=caG014HJoE6KNHb44GzrQgvNcLgnzh/yHmushwapMMArg04oDMMDaphyozwtk/MtRp
         YhNEqhHIWetou3xWedY0bTY3D1HurnlxBZTZzBlUj9LufjnNS6AUmL2+sjQXxU6E89WW
         ddRsa8QR3j0Ows5RMTkHYGdb7WlHL1l6E1a6SDBY6Jo+S8XkT91MBGW/j8XEPMawYkga
         kXSVP/XwNUYBGs0s1ua7t34Ynd40p5ITu4Xo63ditXcoXsEyqXaAbPb7KfLt9CHB9zP7
         im1REGaOApY8a4dHIZFd0uaY9z7L9YsqCN8IheTxCmYkkGs2rm8ioU2h/w9krPDXcwo8
         /g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742498557; x=1743103357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfQGuDmIJGh/ITSOT4YNszWuZawwGFZvKsfzUbZxJ14=;
        b=CUTvuCFYgz9GPAgkJWz1g65PcJapeELgtkYA3KtWCtexXRMFeOX15YE5z5i9xLgSE0
         etqZX2Lcgkkl2WhUwZ00AwxO+tDEdY/MZ4hKgsJj3AzuuE+C3sRZNo7TbvfWd7QlfEOp
         wxF1MzbDIFBHTlHfZhTDuGWBGSYnsH7xj+UMsvZefl+QiGYWufXEzpw7JQYHvIFFF7Cr
         7TNbWSv1dOqrCnJRnfBafMfsnPe43sX1z+UxAAINZYiEsZwU66T4ju5esw47oxIBu/dF
         K6P8Z5ZPCrXuWOqac0zg2SFukNu6apxfYDzgQTDDbKVQ9Al7o9nzaXbmsaHVFTilr/fL
         y0xw==
X-Gm-Message-State: AOJu0YzHJvDX8QZxFcSZIKylqlUa4aiaOWkjHXnLp/NsOtuEJDpqTye4
	Ry+xnPTlC8aw3zvtXEKc47DX+HgtafYhkeqswaa4vWF/bKndk0mTDH8AjPyhUKs=
X-Gm-Gg: ASbGncukMmYalVMbbJLayvhAMYBiJe62IdEK9NiXX2b8goLM6a6skg+91vhPS14fZJ/
	cgDYmqQlJxagJB6qG9avQedLH4v7/fq1uB1X5Hz2RtSFFNmWjXReG6PoQuZnhoZckl1HoY38JyU
	EDVgFuqIwIQ7Y6WSmjAoJ0P+dGKZl6P9Bg7Mf+jUq6yw9YYGPaE1LqHiONsIsQ5TZrf3/UhXoZS
	IZbLBd1wnKVGRoRsszb99+CW5U8Tr2M8dd/M97em0vW7nXGK9492FARhA0uysWhqFJA9tKPA3EB
	9ER6QY0LhGikCcyJLn59Q9Z5F2pLLQToIVDpEvAxEAfJhTGMjsY/B2pc0sJEb7S2HySAaLUakrQ
	mYF6YICOhUATcI/0l5OVr35U=
X-Google-Smtp-Source: AGHT+IFKY94rvrjNkAOuc00Gdo3kJQ644nILUIfcV8W4E+mxTP0HIFS0TbZFuRQYgrWNmVURN6pcig==
X-Received: by 2002:a05:620a:40c7:b0:7c5:57e6:ee87 with SMTP id af79cd13be357-7c5ba1e41abmr50161585a.41.1742498556658;
        Thu, 20 Mar 2025 12:22:36 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b934844asm23119685a.85.2025.03.20.12.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:22:35 -0700 (PDT)
Date: Thu, 20 Mar 2025 15:22:33 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	George Thopas <george.thopas@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] kernel-module-split: fix conf file
 generation when KERNEL_SPLIT_MODULES=0
Message-ID: <Z9xq+a9CuOr5heIs@gmail.com>
References: <20250222071113.81675-1-dixitparmar19@gmail.com>
 <20250316082106.14290-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316082106.14290-1-dixitparmar19@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 19:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213426

In message: [OE-core] [PATCH 1/1] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
on 16/03/2025 Dixit Parmar via lists.openembedded.org wrote:

> When KERNEL_SPLIT_MODULES=0 modprobe and autoload conf files are not getting
> generated for the kernel modules.
> 
> Separated out conf file handling mechanism as handle_conf_files() function
> from hook frob_metadata() function. handle_conf_files() gets re-used from the
> existing hook function and add_conf_files function which got introduced for
> splitmods=0 flow in this patch.

Trevor's advice on the commit message was excellent, I won't repeat
it here. I'll just simply add that the commit message should give us
all the information we need about the issue (and what its symptoms
are) and how this fixes it (not explaining the code, but describing
the strategy)

> 
> [YOCTO #15145]
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> Cc: George Thopas <george.thopas@gmail.com>
> --
> Can you show the conf files for the same kernel configuration
> with and without the kernel_split_modules enabled ? That way
> we know there's no change in existing behaviour.
> > I have confirmed that in my testing. Can you suggest how I can
> share that information here?

A good way would simply to put it in the commit message that you've
built and booted with both modes and that the generated module
conf files are the same in both cases. Showing a diff command
that you ran, or how you determined they were the same would be enough
as well.

> 
> We also should make a test for this in the OE selftests. We
> are adding conditional code paths, so they should be tested
> to ensure no regressions in either in the future.
> > Never done that before. May be I can do it given some direction 
> as separate patch.

Any selftests should be in a separate patch, but they do need
to come along with any new verions of this. Saying that "it will
be send later" won't get the patches merged. Since everyone gets
busy and these sorts of things tend to not happen.

If you search on the mailing list(s) you'll find examples of
other self tests being submitted. Just follow what they are
doing. I'd suggest that a self test needs to run both modes
and do a check that the generated .conf files are correct
(basically what you'd be showing in the commit message). Even
better if a boot and showing that they are (auto)loaded.

That's the only way we can be sure this won't break in the
future and be comfortable with the complexty being added.

> 
> I'm curious about the above line. It is unclear to me why we'd
> only have this postinst be relevant if none was previously set.
> > Reverted.
> 
> Is there really a scenario where the directory won't exist ? Isn't
> this just running in our own install phase ? So all prerequisites
> and directories should be in place.
> > Ideally no, we kept it for safer side, I have added log warning.
>

As Trevor mentioned in his reply, it is best to configure your
mail client to reply inline. I had made that comment near the
line of code in question, but with the time between my review,
your reply and now this reply .. the context of what was being
discussed is very difficult to remember.

If that directory doesn't exist, just error out and do not
continue. This isn't something recoverable, and the build should
be stopped.


> The walking and sorting seems quite heavy.  Isn't this called from do_split_packages indirectly ?
> Do we really need to walk and gather the information ? Is this mainly for the case of no-split
> on the kernel modules ? If that is the case, isn't there a way to short circuit the processing
> on the split-package case ?
> > Litterally I could not think of anything else here and not sure of there
> are any short-circuit options. I have limited knowledge in this. I am open to suggestions
> if this is not the best solution at the moment.

Describe the approach in your commit message, this is the type of
information that we need. To be sure that it isn't adding a lot of
time to the build, add some timing information with and without
your changes. This is the type of information we are looking for
in a review.

See a few more comments below.

> ---
>  .../kernel-module-split.bbclass               | 81 +++++++++++++++----
>  1 file changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..b7ee3a8f9e 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -86,11 +86,7 @@ python split_kernel_module_packages () {
>              vals[m.group(1)] = m.group(2)
>          return vals
>  
> -    def frob_metadata(file, pkg, pattern, format, basename):
> -        vals = extract_modinfo(file)
> -
> -        dvar = d.getVar('PKGD')
> -
> +    def handle_conf_files(d, basename, pkg):
>          # If autoloading is requested, output ${modulesloaddir}/<name>.conf and append
>          # appropriate modprobe commands to the postinst
>          autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
> @@ -101,7 +97,7 @@ python split_kernel_module_packages () {
>              bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
>          if basename in autoloadlist:
>              conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
> -            name = '%s%s' % (dvar, conf)
> +            name = '%s%s' % (d.getVar('PKGD'), conf)
>              os.makedirs(os.path.dirname(name), exist_ok=True)
>              with open(name, 'w') as f:
>                  if autoload:
> @@ -123,7 +119,7 @@ python split_kernel_module_packages () {
>          modconf = d.getVar('module_conf_%s' % basename)
>          if modconf and basename in modconflist:
>              conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
> -            name = '%s%s' % (dvar, conf)
> +            name = '%s%s' % (d.getVar('PKGD'), conf)
>              os.makedirs(os.path.dirname(name), exist_ok=True)
>              with open(name, 'w') as f:
>                  f.write("%s\n" % modconf)
> @@ -134,6 +130,63 @@ python split_kernel_module_packages () {
>          elif modconf:
>              bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
>  
> +    def add_conf_files(d, root, file_regex, output_pattern):
> +        """
> +        Arguments:
> +        root           -- the path in which to search
> +        file_regex     -- regular expression to match searched files. Use
> +                          parentheses () to mark the part of this expression
> +                          that should be used to derive the module name (to be
> +                          substituted where %s is used in other function
> +                          arguments as noted below)
> +        output_pattern -- pattern to use for the package names. Must include %s.
> +        """
> +
> +        dvar = d.getVar('PKGD')
> +        root = d.expand(root)

root is a passed parameter, you shouldn't need to call d.expand()
on it. Are you expecting there to be something that can be expanded ?

> +        output_pattern = d.expand(output_pattern)

Likewise with output_pattern

> +
> +        # check if the root directory doesn't exist for safe side, don't error out later but silently do
> +        # no splitting.
> +        if not os.path.exists(dvar + root):
> +            bb.warn("kernel module root directory path does not exist")
> +            return []

as I mentioned above, I see this as a fatal error. Something has gone
terribly wrong if this doesn't exist and we should error and exit.

> +
> +        # get list of modules
> +        objs = []
> +        for walkroot, dirs, files in os.walk(dvar + root):
> +            for file in files:
> +                relpath = os.path.join(walkroot, file).replace(dvar + root + '/', '', 1)
> +                if relpath:
> +                    objs.append(relpath)

The above block of code needs a comment. What exactly is it doing ?
My quick read of it makes me think it is checking our staged / rootfs / sysroot
for the modules, and then removing that part of the path so we'll presumably
have the path as they will appear on the target when it boots ?

We need explanations in the code about the logic, otherwise, it is going
to be unmaintainable.

> +
> +        for o in sorted(objs):
> +            import re, stat
> +            if False:
> +                m = re.match(file_regex, o)
> +            else:
> +                m = re.match(file_regex, os.path.basename(o))
> +
> +            if not m:
> +                continue

Why isn't this test just done when walking the module files ? I don't
see the point in walking once, and not testing to see if they are
modules during that walk.

> +
> +            file = os.path.join(dvar + root, o)
> +            mode = os.lstat(file).st_mode
> +            if not (stat.S_ISREG(mode) or (allow_links and stat.S_ISLNK(mode)) or (allow_dirs and stat.S_ISDIR(mode))):
> +                continue
> +
> +            on = legitimize_package_name(m.group(1))
> +            pkg = output_pattern % on
> +
> +            basename = m.group(1)
> +            handle_conf_files(d, basename, pkg)
> +
> +    def frob_metadata(file, pkg, pattern, format, basename):
> +        vals = extract_modinfo(file)
> +        dvar = d.getVar('PKGD')
> +
> +        handle_conf_files(d, basename, pkg)
> +
>          if "description" in vals:
>              old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
>              d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
> @@ -167,19 +220,19 @@ python split_kernel_module_packages () {
>      postinst = d.getVar('pkg_postinst:modules')
>      postrm = d.getVar('pkg_postrm:modules')
>  
> +    module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> +    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> +    module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> +    module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
> +
>      if splitmods != '1':
>          d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
>              (d.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_libdir")))
>          d.appendVar('pkg_postinst:%s' % metapkg, postinst)
> -        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
> +        d.prependVar('pkg_postrm:%s' % metapkg, postrm)

Why did you remove the semicolon above ? I admit it is strange to see
it in the python routine, but it doesn't look related to your changes.

> +        add_conf_files(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern)

I think this would be better called "create_conf_files" or "generate_conf_files".

It was the semicolon and the name of the routine that had me asking about the
routine being called from do_split_packages(). But I see that it in fact is
not called during package splitting, but only called once (when splitting is
not enabled) .. amd I ready that correctly now ?

Bruce

>          return
>  
> -    module_regex = r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> -
> -    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> -    module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> -    module_pattern = module_pattern_prefix + kernel_package_name + '-module-%s' + module_pattern_suffix
> -
>      modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>      if modules:
>          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212994): https://lists.openembedded.org/g/openembedded-core/message/212994
> Mute This Topic: https://lists.openembedded.org/mt/111728665/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


