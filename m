Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 104156023E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:22:44 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 13so3785755lba.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=l2oeFxZOVh0QDsmSlSEFMT1zr6M5gT/G0nDgJgZsmAc=;
	b=Dh6qaViZGvhnbUfS5m76AD4L1Fbs3sGmBdroJil/m8DbujwBS9JjbkRwkwHzYzHEwh
	wMN2YMMdGHX6Tgf+dJA6fVAHGkGbYznYZ4QHzMRJd1nlwPzDlQ2ScQl/vMdGpojWvMGQ
	0s1YQDX5rQSJilikQyVl0LwXV+AMu2IWZzBFbX+emZOlFzvqR6Wyl+jjNY21BCcH/sKA
	L0i9Zotw68PlyOzapQ2ukL91mEM8w6B8tU1Mw6jTw/b14uh2MRh01seHPYPOcXqlmugc
	GzvMIZX4gVQBHsRmhLHe/JKtW/ncCD+/smLe19WHNV8oNixnlSaQtAVfnuEHScWFA4Ee
	IWcQ==
MIME-Version: 1.0
X-Received: by 10.152.21.194 with SMTP id x2mr9551212lae.9.1371568965372; Tue,
	18 Jun 2013 08:22:45 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Tue, 18 Jun 2013 08:22:45 -0700 (PDT)
In-Reply-To: <cover.1371567827.git.bruce.ashfield@windriver.com>
References: <cover.1371567827.git.bruce.ashfield@windriver.com>
Date: Tue, 18 Jun 2013 11:22:45 -0400
Message-ID: <CADkTA4PwDNEZ43g07xuC59AoPnHSnxGsKASut4OQPnT-SoqtMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1]
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
X-List-Received-Date: Tue, 18 Jun 2013 15:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Apologies for the "no subject" email.

The rest is fine, just the guy typing it up had an itchy trigger finger!

Cheers,

Bruce

On Tue, Jun 18, 2013 at 11:20 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Here's the integration of a change from Khem to fix the gcc 4.8 ARM
> boot issues.
>
> I'm still seeing some quasi random issues, but this definitely fixes
> the issue at hand, gets us up and running and is much better than
> what we had before.
>
> The patch pretty much says everything else:
>
> linux-yocto/3.8: fix gcc 4.8 ARM boot issues
>
> Updating the linux-yocto-3.8 SRCREVs to fix a boot issue with ARM boards
> when gcc 4.8 is used.
>
> Without the following mainline backports:
>
>   f200475 ARM: 7670/1: fix the memset fix
>   8215b0e ARM: 7668/1: fix memset-related crashes caused by recent GCC (4.7.2) optimizations
>
> The following trap will be seen on boot:
>
>     [<c00fc3b8>] (kmem_cache_alloc_trace+0x54/0x210) from [<c039f074>] (con_insert_unipair+0xcc/0x11c)
>     [<c039f074>] (con_insert_unipair+0xcc/0x11c) from [<c039fec8>] (con_set_default_unimap+0xfc/0x198)
>     [<c039fec8>] (con_set_default_unimap+0xfc/0x198) from [<c07ee258>] (console_map_init+0x44/0x58)
>     [<c07ee258>] (console_map_init+0x44/0x58) from [<c07ee738>] (vty_init+0x16c/0x1b0)
>     [<c07ee738>] (vty_init+0x16c/0x1b0) from [<c07edb68>] (tty_init+0x108/0x148)
>     [<c07edb68>] (tty_init+0x108/0x148) from [<c07eead0>] (chr_dev_init+0xb4/0xd8)
>     [<c07eead0>] (chr_dev_init+0xb4/0xd8) from [<c0008a18>] (do_one_initcall+0x11c/0x18c)
>     [<c0008a18>] (do_one_initcall+0x11c/0x18c) from [<c07d89d0>] (kernel_init_freeable+0x16c/0x254)
>     [<c07d89d0>] (kernel_init_freeable+0x16c/0x254) from [<c05a3810>] (kernel_init+0x18/0x160)
>     [<c05a3810>] (kernel_init+0x18/0x160) from [<c000e530>] (ret_from_fork+0x14/0x20)
>     Code: e593a000 e35a0000 0a000020 e5943014 (e79a1003)
>     ---[ end trace e6c62de166779f86 ]---
>     Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> Moderate stress and board testing shows the fix to hold, and it is good for
> broader testing.
>
> [YOCTO #4549]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 1dd643b142c69ac9035e29bff11d02201638dc65:
>
>   licences: Add SGI license (2013-06-17 16:45:37 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>   linux-yocto/3.8: fix gcc 4.8 ARM boot issues
>
>  meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    4 ++--
>  meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   14 +++++++-------
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

