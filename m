Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6A7C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 15:59:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.57344.1702223964474525816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 07:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ieiyk7VZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37A65E0003;
	Sun, 10 Dec 2023 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702223962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ob0XDKe97EBZzNUS73uE0UUH2HW0geAwmesb1AzwRNc=;
	b=Ieiyk7VZY208Bc18LCuaMT8M4sFTFfqOVrmps2KH/iWHtAmj62ZconKxM4mx1cRVdCFElh
	S7AHouydDzOM4K/CiVf0yizih2wMa9os2dKfHGbcqVI9DTw2aKwa0TaHgxudkLm4BAhju9
	rLQCEsNnfIpvpQUi4t547XiT80PsTfehf717mzmwXNsH5y4+39NhdSVzBNjp+61QDa0JJI
	SDMxZ2jE98jsgp5K3bhV4EKy05/rWFn7XmUazZBIuL2x947BPBUlKkVyB5Al74GWG08izG
	CaTpRAxZtkwxG6V8aUYE29bxvQDNZHL1OH4V15F8WEu1NnxKWI1l9XoM9WAPQA==
Date: Sun, 10 Dec 2023 16:59:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pseudo: drop syncfs probe patch
Message-ID: <20231210155921f095cd29@mail.local>
References: <20231209232710.1006536-1-alexandre.belloni@bootlin.com>
 <3d6053b7d1ab449db8882ee92496f32f52706d8b.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d6053b7d1ab449db8882ee92496f32f52706d8b.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 15:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192115

On 10/12/2023 13:19:48+0000, Richard Purdie wrote:
> On Sun, 2023-12-10 at 00:27 +0100, Alexandre Belloni via
> lists.openembedded.org wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > The patch is now upstream and SRCREV has already been bumped
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  .../pseudo/files/syncfs-probe.patch           | 44 -------------------
> >  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 -
> >  2 files changed, 45 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/pseudo/files/syncfs-probe.patch
> > 
> > diff --git a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch b/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
> > deleted file mode 100644
> > index 23f01673e3c2..000000000000
> > --- a/meta/recipes-devtools/pseudo/files/syncfs-probe.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From e38b1fec2eb4a5dcefafdab7f1a240966f3632f1 Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?=
> > - <pidge@baylibre.com>
> > -Date: Wed, 6 Dec 2023 13:00:29 +0000
> > -Subject: [PATCH] subports: Add _GNU_SOURCE
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=UTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -[YOCTO #15074]
> > -
> > -The syncfs probe in ports/unix/subports was failing if the compiler does not 
> > -support implicit function declarations. syncfs is protected and requires 
> > -_GNU_SOURCE, so the answer here is to pull it in.
> > -
> > -Signed-off-by: Eil�s 'pidge' N� Fhlannag�in <pidge@baylibre.com>
> > -
> > ----
> > -Upstream-Status: Pending
> > -
> > - ports/unix/subports | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/ports/unix/subports b/ports/unix/subports
> > -index e41b036..bd5a2f6 100755
> > ---- a/ports/unix/subports
> > -+++ b/ports/unix/subports
> > -@@ -1,11 +1,13 @@
> > - #!/bin/sh
> > - cat > dummy.c <<EOF
> > -+#define _GNU_SOURCE
> > - #include <unistd.h>
> > - int main(void) {
> > - 	syncfs(0);
> > - 	return 0;
> > - }
> > - EOF
> > -+
> > - if ${CC} -o dummy dummy.c > /dev/null 2>&1; then
> > - 	echo "unix/syncfs"
> > - fi
> > --- 
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > index 31b2d5fad20d..699cab11c668 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -2,7 +2,6 @@ require pseudo.inc
> >  
> >  SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
> >             file://0001-configure-Prune-PIE-flags.patch \
> > -           file://syncfs-probe.patch \
> >             file://glibc238.patch \
> >             file://fallback-passwd \
> >             file://fallback-group \
> 
> I think this issue is only in your branch?
> 

Yes, because I was still carrying the other patch, I realized after
sending

> Cheers,
> 
> Richard
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

