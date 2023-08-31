Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAE5C83F2B
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 08:09:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.11846.1693469358481290708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 01:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FL5z7ZXP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-401f68602a8so4677655e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693469357; x=1694074157; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kfcm4OvzxbMAt9gQ2+LP4e/CgOeG2FRUpO6MveVm4DY=;
        b=FL5z7ZXP9ASOoHw+eTtngw6XNDE/f+JeDJbsI2zcglOptq3Cu5vr7O0Lhp6ct3qeST
         Pmj3icveYXtooB60a95jfO10x2I9hOsh8Q746Yku6eGJiM53hOO3fZNaGyXDW4mKFbzu
         qg8XHF0YUNLwT4Kz/4BfTiCjZpUKjrd0wKbWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469357; x=1694074157;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfcm4OvzxbMAt9gQ2+LP4e/CgOeG2FRUpO6MveVm4DY=;
        b=MT2FRnyVAuZyiXUnLW50s6+xJ/WgK7PHWHO5GICBOR1Fipci1q6wqIBGL8TPMG3xbU
         vSNrW7EpsyX9Hg2PBGqjH9wA1OmVCHF7A85jsbm5ZoXXAQFbxRxweh7SIPKDtOi9pWf0
         vZCt12lJhplxi6CGt1tfGg3RIs4nZ6iPGke8hUJcbu9C+RhTeoanED9+aOvX8TqZWei5
         xIbOMyyFJIHmyUBpwNR7YU9JPV4TsMGBCuxBU5dsHv3FSg6ig2HG40CXZhuFv1sori0v
         lzYJsPgFydpiG1kE3h4kwdCwUoVb3z6HOebWw2Vtj8Fuj0kYaTEoruZDeo+fzrKN87bY
         qrAQ==
X-Gm-Message-State: AOJu0Yz1PYsBp3aYUWRHkEpYP9MMHqDk4le11NaKM2Mkrh5PaWCCNuOe
	rPdoVSBcJ9liugW24EmPjvjpjA==
X-Google-Smtp-Source: AGHT+IHggTI9a+dSGQYAkGCkfiapnIID0FEGbnKYkz3o1WeIDUAEJ/ghuRVBRdPxNeb/AAhM3XtTkg==
X-Received: by 2002:a7b:c8c3:0:b0:401:b53e:6c40 with SMTP id f3-20020a7bc8c3000000b00401b53e6c40mr3248837wml.10.1693469356808;
        Thu, 31 Aug 2023 01:09:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22b:9179:6474:7878? ([2001:8b0:aba:5f3c:22b:9179:6474:7878])
        by smtp.gmail.com with ESMTPSA id p9-20020a1c7409000000b003fee53feab5sm1165670wmc.10.2023.08.31.01.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:09:16 -0700 (PDT)
Message-ID: <95d592aa093b5529e8d9abd3d6100c936513226c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][master-next] qemu: fix segfault in MMU
 emulation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Date: Thu, 31 Aug 2023 09:09:15 +0100
In-Reply-To: <202308310730179d8d0ac8@mail.local>
References: <20230830143956.1965354-1-ross.burton@arm.com>
	 <202308310730179d8d0ac8@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 08:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186963

On Thu, 2023-08-31 at 09:30 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> On 30/08/2023 15:39:56+0100, Ross Burton wrote:
> > From: Ross Burton <ross.burton@arm.com>
> >=20
> > Backport a patch that has been submitted to the qemu list that resolves
> > a crash in the softmmu code.
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |   1 +
> >  meta/recipes-devtools/qemu/qemu/softmmu.patch | 216 ++++++++++++++++++
> >  2 files changed, 217 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/softmmu.patch
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index 131162dd62f..ccde87d1901 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -30,6 +30,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
> >             file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gu=
est-d.patch \
> >             file://0002-linux-user-Replace-use-of-lfs64-related-functio=
ns-an.patch \
> >             file://fixedmeson.patch \
> > +           file://softmmu.patch \
>=20
> This doesn't apply cleanly on master, can you rebase?

It applies against qemu 8.1.0 which is in master-next and whilst it
fixes the x86 issues 8.1.0 has, it breaks qemumips and qemumips64 :(

Cheers,

Richard

