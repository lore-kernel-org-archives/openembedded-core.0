Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7C18875A06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 22:44:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2015 15:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,668,1427785200"; d="scan'208";a="593537913"
Received: from josuerfi-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.73.119])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2015 15:44:42 -0700
Message-ID: <5589E159.4080909@linux.intel.com>
Date: Tue, 23 Jun 2015 15:44:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1435087374-18117-1-git-send-email-sgw@linux.intel.com>
	<1435096427.11489.102.camel@linuxfoundation.org>
In-Reply-To: <1435096427.11489.102.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master&fido] image.bbclass: Disable USE_DEPMOD for the dummy kernel
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
X-List-Received-Date: Tue, 23 Jun 2015 22:44:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2015 02:53 PM, Richard Purdie wrote:
> On Tue, 2015-06-23 at 12:22 -0700, Saul Wold wrote:
>> The image bbclass will try to find the kernel-abiversion file which is not part
>> of the linux-dummy kernel since there is no actual kernel. In this case using
>> depmod also does not make sense since there should not be any kernel module built.
>>
>> [YOCTO #7884]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/classes/image.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 01f8b3f..be245e9 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -66,7 +66,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>>   EXCLUDE_FROM_WORLD = "1"
>>
>>   USE_DEVFS ?= "1"
>> -USE_DEPMOD ?= "1"
>> +USE_DEPMOD ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-dummy", "0", "1", d)}'
>>
>
> I'm not convinced this is the right way to solve this. How about we
> teach the code in rootfs.py not to generate a modules.dep file if there
> are no kernel modules to generate dependency information for?
>
I guess we could check for /lib/modules, but I think checking for 
virtual/kernel is cleaner and safer since we know we don't want to run 
this for linux-dummy, but if some random recipe happens to create 
/lib/modules it will break.

Unless you has some other check in mind to verify no modules are created

I also thought about a change to linux-dummy to place an 
kernel-abiversion, but that had other dangers.

Sau!

> Cheers,
>
> Richard
>

