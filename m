Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B854EC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:36:57 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.115418.1738672617048650101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=h6AISSWY;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfIAg-0006pJ-8T; Tue, 04 Feb 2025 07:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=4e6V0FvjBnmJkWpec/6uk5DO4RJqxnn41dtS9nCyMxM=; b=h6AISSWYPtLsrR8IdnEd
	wXx03U4BTPGZA4Ecj5Wt73Iss1yJiceAJJH2wDBHojkiBr18tsTdjXKgTmYavU6RltnqS+dr5+cHC
	UrjU3+0JzvCn4DJMMrwa+SPgTlZn1M2cqjglfyyRoCK4/KC+MA5iSY99tViDc6reWEDkVdKt+nLlh
	szitonhTN3Hpvz7Y4W8SFBvDoOuUaUFiCgvzyAp+dgmHN0IXXg54MlgDtyJ5TKpAm9EtTEqpJISVo
	Ty9s4OsOHFdLct5EThtkAI0QRPds6gMD0njHigHwXLOm2546GgQr7jnRFliGfB1awN2LxyeX37qNv
	lgX8ZfqMIqk7ZA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,  Quentin Schulz
 <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
In-Reply-To: <CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
	(Alexander Kanavin's message of "Tue, 4 Feb 2025 12:37:15 +0100")
References: <20250204103744.27883-1-othacehe@gnu.org>
	<CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
Date: Tue, 04 Feb 2025 13:36:54 +0100
Message-ID: <87y0ylga3d.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210780


Hello Alexander,

> I don't understand. We already have support and tests for
> minidebuginfo, so what additional functionality would the above
> setting enable? Can you adjust the existing tests to showcase that?

When you want to display a backtrace on target you need basically two
things:

1. Symbols
2. Unwind information

The minidebuginfo functionality is covering the first part. It is
providing some symbols in a compressed way, that get appended to every
binary/library at build time.

Then the second part is about how to unwind the stack. That is
architecture dependant. On ARMv7, GCC is producing unwind information in
the .debug_frame section. That section is always removed by
'strip'. It prevents any unwinding based on .debug_frame on the target.

In the first version of that patch[1], I was proposing to introduce a
variable called PACKAGE_KEEP_DEBUG_FRAME to instruct `strip` to keep the
.debug_frame section around.

Quentin, pointed out, that we could be more generic and offer a
PACKAGE_KEEP_SECTIONS variable instead, to prevent specific sections
from being stripped.

That's what is done in this v2. I have proposed a documentation update
here: https://lists.yoctoproject.org/g/docs/message/6243

> Also the patch is changing things all over the place, and so is
> difficult to review. Can you split it up? E.g. first add some new
> thing, then adjust code elsewhere to take it into use.

It is only modifying the run_strip function and its callers, so "all over
the place" seems like an overstatement. I am not really sure how to
break that into more pieces. It's just about instructing "strip" to keep
some sections that are specified in the PACKAGE_KEEP_SECTIONS variable.

I would be glad to bring some more details on the topic if needed.

Thanks,

Mathieu

