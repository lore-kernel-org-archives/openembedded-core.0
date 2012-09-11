Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBShy-0000zB-B0
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:49:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Sep 2012 08:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,405,1344236400"; d="scan'208";a="191645813"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga001.jf.intel.com with ESMTP; 11 Sep 2012 08:36:28 -0700
Message-ID: <504F5A7C.9070407@linux.intel.com>
Date: Tue, 11 Sep 2012 08:36:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1347376071-29566-1-git-send-email-sgw@linux.intel.com>
	<1347376402.2122.44.camel@ted>
In-Reply-To: <1347376402.2122.44.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] arch-ia32: Add x32 to MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 11 Sep 2012 15:49:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 08:13 AM, Richard Purdie wrote:
> On Tue, 2012-09-11 at 08:07 -0700, Saul Wold wrote:
>> This will allow the KERNEL_FEATURES to trigger the x32 ABI via overrides
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/conf/machine/include/ia32/arch-ia32.inc |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
>> index 15f67d7..fa70e57 100644
>> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
>> +++ b/meta/conf/machine/include/ia32/arch-ia32.inc
>> @@ -24,6 +24,7 @@ ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
>>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
>>   TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
>>   TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
>> +MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", ":x32", "" ,d)}"
>>
>>   # ELF64 ABI
>>   TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
>
> This is just for the kernel issue, right?
>
> In that case, just use ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> "xxxx", "" ,d)} in the kernel recipe code...
>
It's possible that there will be other recipes that need patches or 
other changes in the future, but I guess we can cross that bridge when 
we come to it.

I think I will actually use the features update that Bruce just added 
from here instead.  Since multiple BSP could take advantage of x32 we 
should not have to edit each of there kernel recipes.  It should just be 
enabled based on the x32 DEFAULTTUNE.

Thanks
	Sau!



> Cheers,
>
> Richard
>
>
>


