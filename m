Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F416FC5938
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:49:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68167.1772106559035791366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 03:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YM60U/4f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso6483915e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772106557; x=1772711357; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wODEL5HWjLkxJE0Lfz6459aBVrOd8nkszO/vdQcYgZg=;
        b=YM60U/4fc1Dee/VNfuqkNdkeGoKEzl/l2y5zKSIwnhIlBXlucAbfOD0WDMI59iR838
         AfcKjJP7pQIYKqcbxaYRzoKu9+aHt4WrW5cfyzA0isI30aOM63YwNxKrzkteQ8OUeI4l
         1oa6CAGQnTyKIW5OfLknnkGe09aAkwEkPK0tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106557; x=1772711357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wODEL5HWjLkxJE0Lfz6459aBVrOd8nkszO/vdQcYgZg=;
        b=ZPv9lyrKzlQryumqu8KjwU3fcKxReSBsm9kwau3QvJamT4AcBp27tCXweh5dsEUVaN
         hhF96Zwg4E7iJ78lPHcv8tswPKlZRKzcESzBY7CD5RuDjgjhQMiwdxfP+ukwQUSPqik9
         hRJ+b84k0/sFMG2+emErV7KZ8JTKxDKXmXTXGfcMVNSyON5/B7mM5m1wfwa6R5OUAmfP
         Lo+7aQfmzh9r5j18AaBoNJKdY3RB5vFSuMlvJ6DUpsh38kzz3PlmZzNQOkiMxkwm3FOi
         L+c05TrgL8dbnORC72sNgU6gFIctoG4CtCufA5ZKXFHhdyBeu3Hjy/XNQAcEUrxlnO2A
         gZYA==
X-Forwarded-Encrypted: i=1; AJvYcCUStzCHRV3LHyy8vYKjLHWw0exWRcKQ29xx4Ywg93wH6nl34pbrffdMZRNV/GAS2k5WByT0YsJbwCccvXpso2H45g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLWs6PTxvDx6XYEEA2rWNcRwCrFCwEZPys6T9mf32dHd6jK2Wk
	MAUSemaUqKu/AhWfug97OoKgoNc9MPJQj0jKtZ8CdJtlGLPXe9B/pJ9CwfSRH9tgjK0=
X-Gm-Gg: ATEYQzytzWApAyrCro/8Q4H5cCakf545ju97zhop3eoxYHfDOzHsbiBm7GTBmKtVPru
	NaFB0EOvR6UM7IyD6sUlagCmRU8/n7AVsvDbDphqqTiZzt+LN6jdrUKkFz5h3uuQfrffsc14MDy
	OkxyH0UFVWut7Gv4oxejjE3USdi4y+neLbl29wjURJfN6SLPZWFASt9wC4XyiG3KNxlzKg4r8S2
	JqcDOqFon6zWCaDdKJKPkLXNEgewIoQHbjoJw3re+mCZUIjdYtbwYEwMLT5fFZKrtLmi9XB2x80
	94CoRBpLI1l+o6w9rkHmrm4lY7xMX+qri4aRKd99hdL0F6K6zzJOj9yiZNf8rYPX3fNs9bSEO8o
	/BwlhHC690o85brazoTxItjAW8h0exaSw5bPzFQ+PP9nVZOf4zjIXIVgd5PTVpJJJle806W9P2R
	VsEBdwiT1pMmxolxMBA8OqHueVB4YbPSGdvYG8pWj3x5E73COSyGAaEh/fV/ffKs46XsbmGydoQ
	FaclZeakhiYVuE=
X-Received: by 2002:a05:600c:64c6:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-483c3de687bmr32190095e9.17.1772106557326;
        Thu, 26 Feb 2026 03:49:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6? ([2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789fbsm55250995e9.1.2026.02.26.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 03:49:16 -0800 (PST)
Message-ID: <5b7f9fe72cb1863826c7a7757c90eab97853f134.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nicolas.dechesne@oss.qualcomm.com, Paul Barker <paul@pbarker.dev>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "openembedded-architecture@lists.openembedded.org"
	 <openembedded-architecture@lists.openembedded.org>
Date: Thu, 26 Feb 2026 11:49:16 +0000
In-Reply-To: <CABWbsgD=OF0G4kXyGCDCSByVrd0u4jnxHQipFjdLueoiv-99yA@mail.gmail.com>
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
	 <CABWbsgD=OF0G4kXyGCDCSByVrd0u4jnxHQipFjdLueoiv-99yA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232003

On Thu, 2026-02-26 at 12:37 +0100, Nicolas Dechesne via lists.openembedded.=
org wrote:
> On Wed, Feb 25, 2026 at 6:44=E2=80=AFPM Paul Barker <paul@pbarker.dev> wr=
ote:
> > I've been briefly discussing stable branch update policy with Yoann.
> > There's a few recipes in openembedded-core which I would like to propos=
e
> > that we always update to the latest version on LTS and stable branches.
> > These are recipes typically providing data that is expected to change
> > over time, with little or no code.
> >=20
> > You could say ca-certificates is already covered by the fact that
> > security fixes are acceptable for example, but a clearer policy would b=
e
> > better.
> >=20
> > Any policy change will go to the TSC for approval, the goal here is to
> > get some review and input so that a concrete proposal can be put
> > forward.
> >=20
> > The recipes that come to my mind are:
> >=20
> > - ca-certificates: To allow access to HTTPS resources we need to keep
> > =C2=A0 these up-to-date.
> >=20
> > =C2=A0=C2=A0=C2=A0 - Keeping this up-to-date is common practice in othe=
r distros.
> >=20
> > - tzdata: To stay up to date with timezone or daylight savings changes.
> >=20
> > =C2=A0=C2=A0=C2=A0 - Debian takes upgrades to this on stable branches
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (see https://tracker.debian.org/pkg/tzda=
ta).
> >=20
> > - mobile-broadband-provider-info: To stay up to date with provider
> > =C2=A0 changes.
> >=20
> > =C2=A0=C2=A0=C2=A0 - The README file for this project says "The Package=
 contains only
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 informational files so it's safe for dis=
tributions to grab updates
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 even during feature freeze and maintenan=
ce stages."
> >=20
> > What opinions do other folks have?
> >=20
> > Are there any other recipes we should include in this list?
>=20
> I know this is going to be controversial.. what can we do to keep
> linux-firmware a bit more up-to-date? the recipe in scarthgap has not
> been updated since it was released. Other distros deal with
> linux-firmware in various ways..

The challenge is that linux-firmware is a totally different thing.

a) We have little idea what the internal changes in the firmware actually m=
ean

b) The liunx-firmware recipe is complex and changes a lot

c) The firmware in the codebase has very different properties and
change controls, there is a lot lumped together and QCOM has different
policies and timelines for their changes compared to other vendors who
have firmware there (for exmaple)

d) The linux-firmware recipe itself has caused all kinds of regressions in =
the past

Yes, we have done a lot to address d) recently but it is far from clear
we would be safe due to the other issues.

Cheers,

Richard






