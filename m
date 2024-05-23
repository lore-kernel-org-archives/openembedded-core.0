Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7494DC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:58:51 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.17765.1716472722861107067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Dk/zJkD3;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso6101454276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716472722; x=1717077522; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbPhpX2lTsmdlGFGHUV9TbzPoaJQH908sBXRlQ9YVXk=;
        b=Dk/zJkD393BSXprd3f8P9dXo9qcp8uw8SfF79WAvaxshR0jjj2srXLQT53kORkSez9
         FI8oTEz+20wzAb2ot+wx4C0ax4wXRww+6T5FL8YxF1GFi17yeDIQgxvtuLmxyjesb8LV
         /m2eK0GLJUqmj3FERFEtcOEAuVllp4RMvUlLbMr+PP8yR8nHAqKHgTZKeLPg7kiaoeyq
         7CzfTWi/6u9nYfwsvzwgw/cAvUfnrUro+PBCaFnsxG11RnbCwHpxm14RXmb6F8cNjwUo
         hW4qqIBryZqrNr29S+oxKv9jRPBa1/lpC3LHUH5Yaji8yoQhYh2irtoLuJcqL6Ff1I3c
         rc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716472722; x=1717077522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbPhpX2lTsmdlGFGHUV9TbzPoaJQH908sBXRlQ9YVXk=;
        b=GXxTcRASmR/VN2z3Qtapdi18EbW2iJN7g4mL+7+SG1Xpqhy/oZeeCKdZNGbhTmMdsU
         029j6/B2FM4qlHczWSPIROG1ODfePuBveCp3by+YPHQKYnS4kRAp20IsScbhdLZ3pzMT
         BW3O9aPDGYJJvcg6KH6rJFQgSCeQswaWGwNPmn6ELbLbnCtDrYkHzcoxuQnhm732PNze
         7W0/LBNRUSnHcyjToi66A+H0XcHs/VVFUeb7YhPwlNg69b2e1+X39quhvP+fJajAV3dz
         pLK8InIMv5layFijJ7B5Vj3ri/GmChPShIMD+YYjaVHpv8nacRj9O+5scpifqNmPpAAI
         rHyw==
X-Forwarded-Encrypted: i=1; AJvYcCWHHxn7jasmXwquNYvEP67B8b99WfyU1Pq/QGi1gckwA2oEnvOT7BJ5bq9GZ2ACQfKlJJRaDEfMX7mK1AFpVu1497TXYmSdevLaDN3LHASkCl7C6yGOP04Y
X-Gm-Message-State: AOJu0YwLSH/TctJ3xosuXXXzATafGhcCvhgJB3bvC64ixg8svLhYJe7i
	elM7jYDoMqdX0RKJojETb0fe3cCCcsNYpUkkOGCr3QcAEKeBrPEMHeRoe5AZ3HrQZ/zBiGaln5L
	0wc8VZQ2F4FS+JRz3/uJJS6rXY6MIqGe9n7hKMQ==
X-Google-Smtp-Source: AGHT+IE6RwFU9mqeQrbvQGNYpd/N2KY9cvC7VnAnJw5pOBqdV5rEVgMID1F+GYV5H8caY/AJPMvshiQ+QBh/o61aYaw=
X-Received: by 2002:a25:5f48:0:b0:dc6:ff12:13d7 with SMTP id
 3f1490d57ef6-df4e0df17edmr4417850276.60.1716472721909; Thu, 23 May 2024
 06:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <AS1PR10MB5697A571F24C68195FB82070FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <f0452dbd-636d-474d-b87d-caf6c0680843@cherry.de>
In-Reply-To: <f0452dbd-636d-474d-b87d-caf6c0680843@cherry.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 23 May 2024 06:58:30 -0700
Message-ID: <CAOSpxdbW=mH6Uy_hGOiG6N2ioDhjJJNPsh_MirkkYWhfoUuGCg@mail.gmail.com>
Subject: Re: [OE-core] scarthgap backports
To: quentin.schulz@cherry.de
Cc: peter.marko@siemens.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199803

On Thu, May 23, 2024 at 6:46=E2=80=AFAM Quentin Schulz via
lists.openembedded.org
<quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>
> Hi Peter,
>
> On 5/22/24 11:10 PM, Peter Marko via lists.openembedded.org wrote:
> > Hello,
> >
> > I'd like to request following backports from master to scarthgap
> >
> > To match versions in scarthgap branches between oe-core and meta-clang:
> > adc2651a8e902af24fee6ff30a72f4b7c63bef6f llvm: Upgrade to 18.1.4
> > 02df2fc6241ac8fb0e78f2fdff97a04e5c561d54 llvm: Upgrade to 18.1.5
> >
> > Fix CVEs:
> > bdf7b7460a4816e3d447264730a2814209667fb0 ncurses: Fix CVE-2023-50495
> > 6573995adf4cfd48b036f8463b39f3864fcfd85b ncurses: Fix CVE-2023-45918
> >
> > Version correction:
> > c94e46019a7d443ccc4763ba16d87e7e97abe977 update-rc.d: add +git to PV
> >
>
> I think the most efficient way may be to send patches with [scarthgap]
> in the mail subject (see --prefix) to the ML :)

Yes, please! I use patchworks to keep track of things, so patches sent
to the list are much less likely to get lost than an email request.

It also gives the community an opportunity to comment.

Thanks!

Steve

