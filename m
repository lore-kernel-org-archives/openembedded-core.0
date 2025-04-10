Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EBEC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:46:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.32542.1744285599114619452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YpSxCcGn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d129c1aso512932f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744285597; x=1744890397; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LMvzMbv5FtFD+spDFsEMXnlHOKTXIKHJV3O/WGzzUyw=;
        b=YpSxCcGnNT2OHZFXtD/dEpGKwy5ZpFP10F5ZaBniES7AUm9xzE6v+YIqBCL/AvX8yg
         cLb3z8z7lksJx6xLo57r+nrO764GeLNxjVSJFaHShh9phasFDphDm7VJa2ZTMRTsFWV/
         nPy44R5nmWBfPwSqb/CS35ZXbbbuCoYR53csE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285597; x=1744890397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMvzMbv5FtFD+spDFsEMXnlHOKTXIKHJV3O/WGzzUyw=;
        b=g6i22S0c0g8Avy3t4Z40nVPfdIU6O4I25Q1zDMKf18xkM+kBdOtBvc3+B/wvpnw/Hr
         JNeBj1eY/tQzArM1biT9iSL5Kf5bZ8lFvJb2oQPX+m9rnwR/E/JwaqVC97YS9tLzR0BI
         7ftFbAHh6kGF5NVev5RNxCNBTOANeRQXX2iR80L7YjgH1h0oC+8SN1wWv2hlMyzEo6r1
         qoWqgkTzxzgQNfeZIuTrjL9bwTx4qXLC4dywdetB2vg+8ogyEsek+eFgzNf1ELyF9Wz5
         GecT2HhBzDjQkmP6R6m5+QFmrmhPnVtM1wlrL7PIyXro6T+gm708YFh4KuxdKq70AleL
         HJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCW50iqIQzPvN+qAI6R8TCGjKX+m8SX44xZ1VQoFD9giSSJrz+Z+HYnMyYmEI+BPu38L+KdAnTS8AwIa7MqOPTXpqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzo6oKD+aohxJBCDP9mTcVWP+2YwPhAGaa6EZ72pK5+mVUlo6+X
	LTvZKR/HozdYUIV30Xl+oCD93XAMqD2BqWToRQTGpnDCu3d/nuXYf2DW1aesJUo=
X-Gm-Gg: ASbGncuUmi0+LssMFQGLSFBCUfx1MuDE5p2O1BA5ZNfOMUbmYbszWniJFjBaoz+a3um
	WPKvleeXScABfE6lg+LugZg2396cGSOlOwWJdC6m/YlVrb1sD2SFRS2gEpf4cFrTEBYyDhSOsiE
	nsoOSBwcCg1gobrJ/h3WdW0gq7qnQGn2N+0at6/g4SIDQiAV4OVVNvyptHqu7AI/DvAgKpfyNEo
	YlCzjfSnA9VU4uNS4FeM2aXq13aErNZm+BmOWR5rqqRkQAv+1tUPGPNoksY6eYnNOX5omdCfUAa
	Q0x6D8daKtYBokEu5uvMEElepBN4KwhywMRbP9xB+D9NaW1CgaQrnK3iDnI285BDvm/YwFBK7eG
	E9Zw6Xff/cDQTv6Az2R1INtnUe9h6Fw==
X-Google-Smtp-Source: AGHT+IEwygSUgCOkJCcnym1z+X0y2/ZuKVirFnr2UFU9DHY+sBBuIgABfmZVj1P2m5mrfYUQ0GySqQ==
X-Received: by 2002:a05:6000:2a8:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39d8f2761fdmr2067554f8f.12.1744285597253;
        Thu, 10 Apr 2025 04:46:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c53sm48503645e9.14.2025.04.10.04.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:46:36 -0700 (PDT)
Message-ID: <ca371ee8ce93c922cfa744c6ab7091979485cd68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/1] libunwind: 1.8.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Schmidt, Adriaan" <adriaan.schmidt@siemens.com>, Khem Raj
	 <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>
Date: Thu, 10 Apr 2025 12:46:35 +0100
In-Reply-To: <AS4PR10MB5318838632DD23699735E538EDB72@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
References: <20250403081907.3422293-1-adriaan.schmidt@siemens.com>
	 <20250403081907.3422293-2-adriaan.schmidt@siemens.com>
	 <58ea2252-aa7a-4fbb-bada-68153dd30e7a@gmail.com>
	 <AS4PR10MB5318838632DD23699735E538EDB72@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214652

On Thu, 2025-04-10 at 09:43 +0000, Schmidt, Adriaan wrote:
> Khem Raj <raj.khem@gmail.com>,Freitag, 4. April 2025 03:03:
> > On 4/3/25 1:19 AM, Adriaan Schmidt via lists.openembedded.org
> > wrote:
> > >=20
> > > -COMPATIBLE_HOST:riscv32 =3D "null"
> > > +COMPATIBLE_HOST:ppc:libc-musl =3D "null"
> >=20
> > Why do we need this to do this ? I see that a patch is added and
> > one is
> > removed to support ppc32/musl support.
>=20
> After some more investigation: There are issues on ppc32/musl when
> building without "--disable-tests".
>=20
> Will post a v3 to:
> - drop this line
> - drop the "--disable-tests"
> - add "-latomic" to ppc32/musl LDFLAGS to fix the build

Sounds good thanks. The commit also needs a proper commit message and
signed off by line.

Cheers,

Richard

