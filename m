Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlkve-00014z-Co
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:56:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2011 09:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="31667587"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 09:52:07 -0700
Message-ID: <4E2EF0B7.5050709@linux.intel.com>
Date: Tue, 26 Jul 2011 09:52:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311386389-9819-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1spH8MKhC458LkDaXZBFurg7J=9W76wp8YDFXYc4PKRm9Q@mail.gmail.com>
In-Reply-To: <CAMKF1spH8MKhC458LkDaXZBFurg7J=9W76wp8YDFXYc4PKRm9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] siteinfo: Rework the siteinfo for powerpc to fix uclibc fallout
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
X-List-Received-Date: Tue, 26 Jul 2011 16:56:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 09:48 AM, Khem Raj wrote:
> ping ? ppc/uclibc is broken in oe-core w/o this atm.
>

RP is looking at the siteinfo stuff (both yours and Tom's).

I am working on the libxcb change, had some other build issues that 
jammed me up yesterday.

Sau!

> On Fri, Jul 22, 2011 at 6:59 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>> I believe that powerpc-linux is now a common file across 32bit/64bit
>> linux for powerpc be it uclibc or glibc. I compared the differences
>> between powerpc-linux-uclibc and powerpc-linux files and it
>> powerpc-linux was more uptodate and all the new stuff it had was needed
>> for uclibc anyway so we do not need to keep exact copy of powerpc-linux
>> as powerpc-linux-uclibc instead we use powerpc-linux for powerpc/uclibc
>> targets.
>>
>> Secondly linux specific files were added in archinfo dictionary
>> which I think logically belongs to targetinfo dictionary therefore
>> moved them to targetinfo
>>
>> now uclibc/powerpc is buildable again
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta/classes/siteinfo.bbclass  |   16 ++++++++++------
>>   1 files changed, 10 insertions(+), 6 deletions(-)
>>   delete mode 100644 meta/site/powerpc-linux-uclibc
>>
>> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
>> index c5308b3..056c519 100644
>> --- a/meta/classes/siteinfo.bbclass
>> +++ b/meta/classes/siteinfo.bbclass
>> @@ -33,11 +33,11 @@ def siteinfo_data(d):
>>          "mips64": "endian-big bit-64 mips64-common",
>>          "mips64el": "endian-little bit-64 mips64-common",
>>          "mipsel": "endian-little bit-32 mips-common",
>> -        "powerpc": "endian-big bit-32 powerpc-common powerpc32-linux",
>> +        "powerpc": "endian-big bit-32 powerpc-common",
>>          "nios2": "endian-little bit-32 nios2-common",
>> -        "powerpc64": "endian-big bit-64 powerpc-common powerpc-linux powerpc64-linux",
>> -        "ppc": "endian-big bit-32 powerpc-common powerpc32-linux",
>> -        "ppc64": "endian-big bit-64 powerpc-common powerpc-linux powerpc64-linux",
>> +        "powerpc64": "endian-big bit-64 powerpc-common",
>> +        "ppc": "endian-big bit-32 powerpc-common",
>> +        "ppc64": "endian-big bit-64 powerpc-common",
>>          "sh3": "endian-little bit-32 sh-common",
>>          "sh4": "endian-little bit-32 sh-common",
>>          "sparc": "endian-big bit-32",
>> @@ -62,8 +62,12 @@ def siteinfo_data(d):
>>          "arm-linux-uclibceabi": "arm-linux-uclibc",
>>          "armeb-linux-gnueabi": "armeb-linux",
>>          "armeb-linux-uclibceabi": "armeb-linux-uclibc",
>> -        "powerpc-linux-gnuspe": "powerpc-linux",
>> -        "powerpc-linux-uclibcspe": "powerpc-linux-uclibc",
>> +        "powerpc-linux": "powerpc32-linux",
>> +        "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
>> +        "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
>> +        "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
>> +        "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
>> +        "powerpc64-linux": "powerpc-linux",
>>      }
>>
>>      hostarch = d.getVar("HOST_ARCH", True)
>> diff --git a/meta/site/powerpc-linux-uclibc b/meta/site/powerpc-linux-uclibc
>> deleted file mode 100644
>> index e69de29..0000000
>> --
>> 1.7.4.1
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


