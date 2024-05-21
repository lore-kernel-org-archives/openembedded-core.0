Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3105C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:24:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.16375.1716287071548354794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0GDFzaR;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52388d9ca98so7130167e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716287070; x=1716891870; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zVtdabEUjEFDwIwQp6o9eADjpth9sgfymeRI5mFuLOI=;
        b=g0GDFzaRz85xZ/qIaFHybaxSCcxNd7oDxsjjrpmeeneG63VKXYzz1jPwcS7a/9G4/b
         +NLgl5vHz61QMDspKUtmJFWwPI4S1chAGsAkq3bq6cfcY3c+lYTkjbHjk+YQwI4O96c1
         WoXLBHo1AdAsWC9BZKW97zDhGqTXx99VY2L0G0ZM42MUEB/g/+94ZrBdz+vmBbF7WRhs
         im9itMNfsKgI+L4xaYe0hObzshB6ck+q4tKOwrbdpCsW4EdHNmUyeGYQuFuzqB9JnWih
         TedIQYe1tFPGoRSoKSFKxsuwupGvel/X59j+DnRNs1DDeRYw6+FZCd6Re+FGCk6B2dCe
         QKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716287070; x=1716891870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVtdabEUjEFDwIwQp6o9eADjpth9sgfymeRI5mFuLOI=;
        b=VZPIdCg/nFBcEusj0vo/NMN2W7mnymy6o5M1DVitLZn4Grq0nmubyPI3bPJNpFXShe
         fexghpyBgHWQY2E1OijeuNosfKBeD7CijX5vVKfxVb0y8bKEEDTUIgt/3G6BLDjQaKb+
         3GrkmX35FJG3LlKgR0axa6FR11rHMz7vRpT8TyI99U6Iz4eo/VZzVVych/DeAwmdLwTB
         MkRwvflxtwnUP3rQrh/bEvEpxHj5RBN8z0GVszTEk+oCm+AedeZ2sHR1ZnBNVyqKdOQ8
         FgjubpaDrufrV3IDGh6Jbgt+7TtyyKDvQuLSyspP1ljKDo9BeOuIVWHQJ6GOo4WbNr9Q
         mYug==
X-Gm-Message-State: AOJu0Yw2ueL3qgR2H43mUk/I0XJiJdI1MdA7mShcfj1JJsee6DbI4x7c
	7Wvs1RE+5LMVIvVr4rfFrK3JlTljDakkfP9lPk0QcRwd18/3Gqa4mGPvxs2MK3joNNG4l7fPxr8
	kv2OupV/nwbdnNALqb21I7qQuITteRg==
X-Google-Smtp-Source: AGHT+IEKv6/JRHH1pC2MNaHJfEG5EywmAWOTCUBPsjZhHGNzWQXhyRD+tmdVd+mMQZxwgyGQfzIX2J2Z5zryo8FoO4A=
X-Received: by 2002:a05:6512:3995:b0:521:cc8a:46dd with SMTP id
 2adb3069b0e04-5220fc7cb3cmr32430564e87.11.1716287069331; Tue, 21 May 2024
 03:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj941KS_ULo9iwpyYCKmvpHRur-4djy0AD=bjUvjnwW1XA@mail.gmail.com>
 <17234.1716192619114804009@lists.openembedded.org>
In-Reply-To: <17234.1716192619114804009@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 12:24:17 +0200
Message-ID: <CANNYZj-d-SSYPv-wZF8kfnSvt7i-cG3ec3wotSNETD6-OttyKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199612

This does not seem to address the question I asked. Please do not send
more code that moves things around, but diagnose the original issue
properly.

Alex

On Mon, 20 May 2024 at 10:10, pmi183 via lists.openembedded.org
<pmi183=gmail.com@lists.openembedded.org> wrote:
>
> Hi Alex,
>
> I made some debug in the flow and i saw a timing issue and since there's no reason to generate files-in-package.txt before sstate-cache operations i moved the call to the postfunc of sstate:
>
> ---
>  meta/classes-global/sstate.bbclass |  5 +++++
>  meta/classes/buildhistory.bbclass  | 18 +++++++++++++++---
>  meta/lib/oe/packagedata.py         |  2 +-
>  3 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
> index 76a7b59636..7e3c3e3c4f 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -104,6 +104,7 @@ SSTATEPOSTCREATEFUNCS = ""
>  SSTATEPREINSTFUNCS = ""
>  SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
>  SSTATEPOSTINSTFUNCS = ""
> +SSTATEPOSTFUNCS = ""
>  EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
>
>  # Check whether sstate exists for tasks that support sstate and are in the
> @@ -805,6 +806,10 @@ python sstate_task_postfunc () {
>      sstate_installpkgdir(shared_state, d)
>
>      bb.utils.remove(d.getVar("SSTATE_BUILDDIR"), recurse=True)
> +
> +    for postfunc in (d.getVar('SSTATEPOSTFUNCS') or '').split():
> +        # All hooks should run in the SSTATE_INSTDIR
> +        bb.build.exec_func(postfunc, d, (sstateinst,))
>  }
>  sstate_task_postfunc[dirs] = "${WORKDIR}"
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index fd53e92402..054c213bf5 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -58,6 +58,9 @@ SSTATEPOSTUNPACKFUNCS:append = " buildhistory_emit_outputsigs"
>  sstate_installpkgdir[vardepsexclude] += "buildhistory_emit_outputsigs"
>  SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "| buildhistory_emit_outputsigs"
>
> +SSTATEPOSTFUNCS:append = " buildhistory_emit_filesinpackage"
> +SSTATEPOSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_filesinpackage"
> +
>  # All items excepts those listed here will be removed from a recipe's
>  # build history directory by buildhistory_emit_pkghistory(). This is
>  # necessary because some of these items (package directories, files that
> @@ -87,6 +90,16 @@ buildhistory_emit_sysroot() {
>         buildhistory_list_files_no_owners $BASE ${BUILDHISTORY_DIR_PACKAGE}/sysroot
>  }
>
> +#
> +# Write out files-in-package for this package
> +#
> +python buildhistory_emit_filesinpackage() {
> +    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
> +        # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
> +        bb.build.exec_func("buildhistory_list_pkg_files", d)
> +        return 0
> +}
> +
>  #
>  # Write out metadata about this package for comparison when writing future packages
>  #
> @@ -99,8 +112,6 @@ python buildhistory_emit_pkghistory() {
>          return 0
>
>      if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
> -        # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
> -        bb.build.exec_func("buildhistory_list_pkg_files", d)
>          return 0
>
>      if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
> @@ -599,7 +610,8 @@ buildhistory_list_files_no_owners() {
>
>  buildhistory_list_pkg_files() {
>         # Create individual files-in-package for each recipe's package
> -       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
> +    pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
> +       for pkgdir in ${pkgdirlist}; do
>                 pkgname=$(basename $pkgdir)
>                 outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
>                 outfile="$outfolder/files-in-package.txt"
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 2d1d6ddeb7..e8c503b43b 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -309,7 +309,7 @@ fi
>          subdata_file = pkgdatadir + "/runtime/%s" % pkg
>          with open(subdata_file, 'w') as sf:
>              for var in (d.getVar('PKGDATA_VARS') or "").split():
> -                val = write_if_exists(sf, pkg, var)
> +                write_if_exists(sf, pkg, var)
>
>              write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
>              for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split()):
> --
> 2.34.1
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199555): https://lists.openembedded.org/g/openembedded-core/message/199555
> Mute This Topic: https://lists.openembedded.org/mt/87258776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

