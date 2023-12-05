Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD82C10DC3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 07:49:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.95405.1701762539782428036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 23:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SIsjs5W9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 581811C0009;
	Tue,  5 Dec 2023 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701762538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oUl3/ertL95zSxAl7gkXajSLucuVfh3t9LCf1QD6SOE=;
	b=SIsjs5W9hiL6Ny8wwRY79FY+8EOaZ8A2Oa9/Zq/c4va/zUlUGgEabxg8sfjRO/bd6s/lTY
	tsx9AQ/r1S7dTCKJP0N7n8eccv3DPHGNY62659THKV7IX2DA2SzoQ90CKTYfKqEHQVVHiT
	OMXLnK95YjMBPItD3HTPMTBN8esfouti74dx8VLOyHfrKr7zpeC/p2Yo1X/NYWyl8O0mOl
	Y3aXRhlAG9rFmX2x58B1l2QqFOubXBMzwWe5ybLt6mZiai4ykk0k0Y61eYyprRFqTJZDws
	akrFUb+EDYMEPq/pnCz5Z+drz0eWTRlMZE6Mj1zsvonjWFVojn52KWgtL90fig==
Date: Tue, 5 Dec 2023 08:48:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/patch: handle creating patches for CRLF
 sources
Message-ID: <2023120507485824c14f37@mail.local>
References: <20231127134903.1327808-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127134903.1327808-1-yoann.congal@smile.fr>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 07:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191805

Hello,

This doesn't apply on master, can you rebase?

On 27/11/2023 14:49:03+0100, Yoann Congal wrote:
> Using devtool to patch CRLF based sources creates patch files which have
> mixed end of lines : LF for headers and CRLF for source context and
> modified lines.
> 
> Python open(..., newline=None) (default for newline arg)does detect
> end-of-line in this mixed file but only outputs LF EOL data. This
> result in patch files that does not apply on the original sources.
> 
> Switching to open(..., newline='') allows to detect end-of-line but keep
> the original end-of-line intact. This generate correct patches for CRLF
> based sources.
> 
> Fixes [YOCTO #15285]
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/lib/oe/patch.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index ff9afc9df9..7bf660978e 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -477,7 +477,7 @@ class GitApplyTree(PatchTree):
>                          patchlines = []
>                          outfile = None
>                          try:
> -                            with open(srcfile, 'r', encoding=encoding) as f:
> +                            with open(srcfile, 'r', encoding=encoding, newline='') as f:
>                                  for line in f:
>                                      if line.startswith(GitApplyTree.patch_line_prefix):
>                                          outfile = line.split()[-1].strip()
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191303): https://lists.openembedded.org/g/openembedded-core/message/191303
> Mute This Topic: https://lists.openembedded.org/mt/102828787/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

