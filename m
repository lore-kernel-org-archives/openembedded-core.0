Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9C21775791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 14:03:54 +0000 (UTC)
Received: by ykay190 with SMTP id y190so193026761yka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jQtpm7IND2PZZcTsZhF7FXQHrWTZWMrTxkSZCxsdXyI=;
	b=rMIJeuwp6VraBhD9bfCBWPtsKcXu5soN5PpL2RuDAHSJfBJezi+/csCsvzBAqEPjgc
	S3uOdhjB7IMwRSiP3TavP9fWZ9Ab88xyqLqhvAfKffZh76FcYy0xn6c1YStDJT8PiJ86
	U7wjadmYLkuBF0rStxBASggxoELGQsGSiUXEH4cn+2R1/Za8+HDnjCWlLE36JJpToLhJ
	NdKWmN4SclGFH7HHwOGFCgfltUq70Um87heuDrHH0450f+L5TS8CUlArFXt5IaurXQXT
	thZJLlESFwHg7MJuxlgO09XcD8k1kXsJG3LPbBNb3Iq5sLSRiELp19Be+fF7TwkKFEzv
	eUBg==
MIME-Version: 1.0
X-Received: by 10.170.77.5 with SMTP id t5mr2659050ykt.58.1437573834252; Wed,
	22 Jul 2015 07:03:54 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 22 Jul 2015 07:03:54 -0700 (PDT)
In-Reply-To: <cover.1437491325.git.bruce.ashfield@windriver.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
Date: Wed, 22 Jul 2015 10:03:54 -0400
Message-ID: <CADkTA4NTzQhvmCt4J9BkbsAh6CL5joomn-NDA8=0kgjd6wcTxQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto: build changes, 4.1 and libc-headers
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
X-List-Received-Date: Wed, 22 Jul 2015 14:03:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 21, 2015 at 11:21 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Hi all,
>
> This series absolutely needs some more testing and runs through the
> autobuilder, but I've done pretty much all I can do with it here.
>
> I have more changes to the build process that will follow this, but
> these changes need to show that they are stable, so here's the first
> blast.
>
> With this series:
>
>   - I create the 4.1, and 4.1-rt linux-yocto content. This will be
>     the new LTSI kernel. Deletion of 3.14 and 3.19 will follow once
>     all machines have been moved forward.
>
>   - libc-headers updated to match the 4.1 kernel version.
>
> And the one that could cause some issues/compatibility issues is the
> split of the kernel configuration data from the kernel tree itself.
>
> From the commit log:
>
>   The linux-yocto tree has always been a combined set of kernel changes
>   and configuration (meta) data carried in a single tree. While this
>   format is effective at keeping kernel configuration and source
>   modifications synchronized, it isn't always obvious to developers on
>   how to manipulate the meta data versus the source.
>
>   With this change, we remove the meta data processing from the
>   kernel-yocto class and use the external meta-data repository that
>   has always been used to seed the linux-yocto meta branch.
>
>   After this change, linux-yocto can no longer process combined trees,
>   and is simplified as a result.
>
> I'm interested to find out if we get any breakages or severe compability
> issues with the change. I don't want to support both variants of the
> meta data (in and out of tree), since the goal is to reduce complexity
> in the code. Once this change lands, I'll further streamline things.
>
> I've built core-image-kernel-dev and boot tested the qemu* machines.
> qemuppc continues to show a boot failure with systemd, but we have a
> bugzilla to track that.
>
> I'm now doing graphical testing, but wanted to get this out and soaking
> for other images types while I wait for builds to churn.

As a follow up, my qemuarm boots that worked on Friday, are now hanging.
I'm bisecting to find out what happened.

But I have tested graphics on x86 and mips without issue.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
> The following changes since commit 0f8d89ce66cfffccc9911d6c61470a585173b79d:
>
>   core-image-lsb-sdk: use kernel-devsrc to ensure kernel module builds work (2015-07-20 10:40:42 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (4):
>   linux-yocto: split meta data from kernel repository
>   kern-tools: standalone tree configuration
>   linux-libc-headers: update to 4.1
>   linux-yocto: introduce 4.1 versioned recipes
>
>  meta/classes/kernel-yocto.bbclass                  | 76 ++--------------------
>  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>  .../kern-tools/kern-tools-native_git.bb            |  2 +-
>  .../linux-libc-headers/linux-libc-headers.inc      |  2 +
>  .../linux-libc-headers/linux-libc-headers_3.19.bb  |  7 --
>  .../linux-libc-headers/linux-libc-headers_4.1.bb   |  7 ++
>  meta/recipes-kernel/linux/linux-yocto-dev.bb       |  5 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  7 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    | 26 ++++++++
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  7 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  7 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  | 23 +++++++
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  7 +-
>  meta/recipes-kernel/linux/linux-yocto_3.19.bb      |  7 +-
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 41 ++++++++++++
>  15 files changed, 129 insertions(+), 97 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.1.bb
>
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

