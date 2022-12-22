Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE55C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 15:00:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.47200.1671721212561788153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 07:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BkOoixIJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AAC5260015;
	Thu, 22 Dec 2022 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671721210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BVBn11M92w+YoM7hFJkcsvtZC+43K5rnryhEj1FjaQ=;
	b=BkOoixIJfsIeWeY7k5Nb978xeng3hsEfrJZRC2N1wwnTJUH7BE2SBqc2PwZCdu4nFWkODl
	hKDWPNt30KhG3zJcXVUTZtOD2+ueqHCJQm4HGkbdJXVzKvUhVH6qpajJi+3KiPW+99LLKP
	4JXx1UglqFBW4hcmaBl+e8pnbf5SpvV72JPPpkUzh+SxDa8Hr3STftdlF4aM9Nrrh8UUoo
	oIiSkF99E58AkmTU9adqWRr1Ud7E7VITdMmLvnrwg5potod+HZ2OarPv6X2934wCm40m8j
	TrLGtKo3TFPpNt9AJVWlYCyEPofNokipbJh71A//a0+yclxE+RKiA7eS1x5Iqg==
Date: Thu, 22 Dec 2022 16:00:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/9] kernel: consolidated pull request
Message-ID: <Y6Rw9zg0yytI/HRL@mail.local>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 15:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174964

Hello Bruce,

I got the following warning for qemuarm oe-core:

WARNING: linux-yocto-6.1+gitAUTOINC+d2ea5dce4e_0952191638-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:
[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_ARM_CRYPTO

On 20/12/2022 13:42:01-0500, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Most of these are -stable udpates, mixed in are a couple of clang fixes
> from Khem, and of course the bigger items of the libc-headers bump and
> the v6.1 reference kernel recipes.
> 
> I've built both musl and glibc for all architectures with the new libc
> headers, and sent patches last week for issues that I found in core or
> meta-oe.
> 
> That being said, I'm sure there's something .. somewhere lurking, but
> there's no sense sitting on it longer.
> 
> As for the 6.1 reference kernel, I've done the same. Built and booted
> core-image-minimal, sato and kernel dev on all architectures. The changes
> sent before the last release meant that our normal culprits of lttng-modules
> and kernel-devsrc don't need any tweaking to work. -rt has also been
> tested.
> 
> We can't make 6.1 the default yet, as the reference h/w BSPs need to
> be updated, and then 5.19 removed. But again, no sense sitting on these
> longer.
> 
> I'm around full time for the rest of this week, and then off and on
> through the first week of January to squash any fallout from the
> updates.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit ace02cec70a4a1bc9088044905b3c4a801a39a1b:
> 
>   systemd: Make importd depend on glib-2.0 again (2022-12-18 19:48:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (9):
>   yocto-bsps/5.15: update to v5.15.78
>   linux-yocto/5.15: update to v5.15.80
>   linux-yocto/5.19: fix perf build with clang
>   linux-yocto/5.15: ltp and squashfs fixes
>   linux-libc-headers: bump to 6.1
>   linux-yocto: introduce v6.1 reference kernel recipes
>   linux-yocto/5.15: fix perf build with clang
>   linux-yocto/5.15: update to v5.15.84
>   linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
> 
>  .../linux/linux-yocto_5.15.bbappend           | 16 ++---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  ...d-input-and-output-files-instead-of-.patch | 67 ------------------
>  ...ders_5.19.bb => linux-libc-headers_6.1.bb} |  5 +-
>  .../linux/linux-yocto-rt_5.15.bb              |  4 +-
>  .../linux/linux-yocto-rt_5.19.bb              |  4 +-
>  .../linux/linux-yocto-rt_6.1.bb               | 45 ++++++++++++
>  .../linux/linux-yocto-tiny_5.15.bb            |  4 +-
>  .../linux/linux-yocto-tiny_5.19.bb            |  4 +-
>  .../linux/linux-yocto-tiny_6.1.bb             | 30 ++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++---
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 70 +++++++++++++++++++
>  13 files changed, 187 insertions(+), 110 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.19.bb => linux-libc-headers_6.1.bb} (70%)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.1.bb
> 
> -- 
> 2.37.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174873): https://lists.openembedded.org/g/openembedded-core/message/174873
> Mute This Topic: https://lists.openembedded.org/mt/95791763/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

