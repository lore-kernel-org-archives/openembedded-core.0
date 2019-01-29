Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 269F56BC01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 08:35:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0T8ZOa8020033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Jan 2019 00:35:25 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Tue, 29 Jan 2019 00:35:23 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <cover.1548667130.git.liezhi.yang@windriver.com>
	<8b20fa4c993e073ec37b0fd6c309a52c4939959c.1548667130.git.liezhi.yang@windriver.com>
	<345abb1ed40143339310707ff00d5aa4@XBOX04.axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1f6cc2f4-2715-b02f-1f46-064937d5e74d@windriver.com>
Date: Tue, 29 Jan 2019 16:40:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <345abb1ed40143339310707ff00d5aa4@XBOX04.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted for HOSTTOOLS
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
X-List-Received-Date: Tue, 29 Jan 2019 08:35:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/28/19 7:46 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
>> Sent: den 28 januari 2019 10:19
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] base.bbclass: Use bb.event.ParseStarted
>> for HOSTTOOLS
>>
>> Fixed:
>> $ export BB_SERVER_TIMEOUT=-1
>> $ bitbake quilt-native
>> $ rm -fr tmp
>> $ bitbake quilt-native
>> ERROR: Error running gcc  --version: /bin/sh: gcc: command not found
>>
>> This is because bb.event.ParseStarted fires only once when server is running,
> 
> I assume you meant bb.event.ConfigParsed above?

Yes, thanks for pointing it out, fixed it in the repo:

git://git.openembedded.org/openembedded-core-contrib rbt/ht

// Robert


> 
>> but bb.event.ParseStarted fires every time when build configs are changed, so
>> use bb.event.ParseStarted to fix the problem.
>>
>> [YOCTO #13022]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/base.bbclass | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index f1a3c0e..c273a29 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -220,11 +220,18 @@ def buildcfg_neededvars(d):
>>           bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
>>
>>   addhandler base_eventhandler
>> -base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
>> +base_eventhandler[eventmask] = "\
>> +	bb.event.ParseStarted \
>> +	bb.event.MultiConfigParsed \
>> +	bb.event.BuildStarted \
>> +	bb.event.RecipePreFinalise \
>> +	bb.runqueue.sceneQueueComplete \
>> +	bb.event.RecipeParsed \
>> +"
>>   python base_eventhandler() {
>>       import bb.runqueue
>>
>> -    if isinstance(e, bb.event.ConfigParsed):
>> +    if isinstance(e, bb.event.ParseStarted):
>>           if not d.getVar("NATIVELSBSTRING", False):
>>               d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
>>           d.setVar('BB_VERSION', bb.__version__)
>> --
>> 2.7.4
> 
> //Peter
> 
> 

