Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B539B7DBB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3UEJEhV024179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Apr 2019 07:19:14 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 30 Apr 2019 07:19:14 -0700
To: <richard.purdie@linuxfoundation.org>
References: <20190430071539.145427-1-kai.kang@windriver.com>
	<20190430071539.145427-2-kai.kang@windriver.com>
	<719f10333b6dc28ffe36c6f61f28528e7d888ee5.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <1e7bf8d9-5a8e-1b54-e3d9-ac5216b12934@windriver.com>
Date: Tue, 30 Apr 2019 22:16:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <719f10333b6dc28ffe36c6f61f28528e7d888ee5.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] target-sdk-provides-dummy: set nostamp for do_package
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
X-List-Received-Date: Tue, 30 Apr 2019 14:19:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/30 下午6:19, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-04-30 at 03:15 -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It exists a situation that there is a common config file includes
>> multilib.conf but variable MULTILIBS is not set by default:
>>
>>    require conf/multilib.conf
>>    MULTILIBS ?= ""
>>
>> When build target-sdk-provides-dummy in the same build project with
>> following steps, it fails.
>>
>> 1 $ echo 'MACHINE = "qemux86"' >>conf/local.conf
>>    $ bitbake target-sdk-provides-dummy
>> 2 $ cat <<EOF >>conf/local.conf
>>      MACHINE = "qemux86-64"
>>      MULTILIBS = "multilib:lib32"
>>      DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
>>      EOF
>>    $ bitbake target-sdk-provides-dummy
>>    $ bitbake lib32-target-sdk-provides-dummy
>>
>> It fails to build lib32-target-sdk-provides-dummy with error
>> messages:
>>
>>> ERROR: target-sdk-provides-dummy-1.0-r0 do_packagedata: The recipe
>>> target-sdk-provides-dummy
>>>   is trying to install files into a shared area when those files
>>> already exist. Those files
>>>   and their manifest location are:
>>>    .../tmp/pkgdata/qemux86-64/lib32-target-sdk-provides-dummy
>>>      (matched in manifest-qemux86_64-lib32-target-sdk-provides-
>>> dummy.packagedata)
>>>    .../tmp/pkgdata/qemux86-64/runtime/lib32-target-sdk-provides-
>>> dummy
>>>      (matched in manifest-qemux86_64-lib32-target-sdk-provides-
>>> dummy.packagedata)
>>>    ... snip ...
>>> Please verify which recipe should provide the above files.
>> Because target-sdk-provides-dummy is a virtual package, its sstate
>> caches are same for both qemux86 and qemux86_64. So when build
>> target-sdk-provides-dummy for qemux86_64, it re-uses the sstate cache
>> from qemux86 and then create file lib32-target-sdk-provides-dummy
>> under
>> ${PKGDATA_DIR} which should not and then conflicts with lib32-target-
>> sdk-provides-dummy.
>>
>> Make do_package always be executed to fix the issue. Because it is a
>> dummy
>> package, it won't cost too much build time.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/meta/target-sdk-provides-dummy.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> index 85472a825c..e09a08bcd7 100644
>> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> @@ -52,3 +52,5 @@ DUMMYPROVIDES = "\
>>   "
>>   
>>   require dummy-sdk-package.inc
>> +
>> +do_package[nostamp] = "1"
> This isn't the right way to fix it, we should probably whitelist that
> particular file for multiple providers. See SSTATE_DUPWHITELIST.

OK. Thanks.

Kai


>
> Cheers,
>
> Richard
>
>
>
>

-- 
Kai Kang


