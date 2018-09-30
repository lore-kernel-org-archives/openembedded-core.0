Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD4279979
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 01:05:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8U15kqk001842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 29 Sep 2018 18:05:46 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 18:05:45 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<2a442ec9c52896065e9d87e1cf1b58eb22534176.1538199671.git.kai.kang@windriver.com>
	<5c661c4cb3eb647f21b0b6fa3d9b50fa609bb84e.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <1edb2f51-46a0-484e-2818-146d5a289941@windriver.com>
Date: Sun, 30 Sep 2018 09:03:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5c661c4cb3eb647f21b0b6fa3d9b50fa609bb84e.camel@linuxfoundation.org>
Subject: Re: [PATCH 06/10] libcheck: avoid multilib install file conflict
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
X-List-Received-Date: Sun, 30 Sep 2018 01:05:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月29日 20:42, Richard Purdie wrote:
> On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It has one line different which is a comment in check_stdint.h
>> between libcheck multilib packages. And then causes install file
>> conflict when install libcheck and lib32-libcheck at same time.
>>
>> Remove the comment line from check_stdint.h to fix the issue.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-support/libcheck/libcheck_0.12.0.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
>> b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
>> index e646d43968..9969e27054 100644
>> --- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
>> +++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
>> @@ -16,6 +16,11 @@ inherit autotools pkgconfig texinfo
>>   
>>   CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
>>   
>> +do_install_append_class-target () {
>> +    # remove the only one line comment which causes multilib install
>> file conflict
>> +    sed -i '/^\/\*/ d' ${D}${includedir}/check_stdint.h
>> +}
> Please do this with a patch, not a sed expression.
>
> The sed expressions are a maintenance nightmare since we don't know
> if/when the header may change, or if/when this expression stops
> working.

Got it. Thanks.

--Kai

>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


