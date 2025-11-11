Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA64CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 05:31:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11026.1762839094710737864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 21:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DA9hWfJF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59428d2d975so3929240e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 21:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762839093; x=1763443893; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRjKZxeH/vu+5RSYkiSusmzKccjr/VVmkChFEk3Nrq8=;
        b=DA9hWfJFTmEVrAuJbIcsx2qcMoiTq5Q2eflMX1IrSldaXSnp3L1/eorairtSOGMhKB
         xB38bvMOnLcYfk4wU4pCDmUeFOxs4ADAbGaym+oFIK1ryLWI7EKfpg+ih81C9FKGGMVN
         Fy2QXI8Z8mapMP2VCIgd+K4y5yd83p4cSNsPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762839093; x=1763443893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vRjKZxeH/vu+5RSYkiSusmzKccjr/VVmkChFEk3Nrq8=;
        b=hVFNwHGi2EZz/uIeY/YaNFKUW0oHkhFz9XQiL4S2u6luGJc++xkO8XLKtoNdSL4/1v
         Bfnr122Ya20CZKuoC7IXZSNyAxtY6UkJMBO260EXF518xl+89E8P4P6e19w8c7oq7al9
         dfBLo5/OdgbsSwhOXwSAHOeL9vZ3h069JuWy7YinmQpGemqsc6v3mWvcKPw0Op3LEOB+
         ci0U2ug4VEjU+CysR6tL6rIt6Jrtb4R4ZYSWxbKjBu+NQEFANKM8LE4Z0Pm9gW87Qbbt
         65ARWe8k+yqPgCniwl2haxuC8vxwAMY5/1JjPVIsRQU/h2SCgRfbrJl5KmVU//MXNygE
         4E6w==
X-Forwarded-Encrypted: i=1; AJvYcCW8voyPGVNjUEmN6VG+zmd6P9yQfAUpx16+PartXR0VIwBvVTzJE4NcdYT/2rLfYbyIa18Sox9wY5fUgbrHcwTe5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEMxaw82IFii10zGr6GTQVMQxUKEUBo/mlfqZVHnAtDTvcK4VT
	/m5UuOxTG5W/GnLlRxrG/sUDvZ+OzrSpPHEc8aMqa55+/kpH9SZhhUVO4HQYfUYxWRKjMvJACjR
	wuJQa81BBLyhWTN0e99ISnG+iNYCLRY8+hfuugUw5uA==
X-Gm-Gg: ASbGncssQazeV5NLs9sePVYsq3JvqDOC+dIHgjOdQXG7tpIGYTim5Zt8jnbjvIYFbjh
	sCtfItZ5NTH1bKfEiRiQXIBjjwrrb+8AEr8QVpNtHjH19N+M6n/Brpt8sTRr3YYkdp6xzWVwdFr
	k57tuAmR9fhbf2R8lvtvZGjVN1dX+fMss/cIItt5O3kkiqT0TMfSUj7nnEG6cz2KQPCKAmXv1KO
	oPCSHVENQ8d5bwCuJObLEFxB39yH6zlDHLdQe4TsmnvVdohgMb9s3bu+G5RkQ8cpr6qiY0PJQ==
X-Google-Smtp-Source: AGHT+IEWsYnlYXq+v/VmyGtD/1aK8LbDHzpGhuo95DhmGSBQ+kvvonDWDITI737IG+SZTPO86VjVp4rNbJ3QUSV10j4=
X-Received: by 2002:a05:6512:158c:b0:594:341a:ab1e with SMTP id
 2adb3069b0e04-5945f1b74afmr3318975e87.31.1762839092629; Mon, 10 Nov 2025
 21:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com> <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com>
 <AS1PR10MB5697F694A61CEF460D80F25EFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAApg2=SyfWMcE2OAknOQJRx4uwysiz9bdWnNxR-pPfLb9SgR1g@mail.gmail.com> <AS1PR10MB56971CEED209F3CDBFBBB23BFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56971CEED209F3CDBFBBB23BFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 10 Nov 2025 21:31:21 -0800
X-Gm-Features: AWmQ_bnNv7bolp8SZw-PIWgVA0cVjMeeBY64IG2WEGXI58sRDLgZwEb3xLgFEm8
Message-ID: <CADfgfoa0d+-dN2qHm2aXJsyuo5gyXiMgfFkyKzuyhcokgSCrfg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226146

On Mon, Nov 10, 2025 at 7:31=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
>
>
> > -----Original Message-----
> > From: Marta Rybczynska <rybczynska@gmail.com>
> > Sent: Monday, November 10, 2025 16:29
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>;
> > niko.mauno@vaisala.com; openembedded-core@lists.openembedded.org;
> > ross.burton@arm.com
> > Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
> > database itself
> >
> >
> >
> > On Mon, Nov 10, 2025 at 4:18=E2=80=AFPM Marko, Peter <Peter.Marko@sieme=
ns.com
> > <mailto:Peter.Marko@siemens.com> > wrote:
> >
> >
> >
> >
> >       > -----Original Message-----
> >       > From: Marta Rybczynska <rybczynska@gmail.com
> > <mailto:rybczynska@gmail.com> >
> >       > Sent: Monday, November 10, 2025 16:00
> >       > To: Richard Purdie <richard.purdie@linuxfoundation.org
> > <mailto:richard.purdie@linuxfoundation.org> >
> >       > Cc: niko.mauno@vaisala.com <mailto:niko.mauno@vaisala.com> ;
> > openembedded-core@lists.openembedded.org <mailto:openembedded-
> > core@lists.openembedded.org> ;
> >       > ross.burton@arm.com <mailto:ross.burton@arm.com> ; Marko, Peter
> > (FT D EU SK BFS1)
> >       > <Peter.Marko@siemens.com <mailto:Peter.Marko@siemens.com> >
> >       > Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp=
 in
> > the
> >       > database itself
> >       >
> >       >
> >       >
> >       > On Mon, Nov 10, 2025 at 3:16=E2=80=AFPM Richard Purdie
> >       > <richard.purdie@linuxfoundation.org
> > <mailto:richard.purdie@linuxfoundation.org>
> > <mailto:richard.purdie@linuxfoundation.org
> > <mailto:richard.purdie@linuxfoundation.org> >
> >       > > wrote:
> >       >
> >       >
> >       >       On Mon, 2025-11-03 at 14:31 +0000, Niko Mauno via
> >       > lists.openembedded.org <http://lists.openembedded.org>
> > <http://lists.openembedded.org>  wrote:
> >       >       > This should help to avoid problems that will occur if t=
he
> > modification
> >       >       > time of database file itself is altered e.g. by unassoc=
iated
> >       >       > process(es) on the file system which hosts the database=
 file.
> >       >       >
> >       >       > Since this change updates the database structure by add=
ing a new
> > table,
> >       >       > bump the 'minor' version number in database file names =
to enforce
> > full
> >       >       > database fetch. This should also iron out e.g. situatio=
n where the
> >       >       > database might have inconspicuously omitted entries due=
 to way
> > in
> >       > which
> >       >       > the mtime of database file itself was relied upon.
> >       >       >
> >       >       > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
> > <mailto:niko.mauno@vaisala.com>
> >       > <mailto:niko.mauno@vaisala.com <mailto:niko.mauno@vaisala.com> =
>
> > >
> >       >       > ---
> >       >       >  meta/classes/cve-check.bbclass                |  2 +-
> >       >       >  .../recipes-core/meta/cve-update-db-native.bb <http://=
cve-update-
> > db-native.bb>  <http://cve-update-db-
> >       > native.bb <http://native.bb> >  |  3 +
> >       >       >  meta/recipes-core/meta/cve-update-native.inc  | 59
> > ++++++++++++-------
> >       >       >  .../meta/cve-update-nvd2-native.bb <http://cve-update-=
nvd2-
> > native.bb>  <http://cve-update-nvd2-native.bb>
> >       > |  3 +
> >       >       >  4 files changed, 46 insertions(+), 21 deletions(-)
> >       >
> >       >       I am a bit worried about this since it takes what is a si=
mple mtime
> >       >       comparison and means that to check the database you now h=
ave to
> > lock
> >       >       and open it which is comparatively expensive.
> >       >
> >       >       What kind of "unassociated processes" are updating the mt=
ime?
> >       >
> >       >
> >       >
> >       >
> >       > I second Richard here. If we would really want to keep the date
> > somewhere else
> >       > than the file
> >       > timestamp, we could create a simple file that stores it, what i=
s way
> > simpler and
> >       > doesn't require
> >       > to open the database just to see if you want to update it.
> >       >
> >       > I second Richard's question: in what kind of a situation have y=
ou seen an
> > issue?
> >
> >       The issue is on Yocto AB.
> >       It has not updated statistics for more than 5 months now.
> >
> >       Looking at the logs, something is updating mtime very frequently.=
..
> >       I don't know the AB infrastructure, but it looks like there is so=
me filesystem
> > crawler, maybe backup of sync process.

On 2024-12-26 we set workers in the
autobulder.yoctoproject.org/valkyrie cluster to run "touch
/srv/autobuilder/valkyrie.yocto.io/current_sources/CVE_CHECK/*.db
/srv/autobuilder/valkyrie.yocto.io/current_sources/CVE_CHECK2/*.db"
every 3 minute to ensure no stale NFS cache existed for these files.
That job was disabled for all builders on 2025-09-02. The performance
testing workers were still running the job though. I've disabled it on
those now.

The issue of stale cached NFS data may return now. Something to keep an eye=
 on.

If we want to keep the timestamp in a separate file I suggest creating
a new file named timestamp_$(date +%s) for each timestamp and deleting
previous timestamp_ files. That should avoid most caching issues and
keep overhead minimal.

> >       Or the nfs mount is plain broken there?
> >
> >       Example is here:
> >       https://valkyrie.yocto.io/pub/non-release/20251109-
> > 43/testresults/metrics/db-update/
> >       NOTE: Current time: Sun Nov  9 07:17:52 2025; DB time: Sun Nov  9
> > 07:14:51 2025
> >       NOTE: Current time: Sun Nov  9 07:19:22 2025; DB time: Sun Nov  9
> > 07:18:14 2025
> >       2 jobs are 90 seconds from each other, but something managed to c=
hange
> > the timestamp in between and only 3.5 minutes after last change!
> >
> >
> >
> >
> > The autobuilder was expected to force the complete download every day.
> > Something
> > has changed? The code does open the database after checking the timesta=
mp, so
> > frequent jobs couldn't cause it. I think that machine requires some mon=
itoring to
> > see
> > what is actually changing those timestamps, because we do not know what=
 it is
> > also
> > changing.
>
> 1 day doesn't beat the 3.5 minutes crawler...
> This is probably AB issue only.
>
> And maybe other example:
> https://valkyrie.yocto.io/pub/non-release/20251110-45/testresults/metrics=
/db-update/
> NOTE: Current time: Mon Nov 10 07:17:47 2025; DB time: Mon Nov 10 07:16:3=
3 2025
> NOTE: Current time: Mon Nov 10 07:19:17 2025; DB time: Mon Nov 10 07:16:3=
3 2025
>
> This shows that the first job does not modify it (at least not in the fir=
st 90 seconds).
> I guess it fit the 3.5 minutes window of opportunity.
> And my local build does not show any timestamp manipulation either.
>
> Peter
>
> >
> > I haven't seen such an effect on my systems.
> >
> > Kind regards,
> > Marta
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226127): https://lists.openembedded.org/g/openembedde=
d-core/message/226127
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

