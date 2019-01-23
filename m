Return-Path: <Xulin.Sun@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E055E60069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 09:31:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0N9VUoc013383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jan 2019 01:31:31 -0800 (PST)
Received: from [128.224.163.161] (128.224.163.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 01:31:29 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Randy MacLeod
	<randy.macleod@windriver.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
References: <20190118022248.17108-1-xulin.sun@windriver.com>
	<ad8f8c65-e628-1102-b49d-883b4eb9ce09@windriver.com>
	<4693588ff8f849cfac2242d5323e9012@XBOX04.axis.com>
From: Xulin Sun <xulin.sun@windriver.com>
Message-ID: <f28ea34b-b4b2-d850-d6cf-6ebb8eeec732@windriver.com>
Date: Wed, 23 Jan 2019 17:31:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <4693588ff8f849cfac2242d5323e9012@XBOX04.axis.com>
Subject: Re: [meta-oe][PATCH] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Wed, 23 Jan 2019 09:31:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/22/2019 10:25 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Randy MacLeod
>> Sent: den 22 januari 2019 00:01
>> To: Patches and discussions about the oe-core layer <openembedded-
>> core@lists.openembedded.org>; Xulin Sun <xulin.sun@windriver.com>
>> Subject: Re: [OE-core] [meta-oe][PATCH] openssl: fix multilib file
>> install conflicts
>>
>> Xulin,
>>
>> Thanks for sending this patch.
>>
>> On 1/17/19 9:22 PM, Xulin Sun wrote:
>>> To avoid issue like below if run "bitbake lib32-wrlinux-image-glibc-
>> std"
>>
>> For future oe-core commits, please use a core-image-minimal
>> example that will be more familiar to people outside of Wind River.
>>
>>> with series userspace packages(LAMP,krb5...) added:
>>>
>>> Error: Transaction check error:
>>>     file /usr/bin/c_rehash conflicts between attempted installs of
>>>     lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-
>> r0.aarch64
>> Also, while your commit log explains what you fixed, it
>> doesn't describe the issue for those who don't know what c_rehash is so
>> something like:
>>
>>     Add multilib_script support for openssl's c_rehash which is
>>     a perl script.
>>
>> Followed by the example failure log that you showed.
>>
>>
>> Since this hasn't been merged to master/master-next,
>> it would be nice if you sent a v2.
>>
>> Thanks,
>> ../Randy
>>
>>> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>>> ---
>>>    meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>>> index 5c4e69cfb7..21359fa68a 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>>> @@ -206,3 +206,7 @@ RREPLACES_openssl-conf = "openssl10-conf"
>>>    RCONFLICTS_openssl-conf = "openssl10-conf"
>>>
>>>    BBCLASSEXTEND = "native nativesdk"
>>> +
>>> +inherit multilib_script
>>> +
>>> +MULTILIB_SCRIPTS = "${PN}:${bindir}/c_rehash"
> Shouldn't that be:
>
> MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
>
> given that openssl inherits lib_package and ${bindir}/c_rehash thus
> ends up in the ${PN}-bin package?

It is verified that both these two modification method ( ${PN}  or 
${PN}-bin ) are all working and can fix the building error issue.
Seems that after update to openssl 1.1.1, the file /usr/bin/openssl is 
packaged into openssl-bin.

Thanks
Xulin
>
> //Peter
>
>


