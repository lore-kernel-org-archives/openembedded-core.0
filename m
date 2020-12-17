Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.825.1608165051399141823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 16:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Z5qy2S9p;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v4] iproute2: split ip to individual package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608165050;
	bh=wDJm70AB5WIQzeuFq7D1R3xiwTP2748ld7NLefK+ZOA=;
	h=To:References:From:Date:In-Reply-To:From;
	b=Z5qy2S9pT6vJShg/WaD5WaELQXbxiyFAlFzXTCErvpqcltimGb0Qkk3Uxm11gfNvS
	 udinWJuxnVHBYMZwUS39YZs+K4xr2IcSHyAIVnXq0w8gmGGmiz1zRAOEx8m2j74Gp9
	 ZT+20IHOCAu/RjomQ1kvAeEqSg32/w/PQ1rnhxMTX+RNNIUzN8GQiPf5Xc4w7i1UPg
	 DoCl/C9p6aIW4Zol089gIauQvF2aG7/V0duEOhXKj9JRMTPxA4j5zxOru4c4STq421
	 7qAPqKNKhByV2vLJuD7XxxYAaO4ooRxLiOlB7i8hnJ7fSHwQwLJkWYOQIQ+XG0RUEV
	 QOlCq3xsK8bHQ==
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20201216175021.18813-1-okaya@kernel.org>
 <c140c451791b4523b97df878f492fba8@XBOX03.axis.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <998de3f5-13a8-6a77-903b-172d4c542309@kernel.org>
Date: Wed, 16 Dec 2020 19:30:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c140c451791b4523b97df878f492fba8@XBOX03.axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 6:19 PM, Peter Kjellerstedt wrote:
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
>> @@ -58,12 +59,16 @@ PACKAGES =+ "\
>>      ${PN}-tipc \
>>  "
>>
>> +PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
>> +RDEPENDS_${PN} += "${IPROUTE2_PACKAGES}"
> 
> This breaks backwards compatibility. The iproute2 package today 
> does not bring in all the sub-packages. 
> 

OK, Let me fix this.

>> +
>>  FILES_${PN}-tc = "${base_sbindir}/tc* \
>>                    ${libdir}/tc/*.so"
>>  FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
>>                        ${base_sbindir}/ctstat \
>>                        ${base_sbindir}/rtstat"
>>  FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
>> +FILES_${PN}-ip = "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
>>  FILES_${PN}-genl = "${base_sbindir}/genl"
>>  FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
>>  FILES_${PN}-nstat = "${base_sbindir}/nstat"
>> @@ -71,7 +76,7 @@ FILES_${PN}-ss = "${base_sbindir}/ss"
>>  FILES_${PN}-tipc = "${base_sbindir}/tipc"
>>  FILES_${PN}-devlink = "${base_sbindir}/devlink"
>>
>> -ALTERNATIVE_${PN} = "ip"
>> +ALTERNATIVE_${PN}-ip = "ip"
>>  ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
>>  ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
>>  ALTERNATIVE_PRIORITY = "100"
>> --
>> 2.17.1
> 
> If you are this space constrained, I would suggest adding bbappend files 
> to your own layer for these recipes instead. That is what we do so we can 
> control exactly what files we want or not. E.g., this is what we have in 
> our iproute2_%.bbappend:
> 
> EXTRA_OEMAKE += "SUBDIRS='lib tc ip'"
> 
> do_install_append() {
>         # Remove unused files
>         rm -f ${D}${base_sbindir}/ifcfg
>         rm -f ${D}${base_sbindir}/rtmon
>         rm -f ${D}${base_sbindir}/routef
>         rm -f ${D}${base_sbindir}/routel
>         rm -f ${D}${base_sbindir}/rtpr
> }
> 
> With the above bbappend, the only binary left in the iproute2 package is in 
> fact "ip".

I do something very similar in my bbappend now. On the other hand, we
have an upstream first principle in the company. I would rather try to
find an upstream friendly solution that works for everybody without
breaking existing users before falling back to bbappend route that I
need to maintain forever.

> 
> //Peter
> 

