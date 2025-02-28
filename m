Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDF4C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 19:02:55 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.2298.1740769369338551725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 11:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cT20OnXj;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0ba9825e9so171811985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740769368; x=1741374168; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xk+Y2E8ULZvAblDsknV9gcUFz0iwKdf0ahGR9DhfyD8=;
        b=cT20OnXj3L3SLtise8rhd67j+mu+oE1sb8MK6TNPpJ6ARBfE62aSgtSTZ+sugeeGYn
         f1DaGyxkkfyt+GvxBvAUEqv2g6ZmR8awdwMVgfn6zoZe8igW37TtXdrXpIAPGwj6MIg6
         se42b1RWnmpljjc/8hk0y6v2jQRyMKmhYdhn+pp/H2Rvnb8cdC23aoEaIDc7t25V7rFk
         n8MT5DyYhlaS4rdYx7IkYqumaw5OXWO26SbUcOKUnLegiIc+uxuRJIiJE85c75kiXaIl
         1TePSEJehh/qZnLg3CgUkbtSfYHUe5yskNt6P5NXZUspzAVCtpI7ugvhfiAq5QErmNPm
         RxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740769368; x=1741374168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk+Y2E8ULZvAblDsknV9gcUFz0iwKdf0ahGR9DhfyD8=;
        b=BnvwtoK7bOssj3bvKFGKlK/Z50SkpSwvzoCCLQRfTGPXbMqH7E4W0cYVddbrK/vuEY
         GKDpTcbOozk/80eF/bBdvo4ltMI8P47NZJK1SHQ6TL+oKJojih9nV2AI4W/l8LsiCo6M
         HvlsHZYqpD/Q0EfwBXj0c/+BxI5ENXAmeXYwmkpdHa8bioeKl539zivFeIjtEOzzfWLD
         hqKQiPxAclsx/Bw/w6pSt14xGTp5U1zfl0cpTWkmaxXuY2NHp5rznQZq6nSeF/IJlyU7
         uJgXJLQ1lLl8s8dgE8pmDXSoeqqO7oAG3s8tuuFrj6NFHdQhav7Lwu+VazZUjiIMOX49
         lWfA==
X-Gm-Message-State: AOJu0Yz7Fw5s9Jtlb1ZUt410mdHQvs3dPA+xRX+4cU8k8NI0DTbiwhR+
	Wf24D3jUcfQucqzFRmwbsGAbCZcez7vC3HKLnAqz46IuwEgqDoM6
X-Gm-Gg: ASbGncthDQTBwQqGBxC+sGYyVtzI86BGMgW1bVmMNFPHz1WXEzIGso90qpe77JaTgXi
	CLUQBLgEYMHXMplKF0EBWiG9SZJmycJxbXNPbrEd/NH0K6KOeVxrDttE5eOvFKa93JdJ6DnR0SP
	RNHKM6JH2sKRiFRSBJW/SAWzjRuruxvuMv8ELsl3oJrGsgr+nNumfQpA+/jY/RgPTY1M5BCqSoc
	KZO0kqlhkRTBg01K3X7aVo3rymz8UYnShEgcIhRFMFCGpecBRyUCNNi+2Wfw1ewlnaJq0VDnkGr
	DDxwFTNfr/twOBfh5Tuoh7hXZunIbk/oCbViLr5ZYMKHZnlfYCmKMj5GxdTUjZ3nUECPjtkEW/L
	caivR
X-Google-Smtp-Source: AGHT+IGAHPIGi27IKht3+rcPeXBaIYw0Y5dXCk5wh0w9/xXJYlOwDiUIUUtzMF7gB90lM8w8SyU3dg==
X-Received: by 2002:a05:620a:28c2:b0:7c0:a1ee:e8d7 with SMTP id af79cd13be357-7c39c675199mr637538585a.50.1740769368168;
        Fri, 28 Feb 2025 11:02:48 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e897634a23sm24957846d6.8.2025.02.28.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:02:47 -0800 (PST)
Date: Fri, 28 Feb 2025 14:02:45 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	George Thopas <george.thopas@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split: fix conf file generation
 when KERNEL_SPLIT_MODULES=0
Message-ID: <Z8IIVTwVir8JCsxE@gmail.com>
References: <20250222071113.81675-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222071113.81675-1-dixitparmar19@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 19:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212075

In message: [OE-core] [PATCH] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
on 22/02/2025 Dixit Parmar via lists.openembedded.org wrote:

> When KERNEL_SPLIT_MODULES=0 modprob and autload conf files are not getting

s/modprob/modprobe/
s/autload/autoload/

> generated for the kernel modules.
> 
> Separated out conf file handling mechanism as handle_conf_files() function
> from hook frob_metadata() function. handle_conf_files() gets re-used from the
> existing hook function and add_conf_files function which got introduced for
> splitmods=0 flow in this patch.

Can you show the conf files for the same kernel configuration
with and without the kernel_split_modules enabled ? That way
we know there's no change in existing behaviour.

We also should make a test for this in the OE selftests. We
are adding conditional code paths, so they should be tested
to ensure no regressions in either in the future.

> 
> [YOCTO #15145]
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> Cc: George Thopas <george.thopas@gmail.com>
> ---
>  .../kernel-module-split.bbclass               | 82 +++++++++++++++----
>  1 file changed, 67 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..2fb3ab967f 100644
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
> @@ -114,7 +110,7 @@ python split_kernel_module_packages () {
>              d.appendVar('CONFFILES:%s' % pkg, conf2append)
>              postinst = d.getVar('pkg_postinst:%s' % pkg)
>              if not postinst:
> -                bb.fatal("pkg_postinst:%s not defined" % pkg)
> +                postinst = d.getVar('pkg_postinst:modules')

I'm curious about the above line. It is unclear to me why we'd
only have this postinst be relevant if none was previously set.

>              postinst += d.getVar('autoload_postinst_fragment') % (autoload or basename)
>              d.setVar('pkg_postinst:%s' % pkg, postinst)
>  
> @@ -123,7 +119,7 @@ python split_kernel_module_packages () {
>          modconf = d.getVar('module_conf_%s' % basename)
>          if modconf and basename in modconflist:
>              conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
> -            name = '%s%s' % (dvar, conf)
> +            name = '%s%s' % (d.getVar('PKGD'), conf)
>              os.makedirs(os.path.dirname(name), exist_ok=True)
>              with open(name, 'w') as f:
>                  f.write("%s\n" % modconf)
> @@ -134,6 +130,62 @@ python split_kernel_module_packages () {
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
> +        output_pattern = d.expand(output_pattern)
> +
> +        # if the root directory doesn't exist, don't error out later but silently do
> +        # no splitting.
> +        if not os.path.exists(dvar + root):
> +            return []

Is there really a scenario where the directory won't exist ? Isn't
this just running in our own install phase ? So all prerequisites
and directories should be in place.

> +
> +        # get list of modules
> +        objs = []
> +        for walkroot, dirs, files in os.walk(dvar + root):
> +            for file in files:
> +                relpath = os.path.join(walkroot, file).replace(dvar + root + '/', '', 1)
> +                if relpath:
> +                    objs.append(relpath)
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

The walking and sorting seems quite heavy.  Isn't this called from do_split_packages indirectly ?
Do we really need to walk and gather the information ? Is this mainly for the case of no-split
on the kernel modules ? If that is the case, isn't there a way to short circuit the processing
on the split-package case ?

Bruce

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
> @@ -167,19 +219,19 @@ python split_kernel_module_packages () {
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
> +        add_conf_files(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern)
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
> View/Reply Online (#211817): https://lists.openembedded.org/g/openembedded-core/message/211817
> Mute This Topic: https://lists.openembedded.org/mt/111322503/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


