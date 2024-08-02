Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3931C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 13:00:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.92303.1722603633441254031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 06:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hGlS1q3t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3683329f787so4381732f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722603631; x=1723208431; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ehyTWU9tP5l6xNAdtYmkq0T2AZDlBE+4ViOXVdC7R1M=;
        b=hGlS1q3tNoUwQC2BKRzJjy5P7uWqmCsT4uqfhiFanG6JDGtU/iw2cXzf7KhwRklM62
         cjN+XtCQIxCHEgvgTvuAPleskGXx6vyMlXvzmLxmYBKbpD6LSc12FVQN4di0ZmAtRaaf
         3lgT0Xq0u+kpfmgAF938Fku55L7n8g0V5/jWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722603631; x=1723208431;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehyTWU9tP5l6xNAdtYmkq0T2AZDlBE+4ViOXVdC7R1M=;
        b=Q7+/NTDy1nT21iPsyuw/OjLKPhGg+vUYSKZcwCVNalAas3NrBZEpSVhbIuwVXAku32
         cQkAENCM5rZoKyCCDllwWFYJYVfoNJsa3CyzoZwu5DpZ4xLIYH0D38IrZfe9bFZHF/rL
         2QvDQxN78YabthAOCjhuzEw/lwqPI20DXZ3tUhOyOwtrfjAvfTOaKkQmB1RkdiGjNANm
         Jwpyr+xUVvnOHjU5SHBYeivkDs9tXQlSL3e2ji/i8Fk4gNOuzEPlKcDFBfADem4yUf4H
         UK3WAwpl/8GKsA9FL6bIYcUjbXjjswbKChM5qGIiXzjvDpCwooK2nCM6dH66G+BYW7ZK
         hr6g==
X-Forwarded-Encrypted: i=1; AJvYcCXEQJUXsF4llNGoMo3uSyXrFOfThfaLFUMDWerifiYfLDWhZGrZ51H6vg4FaHcAUHUzB4ajlaaY6/uu0SjKwRuSN/vjRNmkv/ZBWXEtkntg8fiUOrq1owbt
X-Gm-Message-State: AOJu0Ywi1R8DVpq6K5UXVlUyUllW7kZE1Ia0wTT9n2bpm/x9dkMiVWdI
	OY+5/4G2WCDdncJXQzY/J6J7mBbsmrbfWPLVdAHcg3qN9GpvKFUMtn0aGdhI8Q8=
X-Google-Smtp-Source: AGHT+IFu0saF3uE3wXBKp+2zwKnL8kacIbmCzWcSwVlriPKSjrwmTLq0lmYQ0YsFrK462ETTea1grg==
X-Received: by 2002:a5d:5244:0:b0:364:348:9170 with SMTP id ffacd0b85a97d-36bbc1d30d8mr1991843f8f.54.1722603631282;
        Fri, 02 Aug 2024 06:00:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e1c0:4ec6:2f32:2a4? ([2001:8b0:aba:5f3c:e1c0:4ec6:2f32:2a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd26f908sm1912371f8f.115.2024.08.02.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 06:00:30 -0700 (PDT)
Message-ID: <44cf64be9b222545d86163afc0c6671ace33fa42.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: mrybczynska@syslinbit.com, openembedded-core@lists.openembedded.org, 
 Marta Rybczynska <marta.rybczynska@syslinbit.com>, Samantha Jalabert
 <samantha.jalabert@syslinbit.com>
Date: Fri, 02 Aug 2024 14:00:29 +0100
In-Reply-To: <CAApg2=RRLDsj7jnQh=JJTZOzF2KsMvhqy9UKvxs5igX_TYAmwg@mail.gmail.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
	 <6cf212c600dc109e86e16cf3cf73adc9864deebf.camel@linuxfoundation.org>
	 <399979010dfd02323f49cbd25b95f606@syslinbit.com>
	 <297305874abd246270ce7084d22beee7486b3e70.camel@linuxfoundation.org>
	 <CAApg2=T-6ajkTYjG4c0XHK8qPWkB=1bccU_tgSHUY8yK645PhQ@mail.gmail.com>
	 <9141dd53105bb878e3dc98252110bc9c9d2f0684.camel@linuxfoundation.org>
	 <CAApg2=RRLDsj7jnQh=JJTZOzF2KsMvhqy9UKvxs5igX_TYAmwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 13:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202908

On Fri, 2024-08-02 at 14:50 +0200, Marta Rybczynska wrote:
> On Thu, Aug 1, 2024 at 4:25=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2024-07-26 at 15:02 +0200, Marta Rybczynska wrote:
> > > On Thu, Jul 25, 2024 at 5:27=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Thu, 2024-07-25 at 16:48 +0200, mrybczynska@syslinbit.com
> > > > wrote:
> > > > > On 25.07.2024 16:29, Richard Purdie wrote:
> > > > > > Hi Marta,
> > > > > >=20
> > > > > >=20
> > > > > > With the v3 series applied we did just see this on the
> > > > > > autobuilder
> > > > > > unfortunately so I'm not sure that problem is addressed:
> > > > > >=20
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/buil=
ds/7004/steps/14/logs/stdio
> > > > > >=20
> > > > >=20
> > > > > Hello Richard,
> > > > > Thanks, this is unfortunate. Is it possible to have a copy of
> > > > > the
> > > > > corrupted database somewhere?
> > > >=20
> > > > I think it is transient as we never clean it up and not all
> > > > tasks fail.
> > > > That seems to imply it is a race of some kind.
> > >=20
> > > I have a few ideas of what it might be, but I do not have a
> > > reproducer right now. With the
> > > vex changes, the duration of the cve_check operation changed
> > > slightly. On the other hand,
> > > the database download is slower these days (I have had standalone
> > > runs that lasted for 5+ hours).
> > > Also, I noticed that there were cancellations of some of the
> > > build, so the cancellation of the download
> > > may be in play too.
> > >=20
> > > A question: autobuilder configuration does share DL_DIR among
> > > multiple builds?
> >=20
> > DL_DIR is shared between all the workers over NFS.
> >=20
> > > My possibility list right now:
> > > - the "download" job timeout too short
> > > - download failure/timeout
> > > - job cancellation during the download
> >=20
> > While a download is in progress, the exclusive lock should be held.
> > If the database were damaged, I'd then expect all subsequent
> > cve_check tasks to fail the same way.
> >=20
> > In the failures, 2 or 3 tasks fail, the rest all continue to work.
> > So ti doesn't really fit.
> >=20
>=20
>=20
> I would suspect there's a fetch job running in addition somewhere and
> it manages to do the download. From that point, subsequent checks
> will work. But where does that corruption come from - no idea.

We only ever update the database through the recipe though, right? That
recipe does have the correct lockfile specified for do_fetch? That
should mean it always has an exclusive lock when updating.

> I've noticed that tests *could* cause a database update and that the
> temporary download path will be the same for all instances
> (CVE_DB_TEMP_FILE). This could cause corruption if the lock doesn't
> work as we expect it to.

I did some tests and the lock does work between different autobuilder
nodes. We've noticed that the issue only seems to happen on ubuntu
22.04 which makes me wonder if there is a bug somewhere there such as
in the host sqlite3?

> Now, between kirkstone and master there should be no corruption, as
> this is not the same database - files have different names as changed
> in 048ff0ad927f4d37cc5547ebeba9e0c221687ea6.

Steve has observed the same issue in kirkstone, only on ubuntu 22.04.

>=20
> We could do tweaks to make sure tests do not download the database
> (CVE_DB_UPDATE_INTERVAL =3D "-1"). We could even do a run or two with
> that set for the whole build for all configurations, to make sure the
> corruption
> does not happen at runtime.
>=20
> We also have a standalone script to download the database (no change
> in the format from the master branch), so we can use it and then
> point builds to the copy, while disabling updates.
>=20
> The source is here:
> https://gitlab.com/syslinbit/public/yocto-vex-check/-/blob/main/cve-updat=
e-nvd2-native.py?ref_type=3Dheads
>=20
> We can also change the location of the database and always keep it in
> TMPDIR
> or such. This could mean a long wait for the download.
>=20
> Which solution would you prefer to test?

I'm not convinced the issue is a parallel fetch, I think sqlite is
breaking somehow and it is host specific.

I think we should add a do_unpack to the recipe and work from a local
copy in TMPDIR, not one over NFS. It can copy from DL_DIR so we
shouldn't lose much speed. I'm willing to give that patch a go if that
helps and lets you focus on the other patches?

Cheers,

Richard





