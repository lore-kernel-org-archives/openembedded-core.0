Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C55C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:56:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.47764.1683201369258322225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZiVIJqMB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8EFCB1BF205;
	Thu,  4 May 2023 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683201366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4OWV9xqyLSf9tV94XNSQCW6h/j6qAC91gRTlMEz3QLI=;
	b=ZiVIJqMBVVAzKix4zYr++3viQMUPOWspWvC25aOVBUHCftbGGKb9eBgsQz1vnKtSv8MGsy
	N94gFYWYmUaL8wwReg+dyckgcwj+dw5ZLjcIClX5bkgY8ceFNYcJPlxKb9t1D+loT2l75P
	UdGz+6i6Kc9//5GO6liN7GjVD6gUvwzZHdW8ADhakMXA6V6Xlo7tvH9oXsQQRpmQEGNNqH
	zrk84oi2oE4TqJkJVw+iDDO15mwJGpsPzKou/1wQm/vCytxCfO7VW+LjUUvr9oy06anZly
	kKCKnlURv6JGcpi+8wrW4oYs0A7ewStcPPCK5c0XTameJIifFzRBo6z8+KWylw==
Date: Thu, 4 May 2023 13:56:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V2] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Message-ID: <202305041156063b4bf3fa@mail.local>
References: <Wnqs.1682583778394705301.Jj4z@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Wnqs.1682583778394705301.Jj4z@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180868

Hello,

I applied it to be able to test, however, your mailer is mangling your
patches and they don't apply without heavily modifying them.

On 27/04/2023 01:22:58-0700, qiutt@fujitsu.com wrote:
> From 3b1c081d4efffe83f3a63184450cc79bf16356dc Mon Sep 17 00:00:00 2001
> From: Qiu Tingting <qiutt@fujitsu.com>
> Date: Thu, 27 Apr 2023 15:24:35 +0800
> Subject: [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
> 
> When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
> in test_script and test_one scripts, value of SRCDIR has problem.
> SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test
> 
> ptest log
> # ptest-runner e2fsprogs
> START: ptest-runner
> 2022-12-17T11:08
> BEGIN: /usr/lib/e2fsprogs/ptest
> ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
> ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
> DURATION: 0
> END: /usr/lib/e2fsprogs/ptest
> 2022-12-17T11:08
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> 
> Reason
> In Makefile.in, SRCDIR is set by prefix and libdir.
> @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
> @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
> prefix=/usr
> libdir=/usr/lib (when usrmerge is set)
> 
> solution
> After ptest compiling, check and modify SRCDIR in test_script and test_one.
> 
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
> meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> index 2620610903..a2eb4f8f8f 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> @@ -122,6 +122,9 @@ RDEPENDS:${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck
> 
> do_compile_ptest() {
> oe_runmake -C ${B}/tests

All the whitespaces are missing fro the beginning of those two lines

> +� � � �sed -i 's,/usr/usr,/usr,g' \
> +� � � � � �${B}/tests/test_one \
> +� � � � � �${B}/tests/test_script
> }
> 
> do_install_ptest() {
> --
> 2.25.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180486): https://lists.openembedded.org/g/openembedded-core/message/180486
> Mute This Topic: https://lists.openembedded.org/mt/98532823/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

