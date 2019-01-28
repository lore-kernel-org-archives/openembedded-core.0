Return-Path: <Xulin.Sun@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 724396D73C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 01:42:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0S1fT7g003166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jan 2019 17:41:39 -0800
Received: from [128.224.163.161] (128.224.163.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Sun, 27 Jan 2019 17:41:18 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190118022248.17108-1-xulin.sun@windriver.com>
	<1548126237-38328-1-git-send-email-xulin.sun@windriver.com>
	<96973bd45e71375db51edeabc57c27503feddd9f.camel@linuxfoundation.org>
From: Xulin Sun <xulin.sun@windriver.com>
Message-ID: <2855a235-7e38-c236-ff60-a2439f17d3df@windriver.com>
Date: Mon, 28 Jan 2019 09:41:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <96973bd45e71375db51edeabc57c27503feddd9f.camel@linuxfoundation.org>
Subject: Re: [meta-oe][PATCH v2] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Mon, 28 Jan 2019 01:42:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/27/2019 07:15 AM, Richard Purdie wrote:
> On Tue, 2019-01-22 at 11:03 +0800, Xulin Sun wrote:
>> To avoid issue like below if run "bitbake lib32-core-image-minimal"
>> with series userspace packages(LAMP,krb5...) added.
>>
>> Add multilib_script support for openssl's c_rehash which is a perl
>> script.
>>
>> Error: Transaction check error:
>>    file /usr/bin/c_rehash conflicts between attempted installs of
>>    lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-
>> r0.aarch64
>>
>> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>> ---
>>   meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>> index 5c4e69c..21359fa 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
>> @@ -206,3 +206,7 @@ RREPLACES_openssl-conf = "openssl10-conf"
>>   RCONFLICTS_openssl-conf = "openssl10-conf"
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +inherit multilib_script
>> +
>> +MULTILIB_SCRIPTS = "${PN}:${bindir}/c_rehash"
> Peter's feedback still needs addressing on whether c_rehash is in ${PN}
> or ${PN}-bin?

c_rehash is in ${PN}-bin.  if no other concerns, v3 will be sent.

Thanks
Xulin
>
> Cheers,
>
> Richard
>
>


