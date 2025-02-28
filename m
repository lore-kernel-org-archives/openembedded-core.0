Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BD5C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 09:10:17 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.11715.1740733813674012778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 01:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=oBd30fuN;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tnwNn-00079u-0h; Fri, 28 Feb 2025 04:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=8wZ7IBkKXgB0FvPBtTivZpSHK+O4jIQnFaD5d7NoC+A=; b=oBd30fuNmorAGAgG6o1S
	TmlSBVm4jmXWiHniuoQSMK4Fq8e342cTqtgfX4DnMVcNJzpWyKqL17XYv0ifC/jDgBu1rn9pzZFNy
	JzIzFqpNl0CQ2VEANaGm8f/eQSJkQr4hqyeANpuIuxREccH3EsfBUyCkyXEIwTMlDnerolMo/IKtL
	KYK1cAOuLZSJeKC5Yp2+PVMDxJTKiQWL70HEX4WEz+QY3Vmoi+SZ1G7WAtpFAJFvgJ3IbXmtjAnTH
	g5ZoaIUt1EMrhT9Ol6PkDFbGn2zLR4DKQYgbGXtaUF+zzOkHqg7vL5L1fAg9okUMejDpyHgrieXBb
	YIFWQmGTqoak5Q==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,  Quentin Schulz
 <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
In-Reply-To: <11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 27 Feb 2025 15:28:13 +0000")
References: <20250204103744.27883-1-othacehe@gnu.org>
	<11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
Date: Fri, 28 Feb 2025 10:09:58 +0100
Message-ID: <87frjysae1.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 09:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212053


Hello Richard,

> One of the reasons this has stayed as pending was this messy argument
> passing, which I appreciate is pre-existing code. I've sent a patch
> which cleans it up a bit and this patch will need rebasing on top of
> it. That should at least make things cleaner.

OK, noted. 

> I'm still a bit unsure what to do with the stripping changes this patch
> makes. One concern I worry about is having "magic" options users need
> to know to set. The other is whether there is really a binutils type
> bug underlying this and that there really should be a fix made
> somewhere else. I don't know enough about the issue to be sure whether
> there is an underlying issue though...

I think that this can be seen in a more generic way. To get a backtrace,
libunwind supports multiple methods on ARM:

--8<---------------cut here---------------start------------->8---
/* unwinding method selection support */
#define UNW_ARM_METHOD_ALL          0xFF
#define UNW_ARM_METHOD_DWARF        0x01
#define UNW_ARM_METHOD_FRAME        0x02
#define UNW_ARM_METHOD_EXIDX        0x04
#define UNW_ARM_METHOD_LR           0x08
--8<---------------cut here---------------end--------------->8---

The default one UNW_ARM_METHOD_EXIDX only supports partial backtraces,
as explained in the GCC thread[1]. Then, the UNW_ARM_METHOD_DWARF method
that provides complete backtraces operates on the ELF .debug_frame. By
always stripping that section, and offering no way of keeping this
section, we are preventing the user to use that unwinding method
altogether.

That is true for ARM but for other architectures as well. It can very be
that one might want to keep the .debug_frame around on x86_64 so that
the same unwinding method is used across all the architectures supported
for a given image.

Maybe going for the v2 approach allowing to keep any ELF section, would
feel less magical than the v1 approach that was targeting specifically
the .debug_frame section.

Finally, the .debug_frame based unwinding was a bit broken on libunwind,
it this now fixed[2], so it would be great to be able to use it in
Yocto.

Thanks,

Mathieu

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941
[2]: https://github.com/libunwind/libunwind/pull/826

