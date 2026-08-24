Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8567CC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:57:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.956.1787587044439923357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b5hKdjBy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BD101A17F0
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:57:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED0035FFC1;
	Mon, 24 Aug 2026 15:57:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F4C011C79837;
	Mon, 24 Aug 2026 17:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787587041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OV08yezYH+l6qOdhfH+dBihil5higyf5poZZFOlyNu4=;
	b=b5hKdjByIQ5BOPi7HYLjxQ9lGHYtJMd+CqhMK7lWDKz0usYzelkk69Tw8TsKGGc1thnCbC
	KFTaZ6leTc/t0jBUzizlJK2bLhR05Yp2QLePvRbIfI8yugvRZZT4r5Th5OcbTLNuammJoO
	nRT591QuUA5XaFQJDxrBvJIwxM0v/Lg4sQB+sUMNoRbxyQuspPBTPPPqV/11YoAIJIt4KT
	KwRlJdijiqZbPjdEu4/5+R07tyFoOtDE7l6KqIgUnPnSYj4aZfxFIKadWBcnFrqCt4Nx0w
	GC7urIA/kJdLacmFZ2ra5VIDIcdR5aOe1fU34ixusdt5vIgLhGajwts8WDffXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 17:57:19 +0200
Message-Id: <DKXAPX8BD7XU.12S6DHGQRE540@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] expat: fix CVE-2026-50219
Cc: "yoann.congal@smile.fr" <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jakub.szczudlo@nokia.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260824151448.19118-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260824151448.19118-1-jakub.szczudlo@nokia.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244136

On Mon Aug 24, 2026 at 5:15 PM CEST, Jakub Szczudlo (Nokia) via lists.opene=
mbedded.org wrote:
> Expat does not track whether its public parser APIs are called from insid=
e
> a user handler. Re-entering the parser through XML_GetBuffer(),
> XML_Parse(), XML_ParseBuffer(), XML_ParserFree() or XML_ParserReset() can
> therefore result in use-after-free and memory corruption.
> The 32 upstream commits are divided as follows:
> * 01 introduces the handler call depth counter and the helper functions
>   used to enter, leave and detect handler execution.
> * 02-04 are preparation patches. They extract handler calls from compound
>   expressions so that depth tracking can be placed before and after each
>   invocation without changing handler return-value semantics.
> * 05-26 instrument the individual handler types. Each patch covers a
>   distinct callback path; omitting one would leave a route around the
>   API guards.
> * 27-31 add the actual policy enforcement to XML_GetBuffer(), XML_Parse()=
,
>   XML_ParseBuffer(), XML_ParserFree() and XML_ParserReset().
> * 32 adds regression coverage for all five rejected calls.
> Documentation and Changes-file commits from the upstream
> series are dropped because they do not affect the fix or its test
> coverage.
> An explicit XML_Parser cast is added to the regression-test handler
> because handlers.c is also included by handlers_cxx.cpp and compiled as
> C++ in the OE build.
> Upstream pull request:
> https://github.com/libexpat/libexpat/pull/1246
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---

Hi Jakub,

I suspect this is targeting the wrynose branch. In this case, it is
missing the [wrynose] tag.

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#sub=
mitting-changes-to-stable-release-branches

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


