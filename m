Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B607477AF0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 172FC31E61E9;
	Fri, 21 Apr 2017 14:48:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id MEtJ1JZX4iVC; Fri, 21 Apr 2017 14:48:18 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1E1AD31E61CC;
	Fri, 21 Apr 2017 14:48:18 +0200 (CEST)
Date: Fri, 21 Apr 2017 14:48:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: David Vincent <freesilicon@gmail.com>
Message-ID: <20170421144817.66c189b6@t510.zcs.saftware.de>
In-Reply-To: <CAKRNOGyKJ5_W5Ws0Q7E2Nm9d8SV6bTZzXac2K6uEexE7567UjA@mail.gmail.com>
References: <1492771191-4445-1-git-send-email-obi@opendreambox.org>
	<CAAQYJAs_8am0azk+0_3MNvwrNU6WiX2_5HgH0ouwWdyK6F8rAA@mail.gmail.com>
	<20170421133034.59e68228@t510.zcs.saftware.de>
	<CAKRNOGyKJ5_W5Ws0Q7E2Nm9d8SV6bTZzXac2K6uEexE7567UjA@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Fri, 21 Apr 2017 12:48:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Apr 2017 14:37:36 +0200
David Vincent <freesilicon@gmail.com> wrote:

> On 2017-04-21 13:30 GMT+02:00 Andreas Oberritter <obi@opendreambox.org>:
> > On Fri, 21 Apr 2017 13:02:51 +0200
> > Andrea Adami <andrea.adami@gmail.com> wrote:
> >  
> >> On Fri, Apr 21, 2017 at 12:39 PM, Andreas Oberritter
> >> <obi@opendreambox.org> wrote:  
> >> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
> >> >
> >> > It broke dpkg's update-alternatives, which requires absolute paths.  
> >>
> >> This is really uncommon.  
> >
> > Actually it's not. Try it on any Debian or Ubuntu system.
> >  
> >> I had already expressed my negative opinion about absolute paths for kernel [1].
> >> Personally, I had to patch the bootloader (kexecboot).  
> 
> Same here, that's why I submitted it in the first place. Didn't
> thought that would break dpkg...
> 
> >>
> >> So please try some workaround instead of changing it back.  
> >
> > Well, there's no workaround. Other than opkg's update-alternatives, dpkg's maintains
> > an alternatives database in /etc/alternatives, so the symlink is going to point to
> > an absolute path outside of /boot anyway.  
> 
> The problem is that, for bootloaders, it is not always possible to
> mount the rootfs. So, it must only rely on information in the boot
> partition that can be mounted anywhere.

I understand the problem the patch tried to address.

Those bootloaders don't find the kernel by chance. The name of the image
is usually set in the environment. You can update the environment in postinst-
scripts or just change the name of the kernel image to match the bootloader's
expectations, just to name some alternatives.

> >
> > To fix your problem, kernel.bbclass should be changed to not use update-alternatives
> > at all. But it's definitely wrong to break the original u-a by using invalid command-
> > line arguments.
> >  
> 
> And reverting this patch breaks boot for those who rely on a relative
> symlink ; that is also wrong.

Yes. However, I'd argue that a regression is worse than a problem that
persisted for years.

Regards,
Andreas

