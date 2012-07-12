Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SpP8f-0008Q2-GQ
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 21:33:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2012 12:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="191893427"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2012 12:22:10 -0700
Message-ID: <4FFF23E2.5040007@linux.intel.com>
Date: Thu, 12 Jul 2012 12:22:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
In-Reply-To: <8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Thu, 12 Jul 2012 19:33:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 07/12/2012 11:58 AM, Koen Kooi wrote:
> Any volunteers to test this on a system with >4 real cores?
>

Koen,

Does OE-Core or Poky have an image setup for using .xz by default?

I will run it on a machine I have, just want to make sure I am doing the 
same tests that Andrei is running.

I was about to ask what msm asked about the Memory info.


Sau!

> Op 12 jul. 2012, om 20:13 heeft Andrei Gherzan het volgende geschreven:
>
>> Koen suggested to add -T to xz commands. We have this option implemented in our current version .1alpha.
>>
>> -T threads, --threads=threads
>>               Specify the number of worker threads to use.  Setting threads to
>>               a special value 0 makes xz use as many threads as there are  CPU
>>               cores  on  the system.  The actual number of threads can be less
>>               than threads if the input file is not big enough  for  threading
>>               with  the  given  settings or if using more threads would exceed
>>               the memory usage limit.
>>
>> -------------------
>>
>> Memory: 7.8 GiB
>> Processor:: Intel® Core™ i5-2540M CPU @ 2.60GHz × 4
>>
>> File to compress: 1.9G
>>
>> xz -f -k -e -9 --check=crc32 (current configuration)
>> Memory: 673Mb
>> real    6m37.170s
>> user    6m35.389s
>> sys     0m0.884s
>> Compressed file size: 3.4Mb
>>
>> xz -f -k -e -9 -T 4 --check=crc32
>> Memory: Cannot allocate memory
>>
>> xz -f -k -e -8 -T 4 --check=crc32
>> Memory: 1.8G
>> real    3m24.462s
>> user    12m8.502s
>> sys     0m2.180s
>> Compressed file size: 3.4Mb
>>
>> xz -f -k -T 4 --check=crc32 (-e defaults to -6)
>> Memory: 471Mb
>> real    1m9.265s
>> user    4m8.972s
>> sys     0m0.944s
>> Compressed file size: 3.4Mb
>>
>> So my conclusion would be to use the default -e -6 with -T 0.
>>
>> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:
>>
>>   upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib ag/xz
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/xz
>>
>> Andrei Gherzan (3):
>>   image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
>>     data to file
>>   image_types.bbclass: Add XZ variable to set number of threads to be
>>     used while compressing
>>   image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
>>
>> meta/classes/image_types.bbclass |    5 +++--
>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> --
>> 1.7.9.5
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



