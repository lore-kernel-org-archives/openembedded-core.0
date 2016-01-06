Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A2AAE6FF7B;
	Wed,  6 Jan 2016 23:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06NBjfa024144; Wed, 6 Jan 2016 23:11:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SgM4R_YdRAkd; Wed,  6 Jan 2016 23:11:45 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06NBdQW024141
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Jan 2016 23:11:40 GMT
Message-ID: <1452121899.7598.107.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 06 Jan 2016 23:11:39 +0000
In-Reply-To: <1451904943.23712.49.camel@intel.com>
References: <1451307640.4129.16.camel@linuxfoundation.org>
	<1451904943.23712.49.camel@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Split do_rootfs into image specific tasks?
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
X-List-Received-Date: Wed, 06 Jan 2016 23:11:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-04 at 11:55 +0100, Patrick Ohly wrote:
> On Mon, 2015-12-28 at 13:00 +0000, Richard Purdie wrote:
> I think it is indeed a step in the right direction. Having to re
> -create the rootfs directory each time one makes a change to an image
> creation class or image configuration made experimenting with such 
> changes awkward and slow.

Agreed, that alone probably makes this change worthwhile in some ways.

> However, the question remains how far this rewrite should go. The
> current semantic model of an "image" is essentially "rootfs + boot
> loader + kernel", and the current "image" recipes define both the
> content of the rootfs and additional parameter for turning that one
> rootfs into an image.
> 
> That's arguably the most common scenario, but it is only a special
> case.
> Other image layouts may have multiple partitions, each with certain
> files. For example, there might be a read-only rootfs, an overlay
> partition for the rootfs and a data partition for user files (for the
> sake of the argument, assume that it needs to be pre-populated with
> certain files).
> 
> In my opinion, the proposed changes allow implementing a more general
> image class. Such a class would have to create additional tasks (like
> do_overlayfs and do_userfs where it installs files based on some
> additional recipe variables), then in do_image_foobar combine these
> additional directories into the full disk image.

That is the intent, someone should be able to much more easily tap into
and do other things with the generated data. It works better with
rm_work for example too, since things don't get cleaned up until after
do_image_complete.

> This can be done without using any existing code, but probably there
> are
> overlaps in functionality and opportunities for code reuse. For
> example,
> converting a directory into a ext2/ext3/ext4/btrfs file system is a
> common problem. Having that in a Python utility method would be 
> useful (but not needed immediately).

I'd be more than happy to see a function library of these kinds of
useful things. This change sets the scene for more changes to the
image_types.bbclass, we could for example change the IMAGE_CMD
variables into tasks and drop IMAGE_CMD entirely (at least in
principle, I'm not saying we should/shouldn't).

> The "populate rootfs" code may also be a candidate for moving into an
> utility method, although it may be harder to determine exactly which
> variables it depends on and might not even be needed.

If you look at the code after the recent changes, the do_rootfs code is
already well abstracted into the lib/oe/rootfs.py and associated files
as a module.

> So, bottom line, I think it makes sense to move ahead as proposed and
> refine later in cooperation with distros trying to implement their 
> own special disk layout.

Thanks for the feedback. I think this is a good first step and then we
can consider if any subsequent ones make sense.

Cheers,

Richard


