Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086D3C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:24:02 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.2461.1750346638711253971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gyBXi6sI;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e740a09eb00so803393276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750346638; x=1750951438; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1CRVHh2OJdIShB5zdShlI1VqtmLIUDT3iTSIuwGJpU=;
        b=gyBXi6sIJMXP7UJzNIoSPoJLd8hHJFR1uoMEh59w5E2wW05qD/QcbtL6eyt8M3rDN3
         X1fOE99D6ScCL4Bb8sJemUH4IF4QbAVsMq8YoK98XXI0D5LjSt4nLdYrCwJRhrJiEhhd
         YJc9j+WjeaFjg3l4y2S3anX6yeYs9vfmdW261H9xW91pqp5wGkpZFGtQeTpkIQaErKKc
         5DaxzWpbWgqWJ9bvkT2OIE6gH3u/8quRLTm4RKoyTuVg8N/q0fEoLK3cDOhFlQjN0iAc
         Je59W/wULS13cEHoqNmH093mjXcHZVpBVaUc5eOWFpqyMiHbEJosHNktO8EueogTv/Kb
         UxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346638; x=1750951438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1CRVHh2OJdIShB5zdShlI1VqtmLIUDT3iTSIuwGJpU=;
        b=snao0pB2uQpEjz9VmpizkTtSWx6FA4X3j/E+WvEaYetfXSm5J1xYp1exgfUvngUxkh
         Rty9u4ScveNNtJlOdDwcfNy1edvQHMVRRlqOVPjXrOHLyukgjMi5FvYNNTD0m5lmb6nn
         J6cGmots/Q040u8u7SD5jFaJW8qjhG+jFdjjkE/pvdxjnp6fGJSzon56OXW4adVhZCvU
         aLNT1psCOkiV8BrIOJtrBw7m63OrBQEY+u3vw7KQzEpBIuSFScS/1ed6KnXoKmjkLaDY
         uhzpN11s+KxopZNcgD91/W7MJt6yr7Gjpxkbk0rcONDtJZw7AQ9iGUMmuJtFdjZ4MUFH
         ep+w==
X-Gm-Message-State: AOJu0Yy77aD+F5hWhO7I0PXV6LVQBmk8RBUAQUm+suVrX/l/JqCISHaU
	voDvZ+a1g+A/csfsXPAmo7xR/RfrtvLGsSsfYaI+PQqcBWLtLqnxlYp4ix2N2Uwnm5ZM1VnAG6h
	9245GQ3017VhBX5nObWgJ3A1R+cdifYrJqgOa3Hv8tQ==
X-Gm-Gg: ASbGncuBNsUwz5qOYgIwXDLToiLrfox6uS9ReXVGEan0cCDKJ3f9cIngpRNfH2JsruZ
	rxHUn+KGZh+ubHofhkdwqXfkZbJP4qSGpfiGjKbGT0xdoV33d8qM7WTYxPUMp0wwpVzeMwnQeUv
	bHG5cwCVTqOywLHUuzwqeHcnh+LsLJmNrMRJ/jWGhFhwzylsk9pSabPMWAWxTxolqPBVqtnKV3F
	8k=
X-Google-Smtp-Source: AGHT+IGoYzmNXqBEDI4Lm65Wpsz1buk2muF2Zlre9mH+Y5/JuUEP0Buqb1Kiwo3m7P3lUBaps9vCHNTzmrjcHsTGH1g=
X-Received: by 2002:a05:690c:6887:b0:708:f6d:b79f with SMTP id
 00721157ae682-7117547c53cmr293792487b3.29.1750346637809; Thu, 19 Jun 2025
 08:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
In-Reply-To: <20250619084736.1940747-1-daniel.turull@ericsson.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 19 Jun 2025 08:23:45 -0700
X-Gm-Features: Ac12FXxvN1UIgTDycyjcDU9jztwcko_5VVBDpwT1uoz35O_osHvnS_ZLuDN7T0o
Message-ID: <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Yocto TSC <tsc@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 15:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219086

Hi Daniel,

Since this is a feature addition the TSC will need to approve it
before I can take this backport.

I've copied the TSC so they can add this to the agenda for their next meeti=
ng.

Thanks,

Steve

On Thu, Jun 19, 2025 at 1:47=E2=80=AFAM Daniel Turull via
lists.openembedded.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> The source information used during packaging can be use from other tasks =
to
> have more detailed information on the files used during the compilation a=
nd
> improve SPDX accuracy.
>
> Source files used during compilation are store as compressed zstd json in
> pkgdata/debugsources/$PN-debugsources.json.zstd
> Format:
> { binary1: [src1, src2, ...], binary2: [src1, src2, ...] }
>
> I checked the sstate size, and it slightly increases using core-image-ful=
l-cmdline:
> without patch: 2456792 KB sstate-cache/
> with patch:    2460028 KB sstate-cache/
> (4236 KB or 0.17%)
>
> (From OE-Core rev: c507dcb8a8780a42bfe68b1ebaff0909b4236e6b)
> Adaptations to match spdx in scarthgap: change BP to PF
>
> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/conf/bitbake.conf |  2 ++
>  meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 78f15b76ae..acf4e2d153 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -989,5 +989,7 @@ oe.sstatesig.find_sstate_manifest[vardepsexclude] =3D=
 "BBEXTENDCURR BBEXTENDVARIAN
>  oe.utils.get_multilib_datastore[vardepsexclude] =3D "DEFAULTTUNE_MULTILI=
B_ORIGINAL OVERRIDES"
>  oe.path.format_display[vardepsexclude] =3D "TOPDIR"
>  oe.utils.get_bb_number_threads[vardepsexclude] =3D "BB_NUMBER_THREADS"
> +oe.package.save_debugsources_info[vardepsexclude] =3D "BB_NUMBER_THREADS=
"
> +oe.package.read_debugsources_info[vardepsexclude] =3D "BB_NUMBER_THREADS=
"
>  oe.packagedata.emit_pkgdata[vardepsexclude] =3D "BB_NUMBER_THREADS"
>  oe.packagedata.read_subpkgdata_extended[vardepsexclude] =3D "BB_NUMBER_T=
HREADS"
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index af0923a63f..ba0d326781 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1038,6 +1038,49 @@ def copydebugsources(debugsrcdir, sources, d):
>              if os.path.exists(p) and not os.listdir(p):
>                  os.rmdir(p)
>
> +def save_debugsources_info(debugsrcdir, sources_raw, d):
> +    import json
> +    import bb.compress.zstd
> +    if debugsrcdir and sources_raw:
> +        debugsources_file =3D d.expand("${PKGDESTWORK}/debugsources/${PN=
}-debugsources.json.zstd")
> +        debugsources_dir =3D os.path.dirname(debugsources_file)
> +        if not os.path.isdir(debugsources_dir):
> +            bb.utils.mkdirhier(debugsources_dir)
> +        bb.utils.remove(debugsources_file)
> +
> +        workdir =3D d.getVar("WORKDIR")
> +        pn =3D d.getVar('PN')
> +
> +        # Kernel sources are in a different directory and are special ca=
se
> +        # we format the sources as expected by spdx by replacing /usr/sr=
c/kernel/
> +        # into BP/
> +        kernel_src =3D d.getVar('KERNEL_SRC_PATH')
> +        pf =3D d.getVar('PF')
> +        sources_dict =3D {}
> +        for file, src_files in sources_raw:
> +            file_clean =3D file.replace(f"{workdir}/package/","")
> +            sources_clean =3D [
> +                src.replace(f"{debugsrcdir}/{pn}/", "")
> +                if not kernel_src else src.replace(f"{kernel_src}/", f"{=
pf}/")
> +                for src in src_files
> +                if not any(keyword in src for keyword in ("<internal>", =
"<built-in>")) and not src.endswith("/")
> +            ]
> +            sources_dict[file_clean] =3D sorted(sources_clean)
> +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> +        with bb.compress.zstd.open(debugsources_file, "wt", encoding=3D"=
utf-8", num_threads=3Dnum_threads) as f:
> +            json.dump(sources_dict, f, sort_keys=3DTrue)
> +
> +def read_debugsources_info(d):
> +    import json
> +    import bb.compress.zstd
> +    try:
> +        fn =3D d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.=
json.zstd")
> +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> +        with bb.compress.zstd.open(fn, "rt", encoding=3D"utf-8", num_thr=
eads=3Dnum_threads) as f:
> +            return json.load(f)
> +    except FileNotFoundError:
> +        bb.debug(1, f"File not found: {fn}")
> +        return None
>
>  def process_split_and_strip_files(d):
>      cpath =3D oe.cachedpath.CachedPath()
> @@ -1269,6 +1312,9 @@ def process_split_and_strip_files(d):
>          # Process the dv["srcdir"] if requested...
>          # This copies and places the referenced sources for later debugg=
ing...
>          copydebugsources(dv["srcdir"], sources, d)
> +
> +        # Save source info to be accessible to other tasks
> +        save_debugsources_info(dv["srcdir"], results, d)
>      #
>      # End of debug splitting
>      #
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219060): https://lists.openembedded.org/g/openembedde=
d-core/message/219060
> Mute This Topic: https://lists.openembedded.org/mt/113722386/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

