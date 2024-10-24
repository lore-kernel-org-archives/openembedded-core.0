Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110E8D2E03E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 11:14:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.12266.1729768469262053751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 04:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G18BJ0Q7;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so734998e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729768467; x=1730373267; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cH6GQNu/htgZL1PPhlWohieMgLCJPeNzG+y9yvJQ2g=;
        b=G18BJ0Q7cTXW+JEiJzM6ze+iv+TXk2igwTzql9jAd209eAi/ilaN7qqL10iHZQOO44
         PwoH3FtZm6HNw5xlJNyLuyTRtr+yeCecy1i5uQ5pIeD3FYgDSWw9acufoDt8gBG9o0aj
         NcehcQMjtyCn89QkZamYYVCPv2r5GFtciuApZRnnYgJpRLEFtYspGmmnCR6r9Mwm0N/s
         DjEr5n68ib2/4m+Uh6DcwN0uXc9x3W33kLkiSVDVO2K3ltIhyerf4dLKU55mwK1cSIQo
         P38gebW9lGaOSki/GI4wAbVoOVfbohuhzfZ6JwoytLzDe7OMVKblAR3Eug08zdhHU/Uq
         bwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729768467; x=1730373267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cH6GQNu/htgZL1PPhlWohieMgLCJPeNzG+y9yvJQ2g=;
        b=fUNYNBwsqKoATV8R8DSKPhnwU18T91J6sPaqM7pGrpiGNgyAGd7PzVMxV/ym+CgP4Z
         MGExHuXCk3+4kkAuAzHQfRAbY2JWPSspo5FIXUs5OkwTuH2d9Jzwy82WB7CYbfh2SUvh
         u/GIAgHyAS5gMyNcdSE91MCVYQwaZd0XESK+jC7LnQzFdRcFQn2fu/ijZIj1OxVDSd9x
         tOxpBnBDp+f5geXWzkIiXcekEYb/oruval/iDwtoBxRl1POA8ffLyVdxDR9TSdk2TMQu
         c6joPTOEix9+YgSvIVGjAmgi/GKK4o3sAndVVF8F1Yy0wIrnnDwEgRo3m05aJ6p0qaR7
         vroA==
X-Forwarded-Encrypted: i=1; AJvYcCWqiADFOp29NRyep35vEWDLVRpOoXIhDozdgSxpCnkYdlbBotIngoXQDWOpHesVkjIylYi2VQq+UFUG8fWwmgpb4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVOhDUxRcb5UmFq1+dEediBi+0bsF7KoyTK9UlvwQPz1Wkf3wT
	ZmdminxPK0HEcRQ0SzmJlKd3JiMaZ2RaZqE7IIe9bsFZPnjt2fY+3KcqzTtdj67lEDj90tHkRAw
	rB0x5I1771xFRtv/gCUd9MYE1EeE=
X-Google-Smtp-Source: AGHT+IGs+wO5AzaavUsIIFjEo4A32bu/C62y5jPjOS5BkdRHVy1cMaJaROpN3eJNlG7INKJvQ2DNUFyQlVexG5nECYQ=
X-Received: by 2002:a05:6512:3a91:b0:539:e0fa:6ee8 with SMTP id
 2adb3069b0e04-53b23dcb1famr1052152e87.6.1729768467123; Thu, 24 Oct 2024
 04:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241023173911.1411724-1-danismostlikely@gmail.com> <2E288CC5-EDBF-4AA6-9F48-9DC45C171188@arm.com>
In-Reply-To: <2E288CC5-EDBF-4AA6-9F48-9DC45C171188@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Oct 2024 13:14:15 +0200
Message-ID: <CANNYZj9Bn-yZy1y8NjP=xushF3xa7LO4TScJAKub_6+WRPrOcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: make pam optional to avoid host contamination
To: ross.burton@arm.com
Cc: "danismostlikely@gmail.com" <danismostlikely@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Dan McGregor <dan.mcgregor@usask.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 11:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206289

On Thu, 24 Oct 2024 at 13:01, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[pam] =3D "--with-pam=3Dyes,--with-pam=3Dno,libpam=E2=80=
=9D
>
> We have a =E2=80=98pam=E2=80=99 DISTRO_FEATURE, should we just respect th=
at as the default PACKAGECONFIG using bb.utils.filter?

Only if the host contamination is tracked down and solved? Otherwise
this should not be an option, but rather a hard disable with a comment
on how to reproduce.

Alex

