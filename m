Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44027C77B6F
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 09:41:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.5203.1681465275170761158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 02:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=byYf5otM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B14F6C0006;
	Fri, 14 Apr 2023 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681465273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3IbTFYTezUwCQZh4OqHwFEe0E4kwStcpUeGvmVJoGlQ=;
	b=byYf5otMN1XS8iFfUqw/vOKvCCIePXXfmfVz2ynG54ITFXUb5TrynDxhgKd1RLlINKVx11
	7OtHVaepMpuhUBEK7rD4nNeZU5i48gG9mp+7oAvunqT24ABQodQ+uZn3OLk0rOwr2M4mKo
	Rn6nk2c7zi8Q5i3WwEBwyme2FRUXWGhIbyiu/jLXA9+QBA/OloimTqLdd89JufEGvAlPOg
	9TWTKgOOFgtAgbm2ixbsugmgAVdhd+lI+zXNcEvi9XxiWCgUnPtPw79Yrf7EpR9e1nxlbS
	BRgSTWEcwwIh+nSH4fj/D6TSA5mopyPSqsagCl7GGsnO3Z0TUmBemZPsheaOXQ==
Date: Fri, 14 Apr 2023 11:41:11 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>,
 <fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
Message-ID: <20230414114111.07f9ffdb@booty>
In-Reply-To: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
References: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 09:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179995

Hello Qiu,

On Fri, 14 Apr 2023 16:53:20 +0800
"qiutt@fujitsu.com" <qiutt@fujitsu.com> wrote:

> From: Qiu Tingting <qiutt@fujitsu.com>
> 
> If gcc is installed in image, ptest result has 4 ERROR.
>   ERROR: tests/rm/r-root.sh
>   ERROR: tests/rm/rm-readdir-fail.sh
>   ERROR: tests/cp/nfs-removal-race.sh
>   ERROR: tests/ls/getxattr-speedup.sh
> 
> r-root.log as an example:
>   --------------------------
>   k.c:1:10: fatal error: stdio.h: No such file or directory
>       1 | #include <stdio.h>
>         |          ^~~~~~~~~
>   compilation terminated.
>   r-root.sh: set-up failure: failed to build shared library
>   ERROR tests/rm/r-root.sh (exit status: 99)
>   --------------------------
> 
> reason:
>   In these cases, k.c file is created and compiled by gcc before run.
>   There is a stdio.h file in /usr/include/ directory,
>   but gcc parameter is not set it.
> 
> solution:
>   Add "-l /usr/include/" in gcc parameter.

Why "-l"? Shouldn't it be "-I"?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

