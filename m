Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C945CC982CC
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:41:04 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22751.1789868456964794910
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FqD0rH2Q;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1640196d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789868456; cv=none;
        d=google.com; s=arc-20260327;
        b=QbPHcb9bu5FHG8T9eGRkelct0cvafsZtjkXJ98Gh5irSDiGo4fMPjOzpK+7hm0fQ5w
         5ieYG1uvgWQQdh2spO27MM2lJlcdmVci5RSi39zW0nLk3/Van3Bl3ZyMBJVQ+fHy3vMM
         AIz/I8uZeXH+LM6eUvT5b9R6VS6tnLBL/E9X9qSb+7qPWbC+hYkFMmeTvqMHFuVk80UN
         lNEMyPzODCazuSKJ/IxrcsJ872qudpNRHO2k4Ylkm7eO77xgBARiQZuvlI+J9QRHIp/n
         N+TZ0RDqrMt8Bc60uhV5tbxFXZHvFcq8KhHCUX9cK15Cw3tePkrQYpueRU2t17gnDPEt
         QkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lFmoAaBibe2RS1n6yxjDn8MGOpQq6kM2MX3R+0nUe54=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=ab6S27hqRILQDJpG1+fEg2FsD1mUUTyj0eJlcas+OzgN5DHSSxunelRJp67GWO4EIs
         MqjaDN4Ak6/+4VFO5xg9WrhdmhtTHBK9iMZOhb/x8JLPMMkKZ6dkWMwl7VSN1k9ynHJ8
         sFdbTrqrW9IbT1ynOX2Wua9YQsy4rBtV6OyD1tT0AoENvGOWIy1PcHxHzslmCPVjaplK
         +RQ/zledWhF80rhtHB2zKllJ6o4sKX0NCenZmiv8mUDY6t6P3+LVy1OpEio6trk/ZIIf
         aDvP/6soRkLI6stPv28FbmNPkK0FwKQijLs7QwA4TmLbkYn91/uxOjl7EXIGx+BB0Mx9
         cgeA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868456; x=1790473256; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFmoAaBibe2RS1n6yxjDn8MGOpQq6kM2MX3R+0nUe54=;
        b=FqD0rH2Q+yYI6tRQnNO5JLsIFJWEWIgpu82NMteagYDvOXD/WiS+pHG0o8ev1NM9eG
         6b36EXEMbMdeLXEA7xstnh8ctzJ8JLXIXnGbPJfGXJqP62X/ttTuzt6vEAGF0cHPRfid
         tCqZwa9RNCU211r3lXY91Sut8UJV7o8xeFDOSRiSu+Oi+FWJeJVf44hSr6Xo/6BTTSyz
         sOmZ1AXDGpPQMqHLgtwt+9uRQdH03JOxK4KS5GDyEvc0VVnmInG02mS+2r6WS0aKmIRk
         eDjqTu+Amc6ReWn6Ts1yFtlADO86PPvzEwLsHdW7Un8FYXKC1Cix2l2tLrfa+2vtv4yY
         HY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868456; x=1790473256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFmoAaBibe2RS1n6yxjDn8MGOpQq6kM2MX3R+0nUe54=;
        b=hpQanUXnW66Umt0ZaMPzXzJOStpIaVCaRFFRdbEckR/p6xUxxi7xvWJuPtam6AkFCV
         cO+kIlD7oRl2crGJ6ruce74WMT7piGAXnLaxe1VFRdhPZrMkgJlLBwr81p8v3yc2QR/p
         y+z5zOeeh65UX6pFVGbe1QeYl2nIaW9cooM/+TX8C/8X9KkueczeVWQVRYuQiGX082Vk
         u92ld9omwspyT+g5xxVWNqkEsWazX+HEX5xHxLBq+3Iqzx8kGK3A8tqdNQSZxjjiosyI
         c9UyfF4lH3+3MlRttz8AtFHkarQ8utDFXpnUYQOWOBhiBynEfvAhvHd0F/1sUPEOcHAP
         AWQw==
X-Gm-Message-State: AFuF++mZvA3bMcoYzTfbQwdMCL4ii+t5ro3nJZouwXmOppHg3cl41soG
	hqFh4pTJ6dPtovNHT4QuScJZyrZ+gaR+ozzg6MgIDOR19fxLh4XDiSvvzU1nkTu16pkCqIKvGB1
	j90SQ48WCbldyYZjwUNqnJLYaYu+huQutXI1M
X-Gm-Gg: AYBFou0c3Idh2lOzJSzK9XsyJgEwBhbd8+bDCMDi26+3dvG1VyeqPIEYF2jxfQbHNyl
	q+ABjJOl+kml2UtjavlbaU91PkZdWpLfDGp01wG49CFF/Sv9DI4jdCvppMM/9gh+esaO2Ye5B16
	jDXNztxUx+U7UvGooLqphSfBXkcAOUOSSLcR0gA03DImcfjHSX2F5Ns7i+eAFi4S/HYL+NQnSCv
	16VEYCYIPycvZ3br1CAKlrDL//ktqXDqm0jL+s4AEl/xk9wtR8CCsIOPg3DSvuLsjXZvrLC1wV9
	yOZ8egQfDvXCTqE/Rkq+uGeO7p1Wsj5R3uEJgy1Xi4+ruSDeqCzaZK9H+q7/hFAbQelsSPf4KyL
	XAw8eL5GvPfcLeKplggPbCc2aEI8clIMex9sI/uNza5cpjfwCgN6GxDg0wIPevCmE1q2OGkE0rT
	zRmxY0WJisPMeZ4xpLf3pVqbeTDoQukBtdo9CqeSVzPlgoUKfJPqgt/AL5rq07gEbisyFXpUHok
	TShmgOpQjR5CxD6mx+EsdXEF1GYrgsvzBEy7wGLsUajzbWDxGjug5rpm8NfE/uP1bVwUwjm28rW
	jdJAoKrX5kHNZ+23FPTe33m9NumVBYXi+EZp18460RcTovKj+F4=
X-Received: by 2002:a53:ac82:0:b0:671:2519:a915 with SMTP id
 956f58d0204a3-6717fdac7d6mr2171032d50.59.1789868455982; Sat, 19 Sep 2026
 18:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-14-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-14-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:40:29 -0700
X-Gm-Features: AcwNN1UHeXxx_qbJqhrF5qt6AeKdjiNIzlgH4PZ4BkxT17Mn-oTjP0SYn5_jNYI
Message-ID: <CAMKF1sruqQhtfuMqMJqE-OEAGypirLKyt6xsVvkRnTywm7aW_w@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 13/14] arch-riscv.inc: rename
 TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT in assignments
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="00000000000083794c065be03924"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246254

--00000000000083794c065be03924
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> Change the naming convention we use when determining TUNE_RISCV_PKGARCH,
> so that we have the option of relying on a known RISC-V profile name
> (e.g. 'rva22u64') as a baseline, rather than always specifying the full
> ISA extension set. An example from 'bitbake -e opensbi' with
> 'DEFAULTTUNE =3D "rva22u64" in conf/local.conf:
>
> |TUNE_RISCV_PKGARCH=3D"rva22u64"
> |# $TUNE_RISCV_PKGARCH_EXACT [48 operations]
>
> |TUNE_RISCV_PKGARCH_EXACT=3D"riscv64imafdc_zic64b_zicbom_zicbop_zicboz_zi=
ccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_z=
alrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt"
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../conf/machine/include/riscv/arch-riscv.inc | 118 +++++++++---------
>  1 file changed, 62 insertions(+), 56 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> index e60b88fe44..b0c2460f26 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -32,7 +32,7 @@ TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURE=
S",
> "64", "lp64", "", d)}"
>
>  # The package arch starts with the canonical arch, but adds some
> extensions to make
>  # package compatibility clear
> -TUNE_RISCV_PKGARCH =3D "${TUNE_RISCV_ARCH}"
> +TUNE_RISCV_PKGARCH_EXACT =3D "${TUNE_RISCV_ARCH}"
>
>  # i, e, or g are defined by gcc, but 'g' refers to 'i' + extensions 'MAF=
D
> Zicsr Zifencei'
>  # So 'g' will not be defined here as it is an abbreviation of the
> expanded version
> @@ -40,231 +40,237 @@ TUNEVALID[e] =3D "Reduced register base integer
> extension"
>  TUNECONFLICTS[e] =3D "i"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "e", "e", "=
",
> d)}"
>  TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURES", "e", "e", "",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "e", "e",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "e"=
,
> "e", "", d)}"
>
>  TUNEVALID[i] =3D "Base integer extension"
>  TUNECONFLICTS[i] =3D "e"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "i", "i", "=
",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "i", "i",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "i"=
,
> "i", "", d)}"
>
>  # Extensions
>  TUNEVALID[m] =3D "Integer multiplication and division extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m", "m", "=
",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m", "m",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "m"=
,
> "m", "", d)}"
>
>  TUNEVALID[a] =3D "Atomic extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a", "a", "=
",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a", "a",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "a"=
,
> "a", "", d)}"
>
>  TUNEVALID[f] =3D "Single-precision floating-point extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "f d",
> "f", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "f d"=
,
> "f", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",=
 "f
> d", "f", "", d)}"
>
>  TUNEVALID[d] =3D "Double-precision floating-point extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "d", "d", "=
",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "d", "d",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "d"=
,
> "d", "", d)}"
>
>  # Only f OR d, but just one
>  TUNE_RISCV_ABI .=3D "${@bb.utils.contains("TUNE_FEATURES", "d", "d",
> bb.utils.contains("TUNE_FEATURES", "f", "f", "", d), d)}"
>
>  TUNEVALID[c] =3D "Compressed extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c", "c", "=
",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c", "c",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "c"=
,
> "c", "", d)}"
>
>  TUNEVALID[b] =3D "Bit Manipulation extension"
>  # Handled below via zba, zbb, zbs
>  # This matches current Linux kernel behavior
>  #TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "b", "b", =
"",
> d)}"
> -#TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "b", "b"=
,
> "", d)}"
> +#TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "b=
",
> "b", "", d)}"
>
>  TUNEVALID[v] =3D "Vector operations extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "=
",
> d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "v", "v",
> "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "v"=
,
> "v", "", d)}"
>
>  # Now the special Z extensions
>  TUNEVALID[zic64b] =3D "Cache block size is 64 bytes extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b=
",
> "_zic64b", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zic64b", "_zic64b", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zic64b", "_zic64b", "", d)}"
>
>  TUNEVALID[zicbom] =3D "Cache-block management extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom=
",
> "_zicbom", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbom", "_zicbom", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbom", "_zicbom", "", d)}"
>
>  TUNEVALID[zicbop] =3D "Cache-block prefetching extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop=
",
> "_zicbop", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbop", "_zicbop", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbop", "_zicbop", "", d)}"
>
>  TUNEVALID[zicboz] =3D "Cache-block zeroing extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz=
",
> "_zicboz", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicboz", "_zicboz", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicboz", "_zicboz", "", d)}"
>
>  TUNEVALID[ziccamoa] =3D "PMA guarantees for A-extension atomics extensio=
n."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa",
> "_ziccamoa", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa=
",
> "_ziccamoa", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "ziccamoa", "_ziccamoa", "", d)}"
>
>  TUNEVALID[ziccif] =3D "Patching instructions at run time extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccif",
> "_ziccif", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccif",
> "_ziccif", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "ziccif", "_ziccif", "", d)}"
>
>  TUNEVALID[zicclsm] =3D "Software that assumes misaligned access works
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicclsm",
> "_zicclsm", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicclsm"=
,
> "_zicclsm", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zicclsm", "_zicclsm", "", d)}"
>
>  TUNEVALID[ziccrse] =3D "Guarantees LR/SC forward progress extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccrse",
> "_ziccrse", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccrse"=
,
> "_ziccrse", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "ziccrse", "_ziccrse", "", d)}"
>
>  TUNEVALID[zicntr] =3D "Cycle and instruction counting for profiling
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicntr",
> "_zicntr", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicntr",
> "_zicntr", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zicntr", "_zicntr", "", d)}"
>
>  TUNEVALID[zicond] =3D "Conditional zeroing operations extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicond",
> "_zicond", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicond",
> "_zicond", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zicond", "_zicond", "", d)}"
>
>  TUNEVALID[zicsr] =3D "Control and status register access extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr =
f
> d", "_zicsr", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zics=
r f
> d", "_zicsr", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicsr f d", "_zicsr", "", d)}"
>
>  TUNEVALID[zifencei] =3D "Instruction-fetch fence extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei",
> "_zifencei", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei=
",
> "_zifencei", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zifencei", "_zifencei", "", d)}"
>
>  TUNEVALID[zihintntl] =3D "Non-temporal locality hints extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintntl"=
,
> "_zihintntl", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintnt=
l",
> "_zihintntl", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zihintntl", "_zihintntl", "", d)}"
>
>  TUNEVALID[zihintpause] =3D "Pause hint extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintpaus=
e",
> "_zihintpause", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zihintpause", "_zihintpause", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zihintpause", "_zihintpause", "", d)}"
>
>  TUNEVALID[zihpm] =3D "Hardware performance counters extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihpm",
> "_zihpm", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihpm",
> "_zihpm", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zihpm", "_zihpm", "", d)}"
>
>  TUNEVALID[zimop] =3D "Hardware performance counters extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zimop",
> "_zimop", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zimop",
> "_zimop", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zimop", "_zimop", "", d)}"
>
>  TUNEVALID[zmmul] =3D "Cheaper M subset (mul only) extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul",
> "_zmmul", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul"=
,
> "_zmmul", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "m
> zmmul", "_zmmul", "", d)}"
>
>  TUNEVALID[za64rs] =3D "Reservation set size of at most 64 bytes extensio=
n."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za64rs",
> "_za64rs", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za64rs",
> "_za64rs", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "za64rs", "_za64rs", "", d)}"
>

za64rs is placed before za128rs see below, but canonical order within the
Za group is alphabetical (za128rs then za64rs).


>
>  TUNEVALID[za128rs] =3D "Reservation set granularity (128-byte) extension=
."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za128rs",
> "_za128rs", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za128rs"=
,
> "_za128rs", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "za128rs", "_za128rs", "", d)}"
>
>  TUNEVALID[zaamo] =3D "Atomic read-modify-write memory operations extensi=
on."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zaamo",
> "_zaamo", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zaamo"=
,
> "_zaamo", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "a
> zaamo", "_zaamo", "", d)}"
>
>  TUNEVALID[zalrsc] =3D "Extended LR/SC semantics extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc",
> "_zalrsc", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc=
",
> "_zalrsc", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "a
> zalrsc", "_zalrsc", "", d)}"
>
>  TUNEVALID[zawrs] =3D "Wait-on-reservation-set instructions extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zawrs",
> "_zawrs", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zawrs",
> "_zawrs", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zawrs", "_zawrs", "", d)}"
>
>  TUNEVALID[zfa] =3D "Additional floating point instructions extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zf=
a",
> "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfa",
> "_zfa", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "zf=
a",
> "_zfa", "", d)}"
>
>  TUNEVALID[zfhmin] =3D "Minimal half-precision floating point extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfhmin",
> "_zfhmin", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfhmin",
> "_zfhmin", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zfhmin", "_zfhmin", "", d)}"
>
>  TUNEVALID[zca] =3D "Compressed base integer ops extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "c
> zca", "_zca", "", d)}"
>
>  TUNEVALID[zcb] =3D "Extra compressed integer ops extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zc=
b",
> "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcb",
> "_zcb", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "zc=
b",
> "_zcb", "", d)}"
>
>  TUNEVALID[zcd] =3D "16-bit encodings for 64-bit FP extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zc=
d",
> "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcd",
> "_zcd", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES", "zc=
d",
> "_zcd", "", d)}"
>
>  TUNEVALID[zcmop] =3D "Compressed may-be-ops extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcmop",
> "_zcmop", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcmop",
> "_zcmop", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zcmop", "_zcmop", "", d)}"
>
>  TUNEVALID[zba] =3D "Address bit manipulation extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zba"=
,
> "_zba", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zb=
a",
> "_zba", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",=
 "b
> zba", "_zba", "", d)}"
>
>  TUNEVALID[zbb] =3D "Basic bit manipulation extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zbb"=
,
> "_zbb", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zb=
b",
> "_zbb", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",=
 "b
> zbb", "_zbb", "", d)}"
>
>  TUNEVALID[zbc] =3D "Carry-less multiplication extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zbc",
> "_zbc", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zbc"=
,
> "_zbc", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zbc", "_zbc", "", d)}"
>
>  TUNEVALID[zbs] =3D "Single-bit manipulation extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs"=
,
> "_zbs", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zb=
s",
> "_zbs", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",=
 "b
> zbs", "_zbs", "", d)}"
>
>  TUNEVALID[zkt] =3D "Data-independent execution latency extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt"=
,
> "_zkt", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zk=
t",
> "_zkt", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",=
 "b
> zkt", "_zkt", "", d)}"
>
>  TUNEVALID[zvbb] =3D "Vector basic bit-manipulation extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb",
> "_zvbb", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb=
",
> "_zvbb", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvbb", "_zvbb", "", d)}"
>
>  TUNEVALID[zve32f] =3D "Embedded vector computation (32-bit integer, 32-b=
it
> FP) extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f=
",
> "_zve32f", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve32f", "_zve32f", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve32f", "_zve32f", "", d)}"
>
>  TUNEVALID[zve32x] =3D "Embedded vector computation (32-bit integer)
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x=
",
> "_zve32x", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve32x", "_zve32x", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve32x", "_zve32x", "", d)}"
>
>  TUNEVALID[zve64d] =3D "Embedded vector computation (64-bit integer, 64-b=
it
> FP) extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d=
",
> "_zve64d", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64d", "_zve64d", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64d", "_zve64d", "", d)}"
>
>  TUNEVALID[zve64f] =3D "Embedded vector computation (64-bit integer, 32-b=
it
> FP) extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f=
",
> "_zve64f", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64f", "_zve64f", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64f", "_zve64f", "", d)}"
>
>  TUNEVALID[zve64x] =3D "Embedded vector computation (64-bit integer)
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x=
",
> "_zve64x", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64x", "_zve64x", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zve64x", "_zve64x", "", d)}"
>
>  TUNEVALID[zvfhmin] =3D "Vector half-precision minimal extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmi=
n",
> "_zvfhmin", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvfhmin", "_zvfhmin", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvfhmin", "_zvfhmin", "", d)}"
>
>  TUNEVALID[zvkb] =3D "Vector cryptography bit-manipulation extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb",
> "_zvkb", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb=
",
> "_zvkb", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvkb", "_zvkb", "", d)}"
>
>  TUNEVALID[zvkt] =3D "Vector data independent execution latency extension=
."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt",
> "_zvkt", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt=
",
> "_zvkt", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvkt", "_zvkt", "", d)}"
>
>  TUNEVALID[zvl128b] =3D "Minimum vector length standard extensions
> (128-bit)."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128=
b",
> "_zvl128b", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl128b", "_zvl128b", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl128b", "_zvl128b", "", d)}"
>
>  TUNEVALID[zvl32b] =3D "Minimum vector length standard extensions (32-bit=
)."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b=
",
> "_zvl32b", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl32b", "_zvl32b", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl32b", "_zvl32b", "", d)}"
>
>  TUNEVALID[zvl64b] =3D "Minimum vector length standard extensions (64-bit=
)."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b=
",
> "_zvl64b", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl64b", "_zvl64b", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zvl64b", "_zvl64b", "", d)}"
>
>  TUNEVALID[supm] =3D "User-mode pointer masking extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "supm",
> "_supm", "", d)}"
> -TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "supm=
",
> "_supm", "", d)}"
> +TUNE_RISCV_PKGARCH_EXACT .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "supm", "_supm", "", d)}"
> +
> +# Prefer a known RVA profile name (e.g. "rva22u64"), plus any extensions
> on
> +# top of the profile (e.g. "rva22u64_zvbb"), over the fully expanded exa=
ct
> +# extension list, when TUNE_FEATURES clearly matches a profile. Falls ba=
ck
> +# to TUNE_RISCV_PKGARCH_EXACT for combinations that don't match a profil=
e.
> +TUNE_RISCV_PKGARCH =3D "${@oe.tune.riscv_pkgarch(d.getVar('TUNE_FEATURES=
'),
> d.getVar('TUNE_RISCV_PKGARCH_EXACT'))}"
>
>  # Construct TUNE_CCARGS
>  # This should result in a CCARG similar to:
> --
> 2.55.0
>
>

--00000000000083794c065be03924
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:03=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Change the naming convention we use when d=
etermining TUNE_RISCV_PKGARCH,<br>
so that we have the option of relying on a known RISC-V profile name<br>
(e.g. &#39;rva22u64&#39;) as a baseline, rather than always specifying the =
full<br>
ISA extension set. An example from &#39;bitbake -e opensbi&#39; with<br>
&#39;DEFAULTTUNE =3D &quot;rva22u64&quot; in conf/local.conf:<br>
<br>
|TUNE_RISCV_PKGARCH=3D&quot;rva22u64&quot;<br>
|# $TUNE_RISCV_PKGARCH_EXACT [48 operations]<br>
|TUNE_RISCV_PKGARCH_EXACT=3D&quot;riscv64imafdc_zic64b_zicbom_zicbop_zicboz=
_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaam=
o_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt&quot;<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../conf/machine/include/riscv/arch-riscv.inc | 118 +++++++++--------=
-<br>
=C2=A01 file changed, 62 insertions(+), 56 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/mac=
hine/include/riscv/arch-riscv.inc<br>
index e60b88fe44..b0c2460f26 100644<br>
--- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
@@ -32,7 +32,7 @@ TUNE_RISCV_ABI .=3D &quot;${@bb.utils.contains(&quot;TUNE=
_FEATURES&quot;, &quot;64&quot;, &quot;lp64&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0# The package arch starts with the canonical arch, but adds some exte=
nsions to make<br>
=C2=A0# package compatibility clear<br>
-TUNE_RISCV_PKGARCH =3D &quot;${TUNE_RISCV_ARCH}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT =3D &quot;${TUNE_RISCV_ARCH}&quot;<br>
<br>
=C2=A0# i, e, or g are defined by gcc, but &#39;g&#39; refers to &#39;i&#39=
; + extensions &#39;MAFD Zicsr Zifencei&#39;<br>
=C2=A0# So &#39;g&#39; will not be defined here as it is an abbreviation of=
 the expanded version<br>
@@ -40,231 +40,237 @@ TUNEVALID[e] =3D &quot;Reduced register base integer =
extension&quot;<br>
=C2=A0TUNECONFLICTS[e] =3D &quot;i&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;e&quot;, &quot;e&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_ABI .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&qu=
ot;, &quot;e&quot;, &quot;e&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;e&quot;, &quot;e&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;e&quot;, &quot;e&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[i] =3D &quot;Base integer extension&quot;<br>
=C2=A0TUNECONFLICTS[i] =3D &quot;e&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;i&quot;, &quot;i&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;i&quot;, &quot;i&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;i&quot;, &quot;i&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0# Extensions<br>
=C2=A0TUNEVALID[m] =3D &quot;Integer multiplication and division extension&=
quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;m&quot;, &quot;m&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;m&quot;, &quot;m&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;m&quot;, &quot;m&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[a] =3D &quot;Atomic extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;a&quot;, &quot;a&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;a&quot;, &quot;a&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;a&quot;, &quot;a&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[f] =3D &quot;Single-precision floating-point extension&quot=
;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;f d&quot;, &quot;f&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;f d&quot;, &quot;f&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;f d&quot;, &quot;f&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[d] =3D &quot;Double-precision floating-point extension&quot=
;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;d&quot;, &quot;d&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;d&quot;, &quot;d&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;d&quot;, &quot;d&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0# Only f OR d, but just one<br>
=C2=A0TUNE_RISCV_ABI .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&qu=
ot;, &quot;d&quot;, &quot;d&quot;, bb.utils.contains(&quot;TUNE_FEATURES&qu=
ot;, &quot;f&quot;, &quot;f&quot;, &quot;&quot;, d), d)}&quot;<br>
<br>
=C2=A0TUNEVALID[c] =3D &quot;Compressed extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;c&quot;, &quot;c&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;c&quot;, &quot;c&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;c&quot;, &quot;c&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[b] =3D &quot;Bit Manipulation extension&quot;<br>
=C2=A0# Handled below via zba, zbb, zbs<br>
=C2=A0# This matches current Linux kernel behavior<br>
=C2=A0#TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES=
&quot;, &quot;b&quot;, &quot;b&quot;, &quot;&quot;, d)}&quot;<br>
-#TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&qu=
ot;, &quot;b&quot;, &quot;b&quot;, &quot;&quot;, d)}&quot;<br>
+#TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATU=
RES&quot;, &quot;b&quot;, &quot;b&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[v] =3D &quot;Vector operations extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;v&quot;, &quot;v&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;v&quot;, &quot;v&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;v&quot;, &quot;v&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0# Now the special Z extensions<br>
=C2=A0TUNEVALID[zic64b] =3D &quot;Cache block size is 64 bytes extension.&q=
uot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zic64b&quot;, &quot;_zic64b&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zic64b&quot;, &quot;_zic64b&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zic64b&quot;, &quot;_zic64b&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zicbom] =3D &quot;Cache-block management extension&quot;<br=
>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zicbop] =3D &quot;Cache-block prefetching extension.&quot;<=
br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicbop&quot;, &quot;_zicbop&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zicbop&quot;, &quot;_zicbop&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zicbop&quot;, &quot;_zicbop&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zicboz] =3D &quot;Cache-block zeroing extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicboz&quot;, &quot;_zicboz&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zicboz&quot;, &quot;_zicboz&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zicboz&quot;, &quot;_zicboz&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[ziccamoa] =3D &quot;PMA guarantees for A-extension atomics =
extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[ziccif] =3D &quot;Patching instructions at run time extensi=
on.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;ziccif&quot;, &quot;_ziccif&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;ziccif&quot;, &quot;_ziccif&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;ziccif&quot;, &quot;_ziccif&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zicclsm] =3D &quot;Software that assumes misaligned access =
works extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zicclsm&quot;, &quot;_zicclsm&quot;, &quot;&quot;, d)}&quot;<b=
r>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zicclsm&quot;, &quot;_zicclsm&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zicclsm&quot;, &quot;_zicclsm&quot;, &quot;&quot;, d)}&quot=
;<br>
<br>
=C2=A0TUNEVALID[ziccrse] =3D &quot;Guarantees LR/SC forward progress extens=
ion.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;ziccrse&quot;, &quot;_ziccrse&quot;, &quot;&quot;, d)}&quot;<b=
r>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;ziccrse&quot;, &quot;_ziccrse&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;ziccrse&quot;, &quot;_ziccrse&quot;, &quot;&quot;, d)}&quot=
;<br>
<br>
=C2=A0TUNEVALID[zicntr] =3D &quot;Cycle and instruction counting for profil=
ing extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zicond] =3D &quot;Conditional zeroing operations extension.=
&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zicond&quot;, &quot;_zicond&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zicond&quot;, &quot;_zicond&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zicond&quot;, &quot;_zicond&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zicsr] =3D &quot;Control and status register access extensi=
on&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&quo=
t;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&quot;<=
br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&=
quot;<br>
<br>
=C2=A0TUNEVALID[zifencei] =3D &quot;Instruction-fetch fence extension.&quot=
;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zihintntl] =3D &quot;Non-temporal locality hints extension.=
&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zihintntl&quot;, &quot;_zihintntl&quot;, &quot;&quot;, d)}&quo=
t;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zihintntl&quot;, &quot;_zihintntl&quot;, &quot;&quot;, d)}&quot;<=
br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zihintntl&quot;, &quot;_zihintntl&quot;, &quot;&quot;, d)}&=
quot;<br>
<br>
=C2=A0TUNEVALID[zihintpause] =3D &quot;Pause hint extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, d)}=
&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, d)}&qu=
ot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, =
d)}&quot;<br>
<br>
=C2=A0TUNEVALID[zihpm] =3D &quot;Hardware performance counters extension.&q=
uot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zihpm&quot;, &quot;_zihpm&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zihpm&quot;, &quot;_zihpm&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zihpm&quot;, &quot;_zihpm&quot;, &quot;&quot;, d)}&quot;<br=
>
<br>
=C2=A0TUNEVALID[zimop] =3D &quot;Hardware performance counters extension.&q=
uot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zimop&quot;, &quot;_zimop&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zimop&quot;, &quot;_zimop&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zimop&quot;, &quot;_zimop&quot;, &quot;&quot;, d)}&quot;<br=
>
<br>
=C2=A0TUNEVALID[zmmul] =3D &quot;Cheaper M subset (mul only) extension.&quo=
t;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[za64rs] =3D &quot;Reservation set size of at most 64 bytes =
extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;za64rs&quot;, &quot;_za64rs&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;za64rs&quot;, &quot;_za64rs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;za64rs&quot;, &quot;_za64rs&quot;, &quot;&quot;, d)}&quot;<=
br></blockquote><div><br></div><div>za64rs is placed before za128rs see bel=
ow, but canonical order within the Za group is alphabetical (za128rs then z=
a64rs).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
=C2=A0TUNEVALID[za128rs] =3D &quot;Reservation set granularity (128-byte) e=
xtension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot;<b=
r>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot=
;<br>
<br>
=C2=A0TUNEVALID[zaamo] =3D &quot;Atomic read-modify-write memory operations=
 extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;a zaamo&quot;, &quot;_zaamo&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;a zaamo&quot;, &quot;_zaamo&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;a zaamo&quot;, &quot;_zaamo&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zalrsc] =3D &quot;Extended LR/SC semantics extension.&quot;=
<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;<b=
r>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot=
;<br>
<br>
=C2=A0TUNEVALID[zawrs] =3D &quot;Wait-on-reservation-set instructions exten=
sion.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zawrs&quot;, &quot;_zawrs&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zawrs&quot;, &quot;_zawrs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zawrs&quot;, &quot;_zawrs&quot;, &quot;&quot;, d)}&quot;<br=
>
<br>
=C2=A0TUNEVALID[zfa] =3D &quot;Additional floating point instructions exten=
sion.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zfa&quot;, &quot;_zfa&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zfa&quot;, &quot;_zfa&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zfa&quot;, &quot;_zfa&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[zfhmin] =3D &quot;Minimal half-precision floating point ext=
ension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zca] =3D &quot;Compressed base integer ops extension.&quot;=
<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[zcb] =3D &quot;Extra compressed integer ops extension.&quot=
;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zcb&quot;, &quot;_zcb&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zcb&quot;, &quot;_zcb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zcb&quot;, &quot;_zcb&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[zcd] =3D &quot;16-bit encodings for 64-bit FP extension.&qu=
ot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0TUNEVALID[zcmop] =3D &quot;Compressed may-be-ops extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zcmop&quot;, &quot;_zcmop&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zcmop&quot;, &quot;_zcmop&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATUR=
ES&quot;, &quot;zcmop&quot;, &quot;_zcmop&quot;, &quot;&quot;, d)}&quot;<br=
>
<br>
=C2=A0TUNEVALID[zba] =3D &quot;Address bit manipulation extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zbb] =3D &quot;Basic bit manipulation extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zbb&quot;, &quot;_zbb&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;b zbb&quot;, &quot;_zbb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;b zbb&quot;, &quot;_zbb&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zbc] =3D &quot;Carry-less multiplication extension&quot;<br=
>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zbc&quot;, &quot;_zbc&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zbc&quot;, &quot;_zbc&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zbc&quot;, &quot;_zbc&quot;, &quot;&quot;, d)}&quot;<br=
>
<br>
=C2=A0TUNEVALID[zbs] =3D &quot;Single-bit manipulation extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zbs&quot;, &quot;_zbs&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;b zbs&quot;, &quot;_zbs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;b zbs&quot;, &quot;_zbs&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zkt] =3D &quot;Data-independent execution latency extension=
.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zvbb] =3D &quot;Vector basic bit-manipulation extension.&qu=
ot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvbb&quot;, &quot;_zvbb&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvbb&quot;, &quot;_zvbb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvbb&quot;, &quot;_zvbb&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zve32f] =3D &quot;Embedded vector computation (32-bit integ=
er, 32-bit FP) extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zve32f&quot;, &quot;_zve32f&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve32f&quot;, &quot;_zve32f&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zve32f&quot;, &quot;_zve32f&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zve32x] =3D &quot;Embedded vector computation (32-bit integ=
er) extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zve32x&quot;, &quot;_zve32x&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve32x&quot;, &quot;_zve32x&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zve32x&quot;, &quot;_zve32x&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zve64d] =3D &quot;Embedded vector computation (64-bit integ=
er, 64-bit FP) extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zve64d&quot;, &quot;_zve64d&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve64d&quot;, &quot;_zve64d&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zve64d&quot;, &quot;_zve64d&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zve64f] =3D &quot;Embedded vector computation (64-bit integ=
er, 32-bit FP) extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zve64f&quot;, &quot;_zve64f&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve64f&quot;, &quot;_zve64f&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zve64f&quot;, &quot;_zve64f&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zve64x] =3D &quot;Embedded vector computation (64-bit integ=
er) extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zve64x&quot;, &quot;_zve64x&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zve64x&quot;, &quot;_zve64x&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zve64x&quot;, &quot;_zve64x&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zvfhmin] =3D &quot;Vector half-precision minimal extension.=
&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvfhmin&quot;, &quot;_zvfhmin&quot;, &quot;&quot;, d)}&quo=
t;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvfhmin&quot;, &quot;_zvfhmin&quot;, &quot;&quot;, d)}&quot;<=
br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvfhmin&quot;, &quot;_zvfhmin&quot;, &quot;&quot;, d)}&=
quot;<br>
<br>
=C2=A0TUNEVALID[zvkb] =3D &quot;Vector cryptography bit-manipulation extens=
ion.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvkb&quot;, &quot;_zvkb&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvkb&quot;, &quot;_zvkb&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvkb&quot;, &quot;_zvkb&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zvkt] =3D &quot;Vector data independent execution latency e=
xtension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvkt&quot;, &quot;_zvkt&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvkt&quot;, &quot;_zvkt&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvkt&quot;, &quot;_zvkt&quot;, &quot;&quot;, d)}&quot;<=
br>
<br>
=C2=A0TUNEVALID[zvl128b] =3D &quot;Minimum vector length standard extension=
s (128-bit).&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvl128b&quot;, &quot;_zvl128b&quot;, &quot;&quot;, d)}&quo=
t;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvl128b&quot;, &quot;_zvl128b&quot;, &quot;&quot;, d)}&quot;<=
br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvl128b&quot;, &quot;_zvl128b&quot;, &quot;&quot;, d)}&=
quot;<br>
<br>
=C2=A0TUNEVALID[zvl32b] =3D &quot;Minimum vector length standard extensions=
 (32-bit).&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvl32b&quot;, &quot;_zvl32b&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvl32b&quot;, &quot;_zvl32b&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvl32b&quot;, &quot;_zvl32b&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[zvl64b] =3D &quot;Minimum vector length standard extensions=
 (64-bit).&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zvl64b&quot;, &quot;_zvl64b&quot;, &quot;&quot;, d)}&quot;=
<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zvl64b&quot;, &quot;_zvl64b&quot;, &quot;&quot;, d)}&quot;<br=
>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;zvl64b&quot;, &quot;_zvl64b&quot;, &quot;&quot;, d)}&qu=
ot;<br>
<br>
=C2=A0TUNEVALID[supm] =3D &quot;User-mode pointer masking extension.&quot;<=
br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;supm&quot;, &quot;_supm&quot;, &quot;&quot;, d)}&quot;<br>
-TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;supm&quot;, &quot;_supm&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH_EXACT .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FE=
ATURES&quot;, &quot;supm&quot;, &quot;_supm&quot;, &quot;&quot;, d)}&quot;<=
br>
+<br>
+# Prefer a known RVA profile name (e.g. &quot;rva22u64&quot;), plus any ex=
tensions on<br>
+# top of the profile (e.g. &quot;rva22u64_zvbb&quot;), over the fully expa=
nded exact<br>
+# extension list, when TUNE_FEATURES clearly matches a profile. Falls back=
<br>
+# to TUNE_RISCV_PKGARCH_EXACT for combinations that don&#39;t match a prof=
ile.<br>
+TUNE_RISCV_PKGARCH =3D &quot;${@oe.tune.riscv_pkgarch(d.getVar(&#39;TUNE_F=
EATURES&#39;), d.getVar(&#39;TUNE_RISCV_PKGARCH_EXACT&#39;))}&quot;<br>
<br>
=C2=A0# Construct TUNE_CCARGS<br>
=C2=A0# This should result in a CCARG similar to:<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--00000000000083794c065be03924--

