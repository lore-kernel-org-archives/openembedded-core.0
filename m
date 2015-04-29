Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 135067169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 18:17:02 +0000 (UTC)
Received: by vnbg1 with SMTP id g1so4379591vnb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=ZT/qCU87agxbW0x2EnAxdt5Cw6WIXFzNyOyMeIOgHwY=;
	b=iorIkh4IiUHtjtYUxyWpyyvbXCF47g49b1+S6Aas1f4Xj+FiNBR8J20OT58kKx1Lnu
	/KAseifUcENvovmScyrj8wTkNDqJ9nQHWbWEQ2tooldFkdk8/VO9XzRPd6MZIT17TiRp
	cYd9vwhhuDYltUnrZNtF5WaEbARTrI62YdBxv7pbvgHs4EXSwmtt7/kwlRWK+D1tIdd0
	OI7QwL6ixJurLQUmvSBFJFqYIJx6e298DGI46HLxiONom1wSpLfFz7X31nrvFfvAid9A
	RVjRD8bzf6wpzCBukwH5CLOluvCnCLB9oaD34rwKOnK9dtZowQP3SbuxJNivV2OgVaSD
	SYdg==
X-Gm-Message-State: ALoCoQlfetPtAkLvIGKt6QGo6ED7smx8nkl6wq/zbIehUKXRMao2/yVsaUAT2PYs0abXErII6MZu
MIME-Version: 1.0
X-Received: by 10.52.180.102 with SMTP id dn6mr613167vdc.17.1430331422855;
	Wed, 29 Apr 2015 11:17:02 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 29 Apr 2015 11:17:02 -0700 (PDT)
Date: Wed, 29 Apr 2015 19:17:02 +0100
X-Google-Sender-Auth: i3vJmFZ6E32gehtvlK4_AhiPT_s
Message-ID: <CAOMwXhN7Jiirin0gBxZnL9Ps1_Zd0d5W225apwrROY6FY_8o3A@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Migration from dylan to daisy (and dizzy)
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
X-List-Received-Date: Wed, 29 Apr 2015 18:17:06 -0000
Content-Type: text/plain; charset=UTF-8

Dear OpenEmbedded Community,

I have been trying to migrate over from dylan to daisy (and dizzy,
fwiw), but my own kernel would not boot. It used to work just fine
with dylen. It is kernel 3.2 with our BSP changes on top of it, which
are unfortunately not upstream. Either way, dylan was using 4.7 and I
tried to build the kernel with gcc 4.8 from daisy and gcc 4.9 from
dizzy.

I suspect that it is a toolchain and/or kernel issue, definitely not
Yocto as I can reproduce this with some Linaro binaries for arm
gnueabi. Still, I hope that some may have some ideas while working in
scenarios like this?

Jtag with openocd and gdb shows the following backtrace, where
foo_map_io comes from our board description. As you can see it is
fundamentally broken as it gets stuck at the early register access,
even before printk could be used! I tried using early_prink by
enabling debug_ll, but it did not work out for me. Like I wrote, this
is a really early stage of the booting process.

Has anyone experienced similar issues? I would like to update our
Yocto, but it is becoming very difficult as I do not possess the
corresponding gcc and linux expertise, unfortunately. :(

Thank you in advance!

    (gdb) bt
    #0  0xc0016f40 in davinci_psc_config ()
    #1  0xc00164b8 in __clk_enable ()
    #2  0xc00165cc in clk_enable ()
    #3  0xc03aa8b0 in davinci_clk_init ()
    #4  0xc03ab2ec in davinci_common_init ()
    #5  0xc03ab52c in da850_init ()
    #6  0xc03ac360 in foo_map_io ()
    #7  0xc03aa2d4 in paging_init ()
    #8  0xc03a8640 in setup_arch ()
    #9  0xc03a6590 in start_kernel ()
    #10 0xc0008040 in stext ()
    (gdb)

Ys, L.

