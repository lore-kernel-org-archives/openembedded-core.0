Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8B07F7BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 22:39:01 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id x14so1560829qvu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M/Fx2CfPfSZujkmcWrebMWGPGivnA38zTkzWc0DsS8o=;
	b=FKoY1dVNzJJl7WeVt4gH2VqbweUe2TTmDq7Ebqq4zY+l9npZ0ilzQYe9Iao+qrFdWk
	pp9e9m2pJjwoqdCrHFPr9wsuxNanTpkHt2siJ5pNWkHwi0YRErf4TfH3n8CfapPN7kgZ
	4JRbLvhvRwWGKgwukjJO945QSknqG2bcBngSln0WyRuHgNFBW7hpEK46zXzlsMMVRUrO
	hnVWwfGQOFNPKoSrnzCZKrkyPPFp5EwFwPejXG7LEv9QgcW+4hDVgQ3VuerRl2Jw4UWK
	fm27WM3XjiuYrz0i99G783ty1iX0pfapP3klhJfSFZwM09RgAHdB1wAoi3jRAYeM/4qh
	BUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M/Fx2CfPfSZujkmcWrebMWGPGivnA38zTkzWc0DsS8o=;
	b=p1zPHprjlOM8dJUNFj99YtAmJG7FyESVtVHcvW2nlqNDAKIOCX1PJkWfDBkzg5n0p1
	85FRNPvTTDFnWfPPpps9j1FlOe8jTZ7jZ3+C+T77GP5+RuD6BNaJWNv9L/wt7+u7572n
	0ZJwp/O48WSo6JUvdQDuVbGT33IaeJXJ2PtZ8z5UYWVTwIzM8J0X2xsT3TfYm1TMJkbG
	ihDtLiCK6K/QsQuOORujfkridtuMUZu8/kbIpMQryaOll+9gBuwBiIINndYas4uSDL1P
	+sgtsVG4qb1OfqU+w0WoCsUNCaaf6WbdHsb4fvtEsM+yAKJ1mo94YqBWHDFnuGVAtF62
	r+Zg==
X-Gm-Message-State: APjAAAXNFtfoIvCS1J4f5qjg8kmqfeXHHiraSh5vvfnzH6KrVDCI3nNb
	lQRVSg3iv6L6udOvbwGOh//AW0JQRKS9dY+TG3s=
X-Google-Smtp-Source: APXvYqwNkBT4vrxEkHuOotsbvzZXBO89OlZeOineYzjpz1jQoRIapE3ET7gKZKqL6iO5zKUGMPqumb7C6VExW3pw87Q=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr5273755qvy.109.1573684742206; 
	Wed, 13 Nov 2019 14:39:02 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
In-Reply-To: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Nov 2019 14:38:35 -0800
Message-ID: <CAMKF1sqsWbbj7fJ198E0rt1OqyOG+oc4_dTd7n3B09SqSR89Sw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Wed, 13 Nov 2019 22:39:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 13, 2019 at 12:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This isn't a patch as I'm not sure how to fix the right way it but it
> seems to my that every program that calls pthread_exit() indirectly
> rdepends on libgcc_s.so.1 being installed in the system (at least when
> using glibc).
>
> This is because the implementation of __pthread_exit() in glibc calls
> pthread_cancel() which leads to pthread_cancel_init() being called in
> which said shared object is being loaded with dlopen(). When this
> fails, the program aborts with the following error message:
>
>     libgcc_s.so.1 must be installed for pthread_cancel to work
>     Aborted
>
> A quick way of reproducing it is building a core-image-minimal (which
> by default doesn't contain libgcc) with the core python3 package and
> running the simple python HTTP server:
>
>     python3 -m http.server 8000
>
> Fetching any file will result in the above crash of the python process
> when the thread serving the file exits.
>
> I'm not sure if the same issue is present in musl - the implementation
> of __pthread_exit() there is different.
>

musl will not have this issue since it does not depend on libgcc
unwinder implicitly.

> Please advise on how to best approach this.
>

use musl ;)

> Thanks in advance,
> Bartosz Golaszewski
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

