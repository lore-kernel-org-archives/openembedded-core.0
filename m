Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27B1574591
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 03:24:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4S3OBpk009530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 May 2018 20:24:11 -0700 (PDT)
Received: from [128.224.27.66] (128.224.27.66) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 27 May 2018 20:24:05 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, "Hatle, Mark G (Wind River)"
	<mark.hatle@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<56d696e2a24b5ba066cbb2a02af31bb4496eaa07.1527216285.git.liezhi.yang@windriver.com>
	<055a6008-6237-5535-61c5-60162c3e7729@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7253e4cc-4ef2-522a-df37-383b98cbc81d@windriver.com>
Date: Mon, 28 May 2018 11:24:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <055a6008-6237-5535-61c5-60162c3e7729@linux.intel.com>
Subject: Re: [PATCH 01/24] base.bbclass: Add buildcfg multilib values
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
X-List-Received-Date: Mon, 28 May 2018 03:24:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alexander,

On 05/26/2018 05:51 PM, Alexander Kanavin wrote:
> On 05/25/2018 05:48 AM, Robert Yang wrote:
>> +def buildcfg_multilibs(d):
>> +    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
>> +    for variant in variants.split():
>> +        localdata = bb.data.createCopy(d)
>> +        overrides = localdata.getVar("OVERRIDES", False) + 
>> ":virtclass-multilib-" + variant
>> +        localdata.setVar("OVERRIDES", overrides)
>> +        bb.data.update_data(localdata)
>> +        statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
>> +        for var in statusvars:
>> +            origvalue = d.getVar(var, True)
>> +            variantvalue = localdata.getVar(var, True)
>> +            if origvalue is not None and variantvalue is not None and 
>> origvalue != variantvalue:
>> +                yield '%-7s %-17s = "%s"' % (variant + ":", var, variantvalue)
>> +
> 
> There are helper functions in utils.bbclass that take care of multilib datastore 
> setup, please use them instead of re-implementing what they do. USe 
> all_multlilib_tune_values() in particular.

Thanks for the reply, but I'm afraid that all_multlilib_tune_values() isn't
suitable for this case, what need to display is something like:

lib32:  DEFAULTTUNE       = "x86"
lib32:  TARGET_SYS        = "i686-pokymllib32-linux"
lib32:  TUNE_FEATURES     = "m32"

But all_multlilib_tune_values() returns all values, e.g:

DEFAULTTUNE       = "core2-64 x86"

If there is only one multilib variant, it can work if we remove "core2-64" from
DEFAULTTUNE, then we will get "x86", but if there are multiple multilib
variants, e.g., lib32 and lib64, then
all_multlilib_tune_values(d, 'DEFAULTTUNE') is:

DEFAULTTUNE       = "core2-64 x86 <foo>"

We don't know how to strip x86 for lib32, or <foo> for lib64. So I think that
the current implementation is a must.

// Robert

> 
> 
> Alex
> 

