Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690C2CDB482
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 16:16:41 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.131093.1697472990910509006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 09:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cXHtyTyq;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9becde9ea7bso434569566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697472989; x=1698077789; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwNuFyUmDdzEA1NZQv+U5TWsu8B7+PIWTNdispMEDpE=;
        b=cXHtyTyqKvmKqUe/uQDTQ+e5AzXb8pMk6+GMQ39Fp88muzd1ZDaYO0fNaL+GUfEomB
         8MS1xFQ3K7FE7mvzW9CvwcpFHLoJVMljRG7SxzJSryE266JRCDcSU1YJZh0iv8uFW1wA
         qT0dzynCEaKo1JQAtadg7cB9Q3FdAUdXk36ApkvB2Fv0wZaa9oMYezcbOBCxsofGN/NG
         Pt0Y8uEIrwTkgpIMzlURCqgMQoCVXBkozY9uNXhkafLiyO1WUX82ILXuGsAjQpml4lEh
         6rRe0W+vs0xZPEqXYga85ybx+7l3wsXmBK9RZ427GoiCu89qY1s/lDg7YaluKa8Aax3l
         ABKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697472989; x=1698077789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwNuFyUmDdzEA1NZQv+U5TWsu8B7+PIWTNdispMEDpE=;
        b=RC2qWfIX4k/DKp4v2iR7JeJa3mCyqKqZ2QGfzjoJYlXq8qTWapQl2mNVaYz9zAEZCV
         IaWc4qt+RULmFFLS2sxjNakXHJg71AnG/YJLvS0NCFwYS6qShYPkxGA9LcWaNNV775pk
         a/xOQHP6lS+Hc2rygcApbs/iMC7SmYCoEQOAj2ROb/rpNqo8UcweKS9ijscLU2z6DgJG
         U2no2/rLzY7md77JxydXQKqHf4aBzbABY5dLHUgdDfn5oBjYH9QX3mKWjYaIYNMDCGJs
         +RFFnK7pTr7BKVIqq6ub4xgmS49MqXo7wgXPGMs0Al5tok0DpXIUA1n4FMQHUc1qrpOE
         H3eg==
X-Gm-Message-State: AOJu0YxOSeI1zUlx+Pdbr5yU+LP2RUN6W8kW/Nty4Nt8b149am4KnQBX
	Arfcyf5Emlc1Gs6mzF/qdDTVVwVkdXAbbW1nXCcHPQ==
X-Google-Smtp-Source: AGHT+IFs1mDIp3EerC1CKWCNV9BksjWATSpQegLfexWu1KvNo1lVmnlGaV5ttI5C+rQoQ1NJQwVVsdosw3xfq8qjvgc=
X-Received: by 2002:a17:907:96aa:b0:9ae:659f:4d2f with SMTP id
 hd42-20020a17090796aa00b009ae659f4d2fmr7658735ejc.26.1697472988876; Mon, 16
 Oct 2023 09:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231005-dev-uboot-extlinux-config-sstate-invalidate-v1-1-0f63ac16e38d@theobroma-systems.com>
 <7a244680-a944-40c3-91a4-13e8dd40d03f@theobroma-systems.com>
In-Reply-To: <7a244680-a944-40c3-91a4-13e8dd40d03f@theobroma-systems.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Oct 2023 06:16:17 -1000
Message-ID: <CAOSpxdYOXgHK07MOeVeOqnv+RGOB96U6Jcr00Sy-Lf3fuBPU7g@mail.gmail.com>
Subject: Re: [PATCH] uboot-extlinux-config.bbclass: fix missed override syntax migration
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 16:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189305

On Mon, Oct 16, 2023 at 5:59=E2=80=AFAM Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
>
> Hi Steve,
>
> I think this is appropriate for backporting to earlier branches.
> Considering that dunfell supports both old and new syntax, I don't think
> it matters for that branch.
>
> https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe=
/uboot-extlinux-config.bbclass?id=3Db4dd9d873508128adbbf5ff6cf0a3df3d2ffbcf=
6
> is the URL to the merged commit.

OK, will do.

Steve

> On 10/5/23 15:39, Quentin Schulz wrote:
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >
> > uboot-extlinux-config allows to specify multiple "labels" (entries in a
> > menu, =C3=A0-la grub) and each of them have their own values for some f=
ields.
> > Each "base" variable, e.g. UBOOT_EXTLINUX_FDT can be overridden for eac=
h
> > label. This is done via the OVERRIDES mechanism based on the label name=
,
> > e.g. UBOOT_EXTLINUX_FDT:linux if linux is a label.
> >
> > However, OVERRIDES doesn't contain the label globally because it's only
> > necessary in one task. Therefore, the OVERRIDES itself is modified
> > within the task. This means that the sigdata will not be told the
> > dependency on UBOOT_EXTLINUX_FDT:linux, because it cannot know about it=
.
> >
> > For this reason, we need to explicitly specify which variables this tas=
k
> > depends on via vardeps varflag for the task.
> >
> > This was done in the past, but we missed updating it during the overrid=
e
> > syntax migration so the cache wouldn't get invalidated if someone
> > modifies UBOOT_EXTLINUX_FDT:linux from a configuration file or a
> > bbappend for example.
> >
> > Let's fix this by migrating it to the new syntax.
> >
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> > Cc'ing Steve Sakoman for backporting to stable releases:
> > - kirkstone
> > - mickledore
> >
> > Dunfell should be unnecessary since we support both syntaxes there.
> > ---
> >   meta/classes-recipe/uboot-extlinux-config.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/c=
lasses-recipe/uboot-extlinux-config.bbclass
> > index 30bbea57de..0413e760bd 100644
> > --- a/meta/classes-recipe/uboot-extlinux-config.bbclass
> > +++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
> > @@ -159,7 +159,7 @@ python do_create_extlinux_config() {
> >           bb.fatal('Unable to open %s' % (cfile))
> >   }
> >   UBOOT_EXTLINUX_VARS =3D "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE F=
DTDIR FDT KERNEL_ARGS INITRD"
> > -do_create_extlinux_config[vardeps] +=3D "${@' '.join(['UBOOT_EXTLINUX_=
%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d=
.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
> > +do_create_extlinux_config[vardeps] +=3D "${@' '.join(['UBOOT_EXTLINUX_=
%s:%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d=
.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
> >   do_create_extlinux_config[vardepsexclude] +=3D "OVERRIDES"
> >
> >   addtask create_extlinux_config before do_install do_deploy after do_c=
ompile
> >
> > ---
> > base-commit: 2b9044361f2855866eed831f8bdb770f2c7d42dc
> > change-id: 20231005-dev-uboot-extlinux-config-sstate-invalidate-c464136=
a168b
> >
> > Best regards,

