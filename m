Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C10C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 13:57:42 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.15977.1706795860878522005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 05:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=12xodW5G;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55f2b0c5ae9so1217083a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706795859; x=1707400659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n69VNLc+cMGz/cBV4of2lLji2mKTdd8UqALA5VekEZo=;
        b=12xodW5GqUqYqgMOAs5aWF2+IRG5dAXl3IfeTZrnECECK73bM7CZneM0L6EXSk9YSS
         rIFmaDZF/WQr9kPt3ApTs6GnPzqVzpOMTPw1UqKc3spQ1ajjxHxF4xtrE3RbKgO7kekZ
         DeqdtaAD+kGhKWKruaNJdntcXsiJ1WP7VCJn3NHXNrFIzaTw8/2jBbj7LPPPVHoTcILR
         onafQKAnDfxxuTlgUmAOZFGKIYUQGytuWSMOLM9MOlB+sYWwbmyIAwU3pv5liEl5PVOc
         DBfOnBGGGPpGqkySoGupBuxvQ4ulK2R7++QZUj1/SizycR5JMWTDj8lW4S1ha/JdYCvj
         /Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706795859; x=1707400659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n69VNLc+cMGz/cBV4of2lLji2mKTdd8UqALA5VekEZo=;
        b=enqg7oOXB5bfI2JLQHLYvaxIWXPH1oyiCcNAzkgaALnVxh6EsNrdsUnxlvs2JZ7/33
         Th+33bhdduf/vWfgHqiCjYG59yOoyM4VE4kwsF5Kjao8hBjph8LrQ+hZFhLhdYFhH8wr
         fgr0fRIwFlCmDqV9vw8t3E6XIKJOJr54/XvVJAOO/pMS72/i0rerxrrN+f3Jpcc58aXH
         gc2MEwGfbVWTQ5sxndiFPDDXr9kSpuXCEi+0XCYxupS3kABi5K21HASd/yZ41bl0/+qY
         hWA0lJUeeyOl1T0c2Ud9JRsaZem2jhrn0dxVkFo4Qf4PZcc2JZwCer5NBp2iz0oQCcos
         Fmuw==
X-Gm-Message-State: AOJu0YzSs9sDEdrJUWB8tIMvFW1+631moZm7mb9k46jH4B1LmT7cq0QY
	6rVpmnHUjjRnXaIqc8/WmlqjCFzcDht42lzDDf4d3MKMDuthjU0mRFcQegXBgufD3jj0g4uHI4a
	Vvq7Tr71HJxXQjs3W6R0G7OtuLwBiIBXu/PGiqA==
X-Google-Smtp-Source: AGHT+IGRm/+UzgPNXSQHKCfclx+W2wPLZr4ntYLs8fNs9Vr+IXpn4YPKKqHK+L6mKoZ9Lob0ONqEq3mCnKnALNxlVYc=
X-Received: by 2002:a17:906:22c8:b0:a35:6438:a935 with SMTP id
 q8-20020a17090622c800b00a356438a935mr3657194eja.55.1706795859264; Thu, 01 Feb
 2024 05:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20240128165358.657852-1-peter.marko@siemens.com>
 <CAOSpxdYH5AYuEQ3P3dzMWXZmEkaC5D02XLsaNzk+f8vvG89ZWA@mail.gmail.com> <AS1PR10MB56970AD34141CD5978179AE9FD7C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56970AD34141CD5978179AE9FD7C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 1 Feb 2024 03:57:28 -1000
Message-ID: <CAOSpxdbSeJGs5Hfq19yboUNXa4E25Bho4gSF_LT+4Vn9-F4Ycw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] sqlite3: ignore CVE-2024-0232
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 13:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194589

On Wed, Jan 31, 2024 at 12:56=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.=
com> wrote:
>
> -----Original Message-----
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Monday, January 29, 2024 15:19
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][dunfell][PATCH] sqlite3: ignore CVE-2024-0232
>
> > On Sun, Jan 28, 2024 at 6:54=E2=80=AFAM Peter Marko via lists.openembed=
ded.org <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > This CVE reports bug which was fixed in 3.43.2 by [1].
> > > Code analysis shows that it is fixing caching issue and this cache wa=
s
> > > introduced by [2].
> > > This landed only in 3.43.0 so 3.85.5 is not affected.
> >
> > I think you meant 3.31.1, not 3.85.5
> >
> > In cases like this where the database is in error it is best to send an=
 email to cpe_dictionary@nist.gov providing the above data and asking them =
to fix the issue. They are usually quite responsive.
> >
> > Steve
>
> Hi Steve,
>
> I have sent v2's with corrected comments.
> I'm sorry, but I'll leave discussions with nist.gov to others...

I've sent a database correction request to cpe_dictionary@nist.gov.

These patches will be held pending the result of the request.

Steve

>
> Peter
>
> >
> > >
> > > [1] https://sqlite.org/src/info/5b09212ac05615fc
> > > [2] https://sqlite.org/src/info/2dbb22c75e86f2e3
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/recipes-support/sqlite/sqlite3_3.31.1.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> > > b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> > > index ef12ef0db2..b2d8f9f1dd 100644
> > > --- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> > > +++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> > > @@ -25,3 +25,5 @@ SRC_URI[sha256sum] =3D
> > > "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b5
> > >  CVE_CHECK_WHITELIST +=3D "CVE-2019-19242"
> > >  # This is believed to be iOS specific
> > > (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
> > >  CVE_CHECK_WHITELIST +=3D "CVE-2015-3717"
> > > +# This was introduced in 3.43.0, 3.31.1 is not yet affected
> > > +CVE_CHECK_WHITELIST +=3D "CVE-2024-0232"
> > > --
> > > 2.30.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#194444):
> > > https://lists.openembedded.org/g/openembedded-core/message/194444
> > > Mute This Topic: https://lists.openembedded.org/mt/104014792/3620601
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > > [steve@sakoman.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

