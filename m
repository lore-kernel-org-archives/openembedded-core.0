Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08259CA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:48:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.6126.1756882121639053703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EsHWcm00;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 806C61A0DAA;
	Wed,  3 Sep 2025 06:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A447606C3;
	Wed,  3 Sep 2025 06:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADE8E1C22DA51;
	Wed,  3 Sep 2025 08:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756882118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VCra/bowtvEVBC7QAVt0uByCZy1GedL4Ed/yOEZ0lCQ=;
	b=EsHWcm00gWF39rnTFu00KfjniDfj7fhG0R9yoi3+vbTFdeAHRn+bYorQqILslDTdpnO9hW
	lroqfO6tYcZTBjWqAtQt23U6e67RjxBD9LjZ6Ag6eWNkeSDRlOH2ZBTk8EQdSQSl5ChAq3
	smS6aSrPf0mwSf49cWzUpc+Hy2nHID/SFLtXoAlZjlZQjJiO8HDDlssJNUHZZy58nDg6iB
	y8VhtP0Q/bOvLHNcCl0JNL/CbXc0H7/ztNYgEnQDY3SFLbiq4d4fTOj7PSFUngzl2u+ybL
	H12oxe+l8NBk36tfOzKm8uuDfbRARV9D6n45mTT4bGRaDg0NIuqUcGT7wtJE7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 08:48:22 +0200
Message-Id: <DCIYQ7V57RW9.1B4X57XG939RP@bootlin.com>
Subject: Re: [master][PATCH] libsdl2: Add tests package and ptest support
Cc: <alex@linutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <a-christidis@ti.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250827222051.367093-1-a-christidis@ti.com>
In-Reply-To: <20250827222051.367093-1-a-christidis@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222849

On Thu Aug 28, 2025 at 12:20 AM CEST, a-christidis wrote:
> From: Antonios Christidis <a-christidis@ti.com>
>
> The SDL2 software comes with its own set of tests. Following that
> introduce support for ptest.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---

Hi Antonios,

> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +test_array=3D("testdraw2" "testgeometry" "testsprite2" "testgles2" "test=
offscreen")

Arrays are only valid with bash, not with POSIX shell. This is failing
on the autobuilder:

AssertionError:
Failed ptests:
{'libsdl2': 'START: ptest-runner\n'
            '2025-09-03T06:28\n'
            '/usr/lib/libsdl2/ptest/run-ptest: line 3: syntax error: '
            'unexpected "("\n'
            '\n'
            'ERROR: Exit status is 2\n'
            'DURATION: 0\n'}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2215

Can you fix the syntax please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


