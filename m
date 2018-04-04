Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 510EC74CFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:51:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f125so1100684wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 14:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dg5yBLxAW4Rbj9GAnw4tdxpWrNcwF05kb8QC4Z08Jwg=;
	b=FrW7z3xH5iIge29YjofFsNKBY5C6mAh16J15U9ZiuWc24V8TPVQI9/mYLyRv3DQ3/8
	tYVUwA91UnHeqd4CIyeqB6TdpNEkdAhwRJFGcu+Cg7ev0BjCpCm7YB4ftdHpP9NxPqZY
	HR/T0Lni8u80ae+AsfrYz/KlSJrPqHTU6/jvDoMScs/0yJpzuL9SnuWeXgUQjpWI9FiR
	VhtrCfXv6IngA7MQVrEEc4vPRRVwI/nm4KwzicVek4GkyMqIzoZ47jhH2WNjY7VVc3Gs
	G7xkIPQaFDGKr0mcVtvAfxpYs7G44uNm9aZwMegPdHO9uKqgRBpUlUGbcfdSYGEN3YnC
	6dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dg5yBLxAW4Rbj9GAnw4tdxpWrNcwF05kb8QC4Z08Jwg=;
	b=mVNk30VCegLwHYT0CO5ClkoJkirY0D17rVJeDKX/nuARKcv46WRx6qdNP7cknxDjMU
	RCgEbn5ZOYdg3V36S57aOtU4gqhiWSdsJq/uff4ch/Lkba69r2ISN0YS1kboPGaFvp8Q
	51YIOMKQsNbsk5BehykJTTE0/R3AOkwCv9aKJR9vkne/wSeuywOz92A355RLaYUVMjzW
	vk8cVeG7mKHX75bHNx0SitLB23sRx87CeJkXQRWq8xdGGCpzTYd+526h0slqc2uC23ew
	VkCR6+xb1bPI5IyZQfRqwExT7jabsqRnPwxCNE0fA3TBkcFKq8YaXKPznh3XLt1pom1F
	SJEw==
X-Gm-Message-State: AElRT7FvDNRRlofzU0DzVHw3mOQcX/AdSBN9RLkQVbu+CoIwYhfle067
	kEMTh1Sk7JEkBomWwuZ+G4GNQx9CGM+Vb/n64/g=
X-Google-Smtp-Source: AIpwx48qKmomFPOTy6eGwdkwHVTLn6IZc7nSG9r5t9xCyjot6HkhNXDmIzr5BjZiHSYZMc1nW7RxymSFOpAp72+H6ZU=
X-Received: by 10.28.63.148 with SMTP id m142mr9195584wma.153.1522878667834;
	Wed, 04 Apr 2018 14:51:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Wed, 4 Apr 2018 14:51:07 -0700 (PDT)
In-Reply-To: <39787e20-0d21-00bd-a5bb-73faa52c0839@gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<39787e20-0d21-00bd-a5bb-73faa52c0839@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Apr 2018 14:51:07 -0700
Message-ID: <CAJ86T=Ur33ztXJ8wUXgfD1PX4LuZutTFWLM31xXuCDBHy3gRbw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Wed, 04 Apr 2018 21:51:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 4, 2018 at 2:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 3/27/18 8:48 AM, Ross Burton wrote:
>> coreutils is now using renameat2() in mv(1) but as this syscall isn't in most
>> glibc headers yet it falls back to directly calling syscall(), which pseudo
>> doesn't intercept.  This results in permission problems as files mysteriously
>> move without pseudo knowing.
>>
>> This patch intercepts syscall() and returns ENOTSUP if renameat2() is being
>> called.  Thanks to Andre McCurdy for the proof-of-concept that this patch is
>> based on.
>
> what is the performance impact of adding another stack frame and
> function call in the chain here. Do we have data ?

I'm not sure if anyone has done any formal measurements, but the
overhead of wrapping libc APIs is certainly noticeable in some cases.
For example running "git status" in a devshell under pseudo is
noticeably slower than from a regular shell. e.g.

Within a devshell for glibc:

  # time git status
  real    0m1.552s
  user    0m0.235s
  sys    0m0.870s

From a regular shell in the glibc workdir:

  $ time git status
  real    0m0.067s
  user    0m0.034s
  sys    0m0.033s

Of course most the overhead here comes from what pseudo does inside
the wrapper, not from the wrapper itself. For tasks which are CPU
bound (e.g. compiling) and calling into the libc functions which
pseudo wraps less often than "git status" does, the overhead will be
much less.

