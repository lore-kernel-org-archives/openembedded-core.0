Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50130C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 14:01:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.14971.1675346494045947940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 06:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wdDv1Igw;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id m2so6179205ejb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t2BXzoHdr9TbWwZDis4UX38pXdWRP6zyqhpmp0w/tGQ=;
        b=wdDv1Igw58R+bAhR79LEiAjz4Uv+bxqFu5lNj7uge0B1rDG0GkeuerUSKXJuegvpNu
         cJNZ9lymgtFPbtmBmMvFWwBtEsriVYAjFKf4EP0JRojhUUyX14gG8hVSbaIgJwW9WqXv
         PXnBw1Crdx+nSQ2wLzGDr82CXtIdLJ11Jo0PJqCwxYmPghX5eamgktaGPeXs85cYvx6g
         TKzbQGy2lFrq/n56vzomrKsiFZt4H0oufbjTSty2dlijwDoaSnJHvQF7HhZDuz8LHiol
         DqDgS4zCDa3f0IM85r8T3F+gW8r1m4C6el+pm7CoJg35cq94++baeSVUG5ZS7fKe/Hob
         pzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2BXzoHdr9TbWwZDis4UX38pXdWRP6zyqhpmp0w/tGQ=;
        b=ZfknkhMNDHwyNGYrwVFrU9ziLPaVEde+tPnYt8tjQvQX2CcbpLGNuz9cA5dn9MokHq
         rfYRoPx6P9ISUqB0piMderFYXaaLB0pegMrW/xOiOgrn0c4naMImCj5NsdWymy+lI9Un
         BzHYWoqrGtlKo2K3iRgec2x6k31QDfRitQ1OYDShn4Ku9zgcvBu6Dg6lALg1hOxC6CPE
         So3g56SOvl/IVULiiM/ZM9SN8UCP0zEfvl2TQswVqaXSLyMQVqQplso8aGc3ENAmqseh
         F913lluK1pH00YHzTHiD29ZLr1CDo8FiHTeZlTDqMbD2s3Z7i5087aO4frnLGfZlfEAX
         rCuQ==
X-Gm-Message-State: AO0yUKU0z7hO4qZhavBt7WPb1Dzcg+lq+qm7eOqUA0VcqYciop3S9/k2
	wh79BZwrUeQYlKMr8IiMpe5Y7QZJo0YZRjo5HZfWViT+odffxsYOgNU=
X-Google-Smtp-Source: AK7set8iKXOCuHK5RsoD77PYWcY9UlI9X3EYzkYbl6bp16R21TUkuNqarnc5TCR33Cq6lRULfs9ZFV1H//kgaVsb5rc=
X-Received: by 2002:a17:906:1e0a:b0:883:8b04:457 with SMTP id
 g10-20020a1709061e0a00b008838b040457mr1661558ejj.286.1675346492208; Thu, 02
 Feb 2023 06:01:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675289652.git.steve@sakoman.com> <47a2634831f907d83ec40ad010351c923ef67f0d.1675289652.git.steve@sakoman.com>
 <78aa81ec86a05f1b6da3afd1c7af73e97de3aa58.camel@linuxfoundation.org>
In-Reply-To: <78aa81ec86a05f1b6da3afd1c7af73e97de3aa58.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Feb 2023 04:01:20 -1000
Message-ID: <CAOSpxdY714rpyi6YNmhs1Gp8CBxjqdh7rF3akfanOcwPxmTzdA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/13] native: Drop special variable handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 14:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176699

On Thu, Feb 2, 2023 at 1:42 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-02-01 at 12:16 -1000, Steve Sakoman wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Back when it was merged in https://git.yoctoproject.org/poky/commit/?id=c4257ed8b1040a5a0e9a95846d81961741239116
> > it appeared special handling in setVar was necessary. Likely due to
> > other fixes and improvements it no longer appears to be. The results of
> > "bitbake world -g" before and after this change are identical for oe-core
> > and meta-openembedded. Therefore drop the "parsing=True" special parameter to
> > setVar() meaning overrides can now be cleared.
> >
> > This means that something like:
> >
> > DEPENDS:append = " bash"
> >
> > now functions as expected, adding bash to the target recipe and bash-native to
> > the native BBCLASSEXTENDED version.
> >
> > Without this change, it would add bash to the native version as well as
> > bash-native which is clearly incorrect.
> >
> > [YOCTO #15010]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 99a5105f7b5303cd36077b5910c662a865c1782c)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/native.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> > index fc7422c5d7..4de96cd59b 100644
> > --- a/meta/classes/native.bbclass
> > +++ b/meta/classes/native.bbclass
> > @@ -153,7 +153,7 @@ python native_virtclass_handler () {
> >                  newdeps.append(dep.replace(pn, bpn) + "-native")
> >              else:
> >                  newdeps.append(dep)
> > -        d.setVar(varname, " ".join(newdeps), parsing=True)
> > +        d.setVar(varname, " ".join(newdeps))
> >
> >      map_dependencies("DEPENDS", e.data, selfref=False)
> >      for pkg in e.data.getVar("PACKAGES", False).split():
>
> Steve: Did you check "bitbake world -g" is the same before and after
> this change for kirkstone?

task-depends.dot files are identical with and without this patch.

Ordering of pn-buildlist is different before and after, but sorted
they are identical.

Steve

