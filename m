Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAAFC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 22:00:52 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.1.1705701642717112807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 14:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hEvZXm2R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F048AE0002;
	Fri, 19 Jan 2024 22:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705701640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwLxENnDoQr94b9B5FEcEKj5TTC7i5CwnIf4A29DHrM=;
	b=hEvZXm2Rk6t2+TaopHUWm22yNBoxPMJ68nCEv4tMe1/LmyvjJfvo3m/4c/VIn5Kjcq8kuv
	KjgjxIklzYtpFzcR/xQ9zmY2C+HxAdpeN2i7q2TF3zvHhhCJcZAQJ0FiWcTbDJqDoBi/Kh
	LbP7g78Z4Ikyi0U6AEgdOkc7u5Gp2ikU4FoD3LJvQw/JsZ2/WOhXepq6XlNUBJ7tXN8MWb
	rGgftaduBN2i/ZYoKn+QMV0ray+R1Wp+5CtzODQOvgVzRQeyBOt65duk49BCIj0cLMaYUJ
	K4629XcnGsObuoz5L9qXu9nMX9ucNjGChAQzk/MFjgiP+b/ajGTYNYNLJb61eA==
Date: Fri, 19 Jan 2024 23:00:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>, thomas.petazzoni@bootlin.com
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.4
Message-ID: <2024011922003945fc56a9@mail.local>
References: <20240117094701.25763-1-thomas.perrot@bootlin.com>
 <abad3986d80e9eae3e7ed69f1ca466678eea042d.camel@linuxfoundation.org>
 <f9050dd0b2bb0c072f891a5b45cf96bdb7b9a7f0.camel@bootlin.com>
 <3d768fea662107ded470e7aa3dbd3e2d561e173a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d768fea662107ded470e7aa3dbd3e2d561e173a.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 22:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194078


On 19/01/2024 19:24:44+0000, Richard Purdie wrote:
> On Fri, 2024-01-19 at 18:48 +0100, Thomas Perrot wrote:
> > Hello Richard,
> > 
> > On Fri, 2024-01-19 at 17:22 +0000, Richard Purdie wrote:
> > > On Wed, 2024-01-17 at 10:47 +0100, Thomas Perrot via
> > > lists.openembedded.org wrote:
> > > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > 
> > > > This release has:
> > > > - Synopsys DesignWare APB GPIO driver
> > > > - Zicntr and Zihpm support
> > > > - Console print improvements
> > > > - Smepmp support
> > > > - Simple FDT based syscon regmap driver
> > > > - Syscon based reboot and poweroff driver
> > > > - Non-contiguous hpm counters
> > > > - Smcntrpmf support
> > > > - Full sparse hartid support
> > > > - IPI improvements
> > > > - RFENCE improvements
> > > > - Zkr support
> > > > - Andes custom PMU support
> > > > Overall, this release mainly adds more ISA extensions, drivers and
> > > > other improvements.
> > > > 
> > > > https://github.com/riscv-software-src/opensbi/compare/v1.3.1...v1.4
> > > > 
> > > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > 
> > > This all seems reasonable but why is there a revert below?
> > 
> > I reverted it otherwise the following link issue occurs:
> > 
> > "build/tmp-glibc/work/riscv64-oe-linux/opensbi/1.4/recipe-sysroot-
> > native/usr/bin/riscv64-oe-linux/../../libexec/riscv64-oe-
> > linux/gcc/riscv64-oe-linux/13.2.0/ld.bfd:/src/build/tmp-
> > glibc/work/riscv64-oe-
> > linux/opensbi/1.4/git/build/platform/generic/firmware/fw_dynamic.elf.ld
> > :54: undefined section `.dynsym' referenced in expression"
> 
> The commit should at least mention the issue.
> 
> I'm also not sure that is "Inappropriate", more like "Pending" as in
> needs further investigation.

The original commit states that relocations don't need to be handled
because everything is linked statically which is not true in our case,
else we wouldn't be trying to link dynamically.

> 
> > > > ---
> > > > �...re-Remove-handling-of-R_RISCV_-32-64.patch | 88
> > > > +++++++++++++++++++
> > > > �.../{opensbi_1.3.bb => opensbi_1.4.bb}������� |� 8 +-
> > > > �2 files changed, 92 insertions(+), 4 deletions(-)
> > > > �create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Revert-
> > > > firmware-Remove-handling-of-R_RISCV_-32-64.patch
> > > > �rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb => opensbi_1.4.bb}
> > > > (90%)
> > > > 
> > > > diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-
> > > > Remove-handling-of-R_RISCV_-32-64.patch b/meta/recipes-
> > > > bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-
> > > > R_RISCV_-32-64.patch
> > > > new file mode 100644
> > > > index 000000000000..d14e0b73a9bc
> > > > --- /dev/null
> > > > +++ b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-
> > > > handling-of-R_RISCV_-32-64.patch
> > > > @@ -0,0 +1,88 @@
> > > > +From bfe480929bcc966e1fdf5afdde8d4c22adba7f6f Mon Sep 17 00:00:00
> > > > 2001
> > > > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > +Date: Tue, 16 Jan 2024 15:16:58 +0100
> > > > +Subject: [PATCH] Revert "firmware: Remove handling of
> > > > R_RISCV_{32,64}"
> > > > +
> > > > +This reverts commit 2a6d72534d44c39e1de0614970a0dad97b1c41ba.
> > > > +
> > > > +Upstream-Status: Inappropriate [oe specific]
> > > > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > 
> > > If we're going to revert an upstream change, we need to say *why*. We
> > > need to revert it for some OE specific reason but what is that
> > > reason?
> > > 
> > 
> > I agree, maybe you have any advice to fix it in another way?
> 
> I have no idea, I've copied Khem who might or might know who to talk
> to.
> 
> Cheers,
> 
> Richard

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194065): https://lists.openembedded.org/g/openembedded-core/message/194065
> Mute This Topic: https://lists.openembedded.org/mt/103782707/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

