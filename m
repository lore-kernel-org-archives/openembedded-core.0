Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7536C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 10:36:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.5720.1686220584353958652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 03:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=EKt/PmiJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ad458f085so360462f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686220583; x=1688812583;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvxLvJg0RUqzqt1D3IvMI+7H+agfaoUjXEY53b61D8g=;
        b=EKt/PmiJxOhS462TuocGj+3BXMS8eaHUCBUd6jcxg6BBfzpzBwQdlYpiE8+fZBX8Ru
         AX/PEfWziJD8zUV79QBXmHpXwqHJpMVTFhDRtvU9pA1iAZccxYhIjFqyyTcgR2RVxeui
         jyVgXhTyQVCOOPw1D1A6EEzOd4TIE4R/RbsJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686220583; x=1688812583;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gvxLvJg0RUqzqt1D3IvMI+7H+agfaoUjXEY53b61D8g=;
        b=L7tccfN3BJVBzKq60G4C9D3o6/IeS0gjp9I0RPmOw/Y8dAJ3yVyoh31Q6XZ4QnZxLW
         My5M56XTMuFaDKoiiZx/4S2h5VYNBxXBHT/XtH7rp3+bSZnGXARUQE+/5etmXACz3OWF
         aKRhynyVhC+zjR+skMs9AdI/qECdd9facRp1uGcy1bUPzYFti+cg79ojlySqX15RHPCa
         wuBQqj2C+CfJ/7eN9XT40XDfWBXi3LNSZLhWnfvrbzoR/gYHqvQbX6vpO9hzOyAv0/Gi
         k683uAa3rNPkzTYutjCTddyKtd7fdorAWu04m4Hp9dhPhhO6higt4uF13Qq1J2DN9glE
         5OVw==
X-Gm-Message-State: AC+VfDxfUtF9bIAm0vYWpeTUX5SVWvCRekLN+G89peaZuAA5TfwngH/H
	uswJrY6b8Fzlj2oU27bLsvxYog==
X-Google-Smtp-Source: ACHHUZ4P43dE7opnKXVugxXE1VbGuuQ+iocYJM5N3E/1311qR0JlK+xSPod9w1Hg3/DHJEMOphMTCQ==
X-Received: by 2002:a5d:674a:0:b0:309:33c4:52df with SMTP id l10-20020a5d674a000000b0030933c452dfmr1234883wrw.30.1686220582681;
        Thu, 08 Jun 2023 03:36:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:316b:ce77:4e88:2f02? ([2001:8b0:aba:5f3c:316b:ce77:4e88:2f02])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe350000000b0030e5b1fffc3sm1211341wrj.9.2023.06.08.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 03:36:22 -0700 (PDT)
Message-ID: <c914f55e1cf6a1ef38a2c683d42ba315a204a182.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] incorrect parsing of sysusers.d in rootfs
 generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, tgamblin@baylibre.com, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 08 Jun 2023 11:36:21 +0100
In-Reply-To: <63764037-0417-ef4a-30d0-1fe74d7c9825@baylibre.com>
References: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
	 <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
	 <a5e311b0545dc84f64d985ffcbd595bff2f2a2ff.camel@linuxfoundation.org>
	 <63764037-0417-ef4a-30d0-1fe74d7c9825@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182503

On Thu, 2023-06-08 at 12:28 +0200, Louis Rannou wrote:
> Hello,
>=20
> On 08/06/2023 11:19, Richard Purdie wrote:
> > On Wed, 2023-06-07 at 17:16 +0200, Louis Rannou wrote:
> > > Hello again,
> > >=20
> > > a python solution could be one below.
> > >=20
> > > Also, I found that most of users/groups defined there are redundant a=
s
> > > they already exist (such as root). I guess they are defined from
> > > base-passwd. I am not sure which recipe (base-passwd or systemd) shou=
ld
> > > have the precedence on this. If it's base-passwd, perhaps this
> > > postcommand should check first if the user does already exist.
> >=20
> > I'd say base-passwd should likely be the winner but we should probably
> > error if there is a conflict between what sysusers.d and base-passwd
> > are defining.
> There will be some conflict. As an example the root home directory in=20
> sysusers.d is /root.
>=20
> Some others users/groups defined in sysusers.d files are already created=
=20
> in recipes with the useradd class (such as systemd-resolved,=20
> systemd-network who are defined in the systemd recipe).
>=20
> In the end, almost all users/groups in sysusers.d/* already exist.=20
> Perhaps it's a wrong way to parse this file to add users. In my opinion,=
=20
> we should only parse this file to check users/groups are already created=
=20
> and raise an error if one is missing.

Perhaps lets start there. The fact different bits of systemd are
configured with different home directories is a problem we should
really fix though and ultimately that probably should be an error too.

Cheers,

Richard

