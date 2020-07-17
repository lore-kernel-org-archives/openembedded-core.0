Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.3209.1594951387816708597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 19:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06H2306M025661
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 16 Jul 2020 19:03:00 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Jul 2020
 19:02:41 -0700
Subject: Re: [OE-core] [PATCH 1/1] openssl: openssl-bin requires openssl-conf to run
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <cover.1594897729.git.liezhi.yang@windriver.com>
 <3541ef9cd5a1ebdfa20e9bfe1b1dacf4589bf2fd.1594897729.git.liezhi.yang@windriver.com>
 <a5a2f620b4203f3c4584c7d686f4991ed5e3464c.camel@linuxfoundation.org>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <21975f95-cae3-d18a-bbe2-b6830c592595@windriver.com>
Date: Fri, 17 Jul 2020 10:01:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a5a2f620b4203f3c4584c7d686f4991ed5e3464c.camel@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 7/16/20 10:05 PM, Richard Purdie wrote:
> On Thu, 2020-07-16 at 04:09 -0700, Robert Yang wrote:
>> Fixed:
>> $ dnf install openssl-bin
>> $ openssl req -new -x509 -keyout lighttpd.pem -out lighttpd.pem -days
>> 365 -nodes -batch
>> Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or
>> directory
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> index 47ed6b7640..815955837b 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
>> @@ -204,6 +204,8 @@ CONFFILES_openssl-conf =
>> "${sysconfdir}/ssl/openssl.cnf"
>>   RRECOMMENDS_libcrypto += "openssl-conf"
>>   RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
>>   
>> +RDEPENDS_${PN}-bin += "openssl-conf"
>> +
>>   BBCLASSEXTEND = "native nativesdk"
> 
> Wasn't this addressed by:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cd80b0e52ee2e008672ce910856f63176bc00480

The commit didn't fix the issues, it moved ${libdir}/ssl-1.1/openssl.cnf from
openssl to openssl-conf, but openssl-bin doesn't rdepend on openssl-conf, so the
issue still exists.

// Robert



> 
> ?
> 
> Cheers,
> 
> Richard
> 
