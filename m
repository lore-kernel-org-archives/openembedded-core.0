Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA6FD1F9C7
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 20:32:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7123.1729024348563413161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 13:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DlaUkIRH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so4520838f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 13:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729024347; x=1729629147; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l2y8GJICaNnYIfS0TO2/K3hCGu4jkI57SpIj9X9QvlA=;
        b=DlaUkIRHYUqbhfjN7ulwk4ChGhZ8YsKyg0hiizCYVk6ZroaRmgtI7taYlSRPg3bKnL
         eSGsx1jToEkMNpiKaOBZ/GXDYJ2FG9WqgoQQi/Hjnu7uWsICAo5nZVqVFjdwb2OdHXyD
         o00SJGJCBefIHPVpjFy60OTCtfYJTqfhUXRAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729024347; x=1729629147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2y8GJICaNnYIfS0TO2/K3hCGu4jkI57SpIj9X9QvlA=;
        b=bjqV33+TA4f00GWoGtmJScSFDxHtwne2SqycJkEeDxKaQijGMjxJGannmGtKwXmC9g
         c00zF5ScBtyccRkAILCEasuT2hC0Bzl95iSj1LR8zwTYWGGS0y8nlBtmtwUyFA24cZe6
         2qj52pRjyyvOpeCiD6lcnLYjcluHq/peC74gBH0X2gy7AS3BtOef0KNTrjigiiu/7fgN
         fDNoTecCabwZ2Grr2MuWUSfT1U+hqbHSIRJd+DtaUwoS/3nkjdko1k651sonO24eHjxo
         2koNL4SmUh7D5y4WzTM6DG6t+jlfY4gKgLEKKzMN/CkWK0mLUFeM32QFnkeUUpbz8l/k
         e8Zg==
X-Gm-Message-State: AOJu0YwX7KeMLhGbl8ngPaj9UTeAY7rWQ/XxrepA7kyKLCVjmGEPx7S2
	MREfADEgkm6MjawDmx5mBo56PgmmFVUOnusvvhZH/1afznt3KOXdWG073aPL/aI=
X-Google-Smtp-Source: AGHT+IGNHabWBcfDLdmo1il2v8RlbakXBfnSncUexucERAl9WuNLaloV6SuNm06H0s81h0WeCCklnw==
X-Received: by 2002:adf:ecd2:0:b0:37d:332e:d6ab with SMTP id ffacd0b85a97d-37d600d32b7mr12150475f8f.43.1729024346811;
        Tue, 15 Oct 2024 13:32:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ca4b:46df:459f:fe11? ([2001:8b0:aba:5f3c:ca4b:46df:459f:fe11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a1a3sm2438047f8f.12.2024.10.15.13.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:32:26 -0700 (PDT)
Message-ID: <d091124adf15effe833452090f1dbfcca8739a38.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local
 mirror
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yumx@amazon.com, Alexander Kanavin <alex.kanavin@gmail.com>, "Sobon,
 Przemyslaw" <psobon@amazon.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2024 21:32:24 +0100
In-Reply-To: <D2078899-7FD6-481C-8B0B-032B62F078D7@amazon.com>
References: <D2078899-7FD6-481C-8B0B-032B62F078D7@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 20:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205945

On Tue, 2024-10-15 at 18:25 +0000, Yu, Max via lists.openembedded.org wrote=
:
>=20
> > But can you say what your scale actually is? How many sstate objects
> > are written into the shared cache per day? How often do you see
> > corruptions?
>=20
> Our sstate cache has 25TB and 12M objects. I do not have the
> read/write metrics, but we run ~5k image builds per day, and we were
> seeing the corruption issue about once per two weeks before this
> patch. Our image builds range from 3k - 8k build steps, but these
> numbers become funky since these are not builds from scratch. (These
> corruptions we're facing are likely not bit flips, the example I gave
> was just trying to illustrate how rare events can happen that
> shouldn't just be summarized with "fix your infra". If it makes
> things better or worse, we only started to see these corruption
> issues after moving to kirkstone where they are now compressed with
> pzstd...)
>=20
> For some more context, we at AWS use Yocto to build the OS for a lot
> of hardware platforms and a number of smaller component images.
> Cartesian product the two and we end up with needing to build a lot
> of images...
>=20
> Specifically related to sstate caches, we have a remote sstate mirror
> setup in s3. All CI builds update the s3 mirror, so we have a large
> number of writers. For all our builds, we setup a local build
> directory per repo (a repo can have multiple), which is where we host
> the local sstate cache, and we parallelize based on build directory.
>=20
> > The concern is that your patch does not overwrite the artifact, rather
> > it deletes it first, and recreates it later. This creates a time
> > window where a cache object exists, and then it doesn't, and then it
> > exists again. This will break builds running in parallel in all sorts
> > of interesting ways, as sstate is not designed for objects
> > disappearing after they've been checked and confirmed to exist by
> > bitbake.
>=20
> This makes a lot of sense. This is a use case we didn't consider when
> creating the patch and not applicable to us. (Since we parallelize by
> multiple build directories that don't share a local sstate cache.
> Developer builds don't really care about the extra local
> parallelization, while CI builds share the remote sstate cache.)
>=20
> > Then you can take the report and run a script that deletes the
> > offending items. This all can be automated, and doesn't have to be
> > executed manually.
>=20
> So that's the tricky thing for us. We will have to run the script at
> a time window where no builds are happening. Because when I tried
> deleting corrupted objects from the s3 sstate cache manually, the
> corrupted sstate object ended up being reuploaded by ongoing
> builds... And this is pretty difficult to execute reliably, since we
> have so many builds.

I'm a little bit puzzled here. How would something upload the corrupt
artefact back into the system?

The system has been very carefully designed on how we put artefacts
into the sstate directory. We do it by writing to a temporary file,
then move into place once the files are 100% complete. The move is
atomic even over NFS, something will always win.

Once the files exist, we don't overwrite them. This is essential to
prevent something from half reading them.

My question about "uploading the corrupt" artefact is because this
doesn't happen in what we do out the box.

I know you put everything into s3 and I worry that the s3 code has
races in it somehow letting workers see incomplete files, or
overwriting existing files which differ slightly causing the
corruption.

> I do understand more where you're coming from now, and it does sound
> like the way we implemented this fix is not applicable for all use
> cases. Can we make this a configurable option instead?=20
>=20
> Or if we don't want to remove an existing sstate object from the
> cache, would it be fine to then overwrite existing sstate cache
> objects after we finish rebuild it?

No, overwriting files is a recipe for disaster. See above, you get
partially complete files which come out as corrupted. We have enough
scale on our autobuilders we could see that ourselves.

>  With our current remote s3 sstate mirror, we already overwrite the
> remote when the object is different. (I think it might be possible to
> implement a marker during the decompression phase, and later
> overwrite the previous sstate object after the local rebuilds. Will
> need to look more into it. )

I think this overwriting may be the source of your problems. You should
not need to or be doing this. Why do you need to?

It is easy to blame bit flips and put a hack into the system to force
an overwrite but I think you have a more fundamental issue going on
which you may want to fix properly.

Cheers,

Richard

