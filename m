Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QvvSH-0006Z7-58
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 20:12:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 11:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41422703"
Received: from unknown (HELO envy.home) ([10.7.199.154])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 11:07:18 -0700
Message-ID: <4E53EC55.9070905@linux.intel.com>
Date: Tue, 23 Aug 2011 11:07:17 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <91e2a59d20e1d1992691684fb2dd64a6405ec6e3.1313791350.git.dvhart@linux.intel.com>
	<fa0a22eee3461de38fc4b41a76f15980b78fd0bf.1313791350.git.dvhart@linux.intel.com>
	<4E4FDA4D.9020508@gmail.com>
In-Reply-To: <4E4FDA4D.9020508@gmail.com>
Subject: Re: [PATCH 2/3] tune: remove thumb flag from non-thumb cortexa8 tune variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Aug 2011 18:12:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/20/2011 09:01 AM, Khem Raj wrote:
> On 8/19/2011 3:06 PM, Darren Hart wrote:
>> The thumb flag "t" appears to have been copy/pasted to all the
>> PACKAGE_EXTRA_ARCHS tune variables. Remove it from the non-thumb versions.
>>
> 
> hmmm non thumb versions can run thumb packages. So I think its ok to 
> have t in EXTRA_ARCHS

Perhaps I'm confused with respect how these are used... see below.

> 
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>> CC: Jason Kridner<jkridner@beagleboard.org>
>> CC: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>   meta/conf/machine/include/tune-cortexa8.inc |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
>> index 02b560c..67c5f0b 100644
>> --- a/meta/conf/machine/include/tune-cortexa8.inc
>> +++ b/meta/conf/machine/include/tune-cortexa8.inc
>> @@ -10,7 +10,7 @@ TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
>>   TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
>>   TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
>>
>> -PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
>> +PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"

If we don't drop the t, do we need to add the non-t version as well?, ie:
-PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}
${PACKAGE_EXTRA_ARCHS_tune-armv7at}"



>>   PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"

Here we're adding thumb to thumb, so I took that to mean we needed to
add non-thumb to the non-thumb tune definitions.

>> -PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
>> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


