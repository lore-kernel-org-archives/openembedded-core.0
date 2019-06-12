Return-Path: <alex.kiernan@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6593A7E703
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 18:02:51 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id n189so12055541itd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yeheDQkuHmcCyNxqnhDGoBZC2qc3NHQXrn/CBGxZ7PI=;
	b=Wpir8aVcm3DedLs0pLb+G+s+KgRGqZdLe9S94qn33nE1VBMn8HGJFXvM6RiV+mumFg
	5a/yeVb5yEhM4qFr98q3HkPbbKvR3sXjTaJGsPK0oBt5UhM+IGjp97Kbm+rO1Vm3D1WF
	aVpshzu8iMlLrxya7aWd1j4EYQGT2y/38OuatWYb1K7p0tMbhIRAWalRzym4juocoycv
	TOzeq6HyxKSGFxv2i6dFHaIHNdebL6Rpp7DBi6jUmmc7iGxWpvHBp9K4DGT9CDTLFyZa
	u7UHKcbzxTQb04/IqefKHf7rauOYyYF7psNoSnBnIQbOYXJ2fWMY5IZw+fdHO7ckzAr0
	DvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yeheDQkuHmcCyNxqnhDGoBZC2qc3NHQXrn/CBGxZ7PI=;
	b=c/4+SrpXbWcmCqFLMCekJl25tmxo4m2SZCmzu+7ZZ7y6VS94BJjmAZgLGNXvBp616o
	EsxYLTxgmufUztygbEOwZULWlPgo2bDi54F6rDxpRdfVG1p9mHPAg7lKcKVliE3GoxdK
	qJ8CDzg+gEA/BXC7g5jr8QLy9vnUiEEEUV2bhQBQsakmHGRz2zZZXxgu2LdEt6ljqug7
	6Sw5nu4GgH9wNJj/CTRSbm5WSsPnRM14ftw1dYkznm2PGYcqjRLqkncWPsNcUPVEnlUs
	Z9ZUOyfxRuDsOaUk5MSuuyxy5zOgSce9IY+73nqV6cAIqJUEREzGpyIqUjysJP/LL/pw
	rblw==
X-Gm-Message-State: APjAAAWSxD5IO3ylFtoUYsY0FzesRwlL0+kjIKhZWR+b124L1B0vsv+O
	IMQemtuuY72OIjkpW9kL3OOYerf03wR+kcwfSsOg1tNm
X-Google-Smtp-Source: APXvYqwqOolvEDytnpPxM25iMi+kcBH4fwSKpbCPgP4dqM1NaT1QHUah6SKiDVzj0AkSpC40NZGD/CIOpXlmAwBlTQc=
X-Received: by 2002:a24:e53:: with SMTP id 80mr285046ite.45.1560362572249;
	Wed, 12 Jun 2019 11:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190612081559.5102-1-alex.kiernan@gmail.com>
	<51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
In-Reply-To: <51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Jun 2019 19:02:41 +0100
Message-ID: <CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2019 18:02:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 12, 2019 at 10:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-06-12 at 09:15 +0100, Alex Kiernan wrote:
> > Since UBOOT_DTB_BINARY empty means we don't need to inject signatures
> > into the U-Boot DTB, we can remove the dependencies between consumers
> > of
> > these two classes and resolve a circular dependency between u-boot
> > and
> > kernel.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/classes/kernel-fitimage.bbclass | 2 +-
> >  meta/classes/uboot-sign.bbclass      | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Really wish we had tests and documentation for these classes...
>

I know... I have a dread anytime anyone touches it, me included... I
sat on this change for a couple of weeks too.

The truth is the pair of them are fragile and hopelessly intertwined,
but without tests they're never going to get rewritten, so I might try
and take some of that on (or get someone here to do it) as I still
have multiple issues with them - signing doesn't really work the way I
want, I still have a circular dependency I've not tracked down,
doubtless other things I can't immediately bring to mind.

If we were to add some tests around it, what would you pull out as the
simplest thing that it could do which would be valuable?

-- 
Alex Kiernan

