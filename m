Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.1276.1623344383808383201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 09:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g8Q8DsuV;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id p7so4346218lfg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyQ/PcyzSuqQY+BM1Qi2g6VvXjFm0oYCS47DPS3fyOc=;
        b=g8Q8DsuV959luLnWV+cyZIObCxOPyLdrAV4Gd1ikTHLpohMA5Ft9Pj4RGM4AyO5J8W
         1RaED00/W84RfWhb3Az9v0tLj4flJ34JV9YwyBuzddrOmbs2b+Ku8Wmy0NnJFlmdNajg
         yJwmElA1KdHH9T3stPsDKHRzwYQIhyQQqzLTmXZm3W29uaJcZrzLgESCF/eOCJJK0S95
         Wp9d053bSnhdVNaEFsLt0UXDAuDj5KVaa3fkZp9UZQQTqvkkPILQqZt3W1eHdfIMQzRt
         dzWG8JBWrJBAjzCNOihTtQbkEu8E4/o8iwyb2EOSF5/jO/SULhnA8Fq3oxg1Nc/f4Aaz
         Q4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyQ/PcyzSuqQY+BM1Qi2g6VvXjFm0oYCS47DPS3fyOc=;
        b=mdc3/G76EwIMPLew7/LRRNe+6eGEdpMvsw3gWPZq5NWPPge/rkcCmjrgD/PmpT0IbP
         sFaCoLySaZTLE7SjkTbCgBWD3JE+2XqMI8y3jv2xo3tkA1YUXkYJhcXw2Hv4wbpyzJIl
         J3zWdX9yaj/GfxlIVAKsl3/adz4QqnvKcFfC8vshmXmnx2nozY5QfRJ4zt09CvvlU/qa
         bf0ju+bcTROs1h5FwbvPCg6RKQ9cl3RcOo9NfwI+pULdTByTxrH1np+jfaxvbO0BeeLn
         a3dO9sdQrGGehqcN29YyGV7qoz7TfCRnmDFljLsHP8KDoR97tTy0kcszVgQMkZnhhEi5
         Rk6Q==
X-Gm-Message-State: AOAM530mtBtrH1dxfLFNQGzZA6WeBZIPFNYfvZ4uE4CEO9A+PLmR5UuH
	9FCCpNlI0GioT2b+nVt+YFdHTcBfUNKN2FSTglE=
X-Google-Smtp-Source: ABdhPJwg6taB0HczHizrJnRbvGocXOToDETj7wwYwG9lGsBrySbNzxXoEU1FwbnOm0pMPAwDwnEP9ZSlyJppXeJa48E=
X-Received: by 2002:a05:6512:3ca6:: with SMTP id h38mr2565007lfv.257.1623344381401;
 Thu, 10 Jun 2021 09:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210609072939.6058-1-changqing.li@windriver.com>
 <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com> <ecdf1fb7-cc74-23ab-3c70-929492d4d178@windriver.com>
In-Reply-To: <ecdf1fb7-cc74-23ab-3c70-929492d4d178@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 10 Jun 2021 09:59:30 -0700
Message-ID: <CAJ86T=UrOhHSKxDV-KWNyyqKTfFr89v-oQvYY2adRAYvpzOvWg@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Changqing Li <changqing.li@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 10, 2021 at 2:42 AM Changqing Li <changqing.li@windriver.com> wrote:
> On 6/10/21 1:29 AM, Andre McCurdy wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Wed, Jun 9, 2021 at 12:32 AM Changqing Li <changqing.li@windriver.com> wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> fix below error:
> >> /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> >> 31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> >>
> >> Neon is not supported by armv5, disable the simd extension build.
> > Drop this comment. Neon may be missing from other ISA levels too (i.e.
> > this fix is not specific to armv5).
> Get it. Thanks.
> >
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> >> index 7f91cc02ac..da21971113 100644
> >> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> >> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> >> @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
> >>   # Work around missing non-floating point ABI support in MIPS
> >>   EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
> >>
> >> +EXTRA_OECMAKE_append_class-target = " ${@ ('') if (d.getVar('TUNE_CCARGS_MFPU') != '') else '-DWITH_SIMD=False'}"
> > Shouldn't this be checking for neon in TUNE_FEATURES rather than
> > TUNE_CCARGS_MFPU?
> Refer feature-arm-vfp.inc:
>
> TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES',
> 'callconvention-hard', 'hard', 'softfp', d) if
> (d.getVar('TUNE_CCARGS_MFPU') != '') else '' }"
>
> TUNE_CCARGS   .= "${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if
> (d.getVar('TUNE_CCARGS_MFLOAT') != '')     else ''}"
>
>
> There are condition that neon is not in TUNE_FEATURES, but vfp is in it.
> so TUNE_CCARGS may append -mfloat-abi=softfp,  then
>
> simd module here can be compiled  sucessfully.

The SIMD code can only be used on targets which support neon. There
may be other cases where the code can be compiled but if it can never
be used at run time it's not very useful.

> > It should also probably be conditional on the _arm
> > over-ride since neon will be missing from
> > TUNE_CCARGS_MFPU/TUNE_FEATURES for other architectures.Since big
> > endian ARM doesn't use the _arm over-ride you will also need a
> > duplicate line with the same logic with the _armeb override too. See
> > the lines below which do the equivalent for _powerpc / _powerpc64 as a
> > reference.
> ok. thanks.
>
> >
> >>   # Provide a workaround if Altivec unit is not present in PPC
> >>   EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
> >>   EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
> >> --
> >> 2.17.1
> >>
> >>
> >> 
> >>
