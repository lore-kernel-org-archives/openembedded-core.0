Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7108D7FA14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 13:13:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b24so2235697wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M1F7lGrwovaVv/sjqA4HEoB4Mk6p/+8ex6PjSCPFe+A=;
	b=jfimXJeWWZJ9ORc+8pn220ILDy1C3UO/or8qHYcpq21vv4a6JGPgWcd+lsUI4MjE7m
	XnOQpuMUujbpTqXfHp4UYAefHZ2pUunGhMZpOydhSisfMovSO7fCj51Dd4BJ6ubP5FWV
	n0nq5O0ARjPLzEIwq5mWJrlLry65Opud0w4oZDEiYWdsKPKOWz7MG8c36Wf6Neq3vYwb
	700poqLhnfjO4iP/o0gA9A8hL0Wwi1lgp8SupNNb8620R6JKwXtFw1x27a1FgrL8oL2v
	7QvKtJvYfs0r3mK9s/LA7rlLA6dBqd8C4DiBMr23Ch1+YE7ktI0sT6AtdxKgB/Mz8cmz
	FdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M1F7lGrwovaVv/sjqA4HEoB4Mk6p/+8ex6PjSCPFe+A=;
	b=exdEh82kBvaCAZL/SdxhY96fjvZ070UCEdf+J9mONwvZVCxp2b5AtHTcUfztyCmM80
	+nZ0ifIhK7Yd1Si6R5YxmvZUdr4ED88jTmxrL19lqbZxG9FgWIx8H/INi0VavVEqxAKW
	WB7kQ9R5JBeiw2IbILlWAT0IiuZ4qiHecN2SKR+U9zLqkbUeW+fAfJndmkjWrvYZY8BB
	KjPmNxvdehULHvIVFPmpd7FVzzryWPhPLJ+wlxyAxzwh2k6zyLqrhzzt1a4NbQ7ZAU9i
	vC/05p5ClrHKOTpqoNv2a3Ye1H2wRfhxNxU3at+/SDb8u4Bz7bisNCjq8M4u2rMxvm++
	NQrQ==
X-Gm-Message-State: APjAAAUCC2/c7bC9V+PPhSPZvNPV/umpJnJvPUqEFuahj0cGSaprnMx0
	uSGKHDBiaN/qog5zkKG6zTUPSrAZjTUZU7EkxMk=
X-Google-Smtp-Source: APXvYqyVaknrpVGy+8sRyKavABL4V9N9sarOs3JJO9P47DBOZlikvP9nj1/ZBDlxT57dC4BHjn637R81Dknl03pXrZE=
X-Received: by 2002:a05:600c:2208:: with SMTP id
	z8mr3751211wml.113.1568985235074; 
	Fri, 20 Sep 2019 06:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190917184947.2244823-1-raj.khem@gmail.com>
In-Reply-To: <20190917184947.2244823-1-raj.khem@gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 20 Sep 2019 15:13:44 +0200
Message-ID: <CAHtQpK4svi46b06dzCfCX7R-i6uiooQ0hi0mmdcOuoY+Ccm+MQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Fri, 20 Sep 2019 13:13:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Raj,

On Tue, Sep 17, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> with openSSL 1.1.1d we start seeing errors like
>
> Error Generating Key
> 139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
>
> when using openssl from openssl-native on build hosts, this is due to
> limiting the random seed to devrandom, to support older hosts, since the
> option allows to have a comma separated list of methods to try, we can
> try the default first and if that fails then fallback to devrandom, this
> will ensure that it keeps working with build systems which dont support
> getrandom()
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Adrian Bunk <bunk@stusta.de>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---

Just as a test report for this patch:

I've tested this patch on the HW (i.MX8M Mini EVK) and unfortunately
my sshd given up with a message: PRNG is not seeded

Reverting commits (effectively rolling back to openssl 1.1.1c) made
sshd operable again.:
53b5654d6e openssl: Enable os option for with-rand-seed as well
2c6b9b918c openssl: Upgrade 1.1.1c -> 1.1.1d

I'm not sure whether this is related to the Kernel used in i.MX8M Mini
series or the openssl version used...

I'd try to use a different HW to verify this patch further (perhaps
Altera CV) to see if the sshd is broken there as well.

-- andrey

