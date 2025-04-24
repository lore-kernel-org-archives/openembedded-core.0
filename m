Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9836CC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 13:50:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.15670.1745502627539503076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 06:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JrVB5RwX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so10312565e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745502626; x=1746107426; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R2JIOpUdTR/pG883GEw4yHZxmx630eqlxXgfKpoR6Do=;
        b=JrVB5RwXLB3Z6MBqT3FF9JT0+1QLLnzsZUgAy4cL8gyLS7Zu20y249kaJRe2AnxTKI
         +BabzhH35s4cAXCmCOvjpLDgwT0dLI0fBUzyK7Ucc0st2awnNXNCLBX/oEYl3yezcBqn
         /cAWfy4A0zNqi1Tr3FAXdCBwaE6cETBfyZ7oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502626; x=1746107426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2JIOpUdTR/pG883GEw4yHZxmx630eqlxXgfKpoR6Do=;
        b=dB8bUwhpZit82lMeRjUGC2CaenCzc+u+wAl+mpteZ4Jqe7scakLhIXTLpUGPA+oCeG
         MO7nvgLzzdy5ukV9Hq3vswvxScjAsfPfTn5Ye+qdGWnFrPcEYp9GSM1UzNTOkxc24ciV
         i/+kG6xhjdK2yABTQQpWizyvlFJDi3OWvP/wQuJBKd7/NlQjOQQLjnoFCtlfXA301MYf
         fm0xoCKK9ThLKCTXqfBVQ7tyL2zYP6R1N709lgF2/uShWlzwBvSlZlKwrFZCYzJKornv
         tV6Ee9cvgu1twQtKPaReOuTudUdGOeLhcqbLo/XIIzWPqy8uQlTYjqJmS3rtEk/wvgDX
         0QOQ==
X-Gm-Message-State: AOJu0YzgL5ryLhaxidmQV5nmHWlmHgYKLYdr+2sPxN00ewaYtPvaXhnW
	Ldl59llLnwz4X6BuD4AUgENQa9Idoz8DiogBB20BLczUlGL9qZu9yiM8vfti/UU=
X-Gm-Gg: ASbGnctg5Bca7zCpR6suOQINUVhPJQkY+mJDBlUYYrl2NVfhpfuy5bHFY7DxnpAMcd0
	VATaxnXYf3DfwC77m6ldYxp29SCTKk0i5lL2TdTU4RjqZPxG8w9806hncu6kMVIS7TPP0dyWG4a
	HP9KJMieNGLmsqqIFLIOfoiWa8C2bRT12spyMVn2fXers2FT4GOvfla3RgFaxl7HREJ+NUx7xaM
	1togPAroeELiFpKKcLer0Ci7dGfEMhRdLlarF0Wk7wQD/vM9ZAmcWuVV9Rny6USTwTYjmSNldhM
	UhIcsnf/bCcOgIvUMxa8tz4R5L5q2XYPeGqh7/TMjPAIbHRx3PNQ+JFQ106S3LsCqGC5rsvHeiy
	V9BcDZNuyU4/NKlQgvSgVsjJHqa54Rg==
X-Google-Smtp-Source: AGHT+IECEMtCo7SEN8eowpSUBQ4Ue3kWXPBTt67x92mFhm15s9F6WVgwvd0mqDOcC3y4jKrNcOlM1A==
X-Received: by 2002:a05:600c:1e15:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-4409bcfc330mr26244585e9.6.1745502625893;
        Thu, 24 Apr 2025 06:50:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac079sm21725195e9.18.2025.04.24.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:50:25 -0700 (PDT)
Message-ID: <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 24 Apr 2025 14:50:24 +0100
In-Reply-To: <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
	 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
	 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
	 <18394019E7982924.8448@lists.openembedded.org>
	 <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
	 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 13:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215373

On Thu, 2025-04-24 at 14:41 +0200, Alexander Kanavin wrote:
> On Thu, 24 Apr 2025 at 14:14, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > In the two examples above, what is UNPACKDIR set to?
> >=20
> > Sorry, let me be more specific. What are the actual values of S and
> > WORKDIR for the different cases?
>=20
> Can we step back for a bit? The original error is that 'devtool
> upgrade' breaks cryptically on recipes that set:
>=20
> S =3D "${UNPACKDIR}/git" (instead of the usual WORKDIR/git).
>=20
> (everything else being the defaults from oe-core).
>=20
> Devtool, in this case, calculates the 'top level source' to be the
> same as UNPACKDIR, and breakage follows.
>=20
> An example of such recipe in core is
> meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb

Stepping back further, we had this mess in devtool in the first place
as it could never work out which files in WORKDIR were "sources" which
it needed to handle carefully.

We now define UNPACKDIR as the place we unpack files to. devtool in
theory can therefore just redefine UNPACKDIR and WORKDIR and things
should 'just work'. The relation of the subpaths between the two should
remain the same.

This should therefore make the code in devtool simpler, not more
complex.

Your patch isn't doing that and I'm wondering if there are code paths
in there which are no longer needed if we handle UNPACKDIR correctly/as
intended.

So in summary, something isn't adding up here to me but I'm not yet
sure quite what.

Cheers,

Richard


