Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB14FC83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 15:01:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16492.1693234916902079201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 08:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Dbe9P/x2;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so32050435e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693234915; x=1693839715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqhP+MC5Rkai+vU31nGt/I6YXc1VC7AxPWFp3Y1/qA0=;
        b=Dbe9P/x2286ex6xaJN/lLwbHlDe6ZoZKukAXdUL2LSk+t9JkC88h2/3uEO0q6hDhyI
         INOnTxTE5MYa1lYXIqF+JIqVKENoB8SLcaxcJn5I9guLinHtuySzFTn4bH30j9+ZVN7s
         gAPx3WDovW8LPgg0ujv8xBCsQkjHfP1kgHNgD7U+fsn7EhiinWuImfYwyswrdw7jW+fL
         JgbXiWW0D8YdZBTn2juVe4hEc2sxCAUDB5guHPshFeoDHM8464X17USIDzNzSDeOLCyC
         gx+HrTFlct4+awD1uLj4jCaBI8zXBTzWPFTS4nym05UlP5NojJHAoWNht2pT8uIaMCtD
         rqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693234915; x=1693839715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqhP+MC5Rkai+vU31nGt/I6YXc1VC7AxPWFp3Y1/qA0=;
        b=XAEidagNzYG769ltrWE5rL00bm7jjSY/JU8JK0s3eac+TzAO6F78szWtdfsES2XGVf
         pG5U6pWz5PWVvvCOH16bD7eGLxGFM/cyGIm50KG6DXPipJs8cHkfc/HzK2qsbLIHBGxz
         sq6bUUFXzDnI6QusOWQMblSfBaQo/NW5VWhp1pfH5tEqrEuLuGTskQJe2FNidCsefpon
         vU5yO7xibciAnkONdNVlM8ZB0APAGm/j2ABx5/NrhFNx81OlmLrEYsURcKIqRhXmHB0Q
         sGEdht+6k7IyXOo5dn/w7SrYqMqOzLkKr7A3jV0td4aat2l1qOnVDp6RQdHJmrBC4QVQ
         V9RQ==
X-Gm-Message-State: AOJu0Yyy6FyopL/CBwoDUeT4u9CvcdasjT51G/R/jMkPkf9qOXjIJW9v
	1/uCQAiIoBzmjoDaUW45hk3Q/XcGzwt7tVP5SI0=
X-Google-Smtp-Source: AGHT+IFAbAEYc/mcmZZmgav/j69b6ThDl31+y2siV8WsmP4oEOU7tXqzRxDHCv0spAWitInAtYNDCslkWjOkgzzR+dk=
X-Received: by 2002:a05:6000:1146:b0:314:152d:f8db with SMTP id
 d6-20020a056000114600b00314152df8dbmr21397125wrx.58.1693234915093; Mon, 28
 Aug 2023 08:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230827080953.2005190-1-max.oss.09@gmail.com> <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 28 Aug 2023 17:01:44 +0200
Message-ID: <CAEHkU3WmGQJ7o7o7FbozOchMjv=rU_O92PmHJ_7hBOWDDLbeeg@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 15:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186832

On Sun, Aug 27, 2023 at 11:23=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Max Krummenacher <max.oss.09@gmail.com>
> > Sent: den 27 augusti 2023 10:10
> > To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>; Randolph Sapp
> > <rs@ti.com>
> > Subject: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit =
the
> > default dependencies"
> >
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > Hi
> >
> > With commit d1d09bd4d7 ("bin_package.bbclass: Inhibit the default
> > dependencies") applied I'm getting a lot of these errors, i.e. qa
> > does miss libc and compiler provided libs:
> >
> > ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> > /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlib=
s
> > requires ld-linux-aarch64.so.1(GLIBC_2.17)(64bit), but no providers fou=
nd
> > in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> > ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> > /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-umlib=
s
> > requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in
> > RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> > ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> > /usr/lib/libufwriter.so.23.1.6404501 contained in package ti-img-rogue-
> > umlibs requires libstdc++.so.6(GLIBCXX_3.4.14)(64bit), but no providers
> > found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> >
> > Reverting the commit makes the build pass, alternatively adding
> > to depends in the recipe which is using the bin_package class
> > fixes it too:
> >
> > DEPENDS +=3D " virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> >
> > I'd prefer reverting removing the default dependencies over fixing
> > each of the recipes which do use the bin_package class to actually
> > install binaries running in the target user space.
> >
> > Any opinions?
>
> Bummer. I guess we will have to update our recipes individually
> instead. :(
>
> >
> > Max
> >
> > Max Krummenacher (1):
> >   Revert "bin_package.bbclass: Inhibit the default dependencies"
> >
> >  meta/classes-recipe/bin_package.bbclass | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > --
> > 2.35.3
>
> //Peter
>

From the bugzilla entry [1] which added the feature and from the commit
adding the class [2] it looks to me that the class should simplify adding
binaries externally built for the target.
Having the users of the class having to add the used libc / compiler
shared objects to not trigger a qa warning seems really wrong to me.

Additionally I don't see the advantage in not installing the base
dependencies. Doing anything usefull in a build would need to build
them anyway for some other recipe, so one would save creating a few
hard links. Do I miss something here?

So IMHO a recipe which inherits the class and really does not like the
default dependencies should add the `INHIBIT_DEFAULT_DEPS =3D "1"`.

Regards
Max

