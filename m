Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8D0C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:08:45 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.566.1742314120052361163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5LaqNfI;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476775df2f0so63370851cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742314119; x=1742918919; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1TGHWTt0jK1G++HDXhLcl0HdcidisfCaf30TUr048I=;
        b=Q5LaqNfIIFYjNtu3X9bqByjVl/GC5tJ+SJqcRYEdX+Wqn0FGDpMYO/XmRpEIIIrEAm
         2qYkFMcSTfmb5iV1AE1lbjD3q/zm0NuAInI7XhkkgY/2y9lZomYKvUAo6v5Vb8H2SaLX
         UzieziTYBcwkH6uEIVCAW1G4XJmJ3pkVEaaezLABxa6tRkTGcQergs5o8icGJcHDcmR6
         HwkoZe4VZxxjR8VKWABufaYtdBgkBmIHHXB9+QjxAQnrQXVXCCkspogM7MumCFQ9Oh+p
         oBWNvifhbQL5lyILQRbABWfGUuIEg+AZ7p6LZB/CVU/PWUfFBW3bctXt8Tz6uFnvsWLl
         hC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314119; x=1742918919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1TGHWTt0jK1G++HDXhLcl0HdcidisfCaf30TUr048I=;
        b=dsgDN+N7ZqPA2Ovps8wKNy10f7ir/qxChp0s+vxhj3P4P3TFzl/wgw2vPO2FlLjiTK
         LcbkpJBTlA8iSme83zJPTPOkjm4VF2pEKnTnwDnkvoO5qVsbvUY8LSGdmNoueSc0Yg6n
         2rMWfqLRuBZZOv8z72Dei26cYgQ87pz905qCIxqRL0c12CaIinzHJUVbkS6XvFZ6SYP2
         ApITcsOGlYx9gdvv+9qGFiwunzz+PRyAKvAEblPY1/AYCfZfZh1x2xscPT20PRwWbxRj
         Pfj2DjRsZDqGfydLmcU+Pn6VqP6POwYOHSsF7ZhZweCDkERNGoq8LZL6zXUyGUolJe/L
         67Fw==
X-Gm-Message-State: AOJu0YwPTCOABDXKMKKocoxdtIWBs4DWnRRRxkAGr7JBUey8rg1EVqJB
	1NaVn72l8zAa2hUxrqRIcZH22f+vSYJbANQ/GqXdiN+3ryiF2uycghuPwDzywy1np8p+VN3Cf9b
	vgGCCs73RjoP/xNmh6vx3RN0dE9wTqcWg
X-Gm-Gg: ASbGncsVNGuNjVGFEh1udFXJYlq00hZVbtxBud/yHuWTXWmX0hGsWr5/kAmIrTDkFPc
	ZCegnGLGkdUOxc2BSxHIg8+8FL+E12bga7ZSCf5vVDk2lraNPneJwZJ1tyqJMgfoVBA4dYgMMIz
	jLYZ2yeKI4mlYQfqyytnIM39b1eA==
X-Google-Smtp-Source: AGHT+IGzoCL6HlzzQLV4cA9F2NUOZKounJy4BQsHtV1Cs4LJVXRkIBOJ45gj/kG5z8lB+9ypOoAxwxG7dS2e/N58YRc=
X-Received: by 2002:a05:6808:1595:b0:3ec:bf55:e33f with SMTP id
 5614622812f47-3fea247da06mr2164807b6e.9.1742314108246; Tue, 18 Mar 2025
 09:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-5-raj.khem@gmail.com>
 <CANNYZj-_OsiNMuYvm8iVDvKrvcnGujFqN9_in_cB9qj-gdqVBg@mail.gmail.com>
In-Reply-To: <CANNYZj-_OsiNMuYvm8iVDvKrvcnGujFqN9_in_cB9qj-gdqVBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Mar 2025 09:08:02 -0700
X-Gm-Features: AQ5f1Jq8y-9nDhrGxjHfrVwkoEcFoi9gHAZqBvNZSPr7lR58Zai5985xW7fwNb8
Message-ID: <CAMKF1sq=tF+-=ReffePVyaSY40DZNytGbbUOmyjSkOHox7FQUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] ncurses: Upgrade to v6_5_20250315
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213219

On Tue, Mar 18, 2025 at 2:38=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 18 Mar 2025 at 05:39, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > Brings needed fixes to build with GCC15
> >  # commit id corresponds to the revision in package version
> > -SRCREV =3D "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
> > +# v6_5_20250315
> > +SRCREV =3D "5fa5aea6d020750dbe601c1136c7cc35a8a53dd8"
> > +PV .=3D "+20250315"
>
> I know we had them in the past, but ncurses' YYYYMMDD are all random
> development snapshots, and I wouldn't want to update to them. Is it
> possible to cherry-pick needed fixes?

Fedora is using these releases as well, so I am hoping that it is sane.

>
> Alex

