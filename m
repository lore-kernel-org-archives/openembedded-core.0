Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4712873286
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 20:18:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VKHwjX013558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 31 Aug 2016 13:17:59 -0700
Received: from server.local (147.11.116.125) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 13:17:58 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
	<94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
	<1472566766.8449.29.camel@andred.net>
	<78886c10-2951-9a57-31dd-0e1e78d19815@windriver.com>
	<1472633650.12967.15.camel@andred.net>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <81c8d462-9f65-cd7c-7dfe-f3acd2e21e18@windriver.com>
Date: Wed, 31 Aug 2016 16:17:56 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472633650.12967.15.camel@andred.net>
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
X-List-Received-Date: Wed, 31 Aug 2016 20:18:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016-08-31 4:54 AM, André Draszik wrote:
> On Di, 2016-08-30 at 14:35 -0400, Bruce Ashfield wrote:
>> Can you clarify for me if you are are using SRC_URI items tagged with
>> 'kmeta', i.e. a directory of fragments, or are you just adding .cfg/.scc
>> items directly to the SRC_URI ?
>
> I do both:
>
> in the 1st layer, my kernel recipe boils down to:
>
> SRC_URI = "\
>     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;nocheckout=1;branch=${KBRANCH} \
>     file://0001-a-patch.patch \
>     file://kernel-meta;type=kmeta;destsuffix=${KMETA} \
> "
>
> KERNEL_FEATURES_append = " patches/some-patches.scc"
> KERNEL_FEATURES_append = " patches/more-patches.scc"
> KERNEL_FEATURES_append = " patches/even-more-patches.scc"
>
> some of the above in turn include additional .scc items recursively.
>
>
> In the 2nd layer, my .bbappend boils down to:
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-4.4:"
>
> KERNEL_FEATURES_append_tgm = " patches/tgm.scc"
>
> 2nd-layer.scc is located in ${THISDIR}/kernel-meta/patches/ in the 2nd
> layer. I don't specifically add another SRC_URI item tagged with 'kmeta' (or
> any other explicit SRC_URI item for that matter).

One more clarification. From our problem description, are you saying
that in your runs, only the meta data from layer2 is getting copied
and not that from layer1 ?

I ran my sanity test, and saw meta data from both my layers copied ..
so I'm worried that I misunderstood the issue you are seeing.

But looking at the code, I can definitely do some minor tweaks in this
area .. I'm just trying to get the reproducer nailed down.

Bruce

>
>
> Andre'
>


