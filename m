Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8975F7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 18:37:20 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0F24FF81188; Wed, 29 Apr 2015 12:37:21 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8A4E2F81188;
	Wed, 29 Apr 2015 12:37:21 -0600 (MDT)
Message-ID: <554124F6.7060804@mlbassoc.com>
Date: Wed, 29 Apr 2015 12:37:42 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAOMwXhN7Jiirin0gBxZnL9Ps1_Zd0d5W225apwrROY6FY_8o3A@mail.gmail.com>
In-Reply-To: <CAOMwXhN7Jiirin0gBxZnL9Ps1_Zd0d5W225apwrROY6FY_8o3A@mail.gmail.com>
Subject: Re: Migration from dylan to daisy (and dizzy)
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
X-List-Received-Date: Wed, 29 Apr 2015 18:37:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-29 12:17, Laszlo Papp wrote:
> Dear OpenEmbedded Community,
>
> I have been trying to migrate over from dylan to daisy (and dizzy,
> fwiw), but my own kernel would not boot. It used to work just fine
> with dylen. It is kernel 3.2 with our BSP changes on top of it, which
> are unfortunately not upstream. Either way, dylan was using 4.7 and I
> tried to build the kernel with gcc 4.8 from daisy and gcc 4.9 from
> dizzy.
>
> I suspect that it is a toolchain and/or kernel issue, definitely not
> Yocto as I can reproduce this with some Linaro binaries for arm
> gnueabi. Still, I hope that some may have some ideas while working in
> scenarios like this?
>

You may need a couple of patches to the Linux kernel to use GCC > 4.7.1
   From 455bd4c430b0c0a361f38e8658a0d6cb469942b5 Mon Sep 17 00:00:00 2001
   From: Ivan Djelic <ivan.djelic@parrot.com>
   Date: Wed, 6 Mar 2013 20:09:27 +0100
   Subject: [PATCH] ARM: 7668/1: fix memset-related crashes caused by recent GCC (4.7.2) optimizations

   From 418df63adac56841ef6b0f1fcf435bc64d4ed177 Mon Sep 17 00:00:00 2001
   From: Nicolas Pitre <nicolas.pitre@linaro.org>
   Date: Tue, 12 Mar 2013 13:00:42 +0100
   Subject: [PATCH] ARM: 7670/1: fix the memset fix

> Jtag with openocd and gdb shows the following backtrace, where
> foo_map_io comes from our board description. As you can see it is
> fundamentally broken as it gets stuck at the early register access,
> even before printk could be used! I tried using early_prink by
> enabling debug_ll, but it did not work out for me. Like I wrote, this
> is a really early stage of the booting process.
>
> Has anyone experienced similar issues? I would like to update our
> Yocto, but it is becoming very difficult as I do not possess the
> corresponding gcc and linux expertise, unfortunately. :(
>
> Thank you in advance!
>
>      (gdb) bt
>      #0  0xc0016f40 in davinci_psc_config ()
>      #1  0xc00164b8 in __clk_enable ()
>      #2  0xc00165cc in clk_enable ()
>      #3  0xc03aa8b0 in davinci_clk_init ()
>      #4  0xc03ab2ec in davinci_common_init ()
>      #5  0xc03ab52c in da850_init ()
>      #6  0xc03ac360 in foo_map_io ()
>      #7  0xc03aa2d4 in paging_init ()
>      #8  0xc03a8640 in setup_arch ()
>      #9  0xc03a6590 in start_kernel ()
>      #10 0xc0008040 in stext ()
>      (gdb)
>
> Ys, L.
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

