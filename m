Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB0FC3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 05:55:10 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.5307.1746078900272428315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 22:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFo46LBW;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-605f7d3216bso141874eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 22:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746078899; x=1746683699; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdPxbeU3miR7PPFXJQaGCNo18CLUe41lndMCKpZUrU4=;
        b=XFo46LBW9KfN1occKREA8m0ZyuScSmbjOk3B8KGgcSMk4GtCGyU+ItteU6F9UBS6FB
         yXM0b7St8CzITRrqcv9OBEI30jnYemptOSPZBkt7aNRJuzB9cj+GDWKZOa3WDbax1Af6
         6uCC+WBd0s+rwGNHCbxEkfbanZrVqz2ntI3prBPbkaQGarJGMhh+DgPHagRs4gTCyn2C
         cAsYp7c9O4AYhXEyjDRvmncdZis6RoTl2wRXd11wDQQTYS2YPFUngdPqYUORIflDPbh6
         i1t5o0v1sIqhdCOoiyk10N7xUwUNT2n/LbOLgFIUVfTueUhbjHKE7tH5P5C7fRIj5EL4
         Wpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746078899; x=1746683699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdPxbeU3miR7PPFXJQaGCNo18CLUe41lndMCKpZUrU4=;
        b=XqYDKXOM1TIx0IdoIx3lUNjh2nVfvtD5yZ92jAdCUSeZ4ac8LZ3Z260C1fhqzy97PZ
         FQd0NSg2YMkAIizbfYHRiQ4p6/1GpLCuXHDZZbNGKjIh3S45rSvJYCWMRZgilS4NwU8W
         LVfEeRzijZEPr0G42VvuivREiMT8mvM2Gx8MdJ2Ps2MR/klI2ULvjItN1taK5lJYPbKu
         b1dvQa6ivhRnPq3lOIM1zTJWKICl09MHw+oZ1HK+xWz0TfBFu2heAXT3svwmNAGMmuPm
         /B5gDAaaw4ZqKT61Gv5fM5l4KpK0evg3gHvfSdQd+tMxW8YeQPEpZmVzGlWFvuIen94L
         UyUw==
X-Gm-Message-State: AOJu0Yx+LvIXQLjF4q1Ma18Yr2HqfALAnS19mo+tKngJEFFfbDV3EILw
	C9mRD9WaS7V5Xan02yGho/UVK906JTOXvIv7FSPrCxn61P2az7UmAJbM3tZKmx3Rpq32nO5rW84
	3f85eKjTqpc3HgPtT6ufxClL9YIWliyB/
X-Gm-Gg: ASbGnculBLKNUYg6Y5BlJ00DEM8b/xBv8i8BHk9I7YSUq0l3GkSuVFI2mKhgUjOcRqR
	6T/47rlk7eqbyMmAH7ytXjEuqccCE05kXV+iR+xk2BYxN+4uJ6iBkdMHI3oog0NOLza0fZqnUv+
	GJHZozrweYG4WKprzlEcs3+Q==
X-Google-Smtp-Source: AGHT+IH16AUM9xHrzg98CRTpqfia2ldAC/S31iax3Qytdq2VOvUkSC/3AeSdVYj9ibn7LeRg4Xuo3n8fFe2aEoX7PG8=
X-Received: by 2002:a4a:e916:0:b0:603:f973:1b3 with SMTP id
 006d021491bc7-607d40fc7d8mr3193786eaf.0.1746078899402; Wed, 30 Apr 2025
 22:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Apr 2025 22:54:33 -0700
X-Gm-Features: ATxdqUHDjnvp-U9fRtOhbyZMX1K10P7N0EhyxBgRO_t9UA1id_JSBHZgwt9vf2A
Message-ID: <CAMKF1soiQ=bmtZwHLLZ4OAEHA=8r04mQ0ATyFmcCaZmy27tXVQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 05:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215764

On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> 3463100f2d x86: Detect Intel Diamond Rapids
> e09436c2cb x86: Handle unknown Intel processor with default tuning
> 7620d98186 x86: Add ARL/PTL/CWF model detection support
> 765ff3d0d4 x86: Optimize xstate size calculation
> 65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control non-temporal p=
ath
> 2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (=
bug 32047)
> bde201e92c x86: Disable non-temporal memset on Skylake Server
> 38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold` when it=
 is undesirable
> cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
> 0da58e8be0 x86: Add seperate non-temporal tunable for memset
> 837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
> 87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size=
 (bug 32810)
> 60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires XSAVE
> 4cf3f9df54 x86_64: Add atanh with FMA
> 01ed435e2e x86_64: Add sinh with FMA
> 0edcc77fe7 x86_64: Add tanh with FMA
> 7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
> e1fe22368e nptl: clear the whole rseq area before registration
> dd8c0c3bbd math: Improve layout of exp/exp10 data
> a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
> d0e2133470 AArch64: Add SVE memset
> 0cc12d9c47 math: Improve layout of expf data
> 0cd10047bf AArch64: Remove zva_128 from memset
> dd1e63ab58 AArch64: Optimize memset
> 65a96a6f2b AArch64: Improve generic strlen
> 4073e4ee2c AArch64: Improve codegen for SVE logs
> 78abd3ef6e AArch64: Improve codegen in SVE tans
> a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
> dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
> 72156cb90b AArch64: Improve codegen in AdvSIMD logs
> 5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several AdvSIMD=
 routines
> 80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
> d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
> f6d48470ae assert: Add test for CVE-2025-0395
>
> Testresults:
> After update    |Before update   |Difference
> PASS: 5068      |PASS: 5072      |PASS: +4

+4 should mean more passes after update but the table shows otherwise.
Can you list the 4 tests which are passing now ?

> FAIL: 120       |FAIL: 120       |FAIL: 0
> XPASS: 4        |XPASS: 4        |XPASS: 0
> XFAIL: 16       |XFAIL: 16       |XFAIL: 0
> UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index da9227ccca..040fc793b1 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
> +SRCREV_glibc ?=3D "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215761): https://lists.openembedded.org/g/openembedde=
d-core/message/215761
> Mute This Topic: https://lists.openembedded.org/mt/112554022/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

