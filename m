Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AF3C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:49:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.32375.1661266187630511209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GnLzLaLf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7468DC000E;
	Tue, 23 Aug 2022 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661266186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE7/LZDayc/l5NHiA2zz1kLN+8Deej5e0yglReCy3DA=;
	b=GnLzLaLfr/dE69Wf7FXvh0YEWN82l0COuefKYTw37SzJIxEcMNK1xpiHBPqQ+ZW2q1RSli
	Dzqzu7vi0P5HWwUe2k+FslAYYJhidkCitgWeJ8ZgxHGnGA+K1bzZQSCTUKbcGnKz7Xv2FQ
	2wwjFncIxK/kmNcTelqXd3v06BbDXm21pxj/Zlt7PkVrJAa63wWC5CdlQX7dgDo0kIL6YH
	K9tcwVSJXpa9Nh7Mz/oYXBSfUM8TFO24GekxY/uKSurZhwdW7DSrcF21bWqcal4ac/biU8
	MeWETLvguSwZxyGfYOrHquaKoIS+gs0Hoqz0lXVGEYxnHEu5wT+lHfDybiYLxg==
Date: Tue, 23 Aug 2022 16:49:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to 12.2.0
Message-ID: <20220823164944.774719d2@booty>
In-Reply-To: <20220820163903.3462152-1-raj.khem@gmail.com>
References: <20220820163903.3462152-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:49:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169712

Hi Khem,

On Sat, 20 Aug 2022 09:39:03 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> GCC 12.2 is the first bug-fix release from the GCC 12 branch containing
> important fixes for regressions and serious bugs in GCC 12.1 with more
> than 71 bugs fixed since the previous release comprising of  a number
> of libstdc++ and C++ and fortran fixes [1]
> 
> Remove backported patch to fix libsanitizers with glibc 2.36, its
> already present in 12.2
> 
> [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.2
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Building with this patch I had a ccache compile failure on musl builds:

  error: 'time_t' has not been declared
  error: no declaration matches 'std::string core::Statistics::format_human_readable(const Config&, time_t, uint8_t, bool) const'

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5735/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5752/steps/11/logs/stdio

They disappeared after removing this patch and rebuilding.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

