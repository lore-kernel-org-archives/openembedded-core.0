Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 550 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Nov 2014 18:53:43 UTC
Received: from smtp06.online.nl (smtp06.online.nl [194.134.42.51])
	by mail.openembedded.org (Postfix) with ESMTP id 570AA7230B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 18:53:43 +0000 (UTC)
Received: from smtp06.online.nl (localhost [127.0.0.1])
	by smtp06.online.nl (Postfix) with ESMTP id 6878F96413;
	Wed, 26 Nov 2014 19:44:31 +0100 (CET)
Received: from [192.168.1.7] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp06.online.nl (Postfix) with ESMTP;
	Wed, 26 Nov 2014 19:44:31 +0100 (CET)
Message-ID: <54761F8F.9000400@topic.nl>
Date: Wed, 26 Nov 2014 19:44:31 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <54758D01.3070601@topic.nl>
	<12654718.RPpo1aQ4TE@peggleto-mobl5.ger.corp.intel.com>
	<5475D3AE.1040803@topic.nl>
	<1920393.GFIm8gtWQZ@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1920393.GFIm8gtWQZ@peggleto-mobl5.ger.corp.intel.com>
X-Online-Scanned: by Cloudmark authority (on smtp06.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why does building an image for machine X delete the bootloader for machine Y?
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
X-List-Received-Date: Wed, 26 Nov 2014 18:53:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2014 03:57 PM, Paul Eggleton wrote:
> On Wednesday 26 November 2014 14:20:46 Mike Looijmans wrote:
>> On 11/26/2014 12:31 PM, Paul Eggleton wrote:
>>> Hi Mike,
>>>
>>> On Wednesday 26 November 2014 09:19:13 Mike Looijmans wrote:
>>>> I do a:
>>>>
>>>> MACHINE=X bitbake my-image
>>>>
>>>> This DEPENDS on a virtual bootloader, which will produce a BOOT.BIN file
>>>> in
>>>> the deploy directory, which is tmp-glibc/deploy.images/X/
>>>>
>>>> If I then do a:
>>>>
>>>> MACHINE=Y bitbake my-image
>>>>
>>>> the BOOT.BIN in tmp-glibc/deploy.images/X/ is suddenly gone!
>>>>
>>>> If i do a
>>>>
>>>> MACHINE=X bitbake my-image
>>>>
>>>> then the the BOOT.BIN in tmp-glibc/deploy.images/Y/ is suddenly gone, and
>>>> the one for the X machine appears again. The bootloader recipe is not
>>>> being
>>>> rebuilt at all.
>>>>
>>>> The machines have the same MACHINE_ARCH, they differ on only minor points
>>>> (the FPGA).
>>>>
>>>> What is going on here?
>>>
>>> I can't be sure, but my guess is the recipe is not marked as being
>>> machine-
>>> specific (i.e. PACKAGE_ARCH is not set to "${MACHINE_ARCH}" - is that the
>>> case?) but there is still some variable dependency on a variable that has
>>> a machine-specific value. If it's not obvious from the recipe, check if
>>> there are two sets of tasks for the bootloader recipe in the sstate
>>> cache, and then use bitbake-diffsigs to compare the sigdata/siginfo
>>> files.
>>
>> MACHINE is actually "topic-miami-florida-med-xc7z015" or
>> "topic-miami-florida-med-xc7z030"
>>
>> Both machines have MACHINE_ARCH = "topic_miami_florida_med" since they only
>> differ in the FPGA subsystem, but share all the rest (kernel, bootloader,
>> etc).
>>
>> Is it forbidden to share $MACHINE_ARCH between $MACHINEs? (And if so, why
>> does MACHINE_ARCH even exist?)
>
> I don't know for sure, but I don't think that is forbidden. I'm not sure
> that's the issue here though.
>
>> The BSP layer for the topic-miami machines is here (yes, you can build OE or
>> Yocto images with it, but I have yet some more work to do to make it a
>> proper BSP...):
>> https://github.com/topic-embedded-products/meta-topic
>
> Is it u-boot that's the actual bootloader we are talking about here?

Yep.

u-boot-spl to be exact. The BOOT.bin is just one of the files that 
disappears, it's the firststage loader built by u-boot.


-- 
Mike Looijmans

