Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C6CCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 08:56:27 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13431.1762851378078020476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 00:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KoxvlINU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.217.54, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dd8988d098so1388115137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 00:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762851376; x=1763456176; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBXv6XlGDyHUNVm/kTjPuWAxGL+IJBBASKBGIgzsF8E=;
        b=KoxvlINU7FHDmc9Xz1YBs4Qnc+5ByiBrOwyGr8oRF3HIs4m5RVoediS9zRFTLmfeOo
         o61zdMp0P3JtYMcrZ4h7yMYDDblkJbrfwNNE4Kh9we5Oa7LIdDbBaI/VsLRQd6rkRcys
         e5Ed/1uQ6zi3IaMseyzYmzdW0zI1KFMEyjn5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851376; x=1763456176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VBXv6XlGDyHUNVm/kTjPuWAxGL+IJBBASKBGIgzsF8E=;
        b=CcsCHJDUB+fdYeWShMscL8idpXLahWF70Tk1ZTLc1ptQGUxd3mQuscE7ELboDBc0RC
         lEP0crjYdDywW1gCS2T6rFIm0OGBaBx4yLv3NhkS6ul7GL78v9waqitCIIuf+6/njPmq
         7qRdp35oD0gehJRHROWGHjo3+4Qbl93AXhyWTpy7lsxRz4/jYMIYDWxA9Ne9LZtRJrJc
         v/KylRloc+kXSEk7n1ZBgSVaSMAfs0sw3jT4Pk5RkZ7EN5SEEyjUhei9wCkyVYAmCnK5
         F5i2xow0zNi6BY8OYROhID/hvCQYoxXF9Ur1ojHX8oxt0oTK0Ibseu1poaYlIRBbrNQ7
         gM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyYwRMD3gp6IqH0r4THJB0F+OzGztI0DqWh4R/0FXiqNqEKQKIOjybTCNZU8pnV1tmnTjyujtSCzTY0HMwIuSlpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwftacLy2a5K1Mi1ykeF48b6iTiLRxDVrUiZbghOovDfMx8syd0
	1gG6Qp053Qdm8uyQff7mhoF1BUP8IBy61OWNlYpIIdR5OXQPZyBAieWDzTwervmNpxcoliy57/w
	4jq2C4mfUK8R7Gr2CnmvVOaly/Q8+q79wDDN+3MKddg==
X-Gm-Gg: ASbGncvZjea+SxeN3tTPCCxN6smAKZ3cYY0iCgAxedqs8m5j744hB0O09BBS/XVU5de
	He3coQ5pjvyg3mG4q5QE4ZGsbgc6KwoUzem9qp8ETrYJncwWEsgooBiOX3Hzv8DScaeqT3Twb+K
	6GhP/wj3GSZr6nYJuzfpgcRdIGUnZTZpzeMLcUgnAy9lZ3UxjkJDPI2f8mqNP3V2Lyg0aHl2pKw
	Daeit7aNluy7puz6q6HmSqFs/f0O8QWOFOI5lp0U1TjwaZvnXMFZUfPRJfsn01z5gNZcghmBydI
	+z2g1B/c
X-Google-Smtp-Source: AGHT+IF1RJOdGHQGvBCCw/SHPcaOaRJlaDGAF/W2+amNBqMbLJg814ob79mW8e4mCwr68tOyks4aZqRtsC4KJGusz7k=
X-Received: by 2002:a05:6102:6110:10b0:5dd:f9c2:5505 with SMTP id
 ada2fe7eead31-5ddf9c25924mr293914137.20.1762851376580; Tue, 11 Nov 2025
 00:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com> <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
 <AS1PR10MB5697F694A61CEF460D80F25EFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAApg2=SyfWMcE2OAknOQJRx4uwysiz9bdWnNxR-pPfLb9SgR1g@mail.gmail.com>
 <AS1PR10MB56971CEED209F3CDBFBBB23BFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CADfgfoa0d+-dN2qHm2aXJsyuo5gyXiMgfFkyKzuyhcokgSCrfg@mail.gmail.com> <AS1PR10MB5697EBEC620A0E63356EF08AFDCFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697EBEC620A0E63356EF08AFDCFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 11 Nov 2025 00:56:02 -0800
X-Gm-Features: AWmQ_bmCAID4jfu972du0VzjMOwNwSd2Q2fZFCtID69uF1PSPKYSm8z3aT4dB8Q
Message-ID: <CADfgfob3WmAjhQiyT_eNWT0z5n34ZC0w4hfO0TCPwFX7kf-o_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
To: peter.marko@siemens.com
Cc: Marta Rybczynska <rybczynska@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ross.burton@arm.com" <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 08:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226152

On Mon, Nov 10, 2025 at 11:42=E2=80=AFPM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
>
>
> > -----Original Message-----
> > From: Michael Halstead <mhalstead@linuxfoundation.org>
> > Sent: Tuesday, November 11, 2025 6:31
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: Marta Rybczynska <rybczynska@gmail.com>; Richard Purdie
> > <richard.purdie@linuxfoundation.org>; niko.mauno@vaisala.com; openembed=
ded-
> > core@lists.openembedded.org; ross.burton@arm.com
> > Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
> > database itself
> >
> > On Mon, Nov 10, 2025 at 7:31=E2=80=AFAM Peter Marko via lists.openembed=
ded.org
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Marta Rybczynska <rybczynska@gmail.com>
> > > > Sent: Monday, November 10, 2025 16:29
> > > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>;
> > > > niko.mauno@vaisala.com; openembedded-core@lists.openembedded.org;
> > > > ross.burton@arm.com
> > > > Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in =
the
> > > > database itself
> > > >
> > > >
> > > >
> > > > On Mon, Nov 10, 2025 at 4:18=E2=80=AFPM Marko, Peter <Peter.Marko@s=
iemens.com
> > > > <mailto:Peter.Marko@siemens.com> > wrote:
> > > >
> > > >
> > > >
> > > >
> > > >       > -----Original Message-----
> > > >       > From: Marta Rybczynska <rybczynska@gmail.com
> > > > <mailto:rybczynska@gmail.com> >
> > > >       > Sent: Monday, November 10, 2025 16:00
> > > >       > To: Richard Purdie <richard.purdie@linuxfoundation.org
> > > > <mailto:richard.purdie@linuxfoundation.org> >
> > > >       > Cc: niko.mauno@vaisala.com <mailto:niko.mauno@vaisala.com> =
;
> > > > openembedded-core@lists.openembedded.org <mailto:openembedded-
> > > > core@lists.openembedded.org> ;
> > > >       > ross.burton@arm.com <mailto:ross.burton@arm.com> ; Marko, P=
eter
> > > > (FT D EU SK BFS1)
> > > >       > <Peter.Marko@siemens.com <mailto:Peter.Marko@siemens.com> >
> > > >       > Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime s=
tamp in
> > > > the
> > > >       > database itself
> > > >       >
> > > >       >
> > > >       >
> > > >       > On Mon, Nov 10, 2025 at 3:16=E2=80=AFPM Richard Purdie
> > > >       > <richard.purdie@linuxfoundation.org
> > > > <mailto:richard.purdie@linuxfoundation.org>
> > > > <mailto:richard.purdie@linuxfoundation.org
> > > > <mailto:richard.purdie@linuxfoundation.org> >
> > > >       > > wrote:
> > > >       >
> > > >       >
> > > >       >       On Mon, 2025-11-03 at 14:31 +0000, Niko Mauno via
> > > >       > lists.openembedded.org <http://lists.openembedded.org>
> > > > <http://lists.openembedded.org>  wrote:
> > > >       >       > This should help to avoid problems that will occur =
if the
> > > > modification
> > > >       >       > time of database file itself is altered e.g. by una=
ssociated
> > > >       >       > process(es) on the file system which hosts the data=
base file.
> > > >       >       >
> > > >       >       > Since this change updates the database structure by=
 adding a new
> > > > table,
> > > >       >       > bump the 'minor' version number in database file na=
mes to enforce
> > > > full
> > > >       >       > database fetch. This should also iron out e.g. situ=
ation where the
> > > >       >       > database might have inconspicuously omitted entries=
 due to way
> > > > in
> > > >       > which
> > > >       >       > the mtime of database file itself was relied upon.
> > > >       >       >
> > > >       >       > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
> > > > <mailto:niko.mauno@vaisala.com>
> > > >       > <mailto:niko.mauno@vaisala.com <mailto:niko.mauno@vaisala.c=
om> >
> > > > >
> > > >       >       > ---
> > > >       >       >  meta/classes/cve-check.bbclass                |  2=
 +-
> > > >       >       >  .../recipes-core/meta/cve-update-db-native.bb <htt=
p://cve-update-
> > > > db-native.bb>  <http://cve-update-db-
> > > >       > native.bb <http://native.bb> >  |  3 +
> > > >       >       >  meta/recipes-core/meta/cve-update-native.inc  | 59
> > > > ++++++++++++-------
> > > >       >       >  .../meta/cve-update-nvd2-native.bb <http://cve-upd=
ate-nvd2-
> > > > native.bb>  <http://cve-update-nvd2-native.bb>
> > > >       > |  3 +
> > > >       >       >  4 files changed, 46 insertions(+), 21 deletions(-)
> > > >       >
> > > >       >       I am a bit worried about this since it takes what is =
a simple mtime
> > > >       >       comparison and means that to check the database you n=
ow have to
> > > > lock
> > > >       >       and open it which is comparatively expensive.
> > > >       >
> > > >       >       What kind of "unassociated processes" are updating th=
e mtime?
> > > >       >
> > > >       >
> > > >       >
> > > >       >
> > > >       > I second Richard here. If we would really want to keep the =
date
> > > > somewhere else
> > > >       > than the file
> > > >       > timestamp, we could create a simple file that stores it, wh=
at is way
> > > > simpler and
> > > >       > doesn't require
> > > >       > to open the database just to see if you want to update it.
> > > >       >
> > > >       > I second Richard's question: in what kind of a situation ha=
ve you seen an
> > > > issue?
> > > >
> > > >       The issue is on Yocto AB.
> > > >       It has not updated statistics for more than 5 months now.
> > > >
> > > >       Looking at the logs, something is updating mtime very frequen=
tly...
> > > >       I don't know the AB infrastructure, but it looks like there i=
s some filesystem
> > > > crawler, maybe backup of sync process.
> >
> > On 2024-12-26 we set workers in the
> > autobulder.yoctoproject.org/valkyrie cluster to run "touch
> > /srv/autobuilder/valkyrie.yocto.io/current_sources/CVE_CHECK/*.db
> > /srv/autobuilder/valkyrie.yocto.io/current_sources/CVE_CHECK2/*.db"
> > every 3 minute to ensure no stale NFS cache existed for these files.
>
> This explains a lot.
> Touching file while we rely on mtime is obviously breaking cve-check code=
.
>
> Note that stopping the touch service is not enough, at least not for LTS =
branches,
> because NVD2 code will update new CVEs only since the mtime timestamp.
> Could you also delete the databases now so it can start fresh without 5 m=
onths of missing data?

I've removed those files.

>
> Peter
>
> > That job was disabled for all builders on 2025-09-02. The performance
> > testing workers were still running the job though. I've disabled it on
> > those now.
> >
> > The issue of stale cached NFS data may return now. Something to keep an=
 eye on.
> >
> > If we want to keep the timestamp in a separate file I suggest creating
> > a new file named timestamp_$(date +%s) for each timestamp and deleting
> > previous timestamp_ files. That should avoid most caching issues and
> > keep overhead minimal.
> >
> > > >       Or the nfs mount is plain broken there?
> > > >
> > > >       Example is here:
> > > >       https://valkyrie.yocto.io/pub/non-release/20251109-
> > > > 43/testresults/metrics/db-update/
> > > >       NOTE: Current time: Sun Nov  9 07:17:52 2025; DB time: Sun No=
v  9
> > > > 07:14:51 2025
> > > >       NOTE: Current time: Sun Nov  9 07:19:22 2025; DB time: Sun No=
v  9
> > > > 07:18:14 2025
> > > >       2 jobs are 90 seconds from each other, but something managed =
to change
> > > > the timestamp in between and only 3.5 minutes after last change!
> > > >
> > > >
> > > >
> > > >
> > > > The autobuilder was expected to force the complete download every d=
ay.
> > > > Something
> > > > has changed? The code does open the database after checking the
> > timestamp, so
> > > > frequent jobs couldn't cause it. I think that machine requires some=
 monitoring
> > to
> > > > see
> > > > what is actually changing those timestamps, because we do not know =
what it
> > is
> > > > also
> > > > changing.
> > >
> > > 1 day doesn't beat the 3.5 minutes crawler...
> > > This is probably AB issue only.
> > >
> > > And maybe other example:
> > > https://valkyrie.yocto.io/pub/non-release/20251110-45/testresults/met=
rics/db-
> > update/
> > > NOTE: Current time: Mon Nov 10 07:17:47 2025; DB time: Mon Nov 10 07:=
16:33
> > 2025
> > > NOTE: Current time: Mon Nov 10 07:19:17 2025; DB time: Mon Nov 10 07:=
16:33
> > 2025
> > >
> > > This shows that the first job does not modify it (at least not in the=
 first 90
> > seconds).
> > > I guess it fit the 3.5 minutes window of opportunity.
> > > And my local build does not show any timestamp manipulation either.
> > >
> > > Peter
> > >
> > > >
> > > > I haven't seen such an effect on my systems.
> > > >
> > > > Kind regards,
> > > > Marta
> > >
> > >
> > >
> > >
> >
> >
> > --
> > Michael Halstead
> > Linux Foundation / Yocto Project
> > Systems Operations Engineer
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226148): https://lists.openembedded.org/g/openembedde=
d-core/message/226148
> Mute This Topic: https://lists.openembedded.org/mt/116098343/1003190
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mh=
alstead@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

