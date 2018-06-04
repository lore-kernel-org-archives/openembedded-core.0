Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B71575125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:22:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w543Lflj004021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jun 2018 20:21:56 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:21:30 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<c445dcff9a4a8f8c5de9fbe7468ccc7fc095857e.1527670923.git.liezhi.yang@windriver.com>
	<43755bc4971a80f56aa06bbafad9ce0b62c809f9.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <27145fcd-63d6-a1ec-c011-51dfaec49aba@windriver.com>
Date: Mon, 4 Jun 2018 11:24:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <43755bc4971a80f56aa06bbafad9ce0b62c809f9.camel@linuxfoundation.org>
Subject: Re: [PATCH 06/16] gcc-sanitizers: Fix libtool .la files
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
X-List-Received-Date: Mon, 04 Jun 2018 03:22:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/04/2018 12:01 AM, Richard Purdie wrote:
> On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
>> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>>
>> Since libtool sysroot is not set when compiling sanitizers, the
>> libtool
>> does no prefix the dependency path correctly. Fix it, so that
>> programs
>> can link to sanitizer libraries without error.
>>
>> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> index e5e8452..2373dd8 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -39,6 +39,8 @@ do_install () {
>>           rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>>       fi
>>       chown -R root:root ${D}
>> +    # Fix broken libtool with stdc++, as sysroot is not set.
>> +    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'${libdir}'@=${libdir}@g" {} \;
>>   }
>>   
>>   INHIBIT_DEFAULT_DEPS = "1"
> 
> At this point we gave up and started just deleting .la files so I'm not
> sure this matters any more. Do you still need to do this?

Sory, I can't find any la files in ${D}, I think that is not needed any more,
I will drop it in V3.

// Robert

> 
> Regardless, it would be better to pass in the right libtool sysroot
> rather than hacking the .la files.
> 
> Cheers,
> 
> Richard
> 
> 

