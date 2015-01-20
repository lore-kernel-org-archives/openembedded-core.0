Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 03B2171144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 20:22:06 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so9838686qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 12:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=v6+xf/csabvnIsTucKVGUor3yFL99n4buYuJsrNt3Nk=;
	b=YfK2oisWTMWXGaivZov9mIeWYeCWHY4fCx3Fh4tGMbSQbG4zy1BcDnDil4RmyTyjLN
	JSNvcwDFFYs9uEY3oFiE+ccDyPCy2/SSY0OKKGrFWjWRrOHAmc02Br2d0KbVkuQBBUSb
	x9GTnbrQ5Zg/xd9YBDucv92VFI0a/CEYAjYOV5EngD/iYtCxhjW/LFBdueNUMoSbfYSH
	GEbqbOoWc7sNZ6RPoMPN35MDnJDJwoMHM95ITfbvW/xYzsfKkyRQmCXCy7zh3tzZvQfm
	D0VIgXOFJmtS9VrQpHUEQOzAS6pLQzEqMq3EtMp7PioIdWHkH3t9nu9iM28ZIzlrplVe
	01eQ==
MIME-Version: 1.0
X-Received: by 10.229.225.68 with SMTP id ir4mr7374403qcb.23.1421785326787;
	Tue, 20 Jan 2015 12:22:06 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Tue, 20 Jan 2015 12:22:06 -0800 (PST)
In-Reply-To: <D0E3BC38.B85FA%darren.hart@intel.com>
References: <1421760783.1798.42.camel@linuxfoundation.org>
	<54BE633A.1000306@windriver.com>
	<D0E3BC38.B85FA%darren.hart@intel.com>
Date: Tue, 20 Jan 2015 14:22:06 -0600
Message-ID: <CACS+7ZSZEnbwxb4Y7UCyRfiJuhj1H4gFcEy0VY36XSTpy1SAEw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Hart, Darren" <darren.hart@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel/image/depmodwrapper: Fixups for depmod
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
X-List-Received-Date: Tue, 20 Jan 2015 20:22:12 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2015 at 10:04, Hart, Darren <darren.hart@intel.com> wrote:
>
>
> On 1/20/15, 6:16 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:
>
>>On 15-01-20 08:33 AM, Richard Purdie wrote:
>>> With the rpm package backend enabled, running:
>>>
>>> bitbake <image>
>>> bitbake virtual/kernel -c clean
>>> bitbake <image> -c rootfs -f
>>>
>>> results in an image with incorrect kernel module dependency information.
>>> The problem is that the System.map and kernel-abiversion files are
>>>needed
>>> for depmod and after the recent kernel changes, these are no longer in
>>> sstate.
>>>
>>> Its reasonable to require the kernel to unpack/build if you're
>>> about to build a module against it. It is not reasonable to require this
>>> just to build a rootfs.
>>>
>>> Therefore stash the needed files specifically for depmod.
>>>
>>> Also fix some STAGING_KERNEL_DIR references which were incorrect, found
>>> whilst sorting through his change.
>>
>>Now that I see the fix, the tweaks are clear (and obvious). I would have
>>preferred a straight up module loading error in all cases .. since that
>>would have showed in my workflows. The rootfs.py changes in particular
>>would have taken me much longer to get right.
>>
>>>
>>> This patch also makes the depmod files being missing a fatal error
>>>rather than
>>> something the system just ignores silently.
>>
>>Nice improvement.
>>
>>Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> Functionally look good. I noticed some whitespace issues (spaces in bash
> sections instead of tabs), but those may have been due to keeping a file
> internally consistent.
>
> Otherwise,
>
> Reviewed-by: Darren Hart <dvhart@linux.intel.com>

It causes a build failure in meta-beagleboard's kernel recipes. That's
due to meta-beagleboard installing the headers as a package in
/usr/src/linux-<version>. I don't know why it does this, but I patched
the recipe to not install the headers and it worked.

I like this change.

