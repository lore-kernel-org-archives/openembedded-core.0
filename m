Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A19AF77C05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:21:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2U9LolM015808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Mar 2017 02:21:51 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 30 Mar 2017 02:21:50 -0700
To: Gary Thomas <gary@mlbassoc.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1490863008.git.Qi.Chen@windriver.com>
	<ae8133ce6aa20fd7e0f6189ebad556a5716d5111.1490863008.git.Qi.Chen@windriver.com>
	<f9f0bdc7-2ac3-90f2-706e-012ffe86f501@mlbassoc.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0b9253f8-4be5-32d4-71ed-70831f12c43e@windriver.com>
Date: Thu, 30 Mar 2017 17:23:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f9f0bdc7-2ac3-90f2-706e-012ffe86f501@mlbassoc.com>
X-Originating-IP: [128.224.162.201]
Subject: Re: [PATCH 1/1] wic: improve error message
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
X-List-Received-Date: Thu, 30 Mar 2017 09:21:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2017 04:54 PM, Gary Thomas wrote:
> On 2017-03-30 10:37, Chen Qi wrote:
>> When using `wic create mkefidisk -e core-image-minimal', the following
>> error message appeared.
>>
>>   Please bake it with 'bitbake parted-native' and try again.
>>
>> However, following this command doesn't do any help. The same problem
>> still appeared.
>>
>> The problem is that when we 'bitbake parted-native', it doesn't have
>> anything to do with core-image-minimal. And the required tool 'parted'
>> is not under core-image-minimal's recipe-sysroot-native directory.
>>
>> Improve the error message so that following it could get things done.
>
> Why not just fix the wic-tools recipe directly and not push it off 
> onto the user?
>

wic-tools does have 'parted-native' in its DEPENDS.
I met this error when I used wic command before I executed `bitbake 
wic-tools'.

What's important here is, when an error message suggests the user to do 
something, the suggestion should at least have some chance to work. But 
following the current error message has no chance to fix things.

Best Regards,
Chen Qi

>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  scripts/lib/wic/utils/misc.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/lib/wic/utils/misc.py 
>> b/scripts/lib/wic/utils/misc.py
>> index c941112..1b0ab3b 100644
>> --- a/scripts/lib/wic/utils/misc.py
>> +++ b/scripts/lib/wic/utils/misc.py
>> @@ -131,7 +131,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, 
>> catch=3, pseudo=""):
>>                "was not found (see details above).\n\n" % prog
>>          recipe = NATIVE_RECIPES.get(prog)
>>          if recipe:
>> -            msg += "Please bake it with 'bitbake %s-native' "\
>> +            msg += "Please make sure wic-tools have %s-native in its 
>> DEPENDS, bake it with 'bitbake wic-tools' "\
>>                     "and try again.\n" % recipe
>>          else:
>>              msg += "Wic failed to find a recipe to build native %s. 
>> Please "\
>>
>
>


