Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE21C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 13:12:39 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.12695.1720530750135011954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 06:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zQNwL7gH;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e035f4e3473so4670715276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 06:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720530749; x=1721135549; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxC/gRcWtM9gYFj2OOSSCX+40ETDyG7c7b+mG5DlP78=;
        b=zQNwL7gHrEPHNmiWmjKra0QO9+01erkRMTo92UAjG4bEI8WUsgVN1YQ8m6wqjg0C55
         d9eWvDkWHO9pTnWIQpYj8ldCHEn2kJXmoH0k7bCyCWd8Z5zeP6BRg2sq4UYnmo6sNfO5
         /reAliflJBQgg+is9zQxEIH0+fAH8AV/jYLemGPpnewmSALH91apc4rSlTqMzu6Bk+/1
         exv5unf5djFb6p89nxhmZE/oJa5ciFinFtmDaJSTGBH5UF5k+Vke+5xmXXZJw1+pTXua
         b6+ijVgsCgi410R77zzKDyV3VItWfR7Sg+KI1xrDQiR10hc0Nsp368whLxX9WyflEm/G
         v94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530749; x=1721135549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxC/gRcWtM9gYFj2OOSSCX+40ETDyG7c7b+mG5DlP78=;
        b=teGIBuQ3uPkt84g9p5CE2ahAzLTkbFLsntHB4pZwyLZnMuziSJ7U8+7RF1XYMGn9GY
         7H3Pqr+wMs+HZ41KIHlZoafXEMLMFFWytnNqSDEicChlQTG41k9w6zNEAVV+f6YzpUan
         5pjhTK2rlfDfKovHRa81ZDRuej+e3HH43CQWNq9dwpjsR/3RfyiqlJA8NrGhLeg/l/Fy
         Lm1oP6DwcVxJIbm4PysBsVer1p+tDW8Pm53OYzLXmFpJ5tpd1wRqzqBNdMR0LkEpPoL9
         lveUvN5PALE3GojFMhobVG1m1YvDm5dXCI9b781e6RyuVkI2EcA5tdXph47mTEtkDb8O
         +IKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWNy9QWGPmakTTxJ6IpCa7uvOuQyCZopY4BNn22nOkLY82AAxn4Om6Ybc/x8voiCmKFm8+Ffx/UDBZZlruIOw/6ofGaRYbCR2tW2tNY1jp4Qv1amuwBXhs
X-Gm-Message-State: AOJu0Yz3SFp9VmidXNE/YGdKOLW+65N76RNR3ftkO8GxcTnmnjly13DE
	mhVzmWsf/906e/s9gLeoy5a80NiBkmi4zFc8KAbRkFsCi6eJvPruazUr4K1zI/4hwr5wLrfeIVi
	/pJqP55xy6Kj9CNU6o9ObfWyVlbUAALpZ90/ttg==
X-Google-Smtp-Source: AGHT+IE4mrtvy7aFls/ibNpcIxHz63794Kc/C9GVNBJe83Px1n7dtRmlKFAubf5HVl2QARdQbKSxSLHzoqYIW4+5DZQ=
X-Received: by 2002:a05:690c:dc6:b0:644:548a:758b with SMTP id
 00721157ae682-658f0fb395emr30873477b3.49.1720530749132; Tue, 09 Jul 2024
 06:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240604080621.1885249-1-ejo@pengutronix.de> <04d0dd97-6e67-4d5c-a82f-e4ec5f0465f6@amd.com>
 <e2b4f7f59893c005511f1ab7f47d2b70cf91d0a0.camel@linuxfoundation.org>
In-Reply-To: <e2b4f7f59893c005511f1ab7f47d2b70cf91d0a0.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 9 Jul 2024 06:12:18 -0700
Message-ID: <CAOSpxdbEBs7ZT1M-ainOu7CnEOh5T6+_db-SN+FUqX7_xpdRVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] wic: engine.py: use raw string for escape sequence
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>, 
	openembedded-core@lists.openembedded.org, "Hatle, Mark" <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 13:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201658

On Mon, Jul 8, 2024 at 2:32=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-07-08 at 11:56 -0600, Gundlupet Raju, Sandeep wrote:
> > Hi RP,
> >
> > We do see this issue in scarthgap, Can you get this patch backported
> > to
> > scarthgap branch?
> >
> > Thanks,
> >
> > Sandeep
> >
> > On 6/4/2024 2:06 AM, Enrico J=C3=B6rns via lists.openembedded.org wrote=
:
> > > Fixes:
> > >
> > > > poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape
> > > > sequence '\/'
> > >
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
>
>
> You need to talk to the stable maintainer for scarthgap, Steve Sakoman
> (copied on this reply) about that rather than me.

I've got it, thanks!

Steve

