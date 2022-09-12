Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDFAC6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 21:59:39 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.2106.1663019977086473934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 14:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hYiyC5pr;
 spf=pass (domain: gmail.com, ip: 209.85.160.52,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-127f5411b9cso27103555fac.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=giY1/tW0iuZiEVEV6UWlC638keIQvqqS3I6Akp0/NSw=;
        b=hYiyC5prU+0RMUrOX1tkjCjIwECGwfRDQnsGduXAw12DmB7OcxPbQikh20vl/zQsPK
         XwQwKXkzC22z/KO9TCkywzvyJGy6AYlOgocMnPN8z3QKLtJbNBLKqSpCOH800niyQSyp
         x6WDBM33ziQptu4SOAsEg2Zxky7gDtTai/5WreY5YCcQZvkHmvMsH+bsge+NilDb2Kdp
         PcUFcz3Py7KoAzOPw4Fv+nBX7fCXYjySloIdzA2PbDt8OxRIDaaAM1L4AeKrBOk2Fsum
         PiKuTUNwWuOv8xr+VIC42wU++An0mOtZVRsjvSCPNXRYAhYmEQoD1eJ9gAow2O7TI54Y
         5CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=giY1/tW0iuZiEVEV6UWlC638keIQvqqS3I6Akp0/NSw=;
        b=owETFChlOhlq5CBPlrvjQMa7fmRNjt0i9DMTixyaD5WCwzxEoEMrnXk3nNrrVKtEgn
         D+sRt6r2kVAKw45q2jHSwpvj89uvcqYaI24OIl8brJg8BofSHkQWh0FlNVmwwM/M3zz6
         XbRz+0p6hwV+R0OmNzyJuS0S2FP0MgtCz22uD0iNXmQOmSXR4OryFUhgOdMRGwZrib15
         ojf4mIg2gqq2sNJ18mWjuBkzZ++uIDCEY5V1S0NQKLOqCHHcPF4tBDyQeMoGGuZhl2ZC
         PRVgVACx1X2O+gDof679a+iAtIkA02BXwZOYvqB4Ow0txdqaZy3j2c2fSIbMb8fClHnL
         KNcQ==
X-Gm-Message-State: ACgBeo1loHygFdXtf/KY8OIb7kqUoBNJh5pZTjMoNUwbPsae5M9d+qyX
	x8jqzucwCo4UFkjs0siHjQ/bj/RQ4V7MdXjwBT8=
X-Google-Smtp-Source: 
 AA6agR5Dh8GB6p46aZ2fgr2lrgrixxEk+bBNQCAA740220R26r0kSPGx5tWGTDgjISiT7NrPW3XgsaYsSkqLvPcQLwk=
X-Received: by 2002:aca:be07:0:b0:344:d5e6:a404 with SMTP id
 o7-20020acabe07000000b00344d5e6a404mr183732oif.254.1663019976165; Mon, 12 Sep
 2022 14:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220909163640.1985612-1-ross.burton@arm.com>
 <17135317F9CABC3C.4025@lists.openembedded.org>
 <1713EE7A59F012D9.1776@lists.openembedded.org>
 <c36da2945102cf2e0b90562bedcedb83687cc3fd.camel@linuxfoundation.org>
In-Reply-To: 
 <c36da2945102cf2e0b90562bedcedb83687cc3fd.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 12 Sep 2022 23:59:24 +0200
Message-ID: 
 <CALbNGRSfDHyCqF-0g86V7FtOiy81aVu3QbddQT3tAmD-sBm_wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 21:59:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170547

On Mon, Sep 12, 2022 at 11:43 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2022-09-11 at 23:21 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2022-09-09 at 23:54 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2022-09-09 at 17:36 +0100, Ross Burton wrote:
> > > > The KDE build uses custom catalogs by setting XML_CATALOG_FILES, so this
> > > > wrapper should not override that value if it has already been set.
> > > >
> > > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > ---
> > > >  meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > > > index 2b2289e38a6..165c92d4114 100644
> > > > --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > > > +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > > > @@ -121,7 +121,7 @@ do_install:append:class-native () {
> > > >   # Docs are not needed in the native case
> > > >   rm ${D}${datadir}/gtk-doc -rf
> > > >
> > > > - create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=${sysconfdir}/xml/catalog
> > > > + create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=${XML_CATALOG_FILES:-${sysconfdir}/xml/catalog}'
> > > >  }
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/5823/steps/24/logs/stdio
> >
> >
> > Dependency on variable XML_CATALOG_FILES:-/media/build1/poky/build-st-282284/tmp-sstatesamehash/work/x86_64-linux/libxml2-native/2.9.14-r0/recipe-sysroot-native/etc/xml/catalog was added
> > Dependency on Variable XML_CATALOG_FILES:-/media/build1/poky/build-st-282284/tmp-sstatesamehash2/work/x86_64-linux/libxml2-native/2.9.14-r0/recipe-sysroot-native/etc/xml/catalog was removed
> >
> > i.e. it is expanding the variable in the keyname!
>
> I tweaked the patch to exclude this variable for now. We probably need
> to think a bit more about what bitbake is considering a variable name
> though...

Thanks for addressing. Will remove my workaround in meta-qt5-extra and
hope not to come back :)

Andreas

