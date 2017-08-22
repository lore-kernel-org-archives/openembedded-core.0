Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05D4478293
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 21:56:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MLutJ3004529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 22:56:56 +0100
Message-ID: <1503439015.32591.138.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 22:56:55 +0100
In-Reply-To: <30e270c4-3369-b602-a1de-f8bd92038626@windriver.com>
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
	<30e270c4-3369-b602-a1de-f8bd92038626@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 22:56:57 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Tue, 22 Aug 2017 21:56:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 16:34 -0400, Bruce Ashfield wrote:
> On 08/22/2017 12:07 PM, Richard Purdie wrote:
> I found the commit that is causing the problem (after three hours
> of bisecting). That's the good news. The bad news is it isn't
> something
> I can revert .. or easily fix, since the commit is large and is
> pretty
> much tree wide. There's a lot of commits stacked on top if that
> change,
> so it can't be reverted.
> 
> ------------
> 
> commit 82ed4db499b8598f16f8871261bff088d6b0597f
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Fri Jan 27 09:46:29 2017 +0100
> 
>      block: split scsi_request out of struct request
> 
>      And require all drivers that want to support BLOCK_PC to
> allocate it
>      as the first thing of their private data.  To support this the
> legacy
>      IDE and BSG code is switched to set cmd_size on their queues to
> let
>      the block layer allocate the additional space.
> 
>      Signed-off-by: Christoph Hellwig <hch@lst.de>
>      Signed-off-by: Jens Axboe <axboe@fb.com>
> 
> ---------
> 
> I was able to boot with the following in the command line:
> 
> -drive 
> file=tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64-
> 20170822200708.iso,if=virtio,media=cdrom
> 
> --------
> 
> IMHO we need to stop using the ancient IDE support, since it
> continually
> is broken (not usually this badly .. but often in more subtle ways).
> 
> So switching to a virtio backed CDROM, while the issue is reported
> upstream is probably the best bet.

That seems reasonable to me and should be a simple change to the
runqemu script. The hint above should let me test that so I'll try and
and see how the builds work out. Thanks for the help in figuring a
workaround!

Cheers,

Richard



