Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59F5C71BF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 09:55:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8H9t26e029568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 02:55:18 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 02:54:58 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<44bc8e8162a345bc10eb206b7858fd9f2bd91881.1536130313.git.liezhi.yang@windriver.com>
	<CA+chaQccRwckqnoA601TNz-qr5QHLw+2uCigHKTS4D2b4DP_Yg@mail.gmail.com>
	<20180917055055.GB3408@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ce839c47-1365-2b23-90f2-3c9cc284e7df@windriver.com>
Date: Mon, 17 Sep 2018 17:57:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180917055055.GB3408@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] bitbake.conf: Make BUILD_OPTIMIZATION respect to DEBUG_BUILD
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
X-List-Received-Date: Mon, 17 Sep 2018 09:55:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 09/17/2018 01:50 PM, Martin Jansa wrote:
> On Fri, Sep 14, 2018 at 03:25:58PM +0200, Martin Jansa wrote:
>> This seems to cause nativesdk-glibc failures when DEBUG_BUILD is used, it
>> fails like this:
>>
>> ../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
>> ../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>        b = invsqrtpi * temp / sqrtl (x);
>>            ~~~~~~~~~~^~~~~~
>>
>> the target build suffers from the same, that's why I was using this for a
>> while:
>> # glibc-2.21 fails to build with:
>> # iso-2022-cn-ext.c:501:4: error: 'tmpbuf' may be used uninitialized in
>> this function [-Werror=maybe-uninitialized]
>> # connections.c:1916:1: error: inlining failed in call to 'clear_db_cache':
>> call is unlikely and code size would grow [-Werror=inline]
>> # add few -Wno-error like meta/recipes-core/glibc/glibc.inc is trying to
>> doin get_optimization function,
>> # but fails because we append -Os at the end and -O2 is found first
>> SELECTED_OPTIMIZATION_append_pn-glibc =
>> "${@bb.utils.contains('TUNE_FEATURES', 'webos-minsize', '
>> -Wno-error=maybe-uninitialized -Wno-error=inline', '', d)}"
>>
>>
>> There is some logic in meta/recipes-core/glibc/glibc.inc to
>> append -Wno-error to SELECTED_OPTIMIZATION when "-O", "-O1", "-Os" is used,
>> but the same would be needed for BUILD_OPTIMIZATION now.
>>
>> Or maybe it would be worth marking those uninitialized/unused variables
>> with #pragma instead of injecting -Wno-error?
>>
>> Then we can get rid of:
>> python () {
>>      opt_effective = "-O"
>>      for opt in d.getVar('SELECTED_OPTIMIZATION').split():
>>          if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
>>              opt_effective = opt
>>      if opt_effective == "-O0":
>>          bb.fatal("%s can't be built with %s, try -O1 instead" %
>> (d.getVar('PN'), opt_effective))
>>      if opt_effective in ("-O", "-O1", "-Os"):
>>          bb.note("%s doesn't build cleanly with %s, adding -Wno-error to
>> SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
>>          d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
>> }
>> from meta/recipes-core/glibc/glibc.inc (not use about -O0 case) and remove
>> following notes:
>> NOTE: glibc doesn't build cleanly with -O, adding -Wno-error to
>> SELECTED_OPTIMIZATION
>> NOTE: nativesdk-glibc doesn't build cleanly with -O, adding -Wno-error to
>> SELECTED_OPTIMIZATION
>> from every build with DEBUG_BUILD enabled.
>>
>> What would be the preferred fix?
> 
> I've sent possible fix here:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-September/155744.html

Thanks, it seems the right fix to me.

// Robert

> 
>>
>> On Wed, Sep 5, 2018 at 9:05 AM Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>
>>> We may also need debug native tools, so make BUILD_OPTIMIZATION respect to
>>> DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which isn't
>>> convenient.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/conf/bitbake.conf | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index dbadeb3..93aee1a 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -612,7 +612,7 @@ FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
>>>   DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>>>   SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
>>> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>>>   SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
>>> -BUILD_OPTIMIZATION = "-O2 -pipe"
>>> +BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g
>>> -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
>>>
>>>   ##################################################################
>>>   # Settings used by bitbake-layers.
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
> 

