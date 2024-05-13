Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECACC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 16:01:21 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.64664.1715616070730715261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 09:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNuW7/+Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f3a49ff7dso5924042e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715616069; x=1716220869; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEYIwj+PLmrb/Za3SAhJd6o4QWiwuVyfCt1F+vqwO1U=;
        b=iNuW7/+ZI+iHqSJbu0lgjUmKXRjDry37CZ/AiaWQTjEYYSiXqo9bnewC5mjdkV0umY
         iQAUjrribeiQGoywn3Ur8RnltEHS0MXrF73NNeVCsrwLvdmCp8ap6+YLgb7ngItGLzwG
         C/MIMLNcoGwqFOgNzZZ0jL6inV5lUumFiTBMDQ6dEzITZ7i+4VzCJqGKKV3dxUVi+nWN
         soaZsRbgE3dEJ0c2fWyNk7LgKBhqHP2olGVqn3IzZ8vSEzu8P6svPJXJCSfU4T0gys6w
         BhjUJhDs//UFQDxVWE23EIEr0HPMh3WlLPuSlM4ohOTwoyb/rM1BxfP6+g3H4y/XK5MN
         LlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715616069; x=1716220869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEYIwj+PLmrb/Za3SAhJd6o4QWiwuVyfCt1F+vqwO1U=;
        b=brM9j/c5qCRGyvmxRr2XijccupZqDhChpjhlPZ0pmH+26Ymk3WTUkalDCwpS75zyF3
         y7csaQ1D8S0NwNB85muzar6Rt1sO467fr9RX8jXXjwgX7R6m/2Q3E5jCQbVYXUG6+DS+
         +agFmL5c2bVK4YrD0bVSonDlMQ4HmxIJRv4U1tdOcVvWJ235an273GC0faDwsLJWb3Od
         Q6FAS0V2rQAv/6Cv+xvtB7aIWCdJiFlE4OzzTmL32BdL9W2bcuZu4jEe04HEX7mJKgGS
         XMTYtsptcVbttsQqwa1xtErlQ/ZCOXFp6a4Y35UyDi7p0pYc57NQi+OhRJG25aJHMiND
         GnCA==
X-Forwarded-Encrypted: i=1; AJvYcCXGkvB8Xx49zuZLeVHjtXiLK27c7VcUeqgXMIIbeBkZxfvMmekasf5yT7jHTM2/m2aKw2V+Kc16Gka7qTHhAc9UTfS5WbdtnJBwUd8ynxtkKowyxfsa0D+J
X-Gm-Message-State: AOJu0YzOQM4IDQdEwHswBjsBF0nSXSeH1zyrPe8FfS3nAEYdbHCOFDgB
	qs3HRVQneJIJfFZF6t6fN1dnpvloWTGbBbibDHIQAbK5pSqMc+xARjJlP0oXPkTtvSdCTkryRWc
	Ggn6F1re1xvuLIHsB96SpZSJAMjY=
X-Google-Smtp-Source: AGHT+IEaGC7TuC1B+EOOzskCWle0qR+Ruc9QppQhEpua+TNS7JzmeTT0w+bbvKekE9OjxBmdMML9vBv5mXY3RujAhNc=
X-Received: by 2002:a19:f601:0:b0:522:b1f:24c1 with SMTP id
 2adb3069b0e04-5220fc7dd36mr5794697e87.19.1715616068612; Mon, 13 May 2024
 09:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
 <1d0d45e7-b12b-4f9f-be5f-89b85b9d0b41@gmail.com> <CANNYZj_M1e+wAbvyvn5dAfxmKrzcrC3tX2TcWNum5CqmJ0Hruw@mail.gmail.com>
 <AD01E4CD-6C57-4D17-8C7B-E4AFB0C01C12@arm.com>
In-Reply-To: <AD01E4CD-6C57-4D17-8C7B-E4AFB0C01C12@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 18:00:56 +0200
Message-ID: <CANNYZj85avnQgr=i_mp551nLuv8oVPLS2urN8nm2nxBo2sww5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 16:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199245

On Mon, 13 May 2024 at 17:53, Ross Burton <Ross.Burton@arm.com> wrote:
> > That chain happens only when gobject-introspection-data is in distro
> > features, and that is only present for target builds, not native or
> > nativesdk.
>
> There is a long-standing goal for G-I to work in both native and nativesd=
k, so I=E2=80=99m curious if this is the sole blocker for nativesdk to work=
.

I don't know. You first need to specifically add
gobject-introspection-data to nativesdk distro features, and then all
kinds of things are likely going to break, even if BBCLASSEXTEND is
set correctly everywhere. This is very much out of scope for this
version update.

Alex

