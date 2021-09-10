Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.11901.1631293092620050446
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 09:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HF3ITQTy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z4so3555536wrr.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 09:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QULyM/u3CVFUt/HIp1hUc7DAxIK0ptgrJD6o62hnn+M=;
        b=HF3ITQTyvsSuo1L4fxtlAJvWsFJ6wWUVaig7wFEWh8FHZ/QGXEQQNqbGA4oq7zb0SK
         D0Y6X6O6g0aTJq1u1WR/efOvY+pqlq3KwcwJWp7DtlZIYLAvaTkkwjNUjI8Q77Fp4c/4
         TwhV60P+p0hyP0cnpKtnlMYTDjHjJiS3IBpp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QULyM/u3CVFUt/HIp1hUc7DAxIK0ptgrJD6o62hnn+M=;
        b=AKky/uIx00+M6FA0AgOoixHSuldp+vie/agppDSX0vaEPQ25tzrQ8gxChdF3ftNOUP
         nrW3iYMdE26/hkBYAnOM3mSK2tJL+LVxxkkRyp1aKcWkqQtHNm4un6o6t2ZcyVPLbWrl
         sURfwc+9qxxSmUkivV5VOecuFkw3dNj93LJrzqDEthwyJUkUPqZ29DaF9ilpNwgA/y3N
         9EjVzvrBQsbsGMzFPpON+/zpTDYq21VLxe6y4EcS+9kBYGOmOlmrQ1XlRAaqFGU8TfeI
         +rWiwfmJaHWV6na1si6Tcrk9dpGbp2YRYEAi4mPp8xxhXhh92Xo9zXn839sqjnCvoiZj
         2qcg==
X-Gm-Message-State: AOAM533mU/+T0PyMij7reHbNR7ngO/E8WG5qFJkZmYl1E5e+MnqDl4bs
	tED/zQv2eFhW6vGAxuemV0jdBg==
X-Google-Smtp-Source: ABdhPJw+WtALuY3hs1K3fHGFS9+f6sCtKQDT/NToocuhmHFVVWVabpHCQVB2SuNBut7sz6BdprqFjA==
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr10715371wrv.217.1631293090874;
        Fri, 10 Sep 2021 09:58:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45? ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id d5sm5433124wra.38.2021.09.10.09.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 09:58:10 -0700 (PDT)
Message-ID: <c9384cb67a7adbc05dc97a4020d1a89c416d92f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH v2] fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 10 Sep 2021 17:58:07 +0100
In-Reply-To: <YTuJj9dxbuF/36ug@mcrowe.com>
References: <169AD8EBF1055369.13770@lists.openembedded.org>
	 <16A248F6B42CACC2.5565@lists.openembedded.org>
	 <YTuJj9dxbuF/36ug@mcrowe.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-09-10 at 17:36 +0100, Mike Crowe wrote:
> On Monday 06 September 2021 at 17:37:14 +0100, Mike Crowe via lists.openembedded.org wrote:
> > On Friday 13 August 2021 at 12:05:09 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > When running the test suite on my Debian 11 box I see many occurrences
> > > of:
> > > 
> > >  unknown fcntl argument 1032, assuming long argument.
> > > 
> > > (for example from test-execl.sh.)
> > > 
> > > It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
> > > add it and the corresponding F_SETPIPE_SZ too to avoid the warning
> > > messages.
> > > 
> > > F_SETPIPE_SZ accepts an int argument, which strictly speaking isn't the
> > > same as the long that the wrapper expects. However, this is also true
> > > for F_DUPFD which seems to be working correctly on all the targets that
> > > people care about.
> > > 
> > > We need to define the command constants if the system headers don't
> > > provide them to ensure that a binary built on an old system works
> > > without the new commands works correctly only a newer one that tries to
> > > use them. If the system values differ from the expected ones then such a
> > > binary would also be incompatible, so fail the build in that case too.
> > > 
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  Makefile.in              |  1 +
> > >  ports/linux/guts/fcntl.c | 21 +++++++++++++++
> > >  test/test-fcntl.c        | 58 ++++++++++++++++++++++++++++++++++++++++
> > >  test/test-fcntl.sh       |  5 ++++
> > >  4 files changed, 85 insertions(+)
> > >  create mode 100644 test/test-fcntl.c
> > >  create mode 100755 test/test-fcntl.sh
> 
> Hi Richard & Seebs,
> 
> It looks like only part of this change landed as
> 328452d74917ce9314c8c4afe2bd277473a4c076:
> 
> >  Makefile.in              |  1 +
> >  ports/linux/guts/fcntl.c | 21 +++++++++++++++++++++
> 
> This means that the tests no longer pass:
> 
> cc: error: test/test-fcntl.c: No such file or directory
> 
> It looks like something similar happened with test-statx leading to
> https://lists.openembedded.org/g/openembedded-core/message/154797 so I
> wonder whether there's some sort of tooling fault somewhere?

Thanks, I've added those.

I really don't know what happened. This all gets tricky as I have to fix up the
email list mangling of your sender addresses, get these patches applied in a
pseudo recipe as patches, run test builds, then get the patches over to the
pseudo repo, push those then update the recipe.

I guess the issue is we don't run the pseudo tests anywhere so we don't spot
when they're missing. For most other issues I would see failures and fix things.
Not sure if/where we'd want to run them but it is something to think about. We
don't really have a good place for native tool testing.

Cheers,

Richard

