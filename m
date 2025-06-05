Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E0EC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:17:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.7307.1749129430179047834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CuqvJUOI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so834388a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129429; x=1749734229; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9sdHwX3NDWDTFZMgCYQw8M8l0X6aQrEZJ8MeJfaC2DU=;
        b=CuqvJUOI3DHUuvvxA4a8dWfHb0sDQfYo6rgp+uYhGVVPs/fB4qr6uw4D88TuCCOqWP
         SKF3+e8m1C29bM9ezrAa9wGgl12eHC5yuBNnMOSWBcxNn0MWnp33E0MrvMB9/oZXoVml
         bVp5DyCH0UMP1xmHm2dbintW2R1UQLjyR1MhyA26grrMja8V3sdwgd4fvkNJu29IdLZ1
         UVl5KW6SpjJlLuiU+Vt3Ou81ieZRWp7ddt+v3/GPmIuve2HkDib8KTCuc4uwzGaL5QLF
         FIZsumRo0qjZxc15dAUHvD3WOJGFA9TDXe9+6QiScJHqvAhnqz3PawgryBDzkf8tT/G0
         dl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129429; x=1749734229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sdHwX3NDWDTFZMgCYQw8M8l0X6aQrEZJ8MeJfaC2DU=;
        b=hCxQIXt5pbsWsfLLw/mZDx3u3XyIGeQh/HoGtc3oi0cDwlwtpnCQsTF5LPOu5hP77f
         In+I96FGi9vOyUX6cc3QVjCIIsEOPP7bY1na6LEGp3dYBowQio5W+6NnW8NZJmtn5Ewl
         k4FMHBMmeYU7p2fMBZAKoqEdE1YXcDrR/cRo2d7/sDuEbubyvWBrwzVJ+QLOWfRSQTKh
         FVbO3fv25DaP6VGwD29eAXsUJhWnmqurdjNhyAHHNtbF30xhjifqsIpJCA9aw7+EoODH
         ZKuz8RPFBIsHxRwpuOryrCl2RIRH0oawcTzl0JJrrzT+/DAI2I7fVPnM6Ny4EkrKNU2E
         FvHw==
X-Gm-Message-State: AOJu0YwcU/K8J1pvFCjtP2awjuq+zLZ63iH7fA/HrNrYPM6OB9nOfZlR
	LQnku9eaT4u385ynq5kdg5ZDC0crSJSBU5YHZ8RiddhsGFYhu8Nwpn7Qklm5JpCHFYZMF7aHRyJ
	PIKYMCR93KWDGGTALvYYEq+2jmTtzKCY=
X-Gm-Gg: ASbGncsOR1Tcs34ISgHUAQP9L8HqdOikHbn6AAGHhyBcLdU+aHlHniIYGN7lXXNBjVA
	WVXu48JDC2tUlFYW/v8FFiwaKYXWsLUpmxXcj665TBnkRoAkZn1IdRHKf15/vmkbDq1DaekRQ1p
	95s0flvm1Mv0ZcLxnpL3YUM9yXhkmsuxJYIg==
X-Google-Smtp-Source: AGHT+IFlhWWAX0QpPDEeLhQEd2VSLTkLFSjYZDfhdcjC9gdZ52WgaVd4JWkcNgvQXkjU7ypfPpk57SZZJ2Z9pNW+pEU=
X-Received: by 2002:a17:90b:1e0a:b0:310:cea4:e3b9 with SMTP id
 98e67ed59e1d1-3130cd8631fmr9061855a91.34.1749129429012; Thu, 05 Jun 2025
 06:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250605131235.366013-1-dixitparmar19@gmail.com>
In-Reply-To: <20250605131235.366013-1-dixitparmar19@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Jun 2025 09:16:57 -0400
X-Gm-Features: AX0GCFuslrhGhmt_6Tv0STA1vo_QmtTjmdNTbiEpe7WGUwx_3nm8HxlAjGNJk2Y
Message-ID: <CADkTA4MXjyPMNE-TbuiFNjF+oV2hn6a_BsrJuqMT4Z+e9u910g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] kernel-module-split: fix conf file
 generation when KERNEL_SPLIT_MODULES=0
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004855b00636d2eed0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218017

--0000000000004855b00636d2eed0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:12=E2=80=AFAM Dixit Parmar via lists.openembedded.=
org
<dixitparmar19=3Dgmail.com@lists.openembedded.org> wrote:

> KERNEL_MODULE_AUTOLOAD defines the list of the kernel modules to be
> autoloaded
> on boot. kernel-module-split.bbclass generates the required modules.load.=
d
> and
> conf files for each kernel module. This conf files inturn read by system
> service
> to perform module loading and configuration. When a kernel module is adde=
d
> to
> KERNEL_MODULE_AUTOLOAD the conf files must be generated in all cases.
> When KERNEL_SPLIT_MODULES=3D0 modprobe and autoload conf files are not
> getting generated for the kernel modules.
> To fix that enhanced the class implementation by separating out conf
> file handling mechanism in two functions, generate_conf_files() and
> frob_metadata(). generate_conf_files() handles no-split case where as
> frob_metadata() keeps handling the existing case for spliting the modules=
.
> Splitted common handling/generation of conf files stuff in to
> handle_conf_files()
> function which gets invoked by both frob_metadata() and
> generate_conf_files()
> on top of the scenario specific handling done in respective functions.
> This implementation covers generation of the conf files for in-tree kerne=
l
> modules as well as standalone kernel module built as seperate
> package/recipe.
>
> [YOCTO #15145]
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>
> ---
> Previous version of the patch:
> https://lists.openembedded.org/g/openembedded-core/topic/111815220
> oe-selftest
> <https://lists.openembedded.org/g/openembedded-core/topic/111815220oe-sel=
ftest>
> patch: https://lists.openembedded.org/g/openembedded-core/message/218013
>
> Validated these changes by the oe-selftest:
> 1. With the existing implementation the
> kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled
> test case fails because the autoload/modconf .conf files are not getting
> generated for each modules.
> 2. With this fix both enabled & disabled testcases are passed. Below are
> test case running results.
>
> $ oe-selftest -r
> kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled
> 2025-05-29 16:17:29,377 - oe-selftest - INFO - Adding layer libraries:
> 2025-05-29 16:17:29,377 - oe-selftest - INFO -
> /data/home/diparmar/workspace/test/yocto-contri/poky/meta/lib
> 2025-05-29 16:17:29,377 - oe-selftest - INFO -
> /data/home/diparmar/workspace/test/yocto-contri/poky/meta-yocto-bsp/lib
> 2025-05-29 16:17:29,377 - oe-selftest - INFO -
> /data/home/diparmar/workspace/test/yocto-contri/poky/meta-selftest/lib
> 2025-05-29 16:17:29,378 - oe-selftest - INFO - Checking base configuratio=
n
> is valid/parsable
> NOTE: Starting bitbake server...
> 2025-05-29 16:17:30,926 - oe-selftest - INFO - Adding: "include
> selftest.inc" in
> /data/home/diparmar/workspace/test/yocto-contri/poky/build-st/conf/local.=
conf
> 2025-05-29 16:17:30,927 - oe-selftest - INFO - Adding: "include
> bblayers.inc" in bblayers.conf
> 2025-05-29 16:17:30,927 - oe-selftest - INFO - test_split_modules_disable=
d
> (kernel_module_split.KernelSplitAutoloadTest)
> 2025-05-29 16:19:51,512 - oe-selftest - INFO -  ... ok
> 2025-05-29 16:20:00,367 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2025-05-29 16:20:00,368 - oe-selftest - INFO - Ran 1 test in 149.890s
> 2025-05-29 16:20:00,368 - oe-selftest - INFO - OK
> 2025-05-29 16:20:09,019 - oe-selftest - INFO - RESULTS:
> 2025-05-29 16:20:09,019 - oe-selftest - INFO - RESULTS -
> kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled:
> PASSED (140.59s)
> 2025-05-29 16:20:09,036 - oe-selftest - INFO - SUMMARY:
> 2025-05-29 16:20:09,037 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t
> in 149.891s
> 2025-05-29 16:20:09,037 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
>
> =3D=3D=3D
>
> $ oe-selftest -r
> kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled
> 2025-05-29 16:20:53,538 - oe-selftest - INFO - Adding layer libraries:
> 2025-05-29 16:20:53,538 - oe-selftest - INFO -
> /data/home/diparmar/workspace/test/yocto-contri/poky/meta/lib
> 2025-05-29 16:20:53,538 - oe-selftest - INFO -
> /data/home/diparmar/workspace/test/yocto-contri/poky/meta-yocto-bsp/lib
> 2025-05-29 16:20:53,538 - oe-selftest - INFO -
> /data/home/diparmar/workspace/test/yocto-contri/poky/meta-selftest/lib
> 2025-05-29 16:20:53,540 - oe-selftest - INFO - Checking base configuratio=
n
> is valid/parsable
> NOTE: Starting bitbake server...
> 2025-05-29 16:20:55,000 - oe-selftest - INFO - Adding: "include
> selftest.inc" in
> /data/home/diparmar/workspace/test/yocto-contri/poky/build-st/conf/local.=
conf
> 2025-05-29 16:20:55,001 - oe-selftest - INFO - Adding: "include
> bblayers.inc" in bblayers.conf
> 2025-05-29 16:20:55,001 - oe-selftest - INFO - test_split_modules_enabled
> (kernel_module_split.KernelSplitAutoloadTest)
> 2025-05-29 16:23:08,930 - oe-selftest - INFO -  ... ok
> 2025-05-29 16:23:19,735 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2025-05-29 16:23:19,735 - oe-selftest - INFO - Ran 1 test in 145.057s
> 2025-05-29 16:23:19,736 - oe-selftest - INFO - OK
> 2025-05-29 16:23:28,312 - oe-selftest - INFO - RESULTS:
> 2025-05-29 16:23:28,313 - oe-selftest - INFO - RESULTS -
> kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled:
> PASSED (133.93s)
> 2025-05-29 16:23:28,321 - oe-selftest - INFO - SUMMARY:
> 2025-05-29 16:23:28,322 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t
> in 145.058s
> 2025-05-29 16:23:28,322 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
>

With the tests, this version looks good to me!

Bruce



> ---
>  .../kernel-module-split.bbclass               | 74 +++++++++++++++----
>  1 file changed, 59 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..843f301f99 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -86,11 +86,7 @@ python split_kernel_module_packages () {
>              vals[m.group(1)] =3D m.group(2)
>          return vals
>
> -    def frob_metadata(file, pkg, pattern, format, basename):
> -        vals =3D extract_modinfo(file)
> -
> -        dvar =3D d.getVar('PKGD')
> -
> +    def handle_conf_files(d, basename, pkg):
>          # If autoloading is requested, output
> ${modulesloaddir}/<name>.conf and append
>          # appropriate modprobe commands to the postinst
>          autoloadlist =3D (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").spli=
t()
> @@ -101,7 +97,7 @@ python split_kernel_module_packages () {
>              bb.warn("module_autoload_%s is defined but '%s' isn't
> included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename,
> basename))
>          if basename in autoloadlist:
>              conf =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basenam=
e)
> -            name =3D '%s%s' % (dvar, conf)
> +            name =3D '%s%s' % (d.getVar('PKGD'), conf)
>              os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>              with open(name, 'w') as f:
>                  if autoload:
> @@ -114,7 +110,7 @@ python split_kernel_module_packages () {
>              d.appendVar('CONFFILES:%s' % pkg, conf2append)
>              postinst =3D d.getVar('pkg_postinst:%s' % pkg)
>              if not postinst:
> -                bb.fatal("pkg_postinst:%s not defined" % pkg)
> +                postinst =3D d.getVar('pkg_postinst:modules')
>              postinst +=3D d.getVar('autoload_postinst_fragment') %
> (autoload or basename)
>              d.setVar('pkg_postinst:%s' % pkg, postinst)
>
> @@ -123,7 +119,7 @@ python split_kernel_module_packages () {
>          modconf =3D d.getVar('module_conf_%s' % basename)
>          if modconf and basename in modconflist:
>              conf =3D '%s/%s.conf' % (d.getVar('modprobedir'), basename)
> -            name =3D '%s%s' % (dvar, conf)
> +            name =3D '%s%s' % (d.getVar('PKGD'), conf)
>              os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>              with open(name, 'w') as f:
>                  f.write("%s\n" % modconf)
> @@ -134,6 +130,54 @@ python split_kernel_module_packages () {
>          elif modconf:
>              bb.error("Please ensure module %s is listed in
> KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basenam=
e))
>
> +    def generate_conf_files(d, root, file_regex, output_pattern):
> +        """
> +        Arguments:
> +        root           -- the path in which to search. Contains system
> lib path
> +                          so needs expansion.
> +        file_regex     -- regular expression to match searched files. Us=
e
> +                          parentheses () to mark the part of this
> expression
> +                          that should be used to derive the module name
> (to be
> +                          substituted where %s is used in other function
> +                          arguments as noted below)
> +        output_pattern -- pattern to use for the package names. Must
> include %s.
> +        """
> +        import re, stat
> +
> +        dvar =3D d.getVar('PKGD')
> +        root =3D d.expand(root)
> +
> +        # if the root directory doesn't exist, it's fatal - exit from th=
e
> current execution.
> +        if not os.path.exists(dvar + root):
> +            bb.fatal("kernel module root directory path does not exist")
> +
> +        # walk through kernel module directory. for each entry in the
> directory, check if it
> +        # matches the desired regex pattern and file type. if it
> fullfills, process it to generate
> +        # it's conf file based on its package name.
> +        for walkroot, dirs, files in os.walk(dvar + root):
> +            for file in files:
> +                relpath =3D os.path.join(walkroot, file).replace(dvar +
> root + '/', '', 1)
> +                if not relpath:
> +                    continue
> +                m =3D re.match(file_regex, os.path.basename(relpath))
> +                if not m:
> +                    continue
> +                file_f =3D os.path.join(dvar + root, relpath)
> +                mode =3D os.lstat(file_f).st_mode
> +                if not (stat.S_ISREG(mode) or (allow_links and
> stat.S_ISLNK(mode)) or (allow_dirs and stat.S_ISDIR(mode))):
> +                    continue
> +
> +                basename =3D m.group(1)
> +                on =3D legitimize_package_name(basename)
> +                pkg =3D output_pattern % on
> +                handle_conf_files(d, basename, pkg)
> +
> +    def frob_metadata(file, pkg, pattern, format, basename):
> +        vals =3D extract_modinfo(file)
> +        dvar =3D d.getVar('PKGD')
> +
> +        handle_conf_files(d, basename, pkg)
> +
>          if "description" in vals:
>              old_desc =3D d.getVar('DESCRIPTION:' + pkg) or ""
>              d.setVar('DESCRIPTION:' + pkg, old_desc + "; " +
> vals["description"])
> @@ -167,19 +211,19 @@ python split_kernel_module_packages () {
>      postinst =3D d.getVar('pkg_postinst:modules')
>      postrm =3D d.getVar('pkg_postrm:modules')
>
> +    module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> +    module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> +    module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> +    module_pattern =3D module_pattern_prefix + kernel_package_name +
> '-module-%s' + module_pattern_suffix
> +
>      if splitmods !=3D '1':
>          d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
>              (d.getVar('modulesloaddir'), d.getVar('modprobedir'),
> d.getVar("nonarch_base_libdir")))
>          d.appendVar('pkg_postinst:%s' % metapkg, postinst)
> -        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
> +        d.prependVar('pkg_postrm:%s' % metapkg, postrm)
> +        generate_conf_files(d, root=3D'${nonarch_base_libdir}/modules',
> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern)
>          return
>
> -    module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
> -
> -    module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> -    module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> -    module_pattern =3D module_pattern_prefix + kernel_package_name +
> '-module-%s' + module_pattern_suffix
> -
>      modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les',
> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=
=3D'%s
> kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue,
> hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,
> kernel_version))
>      if modules:
>          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218016):
> https://lists.openembedded.org/g/openembedded-core/message/218016
> Mute This Topic: https://lists.openembedded.org/mt/113484744/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004855b00636d2eed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 5, 2025 at 9:12=
=E2=80=AFAM Dixit Parmar via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;dixitparmar19=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">KERNEL_MODULE_AUTOLOAD =
defines the list of the kernel modules to be autoloaded<br>
on boot. kernel-module-split.bbclass generates the required modules.load.d =
and<br>
conf files for each kernel module. This conf files inturn read by system se=
rvice<br>
to perform module loading and configuration. When a kernel module is added =
to<br>
KERNEL_MODULE_AUTOLOAD the conf files must be generated in all cases.<br>
When KERNEL_SPLIT_MODULES=3D0 modprobe and autoload conf files are not<br>
getting generated for the kernel modules.<br>
To fix that enhanced the class implementation by separating out conf<br>
file handling mechanism in two functions, generate_conf_files() and<br>
frob_metadata(). generate_conf_files() handles no-split case where as<br>
frob_metadata() keeps handling the existing case for spliting the modules.<=
br>
Splitted common handling/generation of conf files stuff in to handle_conf_f=
iles()<br>
function which gets invoked by both frob_metadata() and generate_conf_files=
()<br>
on top of the scenario specific handling done in respective functions.<br>
This implementation covers generation of the conf files for in-tree kernel<=
br>
modules as well as standalone kernel module built as seperate package/recip=
e.<br>
<br>
[YOCTO #15145]<br>
<br>
Signed-off-by: Dixit Parmar &lt;<a href=3D"mailto:dixitparmar19@gmail.com" =
target=3D"_blank">dixitparmar19@gmail.com</a>&gt;<br>
<br>
---<br>
Previous version of the patch: <a href=3D"https://lists.openembedded.org/g/=
openembedded-core/topic/111815220oe-selftest" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/topic/111815220<=
br>
oe-selftest</a> patch: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/message/218013" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/openembedded-core/message/218013</a><br>
<br>
Validated these changes by the oe-selftest:<br>
1. With the existing implementation the kernel_module_split.KernelSplitAuto=
loadTest.test_split_modules_disabled<br>
test case fails because the autoload/modconf .conf files are not getting ge=
nerated for each modules.<br>
2. With this fix both enabled &amp; disabled testcases are passed. Below ar=
e test case running results.<br>
<br>
$ oe-selftest -r kernel_module_split.KernelSplitAutoloadTest.test_split_mod=
ules_disabled<br>
2025-05-29 16:17:29,377 - oe-selftest - INFO - Adding layer libraries:<br>
2025-05-29 16:17:29,377 - oe-selftest - INFO -=C2=A0 /data/home/diparmar/wo=
rkspace/test/yocto-contri/poky/meta/lib<br>
2025-05-29 16:17:29,377 - oe-selftest - INFO -=C2=A0 /data/home/diparmar/wo=
rkspace/test/yocto-contri/poky/meta-yocto-bsp/lib<br>
2025-05-29 16:17:29,377 - oe-selftest - INFO -=C2=A0 /data/home/diparmar/wo=
rkspace/test/yocto-contri/poky/meta-selftest/lib<br>
2025-05-29 16:17:29,378 - oe-selftest - INFO - Checking base configuration =
is valid/parsable<br>
NOTE: Starting bitbake server...<br>
2025-05-29 16:17:30,926 - oe-selftest - INFO - Adding: &quot;include selfte=
st.inc&quot; in /data/home/diparmar/workspace/test/yocto-contri/poky/build-=
st/conf/local.conf<br>
2025-05-29 16:17:30,927 - oe-selftest - INFO - Adding: &quot;include bblaye=
rs.inc&quot; in bblayers.conf<br>
2025-05-29 16:17:30,927 - oe-selftest - INFO - test_split_modules_disabled =
(kernel_module_split.KernelSplitAutoloadTest)<br>
2025-05-29 16:19:51,512 - oe-selftest - INFO -=C2=A0 ... ok<br>
2025-05-29 16:20:00,367 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2025-05-29 16:20:00,368 - oe-selftest - INFO - Ran 1 test in 149.890s<br>
2025-05-29 16:20:00,368 - oe-selftest - INFO - OK<br>
2025-05-29 16:20:09,019 - oe-selftest - INFO - RESULTS:<br>
2025-05-29 16:20:09,019 - oe-selftest - INFO - RESULTS - kernel_module_spli=
t.KernelSplitAutoloadTest.test_split_modules_disabled: PASSED (140.59s)<br>
2025-05-29 16:20:09,036 - oe-selftest - INFO - SUMMARY:<br>
2025-05-29 16:20:09,037 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 149.891s<br>
2025-05-29 16:20:09,037 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)<br>
<br>
=3D=3D=3D<br>
<br>
$ oe-selftest -r kernel_module_split.KernelSplitAutoloadTest.test_split_mod=
ules_enabled<br>
2025-05-29 16:20:53,538 - oe-selftest - INFO - Adding layer libraries:<br>
2025-05-29 16:20:53,538 - oe-selftest - INFO -=C2=A0 /data/home/diparmar/wo=
rkspace/test/yocto-contri/poky/meta/lib<br>
2025-05-29 16:20:53,538 - oe-selftest - INFO -=C2=A0 /data/home/diparmar/wo=
rkspace/test/yocto-contri/poky/meta-yocto-bsp/lib<br>
2025-05-29 16:20:53,538 - oe-selftest - INFO -=C2=A0 /data/home/diparmar/wo=
rkspace/test/yocto-contri/poky/meta-selftest/lib<br>
2025-05-29 16:20:53,540 - oe-selftest - INFO - Checking base configuration =
is valid/parsable<br>
NOTE: Starting bitbake server...<br>
2025-05-29 16:20:55,000 - oe-selftest - INFO - Adding: &quot;include selfte=
st.inc&quot; in /data/home/diparmar/workspace/test/yocto-contri/poky/build-=
st/conf/local.conf<br>
2025-05-29 16:20:55,001 - oe-selftest - INFO - Adding: &quot;include bblaye=
rs.inc&quot; in bblayers.conf<br>
2025-05-29 16:20:55,001 - oe-selftest - INFO - test_split_modules_enabled (=
kernel_module_split.KernelSplitAutoloadTest)<br>
2025-05-29 16:23:08,930 - oe-selftest - INFO -=C2=A0 ... ok<br>
2025-05-29 16:23:19,735 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2025-05-29 16:23:19,735 - oe-selftest - INFO - Ran 1 test in 145.057s<br>
2025-05-29 16:23:19,736 - oe-selftest - INFO - OK<br>
2025-05-29 16:23:28,312 - oe-selftest - INFO - RESULTS:<br>
2025-05-29 16:23:28,313 - oe-selftest - INFO - RESULTS - kernel_module_spli=
t.KernelSplitAutoloadTest.test_split_modules_enabled: PASSED (133.93s)<br>
2025-05-29 16:23:28,321 - oe-selftest - INFO - SUMMARY:<br>
2025-05-29 16:23:28,322 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 145.058s<br>
2025-05-29 16:23:28,322 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">With the tests, this version looks good to me!</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 74 +++++++++++++++----<br>
=C2=A01 file changed, 59 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 9487365eb7..843f301f99 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -86,11 +86,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vals[m.group(1)] =3D m.grou=
p(2)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return vals<br>
<br>
-=C2=A0 =C2=A0 def frob_metadata(file, pkg, pattern, format, basename):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vals =3D extract_modinfo(file)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dvar =3D d.getVar(&#39;PKGD&#39;)<br>
-<br>
+=C2=A0 =C2=A0 def handle_conf_files(d, basename, pkg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If autoloading is requested, output ${m=
odulesloaddir}/&lt;name&gt;.conf and append<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# appropriate modprobe commands to the po=
stinst<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autoloadlist =3D (d.getVar(&quot;KERNEL_M=
ODULE_AUTOLOAD&quot;) or &quot;&quot;).split()<br>
@@ -101,7 +97,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;module_autolo=
ad_%s is defined but &#39;%s&#39; isn&#39;t included in KERNEL_MODULE_AUTOL=
OAD, please add it there&quot; % (basename, basename))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if basename in autoloadlist:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf =3D &#39;%s/%s.conf&#3=
9; % (d.getVar(&#39;modulesloaddir&#39;), basename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar,=
 conf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (d.get=
Var(&#39;PKGD&#39;), conf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.makedirs(os.path.dirname=
(name), exist_ok=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(name, &#39;w&#39;=
) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if autoload:<=
br>
@@ -114,7 +110,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;CONFFILES:=
%s&#39; % pkg, conf2append)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;=
pkg_postinst:%s&#39; % pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not postinst:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;pkg=
_postinst:%s not defined&quot; % pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst =3D d.get=
Var(&#39;pkg_postinst:modules&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postinst +=3D d.getVar(&#39=
;autoload_postinst_fragment&#39;) % (autoload or basename)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;pkg_postinst:=
%s&#39; % pkg, postinst)<br>
<br>
@@ -123,7 +119,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modconf =3D d.getVar(&#39;module_conf_%s&=
#39; % basename)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if modconf and basename in modconflist:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf =3D &#39;%s/%s.conf&#3=
9; % (d.getVar(&#39;modprobedir&#39;), basename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar,=
 conf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (d.get=
Var(&#39;PKGD&#39;), conf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.makedirs(os.path.dirname=
(name), exist_ok=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(name, &#39;w&#39;=
) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot=
;%s\n&quot; % modconf)<br>
@@ -134,6 +130,54 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif modconf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;Please ensur=
e module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is se=
t&quot; % (basename, basename))<br>
<br>
+=C2=A0 =C2=A0 def generate_conf_files(d, root, file_regex, output_pattern)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arguments:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
- the path in which to search. Contains system lib path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 so needs expansion.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_regex=C2=A0 =C2=A0 =C2=A0-- regular expre=
ssion to match searched files. Use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 parentheses () to mark the part of this expression<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 that should be used to derive the module name (to be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 substituted where %s is used in other function<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 arguments as noted below)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output_pattern -- pattern to use for the packa=
ge names. Must include %s.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import re, stat<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dvar =3D d.getVar(&#39;PKGD&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 root =3D d.expand(root)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the root directory doesn&#39;t exist, it&=
#39;s fatal - exit from the current execution.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(dvar + root):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;kernel module roo=
t directory path does not exist&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # walk through kernel module directory. for ea=
ch entry in the directory, check if it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # matches the desired regex pattern and file t=
ype. if it fullfills, process it to generate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # it&#39;s conf file based on its package name=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for walkroot, dirs, files in os.walk(dvar + ro=
ot):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for file in files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 relpath =3D os.pat=
h.join(walkroot, file).replace(dvar + root + &#39;/&#39;, &#39;&#39;, 1)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not relpath:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(fil=
e_regex, os.path.basename(relpath))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not m:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file_f =3D os.path=
.join(dvar + root, relpath)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D os.lstat(=
file_f).st_mode<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (stat.S_ISR=
EG(mode) or (allow_links and stat.S_ISLNK(mode)) or (allow_dirs and stat.S_=
ISDIR(mode))):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basename =3D m.gro=
up(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on =3D legitimize_=
package_name(basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg =3D output_pat=
tern % on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_conf_files(=
d, basename, pkg)<br>
+<br>
+=C2=A0 =C2=A0 def frob_metadata(file, pkg, pattern, format, basename):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vals =3D extract_modinfo(file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dvar =3D d.getVar(&#39;PKGD&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_conf_files(d, basename, pkg)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;description&quot; in vals:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_desc =3D d.getVar(&#39;=
DESCRIPTION:&#39; + pkg) or &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;DESCRIPTION:&=
#39; + pkg, old_desc + &quot;; &quot; + vals[&quot;description&quot;])<br>
@@ -167,19 +211,19 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;pkg_postinst:modules&#39;)<b=
r>
=C2=A0 =C2=A0 =C2=A0postrm =3D d.getVar(&#39;pkg_postrm:modules&#39;)<br>
<br>
+=C2=A0 =C2=A0 module_regex =3D r&#39;^(.*)\.k?o(?:\.(gz|xz|zst))?$&#39;<br=
>
+=C2=A0 =C2=A0 module_pattern_prefix =3D d.getVar(&#39;KERNEL_MODULE_PACKAG=
E_PREFIX&#39;)<br>
+=C2=A0 =C2=A0 module_pattern_suffix =3D d.getVar(&#39;KERNEL_MODULE_PACKAG=
E_SUFFIX&#39;)<br>
+=C2=A0 =C2=A0 module_pattern =3D module_pattern_prefix + kernel_package_na=
me + &#39;-module-%s&#39; + module_pattern_suffix<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if splitmods !=3D &#39;1&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;FILES:&#39; + metapkg, &=
#39;%s %s %s/modules&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(d.getVar(&#39;modulesloadd=
ir&#39;), d.getVar(&#39;modprobedir&#39;), d.getVar(&quot;nonarch_base_libd=
ir&quot;)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;pkg_postinst:%s&#39; % m=
etapkg, postinst)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.prependVar(&#39;pkg_postrm:%s&#39; % metapkg=
, postrm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.prependVar(&#39;pkg_postrm:%s&#39; % metapkg=
, postrm)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 generate_conf_files(d, root=3D&#39;${nonarch_b=
ase_libdir}/modules&#39;, file_regex=3Dmodule_regex, output_pattern=3Dmodul=
e_pattern)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
-=C2=A0 =C2=A0 module_regex =3D r&#39;^(.*)\.k?o(?:\.(gz|xz|zst))?$&#39;<br=
>
-<br>
-=C2=A0 =C2=A0 module_pattern_prefix =3D d.getVar(&#39;KERNEL_MODULE_PACKAG=
E_PREFIX&#39;)<br>
-=C2=A0 =C2=A0 module_pattern_suffix =3D d.getVar(&#39;KERNEL_MODULE_PACKAG=
E_SUFFIX&#39;)<br>
-=C2=A0 =C2=A0 module_pattern =3D module_pattern_prefix + kernel_package_na=
me + &#39;-module-%s&#39; + module_pattern_suffix<br>
-<br>
=C2=A0 =C2=A0 =C2=A0modules =3D do_split_packages(d, root=3D&#39;${nonarch_=
base_libdir}/modules&#39;, file_regex=3Dmodule_regex, output_pattern=3Dmodu=
le_pattern, description=3D&#39;%s kernel module&#39;, postinst=3Dpostinst, =
postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D&#=
39;%s-%s&#39; % (kernel_package_name, kernel_version))<br>
=C2=A0 =C2=A0 =C2=A0if modules:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;RDEPENDS:&#39; + metapkg=
, &#39; &#39;+&#39; &#39;.join(modules))<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218016): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218016" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/218016</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113484744/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113484744/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000004855b00636d2eed0--

