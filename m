Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1459CC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 12:52:55 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.5762.1704718366872227108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 04:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdpqcAyT;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso1672664e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704718365; x=1705323165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJzqUOOVDrmZiJ0do48AEJgPN2P7rtkeOV0ZteU06Pw=;
        b=cdpqcAyThiQdVJ4sgSTVWMDz6udhbQOtRnAxJAuyJgK1Ax4aCE1QqFN5IvyhRbyEA3
         OCjHke61J39Z1KpJ4uvGJQ4OasjXPeFpKVmtf+pWsGF4MKKQpBvZ+sTrTr5DqmjxpW2G
         2x97owp0/KEF5g+EkecaSxDf/5FEluET0nf5cDRpsUogqGk9m3kJp08J06EMPrLS1p9i
         tXbrW1BMC2dSm4uqg3ye3GcFjtgzKgFYyknrlXWDE2oTnDCx5G647/rBUTDtt+BRH7c3
         nRr7Izia6YNb/Juro2CloxSAf464cILPh+vf9qJv1b3bW3CYxO15AFdZLKpwfFaDWvFf
         jiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704718365; x=1705323165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJzqUOOVDrmZiJ0do48AEJgPN2P7rtkeOV0ZteU06Pw=;
        b=Dq4pqNV9QzYOwmCfsO7skdFODX2Fq+aKgr3x3kMgsG5WSEhFsvh7rZ/cBOYFfLQHO4
         9WiZz0C4SBZWQCxz6cYjx9s8NjrjCW8d4hQ3FbKa4IpGR8kIzG3svDcXDbFhRETzrKdR
         JMopWklasMQr6ayqxzHjgywRhyVT8vIPiH0yH1BgtXvxwyjUUog3kufvxxA098Pi7lC6
         hMQCVWs8UVDteyVk13j6yX9bmNilX1gHrBAxKWjYPlTFWYvXZqE885NfZLrzc9ti6y7R
         W7A+s6hhBlQWwOEE4IblVA83vc/6lxhYeNZEf7t8bnebnwp+TFjrCjR3VeLfiZtleIYd
         I1cg==
X-Gm-Message-State: AOJu0YxddG1KnKizhj5iAvaPs7t34Wcp8/BFTVdq5y4XEX3NGChRnXbB
	obnZlaXlbW/WBS1gWu3aKk5wvvM4qWwatdIQciA=
X-Google-Smtp-Source: AGHT+IGC7+GjdtqNW5e/G/aD0KiwLm2LMVzV8P679FJKKjqgj6Sj/bcxktvPIQQ+8PmHe8Sj3iKa+yjx4HTTg/WQRYk=
X-Received: by 2002:a05:6512:a86:b0:50e:7555:1bf2 with SMTP id
 m6-20020a0565120a8600b0050e75551bf2mr1753091lfu.5.1704718364186; Mon, 08 Jan
 2024 04:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20231223142540.29847-1-alex.kiernan@gmail.com> <CA+chaQcO-rUJ1GRqRe2PrjXiZ9-Ds8XBqQSz2vw-gakO-NU9TA@mail.gmail.com>
In-Reply-To: <CA+chaQcO-rUJ1GRqRe2PrjXiZ9-Ds8XBqQSz2vw-gakO-NU9TA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 8 Jan 2024 12:52:31 +0000
Message-ID: <CAO5Uq5T-M7iwNuAkBk27a_XOX0fkYM9PDRQ=KPt8j8qZi4mukQ@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH] sstate-cache-management: Rewrite in python
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 12:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193404

On Mon, Jan 8, 2024 at 12:12=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> FWIW: I've compared
> openembedded-core/scripts/sstate-cache-management.sh -d --cache-dir=3Dsst=
ate-cache
> with
> openembedded-core/scripts/sstate-cache-management.py -d --cache-dir=3Dsst=
ate-cache
> on some older kirkstone and nanbield build dirs and the python version re=
moves _much_ more than the shell version did and it was indeed significantl=
y faster.
>
> For kirkstone shell version removed from 145G to 125G and triggering pyth=
on version after that left only 19G.
> For nanbield shell version removed from 88G to 77G and triggering python =
version after that left only 11G.
>
> I didn't check if all those sstate archives should have been removed or w=
hether the new python script is supposed to be compatible with older releas=
es, I just needed to free some disk space quickly before triggering new bui=
ld, so I gave it a try and found the huge difference interesting to share.
>

For reasons (upstream vendor, cough...) I have a very heavily patched
thud branch which other than swapping .tar.zst for .tgz I use it on
regularly, so it _ought_ to be fine at least to there.

My test cycle was mostly, build image, run sstate cache cleanup,
remove tmp, rebuild image, check that we only rebuild the image
through sstate reuse without fetching anything from mirrors.

At some point I just gave up trying to work out why the shell version
didn't delete things which it was clearly allowed to :| That said I'd
not be even slightly surprised if there's behaviours in the shell
version which I've not copied which I should have done, but trying to
work out what it actually did was incredibly painful, not least
there's a bunch of things in it which as far as I could tell were
legacy implementation details of sstate-cache.

> Details from the 4 runs bellow:
>
> kirkstone $ du -hs sstate-cache/; openembedded-core/scripts/sstate-cache-=
management.sh -d --cache-dir=3Dsstate-cache; du -hs sstate-cache/
> 145G    sstate-cache/
> Figuring out the archs in the layers ...
> Done
> Figuring out the suffixes in the sstate cache dir ...
> Done
> The following suffixes have been found in the cache dir:
> addto_recipe_sysroot bundle_initramfs clean cleansstate compile compile_k=
ernelmodules configure configure_manifest configure_security create_v8_qemu=
_wrapper deploy deploy_source_date_epoch extra_symlinks fetch flush_pseudod=
b gcc_stash_builddir generate_qt_config_file generate_toolchain_file genera=
te_webos_localization image image_debugfs_tar image_ext4 image_tar image_wi=
c install kernel_checkout kernel_configcheck kernel_configme kernel_link_im=
ages kernel_metadata kernel_version_sanity_check locate_enactjs_appinfo mak=
e_icudata mkimage multilib_install package packagedata package_qa package_w=
rite_ipk patch populate_lic populate_sysroot preconfigure prepare_recipe_sy=
sroot recipe_qa rootfs rootfs_wicenv shared_workdir sizecheck stash_locale =
strip symlink_kernsrc transform_kernel unpack validate_branches warn_musl w=
rite_config write_qemuboot_conf
> Figuring out the archs in the sstate cache dir ...
> Done
> The following archs have been found in the cache dir:
> allarch hammerhead_halium qemux86_64 tissot x86_64
> ...
> 14012 out of 67493 files will be removed!
> ...
> 14012 files have been removed!
> 125G    sstate-cache/
> kirkstone $ du -hs sstate-cache/; ../scarthgap/openembedded-core/scripts/=
sstate-cache-management.py -d --cache-dir=3Dsstate-cache; du -hs sstate-cac=
he/
> 125G    sstate-cache/
> 39927 out of 55994 files will be removed!
> Do you want to continue (y/n)?
> y
> 19G     sstate-cache/
>
> nanbield $ du -hs sstate-cache/; openembedded-core/scripts/sstate-cache-m=
anagement.sh -d --cache-dir=3Dsstate-cache; du -hs sstate-cache/
> 88G     sstate-cache/
> Figuring out the archs in the layers ...
> Done
> Figuring out the suffixes in the sstate cache dir ...
> Done
> The following suffixes have been found in the cache dir:
> addto_recipe_sysroot bundle_initramfs clean cleansstate compile compile_k=
ernelmodules configure configure_manifest configure_security create_v8_qemu=
_wrapper deploy deploy_source_date_epoch extra_symlinks fetch flush_pseudod=
b gcc_stash_builddir generate_native_toolchain_file generate_qt_config_file=
 generate_toolchain_file generate_webos_localization hack_recipe_sysroot im=
age image_ext4 image_tar image_wic install kernel_checkout kernel_configche=
ck kernel_configme kernel_link_images kernel_metadata kernel_version_sanity=
_check locate_enactjs_appinfo make_icudata mkimage multilib_install package=
 package_qa package_write_ipk packagedata patch populate_lic populate_sysro=
ot preconfigure prepare_recipe_sysroot recipe_qa rootfs rootfs_wicenv share=
d_workdir sizecheck stash_locale strip symlink_kernsrc transform_kernel unp=
ack validate_branches warn_musl write_config write_qemuboot_conf
> Figuring out the archs in the sstate cache dir ...
> Done
> The following archs have been found in the cache dir:
> allarch qemux86_64 x86_64
> ...
> 14339 out of 73198 files will be removed!
> ...
> 14339 files have been removed!
> 77G     sstate-cache/
> nanbield $ du -hs sstate-cache/; ../scarthgap/openembedded-core/scripts/s=
state-cache-management.py -d --cache-dir=3Dsstate-cache; du -hs sstate-cach=
e/
> 77G     sstate-cache/
> 43490 out of 60639 files will be removed!
> Do you want to continue (y/n)?
> y
> 11G     sstate-cache/
>
> On Sat, Dec 23, 2023 at 3:25=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
>>
>> This (should be) a drop in replacement for sstate-cache-management.sh.
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>> This is hopefully an option compatible drop in for the existing shell
>> sstate-cache-management script. It's orders of magnitude faster, for
>> example removing duplicates, with a warmed cache across a more or less
>> vanilla poky build:
>>
>> shell: 24.55s
>> python: 0.63s
>>
>> Running on an NFS mount with 1000s of objects the improvement is even
>> more marked.
>>
>> There are differences in the lists of things which are removed, but all
>> examples I've found are things where the shell failed to remove things
>> it could.
>>
>> There's an additional option to remove orphan siginfo files, which I
>> found quite a lot of during testing.
>>
>> The --extra-archs and --extra-layer options are unimplemented since, as
>> far as I could work out, they were really implementation artefacts of
>> the existing script - there's a couple of functions I implemented which
>> generate this data, but I really couldn't see anywhere I actually needed
>> it; these want deleting if this goes beyond RFC.
>>
>> Similary the --follow-symlink option is unimplemented as that appears to
>> an sstate-cache implementation detail which is no longer used.
>>
>> The couple of TODOs left are all about more parallelisation, I expect
>> neither of them is as big a win as parallelising the stat()ing of all
>> the paths was (especially when running over NFS).
>>
>>  scripts/sstate-cache-management.py | 329 +++++++++++++++++++++++++++++
>>  1 file changed, 329 insertions(+)
>>  create mode 100755 scripts/sstate-cache-management.py
>>
>> diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-m=
anagement.py
>> new file mode 100755
>> index 000000000000..3ae3a7fa0515
>> --- /dev/null
>> +++ b/scripts/sstate-cache-management.py
>> @@ -0,0 +1,329 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +import argparse
>> +import os
>> +import re
>> +import sys
>> +
>> +from collections import defaultdict
>> +from concurrent.futures import ThreadPoolExecutor
>> +from dataclasses import dataclass
>> +from pathlib import Path
>> +
>> +if sys.version_info < (3, 8, 0):
>> +    raise RuntimeError("Sorry, python 3.8.0 or later is required for th=
is script.")
>> +
>> +SSTATE_PREFIX =3D "sstate:"
>> +SSTATE_EXTENSION =3D ".tar.zst"
>> +# SSTATE_EXTENSION =3D ".tgz"
>> +# .siginfo.done files are mentioned in the original script?
>> +SSTATE_SUFFIXES =3D (
>> +    SSTATE_EXTENSION,
>> +    f"{SSTATE_EXTENSION}.siginfo",
>> +    f"{SSTATE_EXTENSION}.done",
>> +)
>> +
>> +RE_SSTATE_PKGSPEC =3D re.compile(
>> +    rf"""sstate:(?P<pn>[^:]*):
>> +         (?P<package_target>[^:]*):
>> +         (?P<pv>[^:]*):
>> +         (?P<pr>[^:]*):
>> +         (?P<sstate_pkgarch>[^:]*):
>> +         (?P<sstate_version>[^_]*):
>> +         (?P<bb_unihash>[^_]*)_
>> +         (?P<bb_task>[^:]*)
>> +         (?P<ext>({"|".join([re.escape(s) for s in SSTATE_SUFFIXES])}))=
$""",
>> +    re.X,
>> +)
>> +
>> +
>> +# Really we'd like something like a Path subclass which implements a st=
at
>> +# cache here, unfortunately there's no good way to do that transparentl=
y
>> +# (yet); see:
>> +#
>> +# https://github.com/python/cpython/issues/70219
>> +# https://discuss.python.org/t/make-pathlib-extensible/3428/77
>> +@dataclass
>> +class SstateEntry:
>> +    """Class for keeping track of an entry in sstate-cache."""
>> +
>> +    path: Path
>> +    match: re.Match
>> +    stat_result: os.stat_result =3D None
>> +
>> +    def __hash__(self):
>> +        return self.path.__hash__()
>> +
>> +    def __getattr__(self, name):
>> +        return self.match.group(name)
>> +
>> +
>> +# this is what's in the original script; as far as I can tell, it's an
>> +# implementation artefact which we don't need?
>> +def find_archs():
>> +    # all_archs
>> +    builder_arch =3D os.uname().machine
>> +
>> +    # FIXME
>> +    layer_paths =3D [Path("../..")]
>> +
>> +    tune_archs =3D set()
>> +    re_tune =3D re.compile(r'AVAILTUNES .*=3D.*"(.*)"')
>> +    for path in layer_paths:
>> +        for tunefile in [
>> +            p for p in path.glob("meta*/conf/machine/include/**/*") if =
p.is_file()
>> +        ]:
>> +            with open(tunefile) as f:
>> +                for line in f:
>> +                    m =3D re_tune.match(line)
>> +                    if m:
>> +                        tune_archs.update(m.group(1).split())
>> +
>> +    # all_machines
>> +    machine_archs =3D set()
>> +    for path in layer_paths:
>> +        for machine_file in path.glob("meta*/conf/machine/*.conf"):
>> +            machine_archs.add(machine_file.parts[-1][:-5])
>> +
>> +    extra_archs =3D set()
>> +    all_archs =3D (
>> +        set(
>> +            arch.replace("-", "_")
>> +            for arch in machine_archs | tune_archs | set(["allarch", bu=
ilder_arch])
>> +        )
>> +        | extra_archs
>> +    )
>> +
>> +    print(all_archs)
>> +
>> +
>> +# again, not needed?
>> +def find_tasks():
>> +    print(set([p.bb_task for p in paths]))
>> +
>> +
>> +def collect_sstate_paths(args):
>> +    def scandir(path, paths):
>> +        # Assume everything is a directory; by not checking we avoid ne=
eding an
>> +        # additional stat which is potentially a synchronous roundtrip =
over NFS
>> +        try:
>> +            for p in path.iterdir():
>> +                filename =3D p.parts[-1]
>> +                if filename.startswith(SSTATE_PREFIX):
>> +                    if filename.endswith(SSTATE_SUFFIXES):
>> +                        m =3D RE_SSTATE_PKGSPEC.match(p.parts[-1])
>> +                        assert m
>> +                        paths.add(SstateEntry(p, m))
>> +                    # ignore other things (includes things like lockfil=
es)
>> +                else:
>> +                    scandir(p, paths)
>> +
>> +        except NotADirectoryError:
>> +            pass
>> +
>> +    paths =3D set()
>> +    # TODO: parellise scandir
>> +    scandir(Path(args.cache_dir), paths)
>> +
>> +    def path_stat(p):
>> +        p.stat_result =3D p.path.lstat()
>> +
>> +    if args.remove_duplicated:
>> +        # This is probably slightly performance negative on a local fil=
esystem
>> +        # when we interact with the GIL; over NFS it's a massive win.
>> +        with ThreadPoolExecutor(max_workers=3Dargs.jobs) as executor:
>> +            executor.map(path_stat, paths)
>> +
>> +    return paths
>> +
>> +
>> +def remove_by_stamps(args, paths):
>> +    all_sums =3D set()
>> +    for stamps_dir in args.stamps_dir:
>> +        stamps_path =3D Path(stamps_dir)
>> +        assert stamps_path.is_dir()
>> +        re_sigdata =3D re.compile(r"do_.*.sigdata\.([^.]*)")
>> +        all_sums |=3D set(
>> +            [
>> +                re_sigdata.search(x.parts[-1]).group(1)
>> +                for x in stamps_path.glob("*/*/*.do_*.sigdata.*")
>> +            ]
>> +        )
>> +        re_setscene =3D re.compile(r"do_.*_setscene\.([^.]*)")
>> +        all_sums |=3D set(
>> +            [
>> +                re_setscene.search(x.parts[-1]).group(1)
>> +                for x in stamps_path.glob("*/*/*.do_*_setscene.*")
>> +            ]
>> +        )
>> +    return [p for p in paths if p.bb_unihash not in all_sums]
>> +
>> +
>> +def remove_duplicated(args, paths):
>> +    # Skip populate_lic as it produces duplicates in a normal build
>> +    #
>> +    # 9ae16469e707 sstate-cache-management: skip populate_lic archives =
when removing duplicates
>> +    valid_paths =3D [p for p in paths if p.bb_task !=3D "populate_lic"]
>> +
>> +    keep =3D dict()
>> +    remove =3D list()
>> +    for p in valid_paths:
>> +        sstate_sig =3D ":".join([p.pn, p.sstate_pkgarch, p.bb_task, p.e=
xt])
>> +        if sstate_sig not in keep:
>> +            keep[sstate_sig] =3D p
>> +        elif p.stat_result.st_mtime > keep[sstate_sig].stat_result.st_m=
time:
>> +            remove.append(keep[sstate_sig])
>> +            keep[sstate_sig] =3D p
>> +        else:
>> +            remove.append(p)
>> +
>> +    return remove
>> +
>> +
>> +def remove_orphans(args, paths):
>> +    remove =3D list()
>> +    pathsigs =3D defaultdict(list)
>> +    for p in paths:
>> +        sstate_sig =3D ":".join([p.pn, p.sstate_pkgarch, p.bb_task])
>> +        pathsigs[sstate_sig].append(p)
>> +    for k, v in pathsigs.items():
>> +        if len([p for p in v if p.ext =3D=3D SSTATE_EXTENSION]) =3D=3D =
0:
>> +            remove.extend(v)
>> +    return remove
>> +
>> +
>> +def parse_arguments():
>> +    parser =3D argparse.ArgumentParser(description=3D"sstate cache mana=
gement utility.")
>> +
>> +    parser.add_argument(
>> +        "--cache-dir",
>> +        default=3Dos.environ.get("SSTATE_CACHE_DIR"),
>> +        help=3D"""Specify sstate cache directory, will use the environm=
ent
>> +            variable SSTATE_CACHE_DIR if it is not specified.""",
>> +    )
>> +
>> +    # parser.add_argument(
>> +    #     "--extra-archs",
>> +    #     help=3D"""Specify list of architectures which should be teste=
d, this list
>> +    #         will be extended with native arch, allarch and empty arch=
. The
>> +    #         script won't be trying to generate list of available arch=
s from
>> +    #         AVAILTUNES in tune files.""",
>> +    # )
>> +
>> +    # parser.add_argument(
>> +    #     "--extra-layer",
>> +    #     help=3D"""Specify the layer which will be used for searching =
the archs,
>> +    #         it will search the meta and meta-* layers in the top dir =
by
>> +    #         default, and will search meta, meta-*, <layer1>, <layer2>=
,
>> +    #         ...<layern> when specified. Use "," as the separator.
>> +    #
>> +    #         This is useless for --stamps-dir or when --extra-archs is=
 used.""",
>> +    # )
>> +
>> +    parser.add_argument(
>> +        "-d",
>> +        "--remove-duplicated",
>> +        action=3D"store_true",
>> +        help=3D"""Remove the duplicated sstate cache files of one packa=
ge, only
>> +            the newest one will be kept. The duplicated sstate cache fi=
les
>> +            of one package must have the same arch, which means sstate =
cache
>> +            files with multiple archs are not considered duplicate.
>> +
>> +            Conflicts with --stamps-dir.""",
>> +    )
>> +
>> +    parser.add_argument(
>> +        "--remove-orphans",
>> +        action=3D"store_true",
>> +        help=3Df"""Remove orphan siginfo files from the sstate cache, i=
.e. those
>> +            where this is no {SSTATE_EXTENSION} file but there are asso=
ciated
>> +            tracking files.""",
>> +    )
>> +
>> +    parser.add_argument(
>> +        "--stamps-dir",
>> +        action=3D"append",
>> +        help=3D"""Specify the build directory's stamps directories, the=
 sstate
>> +            cache file which IS USED by these build diretories will be =
KEPT,
>> +            other sstate cache files in cache-dir will be removed. Can =
be
>> +            specified multiple times for several directories.
>> +
>> +            Conflicts with --remove-duplicated.""",
>> +    )
>> +
>> +    parser.add_argument(
>> +        "-j", "--jobs", default=3D8, type=3Dint, help=3D"Run JOBS jobs =
in parallel."
>> +    )
>> +
>> +    # parser.add_argument(
>> +    #     "-L",
>> +    #     "--follow-symlink",
>> +    #     action=3D"store_true",
>> +    #     help=3D"Remove both the symbol link and the destination file,=
 default: no.",
>> +    # )
>> +
>> +    parser.add_argument(
>> +        "-y",
>> +        "--yes",
>> +        action=3D"store_true",
>> +        help=3D"""Automatic yes to prompts; assume "yes" as answer to a=
ll prompts
>> +            and run non-interactively.""",
>> +    )
>> +
>> +    parser.add_argument(
>> +        "-v", "--verbose", action=3D"store_true", help=3D"Explain what =
is being done."
>> +    )
>> +
>> +    parser.add_argument(
>> +        "-D",
>> +        "--debug",
>> +        action=3D"count",
>> +        default=3D0,
>> +        help=3D"Show debug info, repeat for more debug info.",
>> +    )
>> +
>> +    args =3D parser.parse_args()
>> +    if args.cache_dir is None or (
>> +        not args.remove_duplicated and not args.stamps_dir and not args=
.remove_orphans
>> +    ):
>> +        parser.print_usage()
>> +        sys.exit(1)
>> +
>> +    return args
>> +
>> +
>> +def main():
>> +    args =3D parse_arguments()
>> +
>> +    paths =3D collect_sstate_paths(args)
>> +    if args.remove_duplicated:
>> +        remove =3D remove_duplicated(args, paths)
>> +    elif args.stamps_dir:
>> +        remove =3D remove_by_stamps(args, paths)
>> +    else:
>> +        remove =3D list()
>> +
>> +    if args.remove_orphans:
>> +        remove =3D set(remove) | set(remove_orphans(args, paths))
>> +
>> +    if args.debug >=3D 1:
>> +        print("\n".join([str(p.path) for p in remove]))
>> +    print(f"{len(remove)} out of {len(paths)} files will be removed!")
>> +    if not args.yes:
>> +        print("Do you want to continue (y/n)?")
>> +        confirm =3D input() in ("y", "Y")
>> +    else:
>> +        confirm =3D True
>> +    if confirm:
>> +        # TODO: parallelise remove
>> +        for path in remove:
>> +            remove.unlink()
>> +
>> +
>> +if __name__ =3D=3D "__main__":
>> +    main()
>> --
>> 2.39.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192883): https://lists.openembedded.org/g/openembedd=
ed-core/message/192883
>> Mute This Topic: https://lists.openembedded.org/mt/103334660/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
artin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Alex Kiernan

