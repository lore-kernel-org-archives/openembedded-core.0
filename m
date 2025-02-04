Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB8C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:25:28 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.117565.1738679121208406008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 06:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=QPFkXSqy;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfJra-0006CT-Nv; Tue, 04 Feb 2025 09:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=sGRTU2sVn+fVO4wZp3DzdV9hYJXbVL1aShZZjGs+8kI=; b=QPFkXSqywZ/aSnQiXCdm
	feg11nmZcN1lMbjp3WpMNTn029JfiaB9QjK4OerEF4ma5P0wwlcONR9CoR4xuF/bwTelYxg+r+cRA
	gz/loIOYGx4VyOz9+SpXsgWI52P6kr3TxEjmYQZeoVaT91CZ5fKr4ID1pjKXvEvrmpCfUiMr4m2tJ
	ui1TixcVDIYNhK1WT+t0Kb5JIliES3t1UWWAWkz3+Ygqm3hWT9GIiH4QvERWGakEsx0TSHW9WrkgT
	ijZQJTO2HHRQghzh6Rra1Ze+Xx25xdBc8of7JOkmAnLsfhns4ytr21lI9jKtnyTL0c6Zhnrab6bEK
	YOSc/e6YpXUeZA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,  Quentin Schulz
 <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
In-Reply-To: <CANNYZj9tjKN_Evr3KR7mNDMABXAgbLoCFL=EnoQviXa4+Mg7Kw@mail.gmail.com>
	(Alexander Kanavin's message of "Tue, 4 Feb 2025 13:50:02 +0100")
References: <20250204103744.27883-1-othacehe@gnu.org>
	<CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
	<87y0ylga3d.fsf@gnu.org>
	<CANNYZj9tjKN_Evr3KR7mNDMABXAgbLoCFL=EnoQviXa4+Mg7Kw@mail.gmail.com>
Date: Tue, 04 Feb 2025 15:25:26 +0100
Message-ID: <87tt99g52h.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210808


> Thanks. But you still need to look at existing minidebuginfo tests and
> see if you can enhance them. Otherwise we have a variable that isn't
> tested.

OK, I will check want I can do.

> Also, if minidebuginfo distro feature is enabled, do we actually need
> this level of control? Why not just always have the needed bits?

On some architectures, such as x86_64 and aarch64, the .eh_frame section
that is *not* stripped because used for C++ exception handling, can be
used for DWARF-based stack unwinding purposes.

On those architectures, one can rely on .eh_frame + minidebuginfo to get
DWARF based backtraces. So no need for the PACKAGE_KEEP_SECTIONS there.

However, on ARMv7, the .eh_frame section is empty and the ARM specific .exidx
section is not enough to get full backtraces, as discussed here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941

For that specific architecture, it then makes sense to instruct 'strip'
to leave the .debug_frame section. By setting for instance:

PACKAGE_KEEP_SECTIONS:armv7a = ".debug_frame"

So minidebuginfo and PACKAGE_KEEP_SECTIONS are two very different
things, serving different purposes. Even though the combination of both
is required on some architectures to get full backtraces, I don't think
that they should be tied together.

> You can split into at least four commits:
>
> - change of runstrip signature
> - change of strip_execs signature
> - adding new variable to package.py
> - adding new variable to staging class.

OK, thanks for the suggestion.

Mathieu

