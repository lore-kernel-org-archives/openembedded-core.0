Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1398ACFA442
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:35:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.448.1729697705471605497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OgRot7AN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315baec681so72585825e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729697704; x=1730302504; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IKx5SRrw0vYXcLd5cx6bM2uEySW1JWW3ZpVQ3nGJR1w=;
        b=OgRot7ANYyYYLMRNsHJEjwTmLPGlp3tNTzrKfoYdCHmBt+Z2aY0Rq3m45yx6DkPZP6
         F3wcK17Ve3ZFK6jIaadZiaiRMzJDUe9dEGG8jSXWhLGK87zH3pGVfObhDPwYgbNJn3dy
         LJVbBz2wl/mWHtj64mMR42HgKrLs1uuoYhGiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697704; x=1730302504;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKx5SRrw0vYXcLd5cx6bM2uEySW1JWW3ZpVQ3nGJR1w=;
        b=JGY6VG0eRyCs55eXjZDuPMc2EWtaxchYDS9i90YumjV6HxaC0OyRCFYQhpJ4l42Y1v
         JKO0GeFomyZMEMzKVqriA20BMQl2hyM4Tz5PokR9s4VebAF827R/aVZFfCajXLMPHpTH
         MumY+Vs5fzJasBNcCA1/L8OTmULIkEx9NbdIvTE3x4iHifG8unjnvF6mbGRPoKY4aQ7M
         TduQ+yJSsu/4R7+H4OFfKQ4ZUP3TTVdUZRYF3k5BPrw9er6M/mb+YoJtK8hVffNmrn0d
         bOSUAKe6P4DZodfqB9W/d1GB5KcM3ReuUCrA/zu+d4k9mGCaujs9eArHPQ6XTJwSHtaZ
         o8fw==
X-Gm-Message-State: AOJu0YyIl023Crp+qFECi9uTluHWJRT3emMyzKsNLSs4/LQjwswf5b/U
	YN25r/kLMdEWgc/LFBNQsU/1jvjPKfQKkCE7VSB1FEa+/MEA9P2Pg5ECg38RWFg=
X-Google-Smtp-Source: AGHT+IF6FtglbQq7q+REjMwlUGsqtsjTDUB1sHzDa25nEjtDTOlZnMFypjReRoXUOgBP6xqBb7d07w==
X-Received: by 2002:a05:600c:1d1f:b0:42c:b55f:f7c with SMTP id 5b1f17b1804b1-4318415a48cmr24877165e9.15.1729697703726;
        Wed, 23 Oct 2024 08:35:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bdba62sm19427075e9.19.2024.10.23.08.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:35:02 -0700 (PDT)
Message-ID: <a9f2fa0b0a02f6a6d6db424f8e6830854086154a.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Halstead
 <mhalstead@linuxfoundation.org>
Date: Wed, 23 Oct 2024 16:35:01 +0100
In-Reply-To: <CANNYZj-O5fBgkHmoMie-x9V4EVG5=aQ14oN2gj3NG7FmQmVDQQ@mail.gmail.com>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
	 <17FFD5DF016C394D.24795@lists.openembedded.org>
	 <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
	 <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com>
	 <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org>
	 <CAMKF1spng0TOm9_qy3-Koeeo0LK4FJorfa21J_9Po=pT89akzw@mail.gmail.com>
	 <CANNYZj-O5fBgkHmoMie-x9V4EVG5=aQ14oN2gj3NG7FmQmVDQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206252

On Wed, 2024-10-23 at 17:33 +0200, Alexander Kanavin wrote:
> On Wed, 23 Oct 2024 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > > Yes, ideally we'd track it down and get it fixed properly but
> > > we're not
> > > really setup to debug Debian bugs in old releases and we have
> > > other
> > > more pressing problems.
> >=20
> >=20
> > I agree with this. I was wondering if there is some aspects that
> > Debian community can be made aware of the problem ?
>=20
> If we can't make it easy for them to reproduce (and we can't), then
> reporting is not likely to achieve much. WONTFIX WORKSFORME and all
> that.

It is also in Debian 11 (old stable), not Debian 12 so it is getting
fairly old now. I suspect there will be less interest in the older
release.

Cheers,

Richard

