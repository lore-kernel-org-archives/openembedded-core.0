Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 579A67C132
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 07:23:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x477NR6u028931
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2019 00:23:27 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 7 May 2019 00:23:26 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <5CC12A3E.4010702@windriver.com>
	<1556610320-114012-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LZnTfeC66-BWnhhXrb6w9eRsUH-hMostVgtKLY4mxwA3A@mail.gmail.com>
	<5CCE7E2D.6050008@windriver.com> <20190506095059.GA11818@localhost>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CD13414.9060408@windriver.com>
Date: Tue, 7 May 2019 15:30:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20190506095059.GA11818@localhost>
X-Originating-IP: [128.224.162.170]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: fix ptest failures
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
X-List-Received-Date: Tue, 07 May 2019 07:23:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月06日 17:50, Adrian Bunk wrote:
> On Sun, May 05, 2019 at 02:09:49PM +0800, Yu, Mingli wrote:
>> On 2019年04月30日 21:16, Burton, Ross wrote:
>>> On Tue, 30 Apr 2019 at 08:45, <mingli.yu@windriver.com> wrote:
>> ...
>>>> * Increase the timeout to 15 minutes as the default
>>>>     timeout which is 5 minutes is not enough to fix below error:
>>>>     | Executing: glib/actions.test
>>>>     | Test timed out after 300 seconds
>>>>     | cleaning up pid 13050
>>>>     | FAIL: glib/actions.test (Child process killed by signal 9)
>>>
>>> Looks like we're working around a test case that is going to fail
>>> because it is timing out.  Let's investigate why it is taking so long
>>> instead.
>>
>> The sub-case named test_dbus_threaded[/actions/dbus/threaded] of
>> glib/actions.test takes almost most of the time, the more details as below.
>> ...
>
> On what hardware it this?


Hi Adrian,

I run the test in qemu and the resource info for the qemu target as below:

# time; /usr/libexec/installed-tests/glib/actions -p;time
user	0m0.11s
sys	0m0.03s
/actions/dbus/threaded: OK
user	6m21.03s
sys	0m45.91s


# cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 15
model name	: Intel(R) Core(TM)2 Duo CPU     T7700  @ 2.40GHz
stepping	: 11
cpu MHz		: 3192.391
cache size	: 16384 KB
physical id	: 0
siblings	: 1
core id		: 0
cpu cores	: 1
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat 
pse36 clflush acpi mmx fxsr sse sse2 ss syscall nx lm constant_tsc rep_gi
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf
bogomips	: 6384.78
clflush size	: 64
cache_alignment	: 64
address sizes	: 40 bits physical, 48 bits virtual
power management:


# cat /proc/meminfo
MemTotal:        3071748 kB
MemFree:         2899224 kB
MemAvailable:    2917468 kB
Buffers:            5044 kB
Cached:            49976 kB
SwapCached:            0 kB
Active:            94872 kB
Inactive:          35160 kB
Active(anon):      75484 kB
Inactive(anon):     8428 kB
Active(file):      19388 kB
Inactive(file):    26732 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         75008 kB
Mapped:            23808 kB
Shmem:              8904 kB
KReclaimable:      14436 kB
Slab:              27836 kB
SReclaimable:      14436 kB
SUnreclaim:        13400 kB
KernelStack:        1360 kB
PageTables:          976 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     1535872 kB
Committed_AS:     181504 kB
VmallocTotal:   34359738367 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB
Percpu:              296 kB
DirectMap4k:       30576 kB
DirectMap2M:     3115008 kB

Thanks,

>
> cu
> Adrian
>

