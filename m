Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D383C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 11:25:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.47564.1743074750786923899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 04:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hA68JJzz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3913b539aabso423592f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743074749; x=1743679549; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dz72/Yb632pK/da3m/DjYrC3DnqEZmaQevL+K4IBgXw=;
        b=hA68JJzzilSfs1cSQgRJSBMfwvhyU06ePF6Mq1A15MOuq9MQ0lb/QFeT4EUgJBH0FQ
         VAgA244p8/DldrZFz3qyahFPzoiZJWLYHe1QcIK6OO+B8lrGwJKndJ7+3NoTq4yAnRrb
         83crwqhv+fVgKCLM2+948wwTuHZivLT0OZsgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743074749; x=1743679549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dz72/Yb632pK/da3m/DjYrC3DnqEZmaQevL+K4IBgXw=;
        b=m5BX6xvtgvadZ6upWqrQIuRchhsQzpYU1bayFZp7iIDHiNLjdRHUplnnlfGh6AOaAl
         F4aHChZrBbL3MVk7xkEZ8vveMJqWZ/dlVWvGkQkHXyaizkZQcDYBhRRUNhTJMO1RfkI+
         GGuYFmJkvtB8ePSE22D4ApjKKcBP33FKfennUphl11T/8aJRtjsjx7skrO7i5aAS9IxM
         /dL6jVwpOtsLU1lwAVCndpyYNiS2GW6qnG8YFEZ7mXaYlBwFpUZUJjpgiUnmjfA47r+l
         4eVqSxtVsrn04L/FBAWBezeFfXCvfMT0MkjHDBnRMhI5xqy4vaPl345UWlvaaZP8kXHl
         Plcw==
X-Gm-Message-State: AOJu0YzAAGBz2mE6Bnz1YHo4eevl5c35oHViAwtRM2ZvmIYZwZvFtvL8
	YlDfPWyGyS1NdrE9fUAUa/Pgq0pS+jmaGO/J0WTVYy3gPyMkBT6NhQozJV+copE=
X-Gm-Gg: ASbGncvnaQZb9S6EzG1KXr1r60YyalaSFKirDKRhyTwHK4MaHsIlkPs1AfrvakOOAte
	5wDWdaygnyrMAMXUJ1Nm30Lray5shwD1Uughyd+QMtq0IgaUwKGiiZZD/n1J2AqOGQKf3uXV9CZ
	7zDWLUpzs7kVRPGtoMr+k4+Vqr8op/ZZGDVB/y48QMjFeQZD46IX3xWm3unPn4XAnKlD9pJEy9S
	L9Atlfu3MFKLy1ltbnXlPzhrUmuGqckTwmYAZAP17HaJ2UBd06ho2KgqoOuNJPDk8we11r9c4jO
	xqOGaZrW1ypAqxkn5j8zm0mq/HzPkUeuMrAtXfL2bzN0W7eyUm+K1OMPJNRKg7c5p65nkFE4r5f
	j69j2uKEyOC4fMTK7fU+0Ucgf6OgNNPzbvQ==
X-Google-Smtp-Source: AGHT+IH3nciTRjwKktr6oCmKVWJKJxQnlbqc4mBfpLGRcCqXV9waUJrUOI1I60UZlsiwjvnOHphjtw==
X-Received: by 2002:a5d:6c6e:0:b0:391:3bdb:af5d with SMTP id ffacd0b85a97d-39ad174ae7bmr2779958f8f.28.1743074749031;
        Thu, 27 Mar 2025 04:25:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:16c3:89b9:44c2:d892? ([2001:8b0:aba:5f3c:16c3:89b9:44c2:d892])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995778sm19779931f8f.11.2025.03.27.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:25:48 -0700 (PDT)
Message-ID: <c688ddacdb12fbf3b5ff45b27e6a63f7e8892ccd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/3] version-check.conf: add mechanism for
 checking version mismatch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Date: Thu, 27 Mar 2025 11:25:47 +0000
In-Reply-To: <CANNYZj-hqZOEcwtvnCdSY-FrVBfR8bZxS3OgjUmWLLQ__+307A@mail.gmail.com>
References: <cover.1743052694.git.Qi.Chen@windriver.com>
	 <2ade23315e080afec9b58e7dbb615b5e6d3262aa.1743052694.git.Qi.Chen@windriver.com>
	 <CANNYZj-hqZOEcwtvnCdSY-FrVBfR8bZxS3OgjUmWLLQ__+307A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213725

On Thu, 2025-03-27 at 12:22 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Thu, 27 Mar 2025 at 07:22, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> > The basic idea is to use qemu to run executables at build time,
> > extract
> > possible versions, and check if there's a mismatch found.
>=20
> Should this check be in its own layer for now? If it's in core, there
> should be evidence that it's broadly useful and used (and no one's
> asked for it before as far as I'm aware), and it should be tested for
> correct behaviour and against regressions. I don't feel it meets
> these
> criteria at the moment.
>=20
> Git fetcher has recently gained the ability to match up source
> revisions with tags specified in recipes, and will error out if
> SRCREV
> is set wrongly. We just need to update recipes to specify tags (with
> ${PV} in them somewhere, so they remain valid on version updates). So
> sending in those updates would be most welcome.

The new SRCREV vs tag code was my first thought when seeing this patch
too.=C2=A0

It is a nice idea to check the version information and having something
somewhere to do it is nice but I'm not sure maintaining this in OE-Core
is the right thing to do for it...

Cheers,

Richard

