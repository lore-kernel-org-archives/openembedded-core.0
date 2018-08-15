Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9617791FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 15:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7FFqu0E001862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Aug 2018 08:52:56 -0700
Received: from server.local (128.224.20.117) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 15 Aug 2018 08:52:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1534339941-1968-1-git-send-email-bruce.ashfield@windriver.com>
	<ebb9e2738e47c62514b0816b8d8c2ede13a54275.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b92b98de-79a6-8fd3-fc78-c527d0d5fcfa@windriver.com>
Date: Wed, 15 Aug 2018 11:52:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ebb9e2738e47c62514b0816b8d8c2ede13a54275.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Wed, 15 Aug 2018 15:52:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-08-15 11:50 AM, Richard Purdie wrote:
> On Wed, 2018-08-15 at 09:32 -0400, Bruce Ashfield wrote:
>> The existing kernel-devsrc package starts with a full copy of the
>> kernel
>> source and then starts to strip out elements that are not required.
>>
>> This results in extra time (I/O) and extra space being taken up in
>> the
>> final package. The main purpose of the kernel-devsrc package has been
>> to
>> build modules against the running kernel, not to include a full copy
>> of
>> the source code for re-building the kernel. The end result was a
>> 600M kernel-devsrc package.
>>
>> This restructuring of the package uses an approach similar to other
>> distros, where the kernel-devsrc package is for building against the
>> running kernel and uses a curated set of copied infrastructure,
>> versus
>> a mass copy of the entire kernel.
>>
>> The differences in this approach versus other is largely due to the
>> architecture support and the split build/source directory of the
>> kernel.
>>
>> The result is a kernel-devsrc package of about 10M, which is capable
>> of running "make scripts" and compiling kernel modules against the
>> running kernel.
>>
>> Along with the changes to the copying of the infrascture, we also
>> have the following changes:
>>
>>   - a better/more explicit listing of dependencies for on-target
>>     builds of "make scripts" or "make modules_prepare"
>>
>>   - The kernel source is installed into /lib/modules/<version>/build
>>     and a symlink created from /usr/src/kernel to the new location.
>>     This aligns with the standard location for module support
>>     code
>>
>>   - There is also a symlink from /lib/modules/<version>/source ->
>> build
>>     to reserve a spot for a new package that is simply the kernel
>>     source. That package is not part of this update.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> Hopefully this fixes up the last of the issues, but at the very least
>> there will be less. I'll immediatly respin if the autombuilder finds
>> a combo I didn't test.
>>
>> v2: drop DEPENDS on perf. We no longer need to depend on
>>      perf since the source is copied before modification.
>>
>> v3: build fixes for:
>>        - DESCEND  objtool build failure
>>        - No rule to make target 'arch/mips/boot/tools/relocs_32.c'
>>        - No rule to make target 'arch/arm/tools/syscall.tbl'
>>        - No rule to make target 'arch/arm64/kernel/vdso/vdso.lds'
> 
> There has been one failure so far:
> 
> https://autobuilder.yocto.io/builders/build-appliance/builds/1201/steps/BuildImages_1/logs/stdio
> 
> I suspect we need to tweak the do_populate_poky_src task in the build-
> appliance-image recipe given the kernel devsrc change.

I'll have a look!

Bruce

> 
> Other things are still building. Will reply if anything else comes up.
> 
> Cheers,
> 
> Richard
> 
> 
> 


