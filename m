Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S5KTJ-0007go-Hv
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 18:16:17 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Mar 2012 09:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="74759233"
Received: from unknown (HELO envy.home) ([10.255.15.53])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Mar 2012 09:05:49 -0800
Message-ID: <4F579506.90805@linux.intel.com>
Date: Wed, 07 Mar 2012 09:04:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1331107546.git.dvhart@linux.intel.com>
	<83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
	<AE0C8B23-EB0D-4DD3-9BF9-22BAEB66969F@dominion.thruhere.net>
In-Reply-To: <AE0C8B23-EB0D-4DD3-9BF9-22BAEB66969F@dominion.thruhere.net>
X-Enigmail-Version: 1.3.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
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
X-List-Received-Date: Wed, 07 Mar 2012 17:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/07/2012 12:21 AM, Koen Kooi wrote:
> 
> Op 7 mrt. 2012, om 09:06 heeft Darren Hart het volgende geschreven:
> 
>> Fixes [Yocto #2036]
>>
>> The source and build directories are unused, remove them.
>>
>> The modutils and modprobe.d directories may be used if modules are built that
>> are either autoloaded or have modprobe.d entries. This isn't known at install
>> time, so check after the package split if these directories are empty and
>> remove them if they are.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> CC: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>> meta/classes/kernel.bbclass |   10 ++++++++++
>> 1 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 8fbec90..169df33 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -105,6 +105,8 @@ kernel_do_install() {
>> 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
>> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>> +		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>> +		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> 
> How do you want to support on-target building of exernal modules?

That is an open issue that needs to be addressed, but we don't install
the build or source directories now (unless I'm missing something), so
these are links to nowhere at the moment.

We do have a bug open to support on-target module building. I supect
we'll need to add these as part of a headers package or similar. So
these may come back.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


