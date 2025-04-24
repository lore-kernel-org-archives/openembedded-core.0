Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9453AC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:43:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.12033.1745491412108294731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q1vasnUY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so7964155e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745491410; x=1746096210; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BPm59kh5zDsrGpZMRjU9RxKMpd3t/8c5D28TylMIgPM=;
        b=Q1vasnUYtirPxweOBI619LwYni7UlF2W+NLPmpjrQVlLXKNzAPNZi90HuB2cbccqVt
         kY9CTcuKriQX9c1Hn/v/JtPm31w/3KQVqxYD/GXVyYTmu0v15GiZeNHN2NKbafAGP03v
         fv8w5XpBBLcf9jetXhJSd4gajGkJPBBLFn9dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491410; x=1746096210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPm59kh5zDsrGpZMRjU9RxKMpd3t/8c5D28TylMIgPM=;
        b=MdU14e2L8B2ypOFFHl/Yo1Rfg+WR11hNtYV2UNWu/e8yVqTfyraU+kQkgH/anUSlbp
         bsZxlcxYbP90KeE94QWD7a5JMLkBKRHVWWFj9N1JyBVXkydr0hwboUKQglcf1iGwsWwD
         /AiNjIwLeINzsAYF+AT3u/q3Ot3vvN7M9mQxzkarrci67qcFEYVLA/gbdI0fLNsjdlfm
         H9dai2g4KHk/H8cu0EhmhvI6ci8z6i8tT5pd95hxFZi4HlS7kJC0H9NPUtV1wJ+9oR3u
         oh5mOb3QOEaHfiBLVKUxEiz/TAZmyXiJ+0eI5tZGxifUOzRlDt8hdSE+IGBTXFONLPD8
         IFvA==
X-Forwarded-Encrypted: i=1; AJvYcCVsGr9C7c9ihnyO6/SMbRFCCJBcU3ByMQanilo9xoQ+fwd9hJTA6wP2JRYYeduOCubrCOvsZIh0Qc0xLmRI4kAErA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywl94FFKJ4JY7mFjYmnFXRa6h95+uHslQ270MMcspRxgHLP56NK
	z2GWQ6Em7SA9wm79A9EUMOMvgcy/IME3+8SH4A7jy0DP5NqXYPa0cwiG+8TmDi4=
X-Gm-Gg: ASbGncs34FhPgkEL/2e9fI0EQIYHZLm+x8cx8jW6kgTPFQ4WB104PRRfAzvLaqK/bTb
	uWTuhpSbNl72eKGNj2o5p4SarZc8SFFo1VyasRvJlaXLdh9y2+o2I5HtHGS2Il8VeAheihl/bBd
	klYPP5+0kGeEOBtLV/bULYlW4yvqmnTSaE0jYnf7/cNHn+EDYJkqjUaBmgFVD2MqWCdbxbphXE1
	RPAKHsfISfxBxNTLHyTUx8Pv4KwAsI0D+jtxWJ8ZdnK7t70NukACjciWNk4mCicVzWeNwpKhnY7
	EV58zviJJSb2dPTU5hnZJt4LzOM6v30+4rMsTo7mtOfnqbRWtjzwxIKANg8rpp5Ck3Aq2h8ADH4
	qnG/lC0cdIWAiKfhpPExOaTJOX+drSQ==
X-Google-Smtp-Source: AGHT+IGxKNEJcym3m8460+AxEQ/fVzsDILnGAGnBDWbX13saIt5/aMR3qvJ3vlJhePY9v5dJVxL4TQ==
X-Received: by 2002:a05:600c:3149:b0:440:6760:d06a with SMTP id 5b1f17b1804b1-4409bcfa3c8mr16343825e9.5.1745491410158;
        Thu, 24 Apr 2025 03:43:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm15599135e9.24.2025.04.24.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:43:29 -0700 (PDT)
Message-ID: <65e531299bccf821eafb9bd889edeefa7a77a0c6.camel@linuxfoundation.org>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A?= [OE-core] [PATCH] gzip:
 upgrade 1.13 -> 1.14
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "alex.kanavin@gmail.com"	 <alex.kanavin@gmail.com>, Khem Raj
 <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2025 11:43:28 +0100
In-Reply-To: <OSRPR01MB11597271B174135C69A00BCAE9BBA2@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250417102130.800-1-leimaohui@fujitsu.com>
	 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
	 <OSRPR01MB11597271B174135C69A00BCAE9BBA2@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215356

On Wed, 2025-04-23 at 03:53 +0000, Yiding Liu (Fujitsu) wrote:
>=20
>=20
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> =E4=BB=A3=E8=A1=A8 Alexander=
 Kanavin via
> > lists.openembedded.org
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B44=E6=9C=8822=E6=97=
=A5 23:25
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7 <=
leimaohui@fujitsu.com>
> > =E6=8A=84=E9=80=81: Denys Dmytriyenko <denis@denix.org>;
> > openembedded-core@lists.openembedded.org
> > =E4=B8=BB=E9=A2=98: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
> >=20
> > On Thu, 17 Apr 2025 at 12:21, leimaohui via lists.openembedded.org
> > <leimaohui=3Dfujitsu.com@lists.openembedded.org> wrote:
> > > +Subject: [PATCH] tests/reference: fix invalid option of od issue
> > > +
> > > +ptest issue:
> > > +| od: invalid option -- 'A'
> > > +| BusyBox v1.37.0 () multi-call binary.
> >=20
> > Instead of working around busybox od limitations with a patch, ptest pa=
ckage
> > should rdepend on coreutils to pull in the real original od.
> I will continue this patch on behalf of my colleague
>=20
> Thank you, I know add rdepend on coreutils is the usual approach taken by=
 oe-core for such cases.
> But have you noticed that gzip source code recommended to use perl instea=
d of "od" if " If using "od"
> is not portable enough" right before the error point
>=20
>=20
> $ vi gzip-1.14/ tests/reference
> 42 # Ensure that compressing these simple strings always produces the sam=
e bytes.
> 43 # If using "od" is not portable enough, consider using this:
> 44 # perl -ne 'printf "%02x ", ord($_) for split //'

It is a maintainability question. Is carrying a patch doing this worth
the effort of doing so? It adds maintenance overhead for us and I'm not
sure we gain any significant benefits from it.

I think I'd prefer just to add a ptest package specific dependency on
coreutils rather than carrying a patch we could never upstream. We
should add a comment about why it is needed.

Mentioning the issue to upstream might able be helpful as they might
change their test if they know it does cause downstreams some
challenges.

Cheers,

Richard

