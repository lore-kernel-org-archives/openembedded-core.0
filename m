Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA75EBFD16
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 08:13:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.267485.1776068012476920205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 01:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YtIxtaaD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 612AE1A3193;
	Mon, 13 Apr 2026 08:13:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2FFEB5FFB9;
	Mon, 13 Apr 2026 08:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D357610450096;
	Mon, 13 Apr 2026 10:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776068009; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1+t6kKB21gFN+w9m+8NngiHJLnv29NBpV/CLTLyr+vk=;
	b=YtIxtaaDuOV3Zqhbu0r5c8t4YrdxuYZwX2GK9e7rjdL/HKBVWLTb1d91k1I3JFGeNBD8MG
	MYMKK1HKGlidVNb/voTTHsaSVi1fLyuDs7oRsp17jws94kPTU1Bswq46G0q1LY7GCRweij
	0aDbvjkCCzpaf7LEamOHdP//A9TKaoDCoaXJZ7XBCEqw/DxXSf8oPpuZfiFBT1cqQMertn
	0MWSO5lEFxEsdtFifWKmplDAlx3gjTG6CBmNOUVGIbZhHpWPsYXHX8rMs8V3h9cofBHc1j
	Q5NsvyaPFztXPnyQm2UbBKRuUO00Ut/YSDizIgDwmgslFA8yryHJ1NA18u3dlQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 10:13:27 +0200
Message-Id: <DHRVKB1I9SSR.H8CA4RX6216U@bootlin.com>
Subject: Re: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260409014036.1519-1-wangmy@fujitsu.com>
 <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
 <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com> <DHRA8X87GXTM.1KH04ZIZ4R6N1@bootlin.com> <TYYPR01MB134193382D763659A25739F43DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB134193382D763659A25739F43DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 08:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235090

On Mon Apr 13, 2026 at 9:13 AM CEST, wangmy via lists.openembedded.org wrot=
e:
> Thank you for running the tests. However, looking at the build log for bu=
ild #3471, I noticed that the sstate summary shows:
>
>   Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 440
>
> This indicates that only 5 tasks were actually rebuilt, and lttng-ust was=
 most likely served from the sstate cache rather than rebuilt with the patc=
h applied. The failure output is also identical to build #3450 (before the =
patch), which further confirms that the updated lttng-ust package was not u=
sed during testing.
>
> Could you please invalidate the lttng-ust sstate cache and trigger a clea=
n rebuild before re-running the ptest image? I believe the patch is correct=
 and the test should pass once lttng-ust is rebuilt from scratch.
>
> These ptests all pass in my qemuarm64 and qemux86-64 environments.
>
> Thanks,
>

Hi Wang,

No sorry, I can't do that on the autobuilder. If we need to invalidate
the cache, we will probably have to increase the PR value of the recipe.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


