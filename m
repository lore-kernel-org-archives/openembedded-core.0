Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2027CC32796
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 07:26:40 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.28560.1661239592899614482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 00:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mIaYhGQM;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id l8so965536lfc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 00:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=B3cRJEvkf6ea8oBpjA8Rici2fOOsk8kMrV3XZsgSfr0=;
        b=mIaYhGQM1CJpqtOn5xtSUYEyGxKJt19oYlFpCabRMxwt08kiy71Abugl/C75xuaPps
         /U8PSn21yWVeSVzcwOvOcQxKjhhYo1qKGjL6FnkoApn5qyERVkyxcXFcRAVKTY0YThKT
         +4xiK69nDdfW/lC8Qw3IeSqnPZUPc6dt/H9lHSzR5TnGb7kMXEHDjL/8KOP/xD7EvAFN
         xAKyN/oh7fJExm0KW70nitNjpVTIyz1tcUA5O/wqh5lN+VhCpw8/40uZ9+chp6yoL40Y
         X5bfjYuehYjtVQ2MRkRFMltXe2Fk2pFH8EFFr8YBmG/WU+nZVGg9OkLFm/JCkxIgOwQC
         u0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=B3cRJEvkf6ea8oBpjA8Rici2fOOsk8kMrV3XZsgSfr0=;
        b=hKKM5JtoZ8fI3cuFRslfOeALFIQVeFWWZZcdXjAnhb/JmVSF0TfjiNPrxIURKXQ91H
         RE4e6uuYbEjDkSTMLK5ddmYBphGJu18rGFcPs+55Fhw+1U/fvN1KkeLA4G6DLntYkgkj
         XSxb+d/O9wE1fA1Pm7V4j5OYgzw1VJWkVJikssleYSfhk/y0J0pVRKikHbqNASpW25kX
         myjIjpC6TYGCmbLlIIWpgg6CRe0cWjTmsJEdGw+LDnAfq9py9pXGh30QQozoVg6DBd3q
         l0da0ZvnKdSi2vYCoKdwLvzVmq+XsV8Nwsz8jZpItPV/N8vKFoPVGZ77s8D1s4wOs/E+
         9psw==
X-Gm-Message-State: ACgBeo3rCJbzBaznui7nAXSy28Fq/dEk21YQn/wZk96y80dUf3GALtS7
	I+2qLkC6gTxSb5WnIaPRyARvAzqyKPSBvJ1Z7xY=
X-Google-Smtp-Source: 
 AA6agR4w2nbDp/bNj2AmbkQuNGXK1tfAfjjw/Yx3tmdquK2MdbXUSq7VJTHN45TiLDVeXXsxjY3OdvK9GJpRI6GtBHM=
X-Received: by 2002:a05:6512:687:b0:492:ee7c:5953 with SMTP id
 t7-20020a056512068700b00492ee7c5953mr1990635lfe.673.1661239590854; Tue, 23
 Aug 2022 00:26:30 -0700 (PDT)
MIME-Version: 1.0
References: 
 <PR2PR09MB310005D5AE7E68AD1153DBC2A8719@PR2PR09MB3100.eurprd09.prod.outlook.com>
 <CANNYZj-B1Hmgi+XwbbSRPmCyHg+R6ee_XjJpRS6Q2dYKVnXvWg@mail.gmail.com>
 <PR2PR09MB3100E3D0D4461CF4E8480A6AA8709@PR2PR09MB3100.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PR2PR09MB3100E3D0D4461CF4E8480A6AA8709@PR2PR09MB3100.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Aug 2022 09:26:18 +0200
Message-ID: 
 <CANNYZj_+wVnv9+0vsQkE0-WtzRS=iUtUa6yZ0+j7X1PfvuJXgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3: add wrapper for native
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 07:26:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169696

The new patch is fine, thanks.

Alex

On Tue, 23 Aug 2022 at 09:05, Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> I read a more on this topic and found a less invasive way of disabling
> this feature globally for the native target.
> Sadly there's no configure switch
>
> Just send out a new patch, so this original series can be safely ignored
>
> On 22.08.22 22:03, Alexander Kanavin wrote:
> > This needs to be applied to python3-native/python3, not just to the
> > nativepython3 link to it. You can use 'create_wrapper' helper that was
> > written exactly for the purpose (see meta/ for examples).
> >
> > Also, can the lookup in ~ be simply disabled at python3-native build time?
> >
> > Alex
> >
> > On Mon, 22 Aug 2022 at 21:57, Konrad Weihmann <kweihmann@outlook.com> wrote:
> >>
> >> which makes sure to set PYTHONNOUSERSITE to prevent
> >> dynamically loading site packages from the host sided
> >> package dirs.
> >> In before when a module was using pluggy and/or
> >> importlib_metadata the host sided path ~./local/... was still
> >> part of the sys.path search tree and had priority over the
> >> recipe-sysroot-native, leading to host/workspace contamination
> >>
> >> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> >> ---
> >>   meta/recipes-devtools/python/python3/nativepython3 | 2 ++
> >>   meta/recipes-devtools/python/python3_3.10.6.bb     | 9 ++++-----
> >>   2 files changed, 6 insertions(+), 5 deletions(-)
> >>   create mode 100644 meta/recipes-devtools/python/python3/nativepython3
> >>
> >> diff --git a/meta/recipes-devtools/python/python3/nativepython3 b/meta/recipes-devtools/python/python3/nativepython3
> >> new file mode 100644
> >> index 0000000000..0413e44e32
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python/python3/nativepython3
> >> @@ -0,0 +1,2 @@
> >> +#!/bin/sh
> >> +PYTHONNOUSERSITE=1 python3 $@
> >> \ No newline at end of file
> >> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
> >> index f19cd50273..1121c17887 100644
> >> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> >> +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
> >> @@ -43,6 +43,7 @@ SRC_URI:append:class-native = " \
> >>              file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
> >>              file://12-distutils-prefix-is-inside-staging-area.patch \
> >>              file://0001-Don-t-search-system-for-headers-libraries.patch \
> >> +           file://nativepython3 \
> >>              "
> >>   SRC_URI[sha256sum] = "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
> >>
> >> @@ -153,11 +154,9 @@ do_install:append:class-native() {
> >>           for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
> >>                   sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
> >>           done
> >> -        # Add a symlink to the native Python so that scripts can just invoke
> >> -        # "nativepython" and get the right one without needing absolute paths
> >> -        # (these often end up too long for the #! parser in the kernel as the
> >> -        # buffer is 128 bytes long).
> >> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> >> +        # Create a wrapper for python3 in native environment
> >> +        # make sure that no host sided modules are inherited
> >> +        install -m 755 ${WORKDIR}/nativepython3 ${D}${bindir}/nativepython3
> >>
> >>           # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
> >>           # and the overhead in each recipe-sysroot-native isn't worth it, particularly
> >> --
> >> 2.34.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#169681): https://lists.openembedded.org/g/openembedded-core/message/169681
> >> Mute This Topic: https://lists.openembedded.org/mt/93189857/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

