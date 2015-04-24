Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBE3B6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:14:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O8ETba008711
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Apr 2015 01:14:29 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 24 Apr 2015 01:14:28 -0700
Message-ID: <5539FB6C.3010301@windriver.com>
Date: Fri, 24 Apr 2015 16:14:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1429858183.git.Qi.Chen@windriver.com>	
	<2894e3f1ce4dc1dc2a6ab45859b0425e21184a7a.1429858183.git.Qi.Chen@windriver.com>
	<1429860029.26983.127.camel@linuxfoundation.org>
In-Reply-To: <1429860029.26983.127.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.236]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] populate_sdk_base: avoid executing empty function
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
X-List-Received-Date: Fri, 24 Apr 2015 08:14:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2015 03:20 PM, Richard Purdie wrote:
> On Fri, 2015-04-24 at 14:50 +0800, Chen Qi wrote:
>> `bitbake uninative-tarball' raises the following warning.
>>
>>      WARNING: Function  doesn't exist
>>
>> This is because SDK_PACKAGING_FUNC is set to "" in its recipe.
>> Anyway, we need to check this variable to avoid executing empty function.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/populate_sdk_base.bbclass | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 5c07693..6e3e84f 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -94,7 +94,11 @@ fakeroot python do_populate_sdk() {
>>   
>>       bb.build.exec_func("tar_sdk", d)
>>   
>> -    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
>> +    sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True)
>> +    if sdk_packaging_func:
>> +        sdk_packaging_func = sdk_packaging_func.strip()
>> +        if sdk_packaging_func != "":
>> +            bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
> This is slightly overcomplicated. You can just do something like:
>
> sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True) or ""
> if sdk_packaging_func.strip():
>      bb.build.exec_func(sdk_packaging_func, d)
>
> Cheers,
>
> Richard
>
>
>

Thanks a lot.
I'll send out V2.

Best Regards,
Chen Qi

