Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFE3C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 07:35:11 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.7455.1741246510548413459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 23:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=I9HlzHgQ;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tq5l4-0003fU-NG; Thu, 06 Mar 2025 02:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=rIHLiEh+B1/n/SYnQshiiytDyYP0HGnAAdmK0ylWncw=; b=I9HlzHgQ9XqxYglb8suW
	Tc1gsmnAsbI9V+aHUYp4Weww+PhHdA/wEclZJqXubA5po1zHBcRNpbZoWbsm1FOHV7c/gc9hv/4KV
	bPGgglyAMUYlINgTiIDTVkkEKXgFvvcMjcC2qTePUn2XRPcvR2HQUEtPo3LVPlPaHnxbeJlC5Ilk2
	USyo95kEgLZYpFL0Yw2rYuaXnEcZp+MS0162TcnMh1rPZlhTzDV7rVCJ4+YIR+KIaoFKZ15yxhcH+
	nmCjaGunM1rE2EafgSwXQoSrI2SXCielUeeYI6R7YGUdAksXezhjzItStbaaOjhlOIl66+YKE4U+s
	+bK2XnRtmtjRxw==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,  Quentin Schulz
 <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
In-Reply-To: <0a146fbccc15be5f79f2cfdf668da2fdf5ad400e.camel@linuxfoundation.org>
	(Richard Purdie's message of "Sat, 01 Mar 2025 09:57:48 +0000")
References: <20250204103744.27883-1-othacehe@gnu.org>
	<11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
	<87frjysae1.fsf@gnu.org>
	<0b50a9ac2a5678fd35e2ecd0be842847223a0096.camel@linuxfoundation.org>
	<87ikotnlkp.fsf@gnu.org>
	<0a146fbccc15be5f79f2cfdf668da2fdf5ad400e.camel@linuxfoundation.org>
Date: Thu, 06 Mar 2025 08:34:52 +0100
Message-ID: <8734fq8vdv.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 07:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212371


Hello Richard,

> I think the name has been misleading me as I imagined minidebuginfo as
> a small subset of the main debug information rather than just the
> symbols. You're saying it is just the symbols and there is no way to
> extend the compressed information?

The minidebuginfo symbols are stored in:

--8<---------------cut here---------------start------------->8---
  subprocess.check_call([objcopy, '--add-section', '.gnu_debugdata={}.xz'.format(minidebugfile), file])
--8<---------------cut here---------------end--------------->8---

the .gnu_debugdata ELF section. That's a convention and some tools out
there (GDB, libunwind) will search for symbols in that specific section.

> OE is about choice but I'm still thinking that if someone enables
> minidebuginfo, they are most likely expecting stack traces to work as
> otherwise the extra symbol information isn't much use. Am is missing
> some key usage?

Another usage would be to debug a live program on target with GDB. You
need the symbols but not necessarily the unwind information to do that I
guess.

> If PACKAGE_KEEP_SECTIONS worked well for all targets, I think I'd be
> happier to consider it but the problem is that it is all very
> architecture dependent :(

Would it be OK if I send a v3 that re-introduces
PACKAGE_KEEP_DEBUG_FRAME, and enables that one if minidebuginfo is
enabled and the target architecture is ARM?

Thanks,

Mathieu

