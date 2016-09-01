Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D24A473166
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 20:21:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u81KLAsF001042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 13:21:10 -0700 (PDT)
Received: from server.local (147.11.116.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 13:21:09 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
	<94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
	<1472566766.8449.29.camel@andred.net>
	<78886c10-2951-9a57-31dd-0e1e78d19815@windriver.com>
	<1472633650.12967.15.camel@andred.net>
	<81c8d462-9f65-cd7c-7dfe-f3acd2e21e18@windriver.com>
	<1472746455.27417.57.camel@andred.net>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <cfa28fd7-e1cf-c1fd-ef90-198bf21cd96b@windriver.com>
Date: Thu, 1 Sep 2016 16:21:08 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472746455.27417.57.camel@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] kernel-yocto: streamline patch, configuration and audit phases
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
X-List-Received-Date: Thu, 01 Sep 2016 20:21:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-09-01 12:14 PM, André Draszik wrote:
> On Mi, 2016-08-31 at 16:17 -0400, Bruce Ashfield wrote:
>> On 2016-08-31 4:54 AM, André Draszik wrote:
>>>
>>> On Di, 2016-08-30 at 14:35 -0400, Bruce Ashfield wrote:
>>>>
>>>> Can you clarify for me if you are are using SRC_URI items tagged with
>>>> 'kmeta', i.e. a directory of fragments, or are you just adding
>>>> .cfg/.scc
>>>> items directly to the SRC_URI ?
>>>
>>> I do both:
>>>
>>> in the 1st layer, my kernel recipe boils down to:
>>>
>>> SRC_URI = "\
>>>     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-
>>> stable.git;protocol=git;nocheckout=1;branch=${KBRANCH} \
>>>     file://0001-a-patch.patch \
>>>     file://kernel-meta;type=kmeta;destsuffix=${KMETA} \
>>> "
>>>
>>> KERNEL_FEATURES_append = " patches/some-patches.scc"
>>> KERNEL_FEATURES_append = " patches/more-patches.scc"
>>> KERNEL_FEATURES_append = " patches/even-more-patches.scc"
>>>
>>> some of the above in turn include additional .scc items recursively.
>>>
>>>
>>> In the 2nd layer, my .bbappend boils down to:
>>>
>>> FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-4.4:"
>>>
>>> KERNEL_FEATURES_append_tgm = " patches/tgm.scc"
>>>
>>> 2nd-layer.scc is located in ${THISDIR}/kernel-meta/patches/ in the 2nd
>>> layer. I don't specifically add another SRC_URI item tagged with 'kmeta'
>>> (or
>>> any other explicit SRC_URI item for that matter).
>>
>> One more clarification. From our problem description, are you saying
>> that in your runs, only the meta data from layer2 is getting copied
>> and not that from layer1 ?
>
> That is what I had inferred from the error message:
>
> | DEBUG: Executing shell function do_kernel_metadata
> | ERROR. input file "patches/some-patches.scc" does not exist
> | ERROR: could not process input files: <2nd_layer>/recipes-kernel/linux/linux-ramips-4.4/tgm/defconfig <1st_layer>/recipes-kernel/linux/linux-ramips-4.4/0001-a-patch.patch patches/some-patches.scc patches/more-patches.scc patches/even-more-patches.scc patches/tgm.scc
> |        See /tmp/tmp.mPP1jtatxm for details
> | ERROR. input file "patches/some-patches.scc" does not exist
> | ERROR: could not process input files: <2nd_layer>/recipes-kernel/linux/linux-ramips-4.4/tgm/defconfig <1st_layer>/recipes-kernel/linux/linux-ramips-4.4/0001-a-patch.patch patches/some-patches.scc patches/more-patches.scc patches/even-more-patches.scc patches/tgm.scc
> |        See /tmp/tmp.v9LU9ccpbl for details
> | WARNING: exit code 1 from a shell command.
>
>
>> I ran my sanity test, and saw meta data from both my layers copied ..
>> so I'm worried that I misunderstood the issue you are seeing.
>
> I can see that they are actually copied indeed, but it doesn't find them...
> The file /tmp/tmp.v9LU9ccpbl mentioned above is empty.

Yah, that's a temporary file used in the processing. I'm going to clean
up the logging a bit as I work through this.

I think I can fix things with some path manipulations, but am still
working on it.

>
>> But looking at the code, I can definitely do some minor tweaks in this
>> area .. I'm just trying to get the reproducer nailed down.
>
> I can try to create one for you if you prefer tomorrow, rather than wasting
> your time with this, if you don't get any further?

I'm going to be trying this later tonight (Thursday, Eastern Time), but
even if you can throw a mock up out, it will help me debug more.

Bruce

>
>
> Andre'
>


