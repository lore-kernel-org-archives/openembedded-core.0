Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A05C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:17:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.48460.1752758258290499034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iUR2Q5ni;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45600581226so9810155e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752758257; x=1753363057; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umwr6PN7/f4MxNF83UyI9qkGgXQ1BQe2tdI2tS/AXdg=;
        b=iUR2Q5ni28I0qOXSXU47xKMTQNYkdc+mFOqi4dkCQeowXbgbJabx/sEp/HQcT6FQxe
         EuhQvEGKTDv7z6ikRWkyRqxHB3Tm6wpmtGhS6y/0wtpxLOpImbJsJDmO8MLiypACh3Gu
         oECe+JlYzsmfbmlBk+kBxhzNjSzskbSWTc+MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752758257; x=1753363057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umwr6PN7/f4MxNF83UyI9qkGgXQ1BQe2tdI2tS/AXdg=;
        b=q7pKbRfAA2RqtKoplvValViAuAVXQFiQvxNr27zdKglssFt5nULcMp1dzBER6DNwx0
         8tkMioZpovIpyOiKexsyEr02RA7TyG5gzBkuCCOMLxlvtIhJezQmNPGTnrBapGELfSh4
         /uCRFjwWHRgfQJ+Y8+9fRNBdV94PDkGDGX1XpZl6b48QGXbJKY/je/ea58TT4tsYOIRn
         gqIYQoZTdESK2EyAbed6mFy+ZdI2ifWdDa7e9FVuNVrN+8jo8hDtC2+SOeMDeHz4E8EX
         bbnIhNGBBy0BbK2BVP9hEz8vBaHtcSxEqNnv1Qyl2JWUd2UqecNmSBhgQOdSWWV0qXIx
         4mgg==
X-Forwarded-Encrypted: i=1; AJvYcCXB9LjJ6ubv8+zMaqcolhb3yEGsrZ41fPTZvTrVOyEjLJAwoMg0APn4NnGYj5lnLivs14D3puw/vl+LMSWRr3VAtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YynOXeOzFfQzLSdIWsAyyVnCok5IP4hoyjdZ5uHA6nFk+XN6k38
	mjBZT779qWk7ZHIb2BG0tpJZg3LetN0L+i0MZKk3EpMJ4DY1hw3w+tzjy3+OgzT7kyFK13tvYID
	APe84
X-Gm-Gg: ASbGncutyWh2CctnXAESimFjppBnd0nrl+lqE8/d0PWxXhmtu+nUHee5q7dgQ/Dew7d
	Um6aeAi7GCpsocF7dHnbM/c1ujTcexeun1KRMoSjvgkzoR1yJ8o01aNKzhwSIqayxHDhuHXVrrb
	LvZKNcsxB5PrsA4bGihWWQuh8I7kRwhGHD7B7S1hKe1CjVBPl3tw5H5d0ZteXBrxO2cdufIOj0+
	ygyL/S1ArgiNFNg2KISArwzoUtAhvx5lsVqI+6hH2ZwTUxqIdmhWYrc0zBfE+CcXsibtIVtb+WU
	Fq4pMEMAqLfDBA8p/xT3QncpKsPu0cnJ807Ndz9DakjHZIdckvGXDITho7pFf0gwKNB6KwIIGTJ
	4LsRieGf6GIdqaLEwnCZZCuNN1chckZ9v9pMbcPaoqWQSGGdD+RaVHpaFuMaZuIy2Pssec2jMd3
	ihATm24yiwz88=
X-Google-Smtp-Source: AGHT+IF2GR6wVLk7J0o70N8u3EV2MswOTGJ7LkfrNlclds3w8343mIJS9h7er3YPmRBvVZ+K09/xQQ==
X-Received: by 2002:a05:600c:a55:b0:456:1442:854 with SMTP id 5b1f17b1804b1-4562e28616amr61270205e9.24.1752758256566;
        Thu, 17 Jul 2025 06:17:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c05c:a45d:32ee:c317? ([2001:8b0:aba:5f3c:c05c:a45d:32ee:c317])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c87esm50434595e9.33.2025.07.17.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:17:35 -0700 (PDT)
Message-ID: <1a2f4fc1cc4dc0b911968695c4ccb60764f8bf6d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the
 SRC_URI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dmitry.baryshkov@oss.qualcomm.com, Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2025 14:17:34 +0100
In-Reply-To: <27vjhf4ojfpwvsbdxkboo5hgoaaj7ongeax5icelqv7trobh5c@vfj4cn4mm5h2>
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
	 <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
	 <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
	 <27vjhf4ojfpwvsbdxkboo5hgoaaj7ongeax5icelqv7trobh5c@vfj4cn4mm5h2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 13:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220543

On Thu, 2025-07-17 at 16:00 +0300, Dmitry Baryshkov via lists.openembedded.=
org wrote:
> On Wed, Jul 16, 2025 at 05:14:34PM +0200, Martin Jansa wrote:
> > On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via lists.openembedded=
.org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > >=20
> > >=20
> > >=20
> > > On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via lists.op=
enembedded.org <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org>=
 wrote:
> > > >=20
> > > > It seems under some circumstances the tag in SRC_URI can prevent th=
e
> > > > recipe from being unpacked correctly. Drop it in order to let bitba=
ke
> > > > handle the recipe correctly.
> > >=20
> > >=20
> > > I think we should look more into underlying problem. I have seen proj=
ects create release tags that do not belong to any branches and can create =
fetching issues using nobranch=3D1 helped in such cases
> >=20
> > I think this happens when the git repo tarball already has the
> > revision from SRCREV but not the tag yet.
>=20
> Most likely. I don't follow exact timeline of the repo, so it well might
> be possible that the tag was pushed way later than the commit.
>=20
> > Adding tag param to SRC_URI only when upgrading the version helps in
> > some cases, but not when the tarball was already created with the
> > right SRCREV.
> >=20
> > The only work around which worked for us in webOS builds is enforcing
> > to use annotated tags and using SRCREV of that annotated tag (not the
> > SHA of the code it points to), then either both (SHA and tag) exist in
> > the tarball or neither and the repo is updated before the tag check.
>=20
> This might work, but not all repos apear to be using annotated tags.
> Maybe we should extend bitbake to check for the tags in Fetch code too?
>=20
> Khem, Richard, can we please pick this patch?

I'm not keen to start dropping tags without understanding what the
issue is. The fetcher should notice things need updating and pull in
the right pieces. If that isn't working, that is the issue we need to
fix.

Cheers,

Richard

