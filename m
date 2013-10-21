Return-Path: <ulf@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id BC62D6CC4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 12:55:53 +0000 (UTC)
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 657D8EB537
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 14:55:55 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnsVAIcjZVJT4ztUPGdsb2JhbAANTIM/vjdLgUIDAQEBATiCWgEBAQECAQEBATU2CgEQCxQECRYPCQMCAQIBDwYBGxQGDQEFAgEBh3ADCQsIqkyJGg2Ja4xsgRyBVAeEKQOVPGKBa4EviyGIXQ
X-IronPort-AV: E=Sophos;i="4.93,539,1378850400"; d="scan'208";a="339988645"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.59.84])
	by ipb4.telenor.se with ESMTP; 21 Oct 2013 14:55:55 +0200
Message-ID: <5265245A.2090201@emagii.com>
Date: Mon, 21 Oct 2013 14:55:54 +0200
From: Ulf Samuelsson <ulf@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1382345997-28170-1-git-send-email-ulf@emagii.com>
	<20131021111757.GE3709@jama>
In-Reply-To: <20131021111757.GE3709@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add tune for Cortex-A5 chips
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ulf@emagii.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 12:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-21 13:17, Martin Jansa wrote:
> On Mon, Oct 21, 2013 at 10:59:57AM +0200, Ulf Samuelsson wrote:
>> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
>> ---
>>   meta/conf/machine/include/tune-cortexa5.inc |   24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 meta/conf/machine/include/tune-cortexa5.inc
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
>> new file mode 100644
>> index 0000000..69c945e
>> --- /dev/null
>> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>> @@ -0,0 +1,24 @@
>> +DEFAULTTUNE ?= "cortexa5thf"
> wasn't cortexa5 added already in:
>
> commit 50bc63c5c377d9fbb87b3efefc8c6f5473ba642a
> Author: Andy Voltz <andy.voltz@timesys.com>
> Date:   Wed Jun 5 11:52:30 2013 -0400
>
>      tune-cortexa5.inc: Add tune file for cortex-a5
>
> I think that one was better, because it had optional neon support and
> default DEFAULTTUNE should be something more generic (at least to stay
> consistent with other tunes) it's DISTRO decision to select common
> denominator (or more specific tunes for each MACHINE) for binary feeds
> they want to manage.
Looks like you are right.
I looked at the openembedded-core in Angstrom master, and it wasn't there.
(
     because Angstrom master checks out
     "openembedded-core/remotes/origin/angstrom-staging-yocto1.3"
)

Sorry.

/Ulf

>
> see
> commit a11bdc36a1be18cc5aa14682b2a2c9ee83141f51
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Tue Oct 2 13:21:08 2012 +0000
>
>      tune-*: define more generic DEFAULTTUNE to share feed between
> machines
>
>> +# TUNE_FEATU4RES     = "armv7a vfp callconvention-hard"
>> +# TARGET_FPU        = "vfp"
>> +
>> +require conf/machine/include/arm/arch-armv7a.inc
>> +
>> +TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", "-mtune=cortex-a5", "", d)}"
>> +
>> +# Little Endian base configs
>> +AVAILTUNES += "cortexa5 cortexa5t"
>> +TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
>> +TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
>> +
>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
>> +
>> +# VFP Tunes
>> +AVAILTUNES += "cortexa5hf cortexa5thf"
>> +TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
>> +TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
>> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
>> +
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437


