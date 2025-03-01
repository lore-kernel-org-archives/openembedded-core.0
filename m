Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995E8C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 09:32:06 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.5852.1740821522426131333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 01:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=f7z2trr2;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1toJCR-0002tj-S0; Sat, 01 Mar 2025 04:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=ym06DL1gPMoBuMEsv1Wa+SEfXOjy9PLO13XBChFtCgU=; b=f7z2trr2KeI2pK+UZ57R
	jvL1HL98odeIGvFmc4OuRRoyc+RbTOCJP4UeZoht8ZjtLOI3N6XhQ9gGdSyC1VS7hId4Laz3bJSk7
	qSXYwNY7yDwc1SACY6ZRnYXI0yeetG0eI1IBk6MPqJw/28P95CoitQDJbfrkhtXVgMNzPKS84QVuD
	CkjhybG/ZVzz1dL3FR6itQz06tyL2/G54/MvthMCIYixc2+USmNiKrqKFV62tBBHJw+43+xBr7m/D
	3X5UXI0BJAxbl+7F0pCoqN2AhWop5+AvKx53irMv1QidLgRMuFiJgrsbEMBLXWXX+YQrafzMgGZdm
	kZrFrLRCX1CKuQ==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,  Quentin Schulz
 <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
In-Reply-To: <0b50a9ac2a5678fd35e2ecd0be842847223a0096.camel@linuxfoundation.org>
	(Richard Purdie's message of "Fri, 28 Feb 2025 10:37:35 +0000")
References: <20250204103744.27883-1-othacehe@gnu.org>
	<11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
	<87frjysae1.fsf@gnu.org>
	<0b50a9ac2a5678fd35e2ecd0be842847223a0096.camel@linuxfoundation.org>
Date: Sat, 01 Mar 2025 10:31:50 +0100
Message-ID: <87ikotnlkp.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 09:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212091


Hello Richard,

> You're using this with minidebuginfo so does it not make sense to add
> this as one of the debug sections injected there with the rest of the
> minidebug info?

Well minidebuginfo is about having compressed symbols in an ELF section,
and keeping .debug_frame is about having unwinding material in another
ELF section. In the end both of them are needed to get human-readable
backtraces on target.

Now, keeping .debug_frame when minidebuginfo is enabled seems a bit
odd. We could only keep .debug_frame on the needed architectures (ARMv7)
and rely on the more generic .eh_frame sections that are never stripped
on other architectures (aarch64, x86_64). Yet, picking what to strip
based on whether minidebuginfo is enabled does not feel right.

Maybe, we could go for a DISTRO_FEATURE that would be even more generic,
such as "backtrace_on_target" that would enable minidebuginfo and keep
the suitable unwinding sections based on the architecture. That way,
users would have unwinding materials and symbols so that GDB, libunwind,
systemd-coredump and other backtracing tools always work on target with
a minimal overhead. People could enable "backtrace_on_target", see if
the image overhead is acceptable to them, and have backtraces without
diving into complex details.

I think it would still be needed to offer minidebuginfo and
PACKAGE_KEEP_SECTIONS so that users willing to invest more time can
decide precisely what do they want on the target in terms of symbols and
unwinding material.

What would you think about that?

Thanks,

Mathieu

