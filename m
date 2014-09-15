Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 01DC365CE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 03:57:05 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c9so1510201qcz.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 20:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TIru4RvalwrYu3krL6DaBvDJQMDOaHPrbrg26oNlZGE=;
	b=MZVCNftcaLTwhi3P63v6xKXY8zGW7gxzFX2A+kIz4S7rZeO1ve5nG6wQRIhHrxiE7V
	It/OPlP3XJqcSGnK8WOxCZtvJBM5aWd740ZKxu8+P6srBs7BYNbHtIhyODCUE4GgkelD
	hQL0m0C/SgbI6827CisGDKb0ZbVhYK57pe4GUpHqJoZq9WaJbqHIzfT1neHAz0IQ/FIA
	piVw9F9iaVY2GKO4fnEO39NLJXhUt9ymVv+oYj+Osg6ECFMASq4Tf7ncV4IaproqJU0d
	koa5FL/LDibxZ/TkX4WmxsAjv/w4SkLMtgLpLdTTnDBePWBt/GADvmh/nO/ZkmKO6Htf
	SKCg==
MIME-Version: 1.0
X-Received: by 10.224.115.139 with SMTP id i11mr14084198qaq.86.1410753426717; 
	Sun, 14 Sep 2014 20:57:06 -0700 (PDT)
Received: by 10.96.138.101 with HTTP; Sun, 14 Sep 2014 20:57:06 -0700 (PDT)
In-Reply-To: <CACS+7ZRkE2=RWVGQO_oG_MuSFGF722f1cQza+sOkS+k1wVHybg@mail.gmail.com>
References: <CACS+7ZTLWpoBXXezLOH5k=i9-x4869mrM35ZfhY5=Wsj2d=c7Q@mail.gmail.com>
	<CAJTo0LbT0CkWqp5MoOYS-zg838113JP7GhSuRPYK8WNjNegwXA@mail.gmail.com>
	<CACS+7ZRkE2=RWVGQO_oG_MuSFGF722f1cQza+sOkS+k1wVHybg@mail.gmail.com>
Date: Sun, 14 Sep 2014 21:57:06 -0600
Message-ID: <CACS+7ZRA+ZBggnPPnJMVb8ExsVgzGdbW2JoaXsWFQ38FUAsF2g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Mon, 15 Sep 2014 03:57:07 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2014 21:16, Dan McGregor <danismostlikely@gmail.com> wrote:
> On 14 September 2014 14:48, Burton, Ross <ross.burton@intel.com> wrote:
>> On 13 September 2014 04:06, Dan McGregor <danismostlikely@gmail.com> wrote:
>>> +python __anonymous () {
>>> +    arch = d.getVar("TRANSLATED_TARGET_ARCH", True)
>>> +    if arch not in { "i586", "i686", "x86_64", "arm" }:
>>> +        raise bb.parse.SkipPackage("libsanitizer only works on Intel and ARM.")
>>> +}
>>
>> Shouldn't this be something like
>> COMPATIBLE_HOST=(x86_64.*|i.86.*|arm.*)? (assuming it doesn't work on
>> aarch64, which isn't matched by arm.*)
>
> Probably, yes. I'll look into whether they work on aarch64 and update this part.
> In the mean time, this fixes Jonathan's issues with the last patch, so
> I think I'm
> at least heading in the right direction.
>

Even better! I've been ignoring the platform specific stuff in the
sanitizes. The only platform
that might give trouble is little-endian PowerPC. This entire clause
can be dropped. I'll test it
tomorrow on big-endian PPC to make sure this actually works.

