Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD00CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:39:07 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.50628.1697794740082629574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 02:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a1FK7oYo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso9637001fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697794738; x=1698399538; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tGpqRANSJ9ptJbbdHbpfz2wL8Z+3It2bRENhCXInR7Q=;
        b=a1FK7oYoqFDLIbeI9p5ovYjsV10K9noket9dW/OAGO5M5gaC+FDcd/cDqZFdbtNxn9
         5xChd1ubTzJygLd5dqeINmuYKQEDz4d78iVdKJ4bAYCrsKIsSCHK7kaC+xtuRZYMWF3+
         Or2gRIgeYZ8qTDbKpbhkvK07Jk/yUYDpVomr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794738; x=1698399538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGpqRANSJ9ptJbbdHbpfz2wL8Z+3It2bRENhCXInR7Q=;
        b=AnmCbpAQjvSZsTy894pnCzE+PXLwh3D8dPMTqnXD+OMXlzFkc3QY9BfpghRW0cIUR8
         Kk7NnR6qqHk8wyo8KU3N60/QP7KmIRDdbjIlM4YuRpk1HVZDLMHVn2i33Pp0dsobfV4T
         UowyxR677X7GsZ7bnMPvbe8r9BnvoLZieS/y3aP1C/BnZwXw4635obSZ9l49J15dXFtE
         y8oyZH7uwNocJk3YPq1SOujFrVMqGqZvY6kH9bwjl2l608YiXPwlUhEw+CfnZwJF/+B1
         +oq6oocQFgMmS3zpfWZhkqi+cOaF+6TBwJwWTbZYqYyS+R6Bdr0lzAVJ/B92t7WxGEO3
         t9tg==
X-Gm-Message-State: AOJu0Yy2igZfNJgunQpQrd+22ASke8PAqUpmr4Bix3GGtpXNBdd2IxhE
	zrbG2/V+JUMpfQy1nQcMnbvKbw==
X-Google-Smtp-Source: AGHT+IFEZFsCTEIfkllfbyzL0ckNTTnmFCOMW4BYOqb+Zu36SfGWFERjC3oPsOzdaX2JvgMfqSwF3Q==
X-Received: by 2002:a2e:a543:0:b0:2bd:d34:f892 with SMTP id e3-20020a2ea543000000b002bd0d34f892mr1008508ljn.3.1697794737656;
        Fri, 20 Oct 2023 02:38:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id 6-20020a05600c230600b004083bc9ac90sm1696186wmo.24.2023.10.20.02.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:38:57 -0700 (PDT)
Message-ID: <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Oct 2023 10:38:56 +0100
In-Reply-To: <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
	 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
	 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189511

On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
> On 19/10/2023 14.48, Richard Purdie wrote:
> > On Thu, 2023-10-19 at 14:32 +0200, Rasmus Villemoes via
> > lists.openembedded.org wrote:
> > > From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > >=20
> > > Building perf without security_flags.inc being included in one's
> > > distro results in the buildpaths warning
> > >=20
> > > WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
> > > package perf contains reference to TMPDIR
> > >=20
> > > because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
> > > that from CFLAGS, but the perf recipe explicitly unsets that.
> > >=20
> > > Now ${SELECTED_OPTIMIZATION} of course contains more than just
> > > ${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
> > > adds its own optimization flags (-O6 for odd reasons), so for those
> > > including the -O2 or -Og doesn't change anything. But looking at the
> > > .o.cmd files show that there are some TUs which currently get built
> > > without any -O flag. So for those adding the distro's
> > > SELECTED_OPTIMIZATION seem to be the right thing to do.
> > >=20
> > > Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> > > ---
> > >  meta/conf/distro/include/security_flags.inc | 1 -
> > >  meta/recipes-kernel/perf/perf.bb            | 1 +
> > >  2 files changed, 1 insertion(+), 1 deletion(-)
> >=20
> > The fact this works suggests perf is ignoring TARGET_CFLAGS. Is there
> > anything in the perf build system where we should be passing in cflags
> > we really want used?
>=20
> Well, IIUC, the normal way TARGET_CFLAGS would take effect is via the
> 'export CFLAGS =3D "${TARGET_CFLAGS}'. But in the perf recipe, both
> do_compile and do_install start with
>=20
>         # Linux kernel build system is expected to do the right thing
>         unset CFLAGS
>=20
> And perf's build system does indeed add lots of flags of its own, at
> least for most TUs, but nowhere is any -f(macro/debug/file)-prefix being
> set.
>=20
> So I do think that TARGET_CC_ARCH is the best place for flags that we
> really want used. At least as an initial step, because this is known to
> work when using the security_flags.inc file. Maybe there's some cleaner
> way where we don't unset CFLAGS, but that could be a giant can of worms.
>=20
> And yes, a comment should be added. Is something like
>=20
> # Perf's build system adds its own optimization flags for most TUs,
> # overriding the flags included here. But for some, perf does not add
> # any -O option, so ensure the distro's chosen optimization gets used
> # for those. Since ${SELECTED_OPTIMIZATION} always includes
> # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
> # ensures perf is built with appropriate -f*-prefix-map options,
> # avoiding the 'buildpaths' QA warning.
>=20
> too verbose?

If it were me I'd probably write:

# The perf makefile has "unset CFLAGS" as "Linux kernel build system is
# expected to do the right thing". It doesn't and we need our prefix=C2=A0
# map options and security flags amongst other things so force our=C2=A0
# cflags in.

Cheers,

Richard





