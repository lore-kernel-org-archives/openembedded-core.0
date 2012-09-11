Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TBSkd-00014m-Aw
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:51:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFdDEK019309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Sep 2012 08:39:13 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 11 Sep 2012 08:39:13 -0700
Message-ID: <504F5B17.5070500@windriver.com>
Date: Tue, 11 Sep 2012 11:39:03 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
	<ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
	<504F59B1.60308@intel.com>
In-Reply-To: <504F59B1.60308@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
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
X-List-Received-Date: Tue, 11 Sep 2012 15:51:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-09-11 11:33 AM, Saul Wold wrote:
> On 09/11/2012 08:17 AM, Bruce Ashfield wrote:
>> When x32 is the tuning for a x86 MACHINE, the kernel should also have
>> CONFIG_X86_X32=y.
>>
>> This can be accomplished by adding the x32 configuraion fragment to the
>> KERNEL_FEATURES when x32 is the tuning for a given machine.
>>
>> cc: Saul Wold <sgw@linux.intel.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | 3 ++-
>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 3 ++-
>> 2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> index 4fd3845..156fb93 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>> @@ -10,7 +10,7 @@ KMETA = "meta"
>>
>> SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
>> SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
>> -SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>>
>> PR = "${INC_PR}.0"
>> PV = "${LINUX_VERSION}+git${SRCPV}"
>> @@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
>> KERNEL_FEATURES_append = " features/taskstats"
>> KERNEL_FEATURES_append_qemux86 = " cfg/sound"
>> KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>
> Scratch this bit and below, as I think I will use the other mechanism
> you talked about to go from a .conf file.

Works for me. The meta change is staged and pushed out, I'll update this
patch to not have the KERNEL_FEATURES portion.

Bruce

>
> Sau!
>
>> \ No newline at end of file
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> index 59ad4b2..bcd1292 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>> @@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?=
>> "b9a720ca38d298ed457f37d099c85771f9164b19"
>> SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>> SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>> SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>> -SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>>
>> SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>
>> @@ -27,3 +27,4 @@ KERNEL_REVISION_CHECKING=""
>> KERNEL_FEATURES_append = " features/netfilter"
>> KERNEL_FEATURES_append_qemux86=" cfg/sound"
>> KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>>
>



