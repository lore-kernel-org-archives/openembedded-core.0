Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C073C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 08:41:58 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.4989.1648629717506219204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JZ9ZBJXH;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id g24so26697835lja.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xc+L8MYGT7FkJEFulc4QRIJLN7YUPv6ICMoqV3uynYQ=;
        b=JZ9ZBJXHUMEj5k7XECnztgUZeCarcVgzYK86jTQIolNbc6NtzQHeMQN+VhF7XLrFsg
         okEaiNKftjvMwADDSGzcHDeFO4XDmLPXN07KuZZGj+1Wfxsf6BcxP8NsvluJZQ7qHba4
         NfM7P3yEtwXDECTvS7nJZfA5aDwh9P50ZPQ7mQ93GroMfgiokSgFrgKn2W7oMWuicSO5
         v7xg1h2T4KB5zGsNQsTa4uSmAM0/1IVXNqQogamgs21CXyC7z/Cb5Et+MT45735ABy4G
         ctrRJ+HPkS0Pr1vIOWW+s94fe4vg0rgmSUx9JtE8ms0QW406HDx7UmQHBkzffYEkJKxh
         Y3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xc+L8MYGT7FkJEFulc4QRIJLN7YUPv6ICMoqV3uynYQ=;
        b=AYKadJFufjT45vuu7tlBpQ+bQvhGqlUsNkwkLtzbu4srqqCudbE9j+5TpZS9RJDYVb
         15uU4+jfr4tsGHQR3X3Yxz18J2uRBnYMcUpMen36TTdrO9LZ/m5F9XCi+LYaGIDMi07t
         wUlw5sInq1pChL6rkUNs/3EMj7Va3ccH90rt1vUtZZVwP1RJz2+7eIgq7AIi1OZAu8hJ
         umAWOqRNMtbU+DOVIMfQHX87pzkKK/7WYQZAXdHy7rKfuZh1u9ZYTvYZ7AZ+I/oWQR5h
         DE4wgOVYxqlE+oSNTdP4eNBm94VdyKsGwD9RXhnxXvKnQzBcjo6zXx0yKr25gFF4NNzn
         ds2w==
X-Gm-Message-State: AOAM5318P00Y8Tw5duRvsG9VKvRASnhPZ0KLV8oPk89lNJYMWHNkTrZX
	nKL6+ZDJi4j9IIvwZIlVVD3dVPhgbU211ehMeho=
X-Google-Smtp-Source: 
 ABdhPJxQDR4rvfu4zYhZF8rOMjKRV525Ix0sOGEGRakm3mVob7dvNytCpBQRWdG6hKjIXe3hbxfWYonq0bZPmG6bEyc=
X-Received: by 2002:a2e:b989:0:b0:24a:d5a0:bfaf with SMTP id
 p9-20020a2eb989000000b0024ad5a0bfafmr5801941ljp.513.1648629715454; Wed, 30
 Mar 2022 01:41:55 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_AH8pTcynXzUurmoY15y4yLo8o1V2GjAQEAHkwV-7L9w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_AH8pTcynXzUurmoY15y4yLo8o1V2GjAQEAHkwV-7L9w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Mar 2022 10:41:44 +0200
Message-ID: 
 <CANNYZj87RJch2Y7Ji6ZUWKWJA98fZfnN1F4nG7iJsEcjpRMPzQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 08:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163777

Not lambda in this case, but nevermind :)

Alex

On Wed, 30 Mar 2022 at 10:41, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Mangling PV is more flexibly done with a lambda function in the
> recipe, where you can trim and tweak PV to your heart's desire, e.g.
> gnomebase.bbclass:
>
> def gnome_verdir(v):
>     return ".".join(v.split(".")[:-1])
>
> SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
>
> Alex
>
> On Wed, 30 Mar 2022 at 10:16, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> >
> > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >
> > Add a base package version (BPV) variable and use it as default for the
> > package version (PV) variable. The BPV variable contains the base
> > package version of the recipe read from the recipe filename.
> >
> > The base package version variable supports an expansion of the version
> > from the recipe filename without the need of an immediate variable
> > expansion:
> >     PV = "${BPV}+git${SRCPV}"
> >
> > It allows the inclusion of include files inside a recipe file with the
> > same version in the recipe and include filename even if the package
> > version is different to the base package version in the filename:
> >     require linux-yocto-${BPV}.inc
> >
> > Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >
> > ---
> >
> >  meta/conf/bitbake.conf | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 7705415a4f..d56cf811ba 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -232,7 +232,8 @@ ASSUME_PROVIDED = "\
> >  ##################################################################
> >
> >  PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
> > -PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> > +BPV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> > +PV = "${BPV}"
> >  PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
> >  PE = ""
> >  PF = "${PN}-${EXTENDPE}${PV}-${PR}"
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163774): https://lists.openembedded.org/g/openembedded-core/message/163774
> > Mute This Topic: https://lists.openembedded.org/mt/90127138/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

