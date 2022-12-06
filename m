Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26DDC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 14:40:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.49472.1670337622761733521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 06:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=py5jYICa;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m19so20527412edj.8
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=51gA3u9Ec2dT2qUIybv0U7v4dV3uSS+CKKCvrOTqBNY=;
        b=py5jYICanpgXYv9QjlpkQFjkcMRASu5JPNo9Lr5WiYnF08B4qDdhneE34ReKm618Jq
         WQBCzW65GbL5BsIo2OcCiAZPBZzU62uZ1Abn7lWonG78svHlqbMkOvZeE3i6ew2Pr9yo
         7snVKFy7Zp0WlasrSssMZIg93psummzOmGBFTr2CicPtftflIQYeRMR5RF9fah2yITgg
         nT4SrhOcYVZEGobAf3GqtKHFBchieWzZAAklZPpgxgiPVeXsPYSkuHw1fJvtdU1sbj//
         qHJzK8VxfqLVp90Phz5lkcgwtouZlB78rFWbO6B58QfhY5OHVSs50iCpqs3mL/x+sBI0
         jU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51gA3u9Ec2dT2qUIybv0U7v4dV3uSS+CKKCvrOTqBNY=;
        b=S8IwluzAvS/uk15zw0tE6CXx8F6LdnuJASKOqaF/R8wRCRsrI+w2u3aH+FYIm01DgR
         kD7yKxaIqScyAPXzD9io2qvQmVN/t1pD7SnZdPY9BSTDP5q5UzqAwCiu5mExLb56VmcN
         NxVPGMGWjtkcDu6pxeduC9DnVbRL6nrh54DYsBJjXRSpnltmq2TCe9pcO9wzVBTcomN5
         mA8gDsCc70Ubl7uNc88hi+PHnLDHq+rm3dtqRi9lOv1HMzxg2X90DafXBlfmZSUwSp9G
         PvIMI4PTaRWTaMzAwHJPtWTm6hXqSKjaUY8w4FGDt59kf5RmFOZ5b5dD3CHLIop5wHYH
         4Mjw==
X-Gm-Message-State: ANoB5pnXoa5des9mZnGAG1oLo4+qI625Dy1FO7D22vMy4bW927H5i/gj
	7eDriUmFA7GNyc4dEwYAl3JqwTqcmGcRKFWzapYsVYoy
X-Google-Smtp-Source: AA0mqf4K0DhaARiJL3l/Q9VecBIoiVXdauskD7mvp4MqK3T2L/eynyfWSH4bZr59UtBpKFZ/0gFoFpn1h36AKO5ycB4=
X-Received: by 2002:a05:6402:189:b0:469:85d:2663 with SMTP id
 r9-20020a056402018900b00469085d2663mr2284462edv.56.1670337621026; Tue, 06 Dec
 2022 06:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20221111145551.1115391-1-JPEWhacker@gmail.com>
 <CAJdd5GaYZNrHT8Ki3-M7yNuHcGbdz38O04aGJJspu=86PC2-Ag@mail.gmail.com> <CAOSpxdY9h1f4dRVMzbc__eHZ-cPrd7RivFVtO_VGn0VNsWzAmQ@mail.gmail.com>
In-Reply-To: <CAOSpxdY9h1f4dRVMzbc__eHZ-cPrd7RivFVtO_VGn0VNsWzAmQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 6 Dec 2022 08:40:07 -0600
Message-ID: <CAJdd5GYLiHPYBRZ0NN_6=4FJi40+XuD7dvs3Jx0YFsBpAaM4SA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] scripts: convert-overrides: Allow command-line customizations
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 14:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174320

Steve,

I don't see this one in (or pending for) kirkstone yet?

Thanks,
Joshua Watt

On Tue, Nov 15, 2022 at 3:56 PM Steve Sakoman <steve@sakoman.com> wrote:
>
>
>
> On Tue, Nov 15, 2022, 9:42 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> Steve,
>>
>> Please backport this to kirkstone and langdale.
>>
>> Thanks!
>
>
> Ok, will do!
>
> Steve
>
>
>>
>> On Fri, Nov 11, 2022 at 8:55 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>> >
>> > Adds argument parsing to the conversion script so that the fields that
>> > the script uses to do conversions can be customized on the command line.
>> > The intention is to allows easier customization without having to fork
>> > the script, and allow automated checking on 3rd party layers via CI
>> > without false positives
>> >
>> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> > ---
>> >  scripts/contrib/convert-overrides.py | 103 +++++++++++++++------------
>> >  1 file changed, 57 insertions(+), 46 deletions(-)
>> >
>> > diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
>> > index 4d41a4c4759..1939757f1bc 100755
>> > --- a/scripts/contrib/convert-overrides.py
>> > +++ b/scripts/contrib/convert-overrides.py
>> > @@ -22,50 +22,62 @@ import sys
>> >  import tempfile
>> >  import shutil
>> >  import mimetypes
>> > +import argparse
>> >
>> > -if len(sys.argv) < 2:
>> > -    print("Please specify a directory to run the conversion script against.")
>> > -    sys.exit(1)
>> > +parser = argparse.ArgumentParser(description="Convert override syntax")
>> > +parser.add_argument("--override", "-o", action="append", default=[], help="Add additional strings to consider as an override (e.g. custom machines/distros")
>> > +parser.add_argument("--skip", "-s", action="append", default=[], help="Add additional string to skip and not consider an override")
>> > +parser.add_argument("--skip-ext", "-e", action="append", default=[], help="Additional file suffixes to skip when processing (e.g. '.foo')")
>> > +parser.add_argument("--package-vars", action="append", default=[], help="Additional variables to treat as package variables")
>> > +parser.add_argument("--image-vars", action="append", default=[], help="Additional variables to treat as image variables")
>> > +parser.add_argument("--short-override", action="append", default=[], help="Additional strings to treat as short overrides")
>> > +parser.add_argument("path", nargs="+", help="Paths to convert")
>> > +
>> > +args = parser.parse_args()
>> >
>> >  # List of strings to treat as overrides
>> > -vars = ["append", "prepend", "remove"]
>> > -vars = vars + ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
>> > -vars = vars + ["genericx86", "edgerouter", "beaglebone-yocto"]
>> > -vars = vars + ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
>> > -vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
>> > -vars = vars + ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
>> > -vars = vars + ["tune-",  "pn-", "forcevariable"]
>> > -vars = vars + ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
>> > -vars = vars + ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
>> > -vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
>> > -vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
>> > -vars = vars + ["linux-gnueabi", "eabi"]
>> > -vars = vars + ["virtclass-multilib", "virtclass-mcextend"]
>> > +vars = args.override
>> > +vars += ["append", "prepend", "remove"]
>> > +vars += ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
>> > +vars += ["genericx86", "edgerouter", "beaglebone-yocto"]
>> > +vars += ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
>> > +vars += ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
>> > +vars += ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
>> > +vars += ["tune-",  "pn-", "forcevariable"]
>> > +vars += ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
>> > +vars += ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
>> > +vars += ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
>> > +vars += ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
>> > +vars += ["linux-gnueabi", "eabi"]
>> > +vars += ["virtclass-multilib", "virtclass-mcextend"]
>> >
>> >  # List of strings to treat as overrides but only with whitespace following or another override (more restricted matching).
>> >  # Handles issues with arc matching arch.
>> > -shortvars = ["arc", "mips", "mipsel", "sh4"]
>> > +shortvars = ["arc", "mips", "mipsel", "sh4"] + args.short_override
>> >
>> >  # Variables which take packagenames as an override
>> >  packagevars = ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY",
>> >                "pkg_postrm", "pkg_postinst_ontarget", "pkg_postinst", "INITSCRIPT_NAME", "INITSCRIPT_PARAMS", "DEBIAN_NOAUTONAME", "ALTERNATIVE",
>> >                "PKGE", "PKGV", "PKGR", "USERADD_PARAM", "GROUPADD_PARAM", "CONFFILES", "SYSTEMD_SERVICE", "LICENSE", "SECTION", "pkg_preinst",
>> >                "pkg_prerm", "RREPLACES", "GROUPMEMS_PARAM", "SYSTEMD_AUTO_ENABLE", "SKIP_FILEDEPS", "PRIVATE_LIBS", "PACKAGE_ADD_METADATA",
>> > -              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"]
>> > +              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"] + args.package_vars
>> >
>> >  # Expressions to skip if encountered, these are not overrides
>> > -skips = ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
>> > -skips = skips + ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
>> > -skips = skips + ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
>> > -skips = skips + ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
>> > -skips = skips + ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
>> > -skips = skips + ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
>> > -skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
>> > -skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
>> > -skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
>> > -
>> > -imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"]
>> > -packagevars = packagevars + imagevars
>> > +skips = args.skip
>> > +skips += ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
>> > +skips += ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
>> > +skips += ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
>> > +skips += ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
>> > +skips += ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
>> > +skips += ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
>> > +skips += ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
>> > +skips += ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
>> > +skips += ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
>> > +
>> > +imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"] + args.image_vars
>> > +packagevars += imagevars
>> > +
>> > +skip_ext = [".html", ".patch", ".m4", ".diff"] + args.skip_ext
>> >
>> >  vars_re = {}
>> >  for exp in vars:
>> > @@ -124,21 +136,20 @@ def processfile(fn):
>> >  ourname = os.path.basename(sys.argv[0])
>> >  ourversion = "0.9.3"
>> >
>> > -if os.path.isfile(sys.argv[1]):
>> > -    processfile(sys.argv[1])
>> > -    sys.exit(0)
>> > -
>> > -for targetdir in sys.argv[1:]:
>> > -    print("processing directory '%s'" % targetdir)
>> > -    for root, dirs, files in os.walk(targetdir):
>> > -        for name in files:
>> > -            if name == ourname:
>> > -                continue
>> > -            fn = os.path.join(root, name)
>> > -            if os.path.islink(fn):
>> > -                continue
>> > -            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
>> > -                continue
>> > -            processfile(fn)
>> > +for p in args.path:
>> > +    if os.path.isfile(p):
>> > +        processfile(p)
>> > +    else:
>> > +        print("processing directory '%s'" % p)
>> > +        for root, dirs, files in os.walk(p):
>> > +            for name in files:
>> > +                if name == ourname:
>> > +                    continue
>> > +                fn = os.path.join(root, name)
>> > +                if os.path.islink(fn):
>> > +                    continue
>> > +                if "/.git/" in fn or any(fn.endswith(ext) for ext in skip_ext):
>> > +                    continue
>> > +                processfile(fn)
>> >
>> >  print("All files processed with version %s" % ourversion)
>> > --
>> > 2.33.0
>> >

