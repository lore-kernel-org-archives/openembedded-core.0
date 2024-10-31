Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41581E68951
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:34:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.22553.1730406860355023861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jAP8z2LE;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1484187e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730406858; x=1731011658; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF21usoXpfKLU+AePgHtz+gi0Y5M8anz89nGB9+xhJE=;
        b=jAP8z2LEa1iwIeeD2SN1g1RMDBhMGSdFczNPHNsHW96KfnvW+YM4LCAAkTRYVG/kaT
         yAxOH6we6shob31/j9UQPhwLoAdP9vgfDMlCW/cKBCbU47hOKrmbWkiAdJKizAIEO+J0
         0Hyxi3s+vwzbI63HiR7jYNmx6qLPT9sYYdRhLKiFNUNrC+yNeH1Uwc+jQ7f5r42RLODv
         CV8wLNgPmecnjgOIit62iA1Pw6ZQrgHJCeW04e7jQadkIpCw31aZuT+Nu9orMu5ai0Vx
         vXYIqZneBRQVniu8d7wtIXgT0wTbS57cCO8y6uJPayVaEsOnkWhSWGIHaKB95E5Iw1OY
         L0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406858; x=1731011658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF21usoXpfKLU+AePgHtz+gi0Y5M8anz89nGB9+xhJE=;
        b=noQKTPz1t10TffitmRUnzxgIZDM8VSm3WwvLbdVWas5k5BdS1fUQ7PCOyBH80210gR
         YOTWxEo49P6BoCvWGIWikKAICHOB3Z1ZwaO4C/aKSiBjAByuGkv5FR87wFd2liVprKwu
         sArIMlwFZ5gDWD7rWoaz13Rod+4RWdeTeOxzx/tlAAYwmiQLFzLIkezGKEf4QimczRdN
         7IuJtAFp0uEiR13mL0nJeGDnhqIg/eWKhC0GB3rx87rCmjni9ks9Ey+dyi4law1yjyF0
         s2Wp1Jq5nAVNJBUBnA6QSDLlNgf0Cq3fteKqsVk3Bgn+AqEalu8N1YiLTrTG/ZyIEoz2
         isYQ==
X-Gm-Message-State: AOJu0YyEgBHAMXJvVn4By6VkWL1QK/K9AAJWzSX3pZstzJGCgmmvuzzs
	jTKcKh7/Q9l0yLmTUQqwJQloGxM7tuDu4aaENZ0eLq8dl+atTNNYSUK6TMAV8/XP9iNvJfj3f0R
	W4si51VOCch+Y3nk9HuX4u8lspsDMElwb
X-Google-Smtp-Source: AGHT+IGLhgqVyyk+IldC5DS7i7j28BMttmKPt9GgZkSjERYryXG5XRx+O1HCFHACbLj7/NJ7aQwveJ+FmnrUZu9xxHk=
X-Received: by 2002:a05:6512:2807:b0:53b:1671:604f with SMTP id
 2adb3069b0e04-53b348d878dmr11835226e87.23.1730406858160; Thu, 31 Oct 2024
 13:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241030050745.3702603-1-hongxu.jia@windriver.com> <20241030050745.3702603-6-hongxu.jia@windriver.com>
In-Reply-To: <20241030050745.3702603-6-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 31 Oct 2024 14:34:06 -0600
Message-ID: <CAJdd5Gb40gtU9hMbAxtH0gg5us3ju46u2XMV2oUuWdxGP_LxPg@mail.gmail.com>
Subject: Re: [oe-core][PATCH V3 5/6] create-spdx-{2.2,3.0}: support SPDX
 include source for work-share directory
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206593

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 11:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
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
>  meta/classes/spdx-common.bbclass |  9 +++++++
>  meta/lib/oe/spdx_common.py       | 41 ++++++++++++--------------------
>  2 files changed, 24 insertions(+), 26 deletions(-)
>
> diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
> index ad02da5cd6..d3cdc8b6ce 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -57,6 +57,15 @@ def create_spdx_source_deps(d):
>              if oe.spdx_common.has_task(d, "do_shared_workdir"):
>                  deps.append("%s:do_shared_workdir" % pn)
>
> +            # For gcc-source-${PV} source code
> +            if oe.spdx_common.has_task(d, "do_preconfigure"):
> +                deps.append("%s:do_preconfigure" % pn)
> +            elif oe.spdx_common.has_task(d, "do_patch"):
> +                deps.append("%s:do_patch" % pn)
> +            # For gcc-cross-x86_64 source code
> +            elif oe.spdx_common.has_task(d, "do_configure"):
> +                deps.append("%s:do_configure" % pn)
> +
>      return " ".join(deps)
>
>
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 7a85579f64..ff18d91780 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -38,7 +38,7 @@ def extract_licenses(filename):
>
>
>  def is_work_shared_spdx(d):
> -    return bb.data.inherits_class("kernel", d) or ("work-shared" in d.ge=
tVar("WORKDIR"))
> +    return '/work-shared/' in d.getVar('S')
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
> -
> -        # Make sure gcc and kernel sources are patched only once
> -        if not (d.getVar("SRC_URI") =3D=3D "" or is_work_shared_spdx(d))=
:
> -            bb.build.exec_func("do_patch", d)
> +                src_dir =3D spdx_workdir + "/" + d.getVar('BP')
> +
> +            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
> +            oe.path.copyhardlinktree(share_src, src_dir)
>
>          # Some userland has no source.
>          if not os.path.exists(spdx_workdir):
> --
> 2.25.1
>

