Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C110FC7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:26:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3807.1682501169600260800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=keQ1bEFV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 29C9BE0014;
	Wed, 26 Apr 2023 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682501167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wYHzLgX4zNzIEfDncAlaFyyIeKcAzQL6HHACl9zEWI=;
	b=keQ1bEFVm2z6FSW8MfBqsRf7mN/8jxWSG1xDMFkVW9oU7ijyM5e9EL4u02UF0Kp37wy2YK
	2zR89EUV5ZcxokGhIZmKN5vU9hTl4qCI731eKeWTGhYkR5w8yI7aYz0sgazwtEMY3Bo6VG
	pK9CT51vKyCLuUVm8Rbh7/fBdQynigOr1HltEpRDsipxeOiERKvxRJjVeYTYJsIxaqAH5p
	AvlGdC/EhCa1SKy0KcQyh/blm9+/gV1eNBzdBW6fKY5QUH0P5jVyY1M+ftWZU5YuAhB/AC
	AVLteIggYmRDITkQE0WBLRKIjfNqMcFLwO+pOPP+u0qQAgUNOu8hn7tgzE6odQ==
Date: Wed, 26 Apr 2023 11:26:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "qiutt@fujitsu.com" <qiutt@fujitsu.com>,
 <openembedded-core@lists.openembedded.org>, <fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [PATCH V1] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Message-ID: <20230426112604.253bf25b@booty>
In-Reply-To: <175971C08FC40A4D.699@lists.openembedded.org>
References: <1682490667-2414-1-git-send-email-qiutt@fujitsu.com>
	<175971C08FC40A4D.699@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180416

Hi Qiu,

On Wed, 26 Apr 2023 11:23:22 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hello Qiu,
> 
> On Wed, 26 Apr 2023 14:31:07 +0800
> "qiutt@fujitsu.com" <qiutt@fujitsu.com> wrote:
> 
> > From: Qiu Tingting <qiutt@fujitsu.com>
> > 
> > When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
> > in test_script and test_one scripts, value of SRCDIR has problem.
> >   SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test
> > 
> > ptest log
> >   # ptest-runner e2fsprogs
> >   START: ptest-runner
> >   2022-12-17T11:08
> >   BEGIN: /usr/lib/e2fsprogs/ptest
> >   ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
> >   ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
> >   DURATION: 0
> >   END: /usr/lib/e2fsprogs/ptest
> >   2022-12-17T11:08
> >   STOP: ptest-runner
> >   TOTAL: 1 FAIL: 0
> > 
> > Reason
> >   In Makefile.in, SRCDIR is set by prefix and libdir.
> >     @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
> >     @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
> >   prefix=/usr
> >   libdir=/usr/lib (when usrmerge is set)
> > 
> > solution
> >   After ptest compiling, check and modify SRCDIR in test_script and test_one.
> > 
> > Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> > ---
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > index 2620610903..3219817c08 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > @@ -122,6 +122,8 @@ RDEPENDS:${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck
> >  
> >  do_compile_ptest() {
> >  	oe_runmake -C ${B}/tests
> > +	sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_one
> > +	sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_script  
> 
> There is a duplicate '-i' in each line.
> 
> Also the regex would more readable by using another spearator character,
> which would allow getting rid of the backslashes e.g.: 
> 
> sed -i 's,/usr/usr,/usr,g' -i ${B}/tests/test_one

And I forgot, this can be done in single command on both files:

sed -i 's,/usr/usr,/usr,g' \
    ${B}/tests/test_one \
    ${B}/tests/test_script 

Or maybe, in case it makes sense:

sed -i 's,/usr/usr,/usr,g' ${B}/tests/test_*

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

