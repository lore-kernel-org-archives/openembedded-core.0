Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E639D700F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 20:34:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7MKYAVp008824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 13:34:10 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 13:34:09 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
	<74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
	<1503411893.32591.108.camel@linuxfoundation.org>
	<7f1c93bd-0d0d-b4c4-d084-2a75d7362481@windriver.com>
	<1503415737.32591.112.camel@linuxfoundation.org>
	<7462b13d-0fa2-7a9f-c6d9-49c5a3f6abb0@windriver.com>
	<1503417606.32591.115.camel@linuxfoundation.org>
	<08e38c79-6ff5-fb02-00f3-c94e76b322fc@windriver.com>
	<1503418078.32591.118.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <30e270c4-3369-b602-a1de-f8bd92038626@windriver.com>
Date: Tue, 22 Aug 2017 16:34:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503418078.32591.118.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Aug 2017 20:34:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/22/2017 12:07 PM, Richard Purdie wrote:
> On Tue, 2017-08-22 at 12:04 -0400, Bruce Ashfield wrote:
>> On 08/22/2017 12:00 PM, Richard Purdie wrote:
>>>
>>> On Tue, 2017-08-22 at 11:34 -0400, Bruce Ashfield wrote:
>>>>
>>>> I can send you a v4 of the 4.12 patch in the next half an hour,
>>>> that's easiest for me to do.
>>>>
>>>> .. but if it isn't for you, go ahead and do the merge and I'll
>>>> sort it out in a follow up.
>>> The above works, I'm still trying to get to the bottom of the other
>>> issues that are going on.
>> Patch sent as a v4 (although I now realize I forgot to put
>> v4 in the subject, only in the summary).
> 
> Thanks, I'll pull that into subsequent test runs.
> 
>>> Something in the IDE CDROM driver?
>> I keep getting sent changes to drop IDE support completely, but
>> they aren't in play here, I'm still waiting on a 4.10 linux-yocto
>> to configure so I can diff the .configs and fire up some comparison
>> boot tests.
> 
> I did diff the configs and nothing jumped out to me at
> least, CONFIG_INITRAMFS_COMPRESSION=".gz" went missing but doesn't look
> relevant as it only affects built in initramfs afaict.

I found the commit that is causing the problem (after three hours
of bisecting). That's the good news. The bad news is it isn't something
I can revert .. or easily fix, since the commit is large and is pretty
much tree wide. There's a lot of commits stacked on top if that change,
so it can't be reverted.

------------

commit 82ed4db499b8598f16f8871261bff088d6b0597f
Author: Christoph Hellwig <hch@lst.de>
Date:   Fri Jan 27 09:46:29 2017 +0100

     block: split scsi_request out of struct request

     And require all drivers that want to support BLOCK_PC to allocate it
     as the first thing of their private data.  To support this the legacy
     IDE and BSG code is switched to set cmd_size on their queues to let
     the block layer allocate the additional space.

     Signed-off-by: Christoph Hellwig <hch@lst.de>
     Signed-off-by: Jens Axboe <axboe@fb.com>

---------

I was able to boot with the following in the command line:

-drive 
file=tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64-20170822200708.iso,if=virtio,media=cdrom

--------

IMHO we need to stop using the ancient IDE support, since it continually
is broken (not usually this badly .. but often in more subtle ways).

So switching to a virtio backed CDROM, while the issue is reported
upstream is probably the best bet.

Bruce

> 
> Cheers,
> 
> Richard
> 
> 


