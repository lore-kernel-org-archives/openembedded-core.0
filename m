Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181EBCAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 07:21:02 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.web11.6674.1757402458192648016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 00:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id DBE3A5F870;
	Tue,  9 Sep 2025 09:20:55 +0200 (CEST)
Message-ID: <f8931972861e6e5b46ffd29126ee36a2fa0e43f6.camel@emlix.com>
Subject: Re: [OE-core] [PATCH] buildtools-tarball: handle missing host
 pkg-config gracefully
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Sep 2025 09:20:55 +0200
In-Reply-To: <CANNYZj_GhJpNrtJjotmv9hvqTbfzS5CtGnOJzx4tBKyTqG6UTQ@mail.gmail.com>
References: <20250908135933.889249-2-dwagenknecht@emlix.com>
	 <CANNYZj_GhJpNrtJjotmv9hvqTbfzS5CtGnOJzx4tBKyTqG6UTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223090

Hello Alex,

On Tue, 2025-09-09 at 09:13 +0200, Alexander Kanavin wrote:
> It is not clear from this change and the commit message if
> HOST_PKG_PATH is actually expected to contain useful values somewhere
> else. It needs additional research, particularly to reassure
> reviewers that an empty value would not cause problems.
I can reassure you that it won't cause issues, due to the same script
using it with a fallback default value and then unsetting it:
```
HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_path pkg-config 2>/=
dev/null)
export PKG_CONFIG_LIBDIR=3D[--snip--]:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/=
usr/share/pkgconfig}
unset HOST_PKG_PATH
```

But I'll send a v2 which adresses this directly in the commit message.

Sincerely
Daniel

