Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web10.1124.1605166531173354936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 23:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=BJLz9CtJ;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:cc:to:subject:from;
	bh=w/1wB6CAn9wXs/ztjGQhf0y/1IV1Z0qhfdNHZ0B2mUo=;
	b=BJLz9CtJqDZSAqbcXntWyLo+DDvXJzbdDS5WVEPap9tv2OuLu+M23mxJwrbDZroCw8LZW9lcLHPJE
	 5VBgGFmCjnVrKzWh+hfn/ZAjI+uIEf5MISuq+GVgJdQxoSdDlmkcBON/m6zdwQgE0u7q9i24Z2beZd
	 +KA87SHocamqHjAc0m73p83H4pM5E2iC1xjlxoVydoPwNSyDF4VjIL5hOj6o/67uUqMe0nymuk0Qol
	 Lf4WjAG7/Swz2TXtbIOj9ersac4NB23cW0l56JT9uytd+3tOoFlg0DwLwG4knoDiR0kyS1pJSDPJ7A
	 NGiX1sAhBb99VcA8zjPEagsohF23Uxw==
X-HalOne-Cookie: 029c7dcaa4a2397dc429208b9a5cdbd00c242031
X-HalOne-ID: a27eeb1d-24b9-11eb-965a-d0431ea8a283
Received: from [10.11.12.212] (unknown [83.218.73.98])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id a27eeb1d-24b9-11eb-965a-d0431ea8a283;
	Thu, 12 Nov 2020 07:35:28 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 0/2] Make rt-tests buildable for all architectures
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201111221503.2194455-1-peter@berginkonsult.se>
 <CAMKF1sqLteW=fs+A5oQD+L9JT-CyFjV+KRq+dCxX9XxBuLiyVw@mail.gmail.com>
From: "Peter Bergin" <peter@berginkonsult.se>
Message-ID: <3eb3f28c-bc38-3880-34e3-082acdc0af02@berginkonsult.se>
Date: Thu, 12 Nov 2020 08:35:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqLteW=fs+A5oQD+L9JT-CyFjV+KRq+dCxX9XxBuLiyVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 2020-11-12 02:33, Khem Raj wrote:
> this seems to improve the situation but its not clear if arches
> without frc() will now fail miserably at runtime or will it only fail
> a subset of tests and rt-tests will still be largely useful for such
> arches. In the latter case, I am fine with this series.

oslat is a newly added (in v1.9) test to rt-tests and is just one of 
many tests in the suite. With this patch the oslat application will fail 
with an error message to stdout.

     #ifdef FRC_MISSING
         printf("This architecture is not yet supported. "
                "Please implement frc() function first for %s.\n", argv[0]);
         return 0;
     #endif

I searched rt-tests repo for other usages of frc() but it is isolated 
and only used in src/oslat/oslat.c. With this patch others tests in the 
rt-tests suite can be built and run on other architectures and it would 
be helpful to get it in to oe-core to be able to run, for example, 
cyclictest on arm64.

Best regards,
/Peter

