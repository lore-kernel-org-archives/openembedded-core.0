Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF52C77B6F
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 13:17:33 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.12832.1681391843396178223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 06:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VvIHs+Qa;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 39-20020a9d04aa000000b006a1370e214aso5360953otm.11
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681391842; x=1683983842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcabD4zzohBHuqqjUT2CsdzyUSDg/UmL/ee8iG411eo=;
        b=VvIHs+QaeQ3cI+caoVZGATn/uDxXzgjIeN+yaB4ZUsqYhCVX0vi0sy6OCCUhnwJxsg
         F8KNA3K57yrdrk3yjlGiNfkWTrpMHUhhpmBML8fbmcPF/qpvvfc/KupvuNcnYOfbZWnQ
         TPlbsIMHwQ+ujhXZnzQOx+JARPxPAq2HNUQ8UTLv+dMEjc+QLKX7Z61tihR7lnOA/4id
         +4MNA56PNIJLx2hLX0L1JMQbepBO5DFvGCtRf7fOhukGZyW+LJXGqAKe0hoWI74Ic4W+
         glp5MYIl5xGJyjzKMHywBzrS/k5YaBbyL3mFM70w3nBFk3JfQ/Db1V68TpnSVMfKL8nA
         9g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391842; x=1683983842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcabD4zzohBHuqqjUT2CsdzyUSDg/UmL/ee8iG411eo=;
        b=T6G5lWCdk9z1R07uqQYF7MLvxvu5ornyzYGIgDUO1WfmIS0vtCdT3dOexig8sjJ08u
         DwlmzoMPIuHYb56q6DoFx4bASSSwVl0Tmns8K5Xge0r4O4un49KusOcuSnE/2Y2eYZqO
         1X6fdJeqcLpZIYmbaCGBCforImpx/8gfvV3XlfWGq6K3EcjOtFg5MOCyyCVUAlWepqEk
         Ford3eQuBpjG2SwBKcjb6HRJC59dSp84UEFOXvAv8or95Q+63oSHHLu/1fVVHTBQEuzo
         4oT+Ec4kb+dDAYJcckc14Qre7HcoK72bCs8vQEaO5xbYKKxwhNfxZJN2OqEk914E3dQm
         HIlw==
X-Gm-Message-State: AAQBX9fn303Ou63swup4hCgqpJE2/yIb3rK3raRU7bnI1lzOO+sP8T4g
	8lI++K3igbDNHk/ABeybrabh7MyJg+pe2wg1usc=
X-Google-Smtp-Source: AKy350Y8y+ZMwc0423Ex5lk/nSbi977ue57nWgR7O/j4dfS63rzkpTAkACr1fxCgb9VATmOy3yMc1bI96GMiu7nA4IY=
X-Received: by 2002:a05:6830:1d88:b0:6a4:3176:feac with SMTP id
 y8-20020a0568301d8800b006a43176feacmr510751oti.2.1681391842565; Thu, 13 Apr
 2023 06:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230413055432.1977413-1-raj.khem@gmail.com> <20230413055432.1977413-2-raj.khem@gmail.com>
 <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
In-Reply-To: <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Apr 2023 06:16:56 -0700
Message-ID: <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 13:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179976

On Thu, Apr 13, 2023 at 3:14=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++++++++
> >  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
> >  2 files changed, 77 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-fixes-=
for-tests-on-musl.patch
> >
> > diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tes=
ts-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-t=
ests-on-musl.patch
> > new file mode 100644
> > index 0000000000..4ff2466c0e
> > --- /dev/null
> > +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on-m=
usl.patch
> > @@ -0,0 +1,73 @@
> > +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 12 Apr 2023 21:57:18 -0700
> > +Subject: [PATCH] Provide fixes for tests on musl
> > +
> > +Fixes rebt8b1 and regx8bit
> > +Disable clos1way6 [1]
> > +
> > +Disable commas and backsmalls1, they do not work
> > +with musl-locales somehow even though we do isntall
> > +en_US.UTF-8 on target
> > +
> > +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.html
> > +
> > +Upstream-Status: Inappropriate [musl-specific]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + test/Maketests | 11 ++++-------
> > +
>
> Carrying a patch like this makes me a bit nervous as:
>
> a) it is only applied for musl so it makes recipe upgrade testing a
> nightmare
>
> b) there doesn't appear to be any path to upstream it, we'd just have
> to carry it indefinitely.
>
> c) the reasons for the failure don't seem to be understood.

reasons are clear,  these tests need full locale support which we do
not have with musl.

>
> Is there something we can do to avoid having to carry this
> indefinitely?
>
> Out of interest did alpine do anything for this?

they have patches.

>
> Cheers,
>
> Richard
>

