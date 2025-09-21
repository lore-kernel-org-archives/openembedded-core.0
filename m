Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B793CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 06:30:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.24439.1758436237260696868
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Sep 2025 23:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UWxz2hKu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 642721A0F38;
	Sun, 21 Sep 2025 06:30:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F68A60634;
	Sun, 21 Sep 2025 06:30:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A990102F16A2;
	Sun, 21 Sep 2025 08:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758436234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AwC7zyAo7/1nfBlOrL9HC0LcG8xPH3yVcGm4u13EH/Y=;
	b=UWxz2hKuTCsghWtKeNhhr3lgnc3o1r8oKt5OHdNNh+R++tX9E1eaJqSwbWsfVG1ZHRhDB+
	oh4U6rPHQ/Syf/HG9+9ccwFeXK3Q+k/g0WnTeKq06tDdCsxsy1i2yvseqCJdApi3qh6q/M
	2EOTL5ZFv7RIRUNc6IuqzFbKrg0fSyNLzi2psK2xdz26Gqy7gib+hXpjbKeKhlmKCozFaU
	SbCmvhggjSbwa9cyDSvwBFTC0fyWUM0LKoatW1TIqhqk+klIXV8Vbcz/YkdH8HPWJp0g+Z
	O2aADzsUhEPRdPbqDFWV9+c1J222cuG8qxHHMDDhgHKAEoeuO5x/ADkYVbkGLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 08:30:25 +0200
Message-Id: <DCY9M9Y1UU2T.149Q1AZYDJVXG@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, "Bruce Ashfield"
 <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] debug_build.inc: collect debug build
 tuning configuration
Cc: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
 <20250916040927.103722-4-hongxu.jia@windriver.com>
 <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
In-Reply-To: <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 06:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223786

On Wed Sep 17, 2025 at 1:24 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue Sep 16, 2025 at 6:09 AM CEST, hongxu via lists.openembedded.org wr=
ote:
>> The modern compilers and code seem to require extra steps to avoid DEBUG=
 errors,
>> Move debug tuning configuration from recipes to an include file to addre=
ss these
>> errors.
>>
>> Introduce separate variables to avoid the :remove operations, such DEBUG=
_OPTLEVEL,
>> BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS
>>
>> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>
> Just a note about this patches: I had perf reproducibility issues [1][2]
> after taking this series and I believe this is linked with this patch. I
> suspect this is not directly related with it, but more with the issue we
> have had with perf reproducibility last week.
>
> So I dropped this patch for now, but I will take it a bit later this
> week and try to go further. I still wanted to provide some feedback
> here. Also, if anyone believes this issue IS related with this series,
> please share your thoughts.
>
> [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/25=
05
> [2] http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss7=
2vce/
>

OK, I took again the series, and now the issue is gone. So clearly the
AB-INT is still present.

Bruce, I've been told you are the one to contact here. Do you have any
opinion on this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


