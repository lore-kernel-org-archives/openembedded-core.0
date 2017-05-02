Return-Path: <dev@codyps.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id B791171D7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 15:49:14 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id m36so115423334qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 May 2017 08:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0dBM0+F84lSm0+JsX9nxpfBHBNIOXEvNv8V/F0l0AGw=;
	b=REcYH+GR91ds2HUPPp49o9PQp7zLked2T5Ajt1lUoP+NP/lq+MA6SJRxQ4sNmfd9hV
	3QIfFijfmdXAZ3lqpikGNib2dPUpzIE2eFdqYSP/huFZgHCfXUj5OYT/MYBDspgRH2rW
	eKMjptYh7bD7Nf3TwVUC3a2m9RCo4O3OM1+HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0dBM0+F84lSm0+JsX9nxpfBHBNIOXEvNv8V/F0l0AGw=;
	b=UpgXFfG3XOrnlJlfMsQ/FBxe4xAEgZ5CsODG3wOw1T6okGovhM4Thlj0/BRVEzqoTw
	opAl4ivI0jxgRz2GaZXBsFWtzH9tEBFjiQyA4mK1eVMt1oSSVHHBCgLFX6c/wYoT0Hbo
	t41xGv0N5qPCoq6n0XyEkaFCE1+x+VwdI03Gc7wMnHie1b0jXE/dAib3HmCgAKVLTzh1
	MJoYaOKVB9olcHSj/jL59fto8EOa0ywWrZzRex0x68BYanu0vvEayjSJGcWl0e6aQoBs
	S5/m1+m60pil7nz4fwHNHMckN6OtsT1qUC30WLlEWRnTw+IKndz9ud6TUZRsm3Q/HfkA
	8CMQ==
X-Gm-Message-State: AN3rC/5qwr6uHYpfAqDRozsx1g76lKuDnXLliTGoqUlEHuUv07UN2Wz9
	Gx6AVOE2bg9kWrPCg3YWlFiv7dtwAw==
X-Received: by 10.237.44.99 with SMTP id f90mr27312945qtd.24.1493740156287;
	Tue, 02 May 2017 08:49:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.129 with HTTP; Tue, 2 May 2017 08:49:15 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <CAJ86T=X4VYZTkCmeF1tsoKbXxYGJO-i1VPfVa36K38S1Qf-+zw@mail.gmail.com>
References: <20170501194223.16344-1-dev@codyps.com>
	<CAJ86T=X4VYZTkCmeF1tsoKbXxYGJO-i1VPfVa36K38S1Qf-+zw@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
Date: Tue, 2 May 2017 11:49:15 -0400
Message-ID: <CAPoQQ-3T6tJSTzzrpf5pfn7RXzP6FEic-54VFVt+6L=ZF5BD=w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Tue, 02 May 2017 15:49:16 -0000
Content-Type: text/plain; charset=UTF-8

>>  do_compile[progress] = "percent"
>>  cmake_do_compile()  {
>> -       cd ${B}
>
> Removing the redundant "cd ${B}" should perhaps be a separate commit?

I'm not really seeing that as useful, change right now can be viewed
as "moves the ${B} from being in `cd` to being part of the command
line for `cmake --build`". Is fairly straight forward because cmake
requires a path be specified (where `make` makes it optional).

>
>> -       base_do_compile VERBOSE=1
>> +       VERBOSE=1 cmake --build '${B}'
>
> This looks like it will cause parallel make and EXTRA_OEMAKE options
> to be ignored?

That is a good point. I don't think EXTRA_OEMAKE should matter here
too much as configuration for cmake-based builds all is read at
configure time, but the ${PARALLEL_MAKE} flag is definitely an issue.

Doing this could work:

    VERBOSE=1 cmake --build '${B}' -- ${EXTRA_OEMAKE}

(And similar for install)

And for the case of `-jN` like flags, make & ninja happen to be
compatible (they share a few other flags, like `-l` and `-n`.

Another alternative is passing ${PARALLEL_MAKE} (and
${PARALLEL_MAKEINST}) instead of directly using ${EXTRA_OEMAKE}.

Also: I took a look at what else `run_oemake` is doing, and it
contains some output printing (`bbnote`s the make command & `die`s on
make failure), which could be added directly around the `cmake
--build` invocations instead.

