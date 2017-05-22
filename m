Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8C077E87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 17:53:23 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2017 10:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,378,1491289200"; d="scan'208";a="90349969"
Received: from bitbang.jf.intel.com (HELO [10.7.159.60]) ([10.7.159.60])
	by orsmga004.jf.intel.com with ESMTP; 22 May 2017 10:53:24 -0700
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<816f658a-cb3c-2312-99ad-d7e5e3fd2bce@xevo.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <9d51bbc6-08ed-16aa-5f05-e6bdd6d3af12@linux.intel.com>
Date: Mon, 22 May 2017 10:53:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <816f658a-cb3c-2312-99ad-d7e5e3fd2bce@xevo.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Mon, 22 May 2017 17:53:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/22/2017 10:29 AM, Martin Kelly wrote:
> (friendly ping)
> 
> On 05/02/2017 12:20 PM, Martin Kelly wrote:
>> Currently, the qemu CPUs for are specified as generic, but the built
>> artifacts are not. For example, we build x86-64 artifacts targeting
>> core2duo but run them in qemu with generic qemu/kvm CPUs. This causes
>> some packages that take advantage of the host architecture to crash
>> because they try to use CPU features not advertised by qemu. As an
>> example, Qt uses ssse3. When artifacts linked against Qt and built
>> targeting core2duo attempt to run on a generic qemu/kvm CPU, we get
>> the following crash:
>>
>> Incompatible processor. This Qt build requires the following features:
>>      ssse3
>>
>> We could fix this by making packages like Qt not take advantage of CPU
>> features. However, we will probably keep facing similar issues over
>> time, so it's better to resolve them in a more enduring way.

If the MACHINE is a generic qemu, it seems more correct to build without the 
extensions. For instance, what happens when core2duo doesn't have all the 
necessary instructions that some package decided to use?

I like the idea of being able to exercise the code, but I only see this fix as 
pushing the maintenance until the problem appears again later.

>>
>> Fix this by making the qemu -cpu arguments match the built artifacts.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>
>> I sent this to poky@yoctoproject.org but it should have gone to OE-core,
>> so I'm resending it now to restart the discussion on the right mailing
>> list. There were some comments about it in a previous mail thread on the
>> poky mailing list:
>>
>> https://lists.yoctoproject.org/pipermail/poky/2017-April/010956.html
>>
>>  meta/conf/machine/include/qemuboot-x86.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc 
>> b/meta/conf/machine/include/qemuboot-x86.inc
>> index 06ac983..acd03a1 100644
>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>> @@ -1,12 +1,12 @@
>>  # For runqemu
>>  IMAGE_CLASSES += "qemuboot"
>>  QB_SYSTEM_NAME_x86 = "qemu-system-i386"
>> -QB_CPU_x86 = "-cpu qemu32"
>> -QB_CPU_KVM_x86 = "-cpu kvm32"
>> +QB_CPU_x86 = "-cpu pentium2"
>> +QB_CPU_KVM_x86 = "-cpu pentium2"
>>
>>  QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
>>  QB_CPU_x86-64 = "-cpu core2duo"
>> -QB_CPU_KVM_x86-64 = "-cpu kvm64"
>> +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>>
>>  QB_AUDIO_DRV = "alsa"
>>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>>


