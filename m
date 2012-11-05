Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TVLQa-0002Jm-Vf
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 13:05:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2012 03:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,714,1344236400"; d="scan'208";a="242645471"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2012 03:51:31 -0800
Message-ID: <5097A842.9030302@intel.com>
Date: Mon, 05 Nov 2012 13:51:30 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <1351776182-26414-1-git-send-email-laurentiu.palcu@intel.com>
	<50971D45.6010608@windriver.com> <509770C2.8070202@windriver.com>
In-Reply-To: <509770C2.8070202@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base.bbclass: check installation machine before installing SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2012 12:05:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/05/2012 09:54 AM, Robert Yang wrote:
> 
> 
> On 11/05/2012 09:58 AM, Robert Yang wrote:
>>
>>
>> On 11/01/2012 09:23 PM, Laurentiu Palcu wrote:
>>> Do not allow installer to continue if the installation machine architecture
>>> does not match the intended SDK machine architecture.
>>>
>>> [YOCTO: #3269]
>>>
>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>> ---
>>>   meta/classes/populate_sdk_base.bbclass |    8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/meta/classes/populate_sdk_base.bbclass
>>> b/meta/classes/populate_sdk_base.bbclass
>>> index a3ac757..dc715c4 100644
>>> --- a/meta/classes/populate_sdk_base.bbclass
>>> +++ b/meta/classes/populate_sdk_base.bbclass
>>> @@ -118,6 +118,14 @@ fakeroot create_shar() {
>>>       cat << "EOF" > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
>>>   #!/bin/bash
>>>
>>> +INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>>> +SDKMACHINE=$(echo ${SDKMACHINE} | sed -e "s/i[5-6]86/ix86/")
>>> +
>>
>> I'm afraid this doesn't work, how does the script know the SDKMACHINE ?
>> The SDKMACHINE would always be null in
>> poky-eglibc-x86_64-i586-toolchain-gmae-1.3+snapshot-20121104.sh
>>
> 
> This was because i didn't set the SDKMACHINE, I seldom set it when build
> the sdk, but it seems that we should set it since it needs
> 
> include conf/machine-sdk/${SDKMACHINE}.conf
Hmm, I had it set in my local.conf... I missed the fact that, by
default, the local.conf had it commented out.


> 
> Can we check whether the SDKMACHINE is null before build the SDK or use
> SDK_ARCH rather than the SDKMACHINE here ? Otherwise, if we don't set the
> SDKMACHINE, the SDK would be built, but it can't be installed, we would
> always get this error:
I suppose we can safely use SDK_ARCH here, instead of SDKMACHINE. I'll
prepare a patch asap.

> 
> Error: Installation machine not supported!
> 
> // Robert
> 
>> // Robert
>>
>>
>>> +if [ "$INST_ARCH" != "$SDKMACHINE" ]; then
>>> +    echo "Error: Installation machine not supported!"
>>> +    exit -1
>>> +fi
>>> +
>>>   DEFAULT_INSTALL_DIR="${SDKPATH}"
>>>   COMPONENTS_LEN=$(echo ".${SDKPATH}" | sed "s/\// /g" | wc -w)
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>


