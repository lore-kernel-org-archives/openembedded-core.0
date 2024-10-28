Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB12D5B157
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 21:12:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.4352.1730149948701323371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 14:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqXXZeP7;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e690479cso4641612e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 14:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730149947; x=1730754747; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=711hnSHSsaRsfjQLHpmwROGTuiKaC5ghHjW0v+PZYPo=;
        b=OqXXZeP7fHQyMG79nY1MDa3H9UjRuCOnzmjh1JyGrxbhPBTeT+//aQiIevamk4g15v
         /3BhgwvRLSfzV/SUaIV/pVcm7fS2Bo+Jp/3aG22JRvAHU7yvg4n9mBWgiseTcrvF0mRE
         I0gpeWDEiu0u2CmJrKw2/wWfm5+RUYJS0eOEhqUCu3Z5QdglE1kdwo25dk2B6h9nVX9E
         L9iNN5263WJErvyap4WbIeL7pU7P8haIYZ5bRBqBcx5nXkpnzgBonDXefxl0+YOHCHeI
         aiFCIhF7k3h8aApeDQstKbUpvqbsgceu6xodGdgZdYPAODsvNueFHmW7bHnVTYRZSAoQ
         HVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730149947; x=1730754747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=711hnSHSsaRsfjQLHpmwROGTuiKaC5ghHjW0v+PZYPo=;
        b=tdQY/91+Joq63dzulO04EMbwec/2SdC71uoyfwDbAco+Z6NN2Xv2TU4o2b+mMRmkVQ
         LPCLihY/avAlzs+a227Ul7x76DxU928aSj1a+Ik1WVfodhaXd7Pzw3RQxWHat8+Yj4qi
         xaeiIaEJ0K/IpI3maOKGN66BxjdTHPrnWD2IwRoEqAbfXwnAEk1lP8gHFtYFFZ2s6+pQ
         SxsNwMhWvI7e6xD3o7zZa2mqjJ7cKnsb4YXXs1oPrV07VRcgcgz7j7ltvXalBRWxHvHi
         o4KYktpj+BX2XDIv/szHcEweDcuJg0YIP8VEPsMsjWlBk1htYnTi6V30WBeAXz2i6Yxn
         N8jg==
X-Gm-Message-State: AOJu0YyBaTutV404/FZd+KF3R7tZxCsqcVjd8Ar4xqBjEQE7IifXokvs
	2pmk35rJmPVZVAXZkCwHkesyU65ethU4NsPOMphr8+RT6sjVlR75QBh0zmQ69dpyQHY53XkTlUz
	31pwWORHzcJMaV4b5/3UeJ3K88vBw1A==
X-Google-Smtp-Source: AGHT+IG73ljfka6nDqlfM7jA23BtDksA5T6xCWEL1EST0eulhSsDPjuk9MvYN2AE0IZsQN6UkqyVfNGvEDGHu2ZsTuA=
X-Received: by 2002:a05:6512:3d8b:b0:539:d0ef:b3f9 with SMTP id
 2adb3069b0e04-53b3491dfc0mr4814180e87.40.1730149946344; Mon, 28 Oct 2024
 14:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241026032519.1968518-1-hongxu.jia@windriver.com> <20241026032519.1968518-6-hongxu.jia@windriver.com>
In-Reply-To: <20241026032519.1968518-6-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Oct 2024 15:12:14 -0600
Message-ID: <CAJdd5GajXJuLk+zsN+6y_WVLVKj7_b13sx0LVHcyHtw5N7V_Mw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 5/6] create-spdx-{2.2,3.0}: support SPDX include
 source for work-share directory
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 21:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206466

On Fri, Oct 25, 2024 at 9:25=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> Originally, while SPDX_INCLUDE_SOURCES =3D "1" [1], there is bug in scan
> for gcc, libgcc in which the sources locates in work-share directory.
> Copy source from ${WORKDIR} to ${SPDXWORK} did not satisfy the situation
> while ${S} was not included in ${WORKDIR}
>
> This commit aim to support SPDX include source for work-share directory
>
> 1. If is_work_shared_spdx, Copy source from ${S} to ${SPDXWORK},
> normally the dest dir in ${SPDXWORK} has the same basename dir of ${S};
> but for kernel source, rename basename dir 'kernel-source' to ${BP} (${BP=
N}-${PV})
>
> 2. For SPDX source copy, do hard link copy to save copy time
>
> 3. Move do_patch to no work shared situation along with do_unpack
>
> 4. Tweak task do_create_spdx dependencies to assure the patched source
> in work share is ready for SPDX source copy
>
> 5. Remove bb.data.inherits_class('kernel', d) from is_work_shared_spdx,
> the kernel source locates in 'work-shared', test kernel.bbclass is not
> necessary
>
> [1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SPDX=
_INCLUDE_SOURCES
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 20 ++++++++++++++
>  meta/classes/create-spdx-3.0.bbclass | 19 +++++++++++++
>  meta/lib/oe/spdx_common.py           | 41 +++++++++++-----------------
>  3 files changed, 55 insertions(+), 25 deletions(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index cd1d6819bf..900595a7e9 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -947,3 +947,23 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, r=
ootfs_spdxid, packages, spdx
>              tar.addfile(info, fileobj=3Dindex_str)
>
>  combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS SPDX_MULTILIB_SSTAT=
E_ARCHS"
> +
> +python () {
> +    import oe.spdx_common
> +
> +    # Assure the patched source in work share is ready for SPDX source c=
opy
> +    if oe.spdx_common.is_work_shared_spdx(d) and \
> +       d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1" and \
> +       oe.spdx_common.process_sources(d):
> +        pn =3D d.getVar('PN')
> +        # There is a corner case with "gcc-source-${PV}" recipes, they u=
se "do_preconfigure"
> +        # to modify source file after do_patch
> +        if oe.spdx_common.has_task(d, "do_preconfigure"):
> +            d.appendVarFlag('do_create_spdx', 'depends', ' %s:do_preconf=
igure' % pn)
> +        elif oe.spdx_common.has_task(d, "do_patch"):
> +            d.appendVarFlag('do_create_spdx', 'depends', ' %s:do_patch' =
% pn)
> +        # There is a corner case with "gcc-cross-x86_64" recipes, it has=
 "do_configure"
> +        # but no do_patch
> +        elif oe.spdx_common.has_task(d, "do_configure"):
> +            d.appendVarFlag('do_create_spdx', 'depends', ' %s:do_configu=
re' % pn)
> +}

For some reason, I think I'd prefer something like:

do_create_spdx[depends] =3D "${@extra_create_spdx_deps(d)}"

def extra_create_spdx_deps(d):
   if BLAH:
     return "do_configure"

  # ETC.

  return ""

But I don't know why. Perhaps Richard can weigh in on if one is better
than the other?

> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 5f0590198f..284e0ff91c 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -190,3 +190,22 @@ python spdx30_build_started_handler () {
>  addhandler spdx30_build_started_handler
>  spdx30_build_started_handler[eventmask] =3D "bb.event.BuildStarted"
>
> +python () {
> +    import oe.spdx_common
> +
> +    # Assure the patched source in work share is ready for SPDX source c=
opy
> +    if oe.spdx_common.is_work_shared_spdx(d) and \
> +       d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1" and \
> +       oe.spdx_common.process_sources(d):
> +        pn =3D d.getVar('PN')
> +        # There is a corner case with "gcc-source-${PV}" recipes, they u=
se "do_preconfigure"
> +        # to modify source file after do_patch
> +        if oe.spdx_common.has_task(d, "do_preconfigure"):
> +            d.appendVarFlag('do_create_spdx', 'depends', ' %s:do_preconf=
igure' % pn)
> +        elif oe.spdx_common.has_task(d, "do_patch"):
> +            d.appendVarFlag('do_create_spdx', 'depends', ' %s:do_patch' =
% pn)
> +        # There is a corner case with "gcc-cross-x86_64" recipes, it has=
 "do_configure"
> +        # but no do_patch
> +        elif oe.spdx_common.has_task(d, "do_configure"):
> +            d.appendVarFlag('do_create_spdx', 'depends', ' %s:do_configu=
re' % pn)
> +}
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 1ea55419ae..ab037b4088 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -38,7 +38,7 @@ def extract_licenses(filename):
>
>
>  def is_work_shared_spdx(d):
> -    return bb.data.inherits_class("kernel", d) or ("work-shared" in d.ge=
tVar("WORKDIR"))
> +    return 'work-shared' in d.getVar('S')

Should the "/" be included? (e.g. return "/work-shared/" in d.getVar("S") )

>
>
>  def load_spdx_license_data(d):
> @@ -74,11 +74,6 @@ def process_sources(d):
>      if d.getVar("PN") =3D=3D "shadow-sysroot":
>          return False
>
> -    # We just archive gcc-source for all the gcc related recipes
> -    if d.getVar("BPN") in ["gcc", "libgcc"]:
> -        bb.debug(1, "spdx: There is bug in scan of %s is, do nothing" % =
pn)
> -        return False
> -
>      return True
>
>
> @@ -190,34 +185,28 @@ def get_patched_src(d):
>              bb.utils.mkdirhier(d.getVar("B"))
>
>              bb.build.exec_func("do_unpack", d)
> -        # Copy source of kernel to spdx_workdir
> +
> +            if d.getVar("SRC_URI") !=3D "":
> +                bb.build.exec_func("do_patch", d)
> +
> +        # Copy source from work-share to spdx_workdir
>          if is_work_shared_spdx(d):
> -            share_src =3D d.getVar("WORKDIR")
> +            share_src =3D d.getVar('S')
>              d.setVar("WORKDIR", spdx_workdir)
>              d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
> +            # Copy source to ${SPDXWORK}, same basename dir of ${S};
>              src_dir =3D (
>                  spdx_workdir
>                  + "/"
> -                + d.getVar("PN")
> -                + "-"
> -                + d.getVar("PV")
> -                + "-"
> -                + d.getVar("PR")
> +                + os.path.basename(share_src)
>              )
> -            bb.utils.mkdirhier(src_dir)
> +            # For kernel souce, rename suffix dir 'kernel-source'
> +            # to ${BP} (${BPN}-${PV})
>              if bb.data.inherits_class("kernel", d):
> -                share_src =3D d.getVar("STAGING_KERNEL_DIR")
> -            cmd_copy_share =3D "cp -rf " + share_src + "/* " + src_dir +=
 "/"
> -            cmd_copy_shared_res =3D os.popen(cmd_copy_share).read()
> -            bb.note("cmd_copy_shared_result =3D " + cmd_copy_shared_res)
> -
> -            git_path =3D src_dir + "/.git"
> -            if os.path.exists(git_path):
> -                shutils.rmtree(git_path)
> +                src_dir =3D spdx_workdir + "/" + d.getVar('BP')
>
> -        # Make sure gcc and kernel sources are patched only once
> -        if not (d.getVar("SRC_URI") =3D=3D "" or is_work_shared_spdx(d))=
:
> -            bb.build.exec_func("do_patch", d)
> +            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
> +            oe.path.copyhardlinktree(share_src, src_dir)
>
>          # Some userland has no source.
>          if not os.path.exists(spdx_workdir):
> @@ -225,6 +214,8 @@ def get_patched_src(d):
>      finally:
>          d.setVar("WORKDIR", workdir)
>
> +def has_task(d, task):
> +    return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVar=
Flag(task, "noexec", False))
>
>  def fetch_data_to_uri(fd, name):
>      """
> --
> 2.25.1
>

