Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 111B160190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:51:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 27 Sep 2016 12:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,406,1470726000"; d="scan'208";a="13943138"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 27 Sep 2016 12:51:04 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1475000836-12716-1-git-send-email-california.l.sullivan@intel.com>
	<1475002783.3072.13.camel@linux.intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <c328e691-c37f-b794-1c10-b2b400db1fc0@intel.com>
Date: Tue, 27 Sep 2016 12:51:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475002783.3072.13.camel@linux.intel.com>
Subject: Re: [PATCH RFC] scripts/runqemu: Be more loose when guessing QB_SYSTEM_NAME variable
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
X-List-Received-Date: Tue, 27 Sep 2016 19:51:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/27/2016 11:59 AM, Joshua Lock wrote:
> On Tue, 2016-09-27 at 11:27 -0700, California Sullivan wrote:
>> Following the instructions to reproduce YOCTO #10026 I found that
>> runqemu would fail to start because QB_SYSTEM_NAME is null. This
>> patch
>> makes the guessing algorithm more loose allowing it to correctly
>> guess
>> the variable from the MACHINE name.
> Out of interest can you help me understand how/when the current code
> fails?
I ran into this following the instructions on the first post here: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10026

We create a bsp layer called myqemux86-64 that gets a x86-64 
architecture and MACHINE named myqemux86-64. There is no qemuboot.conf 
file generated so it has to try and guess the variable. In the guessing 
function mach gets assigned myqemux86-64, which doesn't match to any of 
the machines directly, so it bails out.

Ultimately the failure probably isn't with runqemu, but the yocto-bsp 
scripts not supporting the new runqemu. Unfortunately I have no 
experience with either part of the system, so I took the path of least 
resistance to quickly get it working again (hence the RFC).

>
>> It is still a good assumption that if it contains "qemux86-64" for
>> example, that the system is x86-64, so this is unlikely to cause any
>> new issues while preserving some peoples' old workflows.
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>   scripts/runqemu | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 45bcad7..b06d09e 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -870,20 +870,20 @@ class BaseConfig(object):
>>           if not mach:
>>               return None
>>   
>> -        if mach == 'qemuarm':
>> -            qbsys = 'arm'
>> -        elif mach == 'qemuarm64':
>> +        elif 'qemuarm64' in mach:
> This elif should be below the "if 'qemuarm' in mach" below which begins
> the control flow statements for determining the value to assign to the
> qbsys variable.
Oops, you are correct. I very quickly reordered them to account for 
having to check the longer mach names first and missed that. I will fix 
it on a V2 if we decide to use this.

Thanks,
Cal

>
>>               qbsys = 'aarch64'
>> -        elif mach == 'qemux86':
>> -            qbsys = 'i386'
>> -        elif mach == 'qemux86-64':
>> +        if 'qemuarm' in mach:
>> +            qbsys = 'arm'
>> +        elif 'qemux86-64' in mach:
>>               qbsys = 'x86_64'
>> -        elif mach == 'qemuppc':
>> +        elif 'qemux86' in mach:
>> +            qbsys = 'i386'
>> +        elif 'qemuppc' in mach:
>>               qbsys = 'ppc'
>> -        elif mach == 'qemumips':
>> -            qbsys = 'mips'
>> -        elif mach == 'qemumips64':
>> +        elif 'qemumips64' in mach:
>>               qbsys = 'mips64'
>> +        elif 'qemumips' in mach:
>> +            qbsys = 'mips'
>>   
>>           return 'qemu-system-%s' % qbsys
>>   
>> -- 
>> 2.5.5
>>


