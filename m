Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.47841.1629247241890783247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 17:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sVPGg49+;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 22so1092914qkg.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 17:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B9EYttQSpk2usQaMGE60HaaX0rAJYCglebrkvl6xOrI=;
        b=sVPGg49+yUAv48mf//9Nyy7GCWEJuWDQS2mdcBKy9HrISdNZNZSMUCK65TKJ6yLxmc
         vS6+3rkYs7ZwtWIOr5xldzU6c9Jq3fJx1WbmAl6S9s4eF9VzTTCTl0BrcF5n5CAMXlDm
         x39uvhoyph5Dl4iTX720zp2QFk6kVR4KSHFJxWnzlX09uYi+F/8n7TaLP9BXr6V/SQgn
         txL6K07H+BYqUSauoN9bNgGGDJGz+qc2R8cgrIPeAc8ERldQrR3RPMLT2kQ7MthDn71h
         MhPhLBJkDHnYh1o0tp4kO7/kCTsFaJnnPvxsxudomauTuEvX6eErQ5KaV40WEm2t1P5a
         7Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B9EYttQSpk2usQaMGE60HaaX0rAJYCglebrkvl6xOrI=;
        b=DtEwyM14oMtXmewoVyQiZ5rXzqLa8qx1RPOx27mqpNr9X1eSPebwwXow/ywkgnYtht
         pygyCpbUcgtmeImFwk8/P2K1Tz+j5sRtXBL+2t+e0LOH4hwH/lxO1QSL4WDfcY2ff1ZC
         mXNgivM9eOMUiorMMINxipbcwCUpPFpTNFXGJufbJGPMkIML15yYi2G/yVUfLt95IHDf
         VDyRIJf6ltzLd3bdeDw8tgpRXRErLktXLuyzzt4yp1zDX3345TUB1yvSVuySveXJs1gH
         4ZidgLmNRiEdx0jjTsPE40Tj06kKkXcn6oC9eODTvsKk5sSqRhyWmuqyze0ORGSh4Tak
         g58g==
X-Gm-Message-State: AOAM530OliPLIv0ldhB8jCmljK2cAjbEk5KeBdtm3p7WE922ttrW+ieV
	J7s3rE/Mq89YYVejf52OzN0sAvIcSdfEQpJhuoE=
X-Google-Smtp-Source: ABdhPJw7mKLlWvLLERyRbBLBiFPeQYB1FPFXB3hREoeQdTffm1AbKLpWjnFtD4QOcHq9o2vk+QjBfscnEuejwekxpKA=
X-Received: by 2002:a05:620a:319a:: with SMTP id bi26mr6701014qkb.119.1629247240802;
 Tue, 17 Aug 2021 17:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210817222919.2170420-1-ross.burton@arm.com> <CAMKF1sp83v6TkKLAAMdDExij9ZceOaCGpSrp=cLPJEkQUCB-pQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp83v6TkKLAAMdDExij9ZceOaCGpSrp=cLPJEkQUCB-pQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Aug 2021 17:40:15 -0700
Message-ID: <CAMKF1soAhzSgaYfuJarzoj6VEkAwcm1+51ymGprGwB=Sn53XZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: package the stub .a libaries into glibc-dev
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

hmm I am seeing pseudo build failures on master-next on all arches see
[1].  I wonder if this is related

https://errors.yoctoproject.org/Errors/Details/601473/

On Tue, Aug 17, 2021 at 4:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 17, 2021 at 3:29 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > In glibc 2.34, the libraries libpthread, libdl, libutil, libanl have
> > been integrated into libc. To retain compatibility with old binaries the
> > shared libaries are still shipped but are empty, and to keep software
> > building there are empty static libraries.
> >
> > However, these static libraries get packaged into glibc-staticdev (as
> > they should be), but by this design they should be in glibc-dev.
> >
> > https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
> >
>
> this patch is ok.
>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/glibc/glibc-package.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> > index 3026aec9b6f..56fbf8b08ce 100644
> > --- a/meta/recipes-core/glibc/glibc-package.inc
> > +++ b/meta/recipes-core/glibc/glibc-package.inc
> > @@ -22,6 +22,7 @@ ARCH_DYNAMIC_LOADER = ""
> >  ARCH_DYNAMIC_LOADER:aarch64 = "ld-linux-${TARGET_ARCH}.so.1"
> >  libc_baselibs:append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
> >  INSANE_SKIP:${PN}:append:aarch64 = " libdir"
> > +INSANE_SKIP:${PN}-dev += "staticdev"
> >
> >  FILES:${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
> >  RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
> > @@ -38,7 +39,7 @@ FILES:sln = "${base_sbindir}/sln"
> >  FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
> >  FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
> >  FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
> > -FILES:${PN}-dev += "${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
> > +FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
> >  RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
> >  FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
> >  FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
> > --
> > 2.32.0
> >
> >
> > 
> >
