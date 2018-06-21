Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4789A7869C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 05:32:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5L5UcRN009567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jun 2018 22:31:34 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 20 Jun 2018 22:31:27 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
	<20180619114512.11699-3-richard.purdie@linuxfoundation.org>
	<4b8dea8f-7f02-98c1-f87b-8b4a80912736@windriver.com>
	<e679e3237e1e9b57a5c92e809fb6e59c38f8f77f.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b59446b4-4499-0842-fa0a-7c169ee6bc2c@windriver.com>
Date: Thu, 21 Jun 2018 13:34:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e679e3237e1e9b57a5c92e809fb6e59c38f8f77f.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Thu, 21 Jun 2018 05:32:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2018 05:54 PM, Richard Purdie wrote:
> On Wed, 2018-06-20 at 08:47 +0800, ChenQi wrote:
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -487,7 +487,7 @@ HOSTTOOLS += " \
>>>    "
>>>    
>>>    # Tools needed to run testimage runtime image testing
>>> -HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
>>> (bb.data.inherits_class('testimage', d) or d.getVar('TEST_IMAGE')
>>> == '1') else ''}"
>>> +HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
>>> (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True,
>>> False, d)) else ''}"
>> After this change, testimage and testsdk is limited to be used via
>> IMAGE_CLASSES. Using INHERIT directly will cause commands missing
>> when testing.
>> e.g.
>> INHERIT += "testimage"
>>
>> Is it designed to be so?
> Using INHERIT += "testimage" is bad form since it adds the testimage
> task to things that it makes no sense with. Consider "bitbake bash -c
> testimage" for example.
>
> So yes, it was designed to do this, unfortunately it breaks the
> autobuilder though.
>
> I will likely want to fix the autobuilder not to do this and use the
> new test code. We're about to change a lot of the autobuilder codebase
> around to the new one so it probably makes sense to make that change
> after we move to the new codebase.
>
> For that reason I'll probably temporarily fix INHERIT of testimage to
> work again but going forward, that support will be removed as it
> doesn't make sense and IMAGE_CLASSES is the correct way to do it.
>
> Does that make sense?
>
> Cheers,
>
> Richard
>
>
>
>
Yes. Thanks for explaining this in detail.

Best Regards,
Chen Qi

