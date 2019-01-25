Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9577C32B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:28:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0P3S1ud007230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2019 19:28:01 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 19:28:00 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1548312985.git.liezhi.yang@windriver.com>
	<86fa8d401929e7641976ac57b34ee4a872ee74c6.1548312985.git.liezhi.yang@windriver.com>
	<7cb9cc96b5112286ae99e953eae706259af9ead0.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0f9356ac-57ba-0f2f-163b-3e875e16b97c@windriver.com>
Date: Fri, 25 Jan 2019 11:32:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <7cb9cc96b5112286ae99e953eae706259af9ead0.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/5] ccache.bbclass: Only let native recipes depend on ccache-native
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
X-List-Received-Date: Fri, 25 Jan 2019 03:28:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/24/19 8:46 PM, Richard Purdie wrote:
> On Thu, 2019-01-24 at 14:57 +0800, Robert Yang wrote:
>> Make native recipes depend on ccache-native should be enough since native
>> recipes are on target/nativesdk recipes' dependency chain, this can reduce the
>> size of DEPENDS.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/ccache.bbclass | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
>> index b545735..6caaca7 100644
>> --- a/meta/classes/ccache.bbclass
>> +++ b/meta/classes/ccache.bbclass
>> @@ -47,8 +47,11 @@ python() {
>>       # quilt-native doesn't need ccache since no c files
>>       if not (pn in ('ccache-native', 'quilt-native') or
>>               bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
>> -        d.appendVar('DEPENDS', ' ccache-native')
>>           d.setVar('CCACHE', 'ccache ')
>> +        # Make native recipes depend on ccache-native should be enough since
>> +        # native recipes are on target recipes' dependency chain.
>> +        if bb.data.inherits_class('native', d):
>> +            d.appendVar('DEPENDS', ' ccache-native')
>>   }
>>   
>>   addtask cleanccache after do_clean
> 
> This is not correct. Think about the case where the native recipes were
> installed from sstate. The target recipe dependencies would then be
> incorrect.

It seems that it is OK, I used base-files to do a test:

- Add 'DEPENDS += "m4-native"' to base-files_3.0.14.bb
- Add INHERIT += "ccache" to local.conf

$ bitbake m4-native

# Got the ones have been built
$ bitbake m4-native -g

Clean all the native builds to make them installed from sstate:
$ bitbake `cat pn-buildlist` -cclean

$ bitbake base-files -cconfigure

Now m4-native is installed from sstate, but ccache is still be installed
to base-files/3.0.14-r89/recipe-sysroot-native/usr/bin/ccache.

I looked at staging.bbclass:extend_recipe_sysroot(), it seems that it
did install all the dependencies on the chain.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 

