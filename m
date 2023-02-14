Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A30C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:07:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.2501.1676365618968578852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 01:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BiL0aEuJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5F9A8C0006;
	Tue, 14 Feb 2023 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676365616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uL8ggnIexVBRTzQGCuSvqJABJJP/VOhweUSxST4BJ3Y=;
	b=BiL0aEuJOmWYLG3mrk6mbokUQ1bXliqyJTkr1gB0iBAbaL+gT3fSYlyot9/6X7Lf6qmKyg
	iZ1jeuOEUvtj81mP8dMUOLYLlhO5woFzm+QXYO9bG58JissE8D/HIlQ0TXyxgXDPGKZqz9
	49d1rbvmOJZRWNvboLYUStj3vMtkHVLQNdAgOn8mv87H8pKPM3SuTt7K04/lrdMwAUhUiz
	9WvvtQVz7wDWPIjAzquitMR1qZGMJI3Avg3rGXi04txJlHyXgAZ7qIZrVvwA/XziUttuZQ
	DELAkdLJu+Fk/lX3XQvloj7FkV0S6Z+IX9gqVw7vpTz/5OQmahSpeS7bl5mX3w==
Date: Tue, 14 Feb 2023 10:06:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][master][kirkstone][PATCH] dhcpcd: fix dhcpcd start
 failure on qemuppc64
Message-ID: <Y+tPL4cPlF3Wukzk@mail.local>
References: <17425510A5DF8C5B.6713@lists.openembedded.org>
 <b125e99c-fedc-2cc8-2f72-7255b0547fe1@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b125e99c-fedc-2cc8-2f72-7255b0547fe1@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177133

On 14/02/2023 16:32:54+0800, Xiangyu Chen wrote:
> 
> On 2/10/23 10:18, Xiangyu Chen wrote:
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> > 
> > Backport patch to fix dhcpcd start failed on qemuppc64.
> 
> Friendly ping, thanks.


You sent this patch 4 days ago, over the weekend, maybe you should have
more patience. Also, you tagged that both master and kirkstone which
will not pass the usual filters as I will drop anything that is for the
stable branches.
> 
> 
> > 
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ---
> >   .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
> >   ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 +++++++++++++++++++
> >   2 files changed, 35 insertions(+)
> >   create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
> > 
> > diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> > index 5cf77fa0f6..39e689d2f6 100644
> > --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> > +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> > @@ -16,6 +16,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
> >              file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
> >              file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
> >              file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
> > +           file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
> >              file://dhcpcd.service \
> >              file://dhcpcd@.service \
> >              "
> > diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
> > new file mode 100644
> > index 0000000000..1c514f9b8c
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
> > @@ -0,0 +1,34 @@
> > +From 7a2d9767585ed2c407d4985bd2d81552034fb90a Mon Sep 17 00:00:00 2001
> > +From: CHEN Xiangyu <xiangyu.chen@aol.com>
> > +Date: Thu, 9 Feb 2023 18:41:52 +0800
> > +Subject: [PATCH] privsep-linux: fix SECCOMP_AUDIT_ARCH missing ppc64le (#181)
> > +
> > +when dhcpcd running on ppc64le platform, it would be killed by SIGSYS.
> > +
> > +Upstream-Status: Backport [7a2d9767585ed2c407d4985bd2d81552034fb90a]
> > +
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +---
> > + src/privsep-linux.c | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/privsep-linux.c b/src/privsep-linux.c
> > +index 7372d26b..6a301950 100644
> > +--- a/src/privsep-linux.c
> > ++++ b/src/privsep-linux.c
> > +@@ -232,7 +232,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
> > + #elif defined(__or1k__)
> > + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
> > + #elif defined(__powerpc64__)
> > +-#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
> > ++#  if (BYTE_ORDER == LITTLE_ENDIAN)
> > ++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64LE
> > ++#  else
> > ++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
> > ++#  endif
> > + #elif defined(__powerpc__)
> > + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC
> > + #elif defined(__riscv)
> > +--
> > +2.34.1
> > +
> > 
> > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177128): https://lists.openembedded.org/g/openembedded-core/message/177128
> Mute This Topic: https://lists.openembedded.org/mt/96868623/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

