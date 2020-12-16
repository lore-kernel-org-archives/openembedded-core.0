Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.10500.1608134999706243559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 08:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MAdVzwv+;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v2] iproute2: split ip to individual package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608134998;
	bh=OfeBfqebtLSyDEltXAoLFy8IzIERSKDSEPHOP8cXvxc=;
	h=To:References:From:Date:In-Reply-To:From;
	b=MAdVzwv+EcgD7eqJXqSrWemdpdla/PhPlaoiab+ACQ0WredWO3fWbkIcNYXvdlHim
	 4sLbLz7sVYYhXt4VXmegp+a5sH9mP6i1hYSvXYxZ/Cq9cDqLPu4iedAt0pox2siiO5
	 crKTgpZds1U5FN7Duc70QAZwykhIDQc3haju6+WI3biSEsEo0Ol6k7dSIkdsY0DLjm
	 9MdYKq4vGgh3kKOAiw56PafNORYa9SGEltza/Sm1KxAVWMbHMOKysUdTDjIkLIHdJt
	 gMX2UBEpfyxCJHFmNM6G0YqDsUbMJs046SFA4zFs5f2Tn92OTKCLQLebZ8RVUIVqvh
	 U1+9rT4eB4wkA==
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201216024141.22439-1-okaya@kernel.org>
 <fdfd532cceb2c81874e4a0ac6a9a27014a14808a.camel@linuxfoundation.org>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <24b84835-d086-7aec-2f5b-af1313039de6@kernel.org>
Date: Wed, 16 Dec 2020 11:09:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <fdfd532cceb2c81874e4a0ac6a9a27014a14808a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 6:50 AM, Richard Purdie wrote:
>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>> @@ -46,10 +46,11 @@ do_install () {
>>  # The .so files in iproute2-tc are modules, not traditional
>> libraries
>>  INSANE_SKIP_${PN}-tc = "dev-so"
>>  
>> -PACKAGES =+ "\
>> +IPROUTE2_PACKAGES =+ "\
>>      ${PN}-devlink \
>>      ${PN}-genl \
>>      ${PN}-ifstat \
>> +    ${PN}-ip \
>>      ${PN}-lnstat \
>>      ${PN}-nstat \
>>      ${PN}-rtacct \
>> @@ -58,12 +59,17 @@ PACKAGES =+ "\
>>      ${PN}-tipc \
>>  "
>>
>> +PACKAGES += "${IPROUTE2_PACKAGES}"
>> +PROVIDES += "${IPROUTE2_PACKAGES}"
> This doesn't look correct. Why do we need to add all the individual
> package splits to PROVIDES?
> 

I want to add iproute2-ip into my IMAGE_INSTALL and not take the rest
of the iproute2-$foo packages. If I don't add PROVIDES, build stage
fails saying nobody provides iproute2-ip.

> 
> or is there some other reason for this? This is basically the issue
> with some of the other package splits too, its not using the build time
> verses runtime namespaces correctly.

If I misunderstood something or am not doing it right, let me know.
