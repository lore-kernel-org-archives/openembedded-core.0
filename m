Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29796C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:13:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.13733.1745496810116352769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=akoZoG9x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-391342fc0b5so705528f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 05:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745496808; x=1746101608; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PHhsou8yaBHePWrnsjMPph3967Pu/LjD+ysSj+UfQZ8=;
        b=akoZoG9xSoTMK3oUJ5iAlP0SjOhbmjioW4eCabEvxAk+G5b1NV09V1WsoHj5wHpW1f
         nJs1DgwUIk5E2dC/lVwbCqQMZpB6ivOjLB1lBR39ocyFp4NxvsECHz+wsc9mtGPCtiak
         XG+hS8PjozX+nLL0Jj1iir7s9xqOIs83XYcPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496808; x=1746101608;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHhsou8yaBHePWrnsjMPph3967Pu/LjD+ysSj+UfQZ8=;
        b=fDiQjVVbExhmMf1gFnhzVcNcWmPI0AhD/qsEfK2CmIZy6OUuJs6tcrZQB93fmCgjOz
         esIJMQfVeiUmsr0keAApn3oNIqssccE7sbwHZRO9Sw+VXDbPjb2sprlrCeC7Nw1anjlN
         r0Zsb3stlP2aQnIFrYeQhSpL7QlWd/L2lp6ZKGuKubRfZFomtHArZV2TODlNJfRX+ujx
         hMURgNamn+TbgPkKBSf/uDhSB0Yk7USCquicu0ipVwk+ftUXK8LFr8wAbUAla8T9UGeH
         CyOVcuzV+/FGAbFS/gthRddOqvvQ/3lWru8bLSnYlIbCGVm1nOpFpyxcTyenWlwZB6ls
         nL2w==
X-Gm-Message-State: AOJu0Yz629+T9PjWDjZL7duvQe5QxpSXap/hdubW1JRUsjUfoWrVW7/c
	Pe0oWmChpFl+WBy8enTDPeJV4M3W5kVPExpIpHD3IDH4dno6TVPLENFyVBtMYB8=
X-Gm-Gg: ASbGncsNdMEfid36HNpaaUXKAkP4RdAItS4HjlrG6/9wyZzWsrUf/m62X4uF0ua59Xx
	oBzzthohpMtQDHrebI0g/woKQ3rzS1i8F4wNit4Rri4WIfQpAXMJZc9/qy0VftslnKJ36kXzUjJ
	/WmuHSWaeuuRBMeTMahRwUFX/+scYT13IdOXJyxp1zdnIruui/eB0/8wFqcpGK0xiJphRPquWob
	p8/6bKFPLcOzhwVvCaaOlagmSjD4nXcgUt2EbHr2VnKElo0isEuEDhyAP9/MzrNpl8nY7Mm6Xq0
	bJdLLclokDkbvObTt9RH899H3UU3eNReYIFQMQsarkUawCHQtNfetygqKpQ2lSKSrOShYBSkelL
	Xskw7yI1bGmlb3x2p+LqJXTxyRffoiV0TShqfRsWP
X-Google-Smtp-Source: AGHT+IHgdOixLFbuqnPMGY5IXv8uxvORTr7QMi3ok2c6//v4oXrpgCLs+vdzeZsd3f4zgGPc52SLnQ==
X-Received: by 2002:a05:6000:220c:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a06cf636fbmr2140423f8f.33.1745496808493;
        Thu, 24 Apr 2025 05:13:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c0cesm1862650f8f.83.2025.04.24.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:13:27 -0700 (PDT)
Message-ID: <9466ac1576016166213fb98191d57ed4106b9c0c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 24 Apr 2025 13:13:26 +0100
In-Reply-To: <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
	 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
	 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215368

On Thu, 2025-04-24 at 13:44 +0200, Alexander Kanavin wrote:
> On Thu, 24 Apr 2025 at 13:32, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > UNPACKDIR was meant to help with this. If devtool is changing the
> > location, can't it just change UNPACKDIR and leave everything else
> > alone? S will still be under UNPACKDIR/git even after devtool moves
> > it?
>=20
> Some recipes use
> S =3D /path/to/workdir/git/sub/path
> and some use
> S =3D /path/to/workdir/unpackdir/git/sub/path
>=20
> It's that 'git' part in the middle that needs to be extracted from
> the final value of S and appended to UNPACKDIR (or WORKDIR), and then
> the resulting path is moved by devtool to a workspace with shutil. I
> probably don't fully understand the suggestion?

In the two examples above, what is UNPACKDIR set to?

Cheers,

Richard

