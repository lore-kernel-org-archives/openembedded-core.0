Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.3563.1617659920442728268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 14:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P2PSz0aP;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id f12so9734592qtq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sgur4Y3+k0g6tuM01quFqgxqcKbdwaJVflJ0QIVo9NI=;
        b=P2PSz0aPb52cpR1S6BWMUHezcO8/Sc36EGxzBTMi47HjjVE+YU9aQ/CREtNy/pabIE
         R19LESfic8KP2mIRNg7wmeDRgJyXXx5nvh42162Ou5H7ktRsDdTUfDYMPGyJnpxSXsT+
         9zbUbrWy/+1funzQONP9kloSWzqGrt7TY4snAymLzUoUyh5DGIEIJAxb+8tlif79CqJ3
         xNkSDAHnuM/t9wZDiym6NmahJ9KWBZRUm7UEH+aETvSimApZv7reYs78lS88/rDOB7Kk
         aWzd3RfxBqDjn3kH3Nm2NnoyGL+V1ySY98JBywwXvOgxnCaGdrLqFDdCgdpW8ujeqHRd
         rcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgur4Y3+k0g6tuM01quFqgxqcKbdwaJVflJ0QIVo9NI=;
        b=bF+n7vSdxe2sl4GL9vqGHCqGjw1IIEo6fmP8pdwDIebFk2AKYPZgsVE1bz70YJQWBB
         FwgOk9HBtCE15ynUb1mFE1XV3e7x8uO0bjkeH/qW/ygSsAP9g9cgOLPuadym+d8absbS
         AHMc5kDDEVU0dWhSKru1saSoFme/hLMkcC/cP9HgeMHmS/15Yyf9LecoB8Xc6LydqODa
         u3SeIGjSjWMe1CEH4HzPB3TxQC0dGfkE2sfZgmvL1LD9kFGNlcgaqR6LPNLj2kqB2GhH
         v4TdFJMf4ejqYIE7jJi93NvyDu1g0NZC/eawHRMNhNPlbMTwQJN7+GM/pf1l6SOEpAya
         Wl6A==
X-Gm-Message-State: AOAM531HYv7mBdyZBTng5VApjTNdop7npMMVOiimfToHM5rnBjN+iI3+
	YE/DSGCuC8TAJsxZ9UgwUY27DxIQig82xHm802Y=
X-Google-Smtp-Source: ABdhPJyiYnIi24rw5FxIDZn/cf3VUqoghlcTlEbqTdEQ+Dc6Dcy/+ZzA3CXUM9HBrEp1gOceJGRKqdfw52TcpK/++bU=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr24276060qta.289.1617659919534;
 Mon, 05 Apr 2021 14:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
 <1617200547-62088-4-git-send-email-wangmy@fujitsu.com> <CAMKF1so7TnQm5Ei6oyvFZHpGya8nKJAYunqP2Y1wgopR=OowVw@mail.gmail.com>
In-Reply-To: <CAMKF1so7TnQm5Ei6oyvFZHpGya8nKJAYunqP2Y1wgopR=OowVw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 5 Apr 2021 14:58:13 -0700
Message-ID: <CAMKF1sqpB-CUzftKDjH32BZ3GnhMJvYLednKDFSVSSX7su0VMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ell: upgrade 0.38 -> 0.39
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I have sent a patch to fix iwd as well. so we should be good except
that sadly upstream has introduced nested functions in both ell and
iwd, which means we can use clang to compile them anymore :(, I wish
it remained portable as it was. however when you touch ell, iwd is
tied to it, so always see if iwd is ok when ell is upgraded.

On Sun, Apr 4, 2021 at 10:56 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> iwd fails to build with this upgrade, its expecting some bult sources
> from ell and they dont exist. Please take a look
>
> https://errors.yoctoproject.org/Errors/Details/575442/
>
> even 1.13 upgrade fails,
>
> On Wed, Mar 31, 2021 at 7:22 AM wangmy <wangmy@fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)
> >
> > diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
> > similarity index 90%
> > rename from meta/recipes-core/ell/ell_0.38.bb
> > rename to meta/recipes-core/ell/ell_0.39.bb
> > index 7d3a339978..68ec4cb4a4 100644
> > --- a/meta/recipes-core/ell/ell_0.38.bb
> > +++ b/meta/recipes-core/ell/ell_0.39.bb
> > @@ -17,7 +17,7 @@ inherit autotools pkgconfig
> >  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
> >             file://0001-pem.c-do-not-use-rawmemchr.patch \
> >             "
> > -SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
> > +SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
> >
> >  do_configure_prepend () {
> >      mkdir -p ${S}/build-aux
> > --
> > 2.25.1
> >
> >
> > 
> >
