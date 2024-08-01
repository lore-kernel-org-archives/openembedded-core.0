Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDCFC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 14:25:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.69661.1722522316526197270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 07:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZ63nZjn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368712acb8dso3287061f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722522315; x=1723127115; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0FRR+Py0N2eGmwpFJ1RrWC/eEdJFlYpL26UkEHZWbd4=;
        b=dZ63nZjneXwErwuiUfeIkHSfunmAtzKUuHqzx5/TdduArW0Pw8x5ncXbScryCw11Kr
         l/pAOMZBS3Ti8GXXHVG4kTXYtX6Mct6s7LjaPQ1CIX6Bw8bXdRQ6pnW8So6bHZowkK1o
         6NZ3X6g/+uEl8JlilFsGgWhG8sKU6WsSJN6/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722522315; x=1723127115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FRR+Py0N2eGmwpFJ1RrWC/eEdJFlYpL26UkEHZWbd4=;
        b=q94Og4fYI1bhJvI4BP8P+aK0L/3Cp9XVwTm+B6kVhVOSuECj+7Th/ujjN4wXz2OxC8
         lJJduxJaJnS6/96wGFkMRy3dne6J6LRShLkcEnZJkXxx5l06i98rN5rzcEGx0HOnG6XG
         ilOAy5Dy8r06w3f+aNfwdkCDSK2SL7KFNqkJpEUEkvzmfWftSvPFwNXUI/0cGsWqPSlD
         aQZLaExw6Icppht4qvP3gugXfVlicFMMSeobfN/XnNaLxeOPZx+8zw7PTv3CbI5W3K92
         uGYMyy/Om3J4+SDZj7Ppwfho8F4KV+WFF0kB6XiZ3q6ItFEKzdlzcuX6DRZSd7mmcmrj
         O8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa9ocx7kx9pUfWOAh03FVDZ/87m8zsvRaKma90GIQ7ejlTVc+HdyyfN0zz4IDsM178Exi2XjnOGGbtlqpPPo9+JqtjTkXJOsnhvMqA4ycvy4hErTDdQi6B
X-Gm-Message-State: AOJu0YzXQirhcBr9vdVScyBqtjCpjgbVTcjbZVOG0CzldAww3GOoZaw3
	O9g7stAISojjaxpaert6zfACFmClxncBWphyJfu8Oq6bO2YmdlfTOyVAxqFi+Ug=
X-Google-Smtp-Source: AGHT+IEmH40eoNp5eLU/XOHGu6zv+luawEOrcP0LheYsZLjHcXDzn9BpbR+MFqggzQoPZ+WWZdjf7g==
X-Received: by 2002:adf:e883:0:b0:368:65ad:529 with SMTP id ffacd0b85a97d-36bbc0e0d0fmr9720f8f.17.1722522314765;
        Thu, 01 Aug 2024 07:25:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f? ([2001:8b0:aba:5f3c:6f1c:86e8:7d42:8e2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36862549sm19537990f8f.106.2024.08.01.07.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:25:14 -0700 (PDT)
Message-ID: <9141dd53105bb878e3dc98252110bc9c9d2f0684.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: mrybczynska@syslinbit.com, openembedded-core@lists.openembedded.org, 
 Marta Rybczynska <marta.rybczynska@syslinbit.com>, Samantha Jalabert
 <samantha.jalabert@syslinbit.com>
Date: Thu, 01 Aug 2024 15:25:13 +0100
In-Reply-To: <CAApg2=T-6ajkTYjG4c0XHK8qPWkB=1bccU_tgSHUY8yK645PhQ@mail.gmail.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
	 <6cf212c600dc109e86e16cf3cf73adc9864deebf.camel@linuxfoundation.org>
	 <399979010dfd02323f49cbd25b95f606@syslinbit.com>
	 <297305874abd246270ce7084d22beee7486b3e70.camel@linuxfoundation.org>
	 <CAApg2=T-6ajkTYjG4c0XHK8qPWkB=1bccU_tgSHUY8yK645PhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202739

On Fri, 2024-07-26 at 15:02 +0200, Marta Rybczynska wrote:
> On Thu, Jul 25, 2024 at 5:27=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > On Thu, 2024-07-25 at 16:48 +0200, mrybczynska@syslinbit.com wrote:
> > > On 25.07.2024 16:29, Richard Purdie wrote:
> > > > Hi Marta,
> > > >=20
> > > >=20
> > > > With the v3 series applied we did just see this on the autobuilder
> > > > unfortunately so I'm not sure that problem is addressed:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7=
004/steps/14/logs/stdio
> > > >=20
> > >=20
> > > Hello Richard,
> > > Thanks, this is unfortunate. Is it possible to have a copy of the
> > > corrupted database somewhere?
> >=20
> > I think it is transient as we never clean it up and not all tasks fail.
> > That seems to imply it is a race of some kind.
>=20
> I have a few ideas of what it might be, but I do not have a reproducer ri=
ght now. With the
> vex changes, the duration of the cve_check operation changed slightly. On=
 the other hand,
> the database download is slower these days (I have had standalone runs th=
at lasted for 5+ hours).
> Also, I noticed that there were cancellations of some of the build, so th=
e cancellation of the download
> may be in play too.
>=20
> A question: autobuilder configuration does share DL_DIR among multiple bu=
ilds?

DL_DIR is shared between all the workers over NFS.

> My possibility list right now:
> - the "download" job timeout too short
> - download failure/timeout
> - job cancellation during the download

While a download is in progress, the exclusive lock should be held. If
the database were damaged, I'd then expect all subsequent cve_check
tasks to fail the same way.

In the failures, 2 or 3 tasks fail, the rest all continue to work. So
ti doesn't really fit.

> What do you think?

I'm wondering if we should make the do_fetch of the database recipe
copy the database to somewhere in TMPDIR when it finishes, then have
the main cve_check class use the copy there. This would move NFS issues
out the equation?

That would be more in keeping with how other recipes work, just using
DL_DIR as an accelerator.=20

Cheers,

Richard


