Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139E3C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 11:39:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.45254.1669376364393813070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 03:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j3aTG3ZC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 84EFB2000E;
	Fri, 25 Nov 2022 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669376361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n/FaVvdLe8K4PKKpwA9VWdg5fz5l/85khOx1/3XEIZs=;
	b=j3aTG3ZCra5hV0DAolMi2SYxpnNv78WgokND4rP/k+6quadMcI+fxiVwTavOm+7ThdlG3J
	jCQSOFl6U3eNJDkx0dFRnA/vqTc5NMK4V4XyyO27T6fKY+EsYVeJpji34O4ZkjOrgy4wmc
	o21yzVepgfTUSlfRzUJ3a/MHs8DZhWscG0XWDhVcuh3Wi0CeyHVacNUSRRV/b12HmJZJfs
	oGcfk2bULVeF5bsrmdaFCiOpfNjXAXSbCV1FrWZMwfLFqm0COqS+1204S0NhM0guZRb/nS
	gIQbZv48KL9NXlGYImX4kuEhmPLYwIFCy61KO+ycq4PDvyPfZ6K0usVhPS2iAA==
Date: Fri, 25 Nov 2022 12:39:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][master][kirkstone][PATCH] rng-tools: backport patch to
 adjust jitterentropy library to timeout/fail on long delay
Message-ID: <Y4CpaKfbn8gnQsLb@mail.local>
References: <1727B4342812AA9D.29995@lists.openembedded.org>
 <d7240f48-42f2-f16e-2fee-56a016ca7d2e@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7240f48-42f2-f16e-2fee-56a016ca7d2e@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 11:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173764

On 25/11/2022 18:08:12+0800, Xiangyu Chen wrote:
> 
> On 11/15/22 16:18, Xiangyu Chen wrote:
> > Backport patch from upstream[1] to adjust jitter to timeout on init after 5 seconds in the event it takes
> > to long to gether jitter entropy.This also fix rng-tools take full cpu usage with whole cores on ARM platforms.
> > 
> > [1] https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81
> > 
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
> 
> Friendly ping, thanks.

I believe this is the cause of this error:
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5017/steps/13/logs/stdio



> 
> 
> > ---
> >   ...ropy-library-to-timeout-fail-on-long.patch | 144 ++++++++++++++++++
> >   .../rng-tools/rng-tools_6.15.bb               |   1 +
> >   2 files changed, 145 insertions(+)
> >   create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
> > 
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
> > new file mode 100644
> > index 0000000000..d70c6587aa
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
> > @@ -0,0 +1,144 @@
> > +From 3f1d6e53985e40cbe4c7380ce503ca2778d4cd9d Mon Sep 17 00:00:00 2001
> > +From: Neil Horman <nhorman@tuxdriver.com>
> > +Date: Mon, 16 May 2022 13:38:54 -0400
> > +Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
> > +
> > +When running rngd -l its possible, on platforms that have low jitter
> > +entropy to block for long periods of time.  Adjust jitter to timeout on
> > +init after 5 seconds in the event it takes to long to gether jitter
> > +entropy
> > +
> > +Also while we're at it, I might have a build solution for the presence
> > +of internal timers.  When jitterentropy is built without internal
> > +timers, jent_notime_init is defined publically, but when it is built
> > +with timers, its declared as a static symbol, preenting resolution, so
> > +we can test to see if the function exists.  If it does we _don't_ have
> > +notime support. The logic is a bit backwards, but i think it works
> > +
> > +Upstream-Status: Backport from
> > +[https://github.com/nhorman/rng-tools/pull/171/commits/c29424f10a0dcbd18ac25607fa1c81c18a960e81]
> > +
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
> > +---
> > + configure.ac  |  6 ++---
> > + rngd_jitter.c | 61 +++++++++++++++++++++++++++++++++++++++------------
> > + 2 files changed, 50 insertions(+), 17 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 40008ca..2e12308 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -94,9 +94,9 @@ AS_IF(
> > + 		AC_SEARCH_LIBS(jent_version,jitterentropy,
> > + 				[AM_CONDITIONAL([JITTER], [true])
> > + 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
> > +-				AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
> > +-				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
> > +-				[],-lpthread)],
> > ++				AC_CHECK_LIB(jitterentropy, jent_notime_init,
> > ++				[],
> > ++				[AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
> > + 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
> > + 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
> > + )
> > +diff --git a/rngd_jitter.c b/rngd_jitter.c
> > +index d1b17ba..3647b7f 100644
> > +--- a/rngd_jitter.c
> > ++++ b/rngd_jitter.c
> > +@@ -400,6 +400,8 @@ int init_jitter_entropy_source(struct rng *ent_src)
> > + 	int entflags = 0;
> > + 	int ret;
> > + 	int core_id = 0;
> > ++	struct timespec base, now;
> > ++	int rc;
> > +
> > + 	signal(SIGUSR1, jitter_thread_exit_signal);
> > +
> > +@@ -508,6 +510,10 @@ int init_jitter_entropy_source(struct rng *ent_src)
> > + 	CPU_FREE(cpus);
> > + 	cpus = NULL;
> > +
> > ++	flags = fcntl(pipefds[0], F_GETFL, 0);
> > ++	flags |= O_NONBLOCK;
> > ++	fcntl(pipefds[0], F_SETFL, flags);
> > ++
> > + 	if (ent_src->rng_options[JITTER_OPT_USE_AES].int_val) {
> > + 		/*
> > + 		 * Temporarily disable aes so we don't try to use it during init
> > +@@ -516,32 +522,59 @@ int init_jitter_entropy_source(struct rng *ent_src)
> > + 		message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Initializing AES buffer\n");
> > + 		aes_buf = malloc(tdata[0].buf_sz);
> > + 		ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 0;
> > +-		if (xread_jitter(key, AES_BLOCK, ent_src)) {
> > +-			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling AES in JITTER source\n");
> > +-		} else if (xread_jitter(iv_buf, CHUNK_SIZE, ent_src)) {
> > +-			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling AES in JITTER source\n");
> > ++		clock_gettime(CLOCK_REALTIME, &base);
> > ++		do {
> > ++			rc = xread_jitter(key, AES_BLOCK, ent_src);
> > ++			clock_gettime(CLOCK_REALTIME, &now);
> > ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> > ++
> > ++		if (rc) {
> > ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain AES key, disabling JITTER source\n");
> > ++			close_jitter_entropy_source(ent_src);
> > ++			return 1;
> > ++		}
> > ++		do {
> > ++			rc = xread_jitter(iv_buf, CHUNK_SIZE, ent_src);
> > ++			clock_gettime(CLOCK_REALTIME, &now);
> > ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> > ++
> > ++		if (rc) {
> > ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain iv_buffer, disabling JITTER source\n");
> > ++			close_jitter_entropy_source(ent_src);
> > ++			return 1;
> > + 		} else {
> > + 			/* re-enable AES */
> > + 			ent_src->rng_options[JITTER_OPT_USE_AES].int_val = 1;
> > + 			ossl_ctx = ossl_aes_init(key, iv_buf);
> > + 		}
> > +-		xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
> > ++
> > ++		do {
> > ++			rc = xread_jitter(aes_buf, tdata[0].buf_sz, ent_src);
> > ++			clock_gettime(CLOCK_REALTIME, &now);
> > ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> > ++		if (rc) {
> > ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to obtain aes buffer, disabling JITTER source\n");
> > ++			close_jitter_entropy_source(ent_src);
> > ++			return 1;
> > ++		}
> > ++
> > + 	} else {
> > + 		/*
> > +-		 * Make sure that an entropy gathering thread has generated
> > +-		 * at least some entropy before setting O_NONBLOCK and finishing
> > +-		 * the entropy source initialization.
> > +-		 *
> > + 		 * This avoids "Entropy Generation is slow" log spamming that
> > + 		 * would otherwise happen until jent_read_entropy() has run
> > + 		 * for the first time.
> > + 		 */
> > +-		xread_jitter(&i, 1, ent_src);
> > +-	}
> > ++		do {
> > ++			rc = xread_jitter(&i, 1, ent_src);
> > ++			clock_gettime(CLOCK_REALTIME, &now);
> > ++		} while (rc && ((now.tv_sec - base.tv_sec) < 5));
> > ++		if (rc) {
> > ++			message_entsrc(ent_src,LOG_CONS|LOG_INFO, "Unable to prime jitter source, disabling JITTER source\n");
> > ++			close_jitter_entropy_source(ent_src);
> > ++			return 1;
> > ++		}
> > +
> > +-	flags = fcntl(pipefds[0], F_GETFL, 0);
> > +-	flags |= O_NONBLOCK;
> > +-	fcntl(pipefds[0], F_SETFL, flags);
> > ++	}
> > +
> > + 	message_entsrc(ent_src,LOG_DAEMON|LOG_INFO, "Enabling JITTER rng support\n");
> > + 	return 0;
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > index efc08b5e0a..c6284f0006 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
> >              file://init \
> >              file://default \
> >              file://rng-tools.service \
> > +           file://0001-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch \
> >              "
> >   SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
> > 
> > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173763): https://lists.openembedded.org/g/openembedded-core/message/173763
> Mute This Topic: https://lists.openembedded.org/mt/95039053/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

