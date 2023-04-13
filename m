Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCE9C77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 13:44:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.13521.1681393454695002459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 06:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=dgwgUVKB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id i3so5001370wrc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681393453; x=1683985453;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ej3CiaxWmA+7rCh+11imEdPOat4owdr/kAdl1+oBaFo=;
        b=dgwgUVKBQFyxEQGBSgvIIbzAnXQe/BT/jK0sj4hjeJXt0fSQNq9dSaO5y0v1aVSz5t
         TEzHnB9CmsOAfw1DLk4rz1PWZFWZfpvKzLCk1K15QEp91wDEwS5X4hQlsbxr9F8mybEG
         65EfjV1pgNsk5Ps2x6n9w+RVFgkRTgqTBv4dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681393453; x=1683985453;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ej3CiaxWmA+7rCh+11imEdPOat4owdr/kAdl1+oBaFo=;
        b=aZepcvWF+QyYuuLzXN5HlvkCNN9p5PO5xnN9oXCQMzqpGrUoPjo0I5cPjwALcpHtgt
         sTC3bBoc4ofro3GwfZosD2ptLBlTw5rYP3tqjtmscYcaRPdSuQM8HLsqdyIdBo+q7waX
         aVtdcnWg9HE2FXOy9FnPow4tDqkH7m2BaxTlvaPC4OuD2NXMcSEU6uemj15FeKstlyc9
         U7Zmuwst1zd1XKejJO5QVCJpM8XXttaBSiuR+xRjlZy8oUoTxPKtRk/9NYEy6suQ9OQG
         FZ/Ksq6uZJzuYqSTo41l8PRNvTtqS2STd80c3FsyNxEWTvPg47dOcZSzmnkGXmMaq+dn
         ZqNg==
X-Gm-Message-State: AAQBX9cjsk78uKWXkIy8B0ycPk2nvUQcyK0NROMWDu5MYTjZF9pOzmYC
	yTAuKdfiVfFE6mrQ3e71sVOkfQ==
X-Google-Smtp-Source: AKy350ZUu5GPWJ5jcnojhWcsjHspFDkNDSCbQS24q33+PMMFkQX837deM8apWhcjqT3k2VRCxO/u2A==
X-Received: by 2002:a5d:51ca:0:b0:2f5:fbe5:bb1f with SMTP id n10-20020a5d51ca000000b002f5fbe5bb1fmr1549160wrv.32.1681393453146;
        Thu, 13 Apr 2023 06:44:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b4d4:7e31:434a:3f40? ([2001:8b0:aba:5f3c:b4d4:7e31:434a:3f40])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c350f00b003ee9f396dcesm5604725wmq.30.2023.04.13.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 06:44:12 -0700 (PDT)
Message-ID: <35ba45bfc40c7d19d2ddc708007110b088f45753.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2023 14:44:11 +0100
In-Reply-To: <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
References: <20230413055432.1977413-1-raj.khem@gmail.com>
	 <20230413055432.1977413-2-raj.khem@gmail.com>
	 <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org>
	 <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 13:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179978

On Thu, 2023-04-13 at 06:16 -0700, Khem Raj wrote:
> On Thu, Apr 13, 2023 at 3:14=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++++++=
++
> > >  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
> > >  2 files changed, 77 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-fixe=
s-for-tests-on-musl.patch
> > >=20
> > > diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-t=
ests-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for=
-tests-on-musl.patch
> > > new file mode 100644
> > > index 0000000000..4ff2466c0e
> > > --- /dev/null
> > > +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on=
-musl.patch
> > > @@ -0,0 +1,73 @@
> > > +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:00 20=
01
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Wed, 12 Apr 2023 21:57:18 -0700
> > > +Subject: [PATCH] Provide fixes for tests on musl
> > > +
> > > +Fixes rebt8b1 and regx8bit
> > > +Disable clos1way6 [1]
> > > +
> > > +Disable commas and backsmalls1, they do not work
> > > +with musl-locales somehow even though we do isntall
> > > +en_US.UTF-8 on target
> > > +
> > > +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.htm=
l
> > > +
> > > +Upstream-Status: Inappropriate [musl-specific]
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + test/Maketests | 11 ++++-------
> > > +
> >=20
> > Carrying a patch like this makes me a bit nervous as:
> >=20
> > a) it is only applied for musl so it makes recipe upgrade testing a
> > nightmare
> >=20
> > b) there doesn't appear to be any path to upstream it, we'd just have
> > to carry it indefinitely.
> >=20
> > c) the reasons for the failure don't seem to be understood.
>=20
> reasons are clear,  these tests need full locale support which we do
> not have with musl.

The above says something quite different to what the patch says:

"they do not work with musl-locales somehow"

which sounds like nobody has looked into it.

> > Is there something we can do to avoid having to carry this
> > indefinitely?
> >=20
> > Out of interest did alpine do anything for this?
>=20
> they have patches.

The same as ours or different? Was there any discussion with upstream
on this?

Cheers,

Richard


