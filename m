Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.13083.1606841395437451173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 08:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=wvlfC1AK;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5D8D4206B7;
	Tue,  1 Dec 2020 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606841394;
	bh=GF1xj+e0m9NJAoBcqmclkj+l5IUY/cFL2hD+nduvvHU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=wvlfC1AKpk4IniWCIsz0EgnotUVh73hckavto/ng09p7YNkbNanfGUNSbAvV9rdyO
	 l1FaNCJex93foN+w+vk3YxcO8XHWV+6RRfpozw3B+CIWiF86e9gA8nO9hVhSIlaEif
	 LxyIWTuAbaSrls0zh8AWlNZgoScHVKsAWG8z6HH4=
Subject: Re: [OE-core] [meta-oe][PATCH v2] procps: split into binary subpackages
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201201034326.11447-1-okaya@kernel.org>
 <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
 <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com>
 <0976a2df7109d102b71033dc444ba9414670d4aa.camel@linuxfoundation.org>
 <CAP9ODKoT12CUNKJnqT_edYu3-Ei-zganQzskRx47OLrJWwXcEQ@mail.gmail.com>
 <63d2d693-dece-0c94-87f9-7965cbb56686@kernel.org>
 <5b161d2cc31540dc73c42df6068e0ef7f69574f2.camel@linuxfoundation.org>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <278a2145-7ebe-ea4b-375c-c2e65e69a06a@kernel.org>
Date: Tue, 1 Dec 2020 11:49:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5b161d2cc31540dc73c42df6068e0ef7f69574f2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/1/2020 10:07 AM, Richard Purdie wrote:
> On Tue, 2020-12-01 at 09:39 -0500, Sinan Kaya wrote:
>> On 12/1/2020 9:30 AM, Otavio Salvador wrote:
>>>>>> I am starting to get a little worried about the direction these
>>>>>> patches
>>>>>> are heading in. How much of the system are we going to split into
>>>>>> individual package per binaries?
>>>>> I am wondering why this is a concern for you? If we keep the old
>>>>> package rdepends on the new ones I see no problem in allowing this
>>>>> granular packaging.
>>>> Taking this to a conclusion its heading towards, most recipes
>>>> generating more than one binary would end up with this splitting code.
>>>> I don't like having large blocks of python in each recipe and heading
>>>> that way means we should probably change approach somehow.
>>>>
>>>> My worry is that simpler recipes are easier to maintain, test and
>>>> upgrade.
>>> Maybe Sinan could try to rework this and move the python code to a
>>> class reducing code duplication?
>>
>> The problem I'm trying to solve is I only need ps file out of this
>> entire package. Everything else in this package is useless for me. I'm
>> sure no-one wants dead code in their system especially if they are size
>> constrained.
>>
>> Ideal solution would be to have --with/without-foo support upstream
>> that we can configure with PACKAGECONFIG.
>>
>> I'm happy to look at other options if there is an alternative.
> 
> The question is how many other packages are you going to need just one
> thing out of?
> 
> You might want ps, someone else might want something different. We've
> had this problem a lot with util-linux and e2fsprogs so we split those
> in the end as the patches were getting painful.
> 
> If this is a widespread issue we might want to have a generic class,
> kind of like lib_package but for splitting the binaries into individual
> packages.
> 
> I just need an idea of how big this problem is going to be as I don't
> want to iterate over half the recipes in oe-core over the next 9
> months! :)

I see. In terms of my project requirements, the only package that I'm
planning to go after like this is sudo.

We should not open the path for subpackages across the board. We need to
prefer PACKAGECONFIG as the right option.


