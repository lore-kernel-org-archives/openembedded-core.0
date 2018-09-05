Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA7F74D0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 08:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8588ux8014360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 01:08:56 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 01:08:55 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
	<7eac4cc6501f4799bb542739f6f7e57d@XBOX02.axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f0fcb85e-d3b6-3bd4-8e46-5aa5f03ba5ee@windriver.com>
Date: Wed, 5 Sep 2018 16:11:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7eac4cc6501f4799bb542739f6f7e57d@XBOX02.axis.com>
Subject: Re: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 08:09:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter,

On 09/05/2018 03:33 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
>> Sent: den 5 september 2018 09:16
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/2 V2] oe/utils.py: Add vartrue()
>>
>> It can be used to simplify code like:
>> "${@['iffalse', 'iftrue'][var]}"
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/conf/bitbake.conf | 2 +-
>>   meta/lib/oe/utils.py   | 7 +++++++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index faef771..dbadeb3 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -610,7 +610,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types
>> ${DEBUG_PREFIX_MAP}"
>>   # Disabled until the option works properly -feliminate-dwarf2-dups
>>   FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
>>   DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>> -SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION',
>> 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
>> +SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
>> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>>   SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION
>> DEBUG_OPTIMIZATION"
>>   BUILD_OPTIMIZATION = "-O2 -pipe"
>>
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index f22a6ab..914a6f2 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -464,3 +464,10 @@ class ImageQAFailed(bb.build.FuncFailed):
>>               msg = msg + ' (%s)' % self.description
>>
>>           return msg
>> +
>> +def vartrue(var, iftrue, iffalse, d):
>> +    import oe.types
>> +    if oe.types.boolean(d.getVar(var)):
>> +        return iftrue
>> +    else:
>> +        return iffalse
> 
> Put it together with ifelse() and conditional() instead, where it better
> belongs.
> 
> You can also implement it as:
> 
> def vartrue(var, iftrue, iffalse, d):
>      import oe.types
>      return oe.utils.ifelse(oe.types.boolean(d.getVar(var), iftrue, iffalse):

Then we need import oe.utils, and I don't think that it's easier to read
than:

+
+def vartrue(var, iftrue, iffalse, d):
+    import oe.types
+    if oe.types.boolean(d.getVar(var)):
+        return iftrue
+    else:
+        return iffalse

// Robert

> 
>> --
>> 2.7.4
> 
> //Peter
> 
> 

