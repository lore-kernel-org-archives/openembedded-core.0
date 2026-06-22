Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15143CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 05:12:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36474.1782105134295417947
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IxhDoW9p;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DE16FC62203;
	Mon, 22 Jun 2026 05:12:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C978A601BB;
	Mon, 22 Jun 2026 05:12:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 109B2106C8961;
	Mon, 22 Jun 2026 07:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782105131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zk7nsIeBTaWt6pIDtT8sUME+GoQwr1t62iVGKI7Hh0w=;
	b=IxhDoW9pq8DGstuoyJkFOe313K7ffR1+bdxYseX0Hp9wTKcCo5fFbylAn+eQY84asMKuXa
	MdVUJdBa/0pJ6yWrzo9PIZo0lCBi3MqmpQDujsYL0/pnJIzMG2tNpSUZW7Nt9Alyyll07x
	HKXCaNWnzVjUPqLA5DCdxezt1tlSJlEhiqg6HEzYxdPMuGAQ7ZdLQHQRDV8eANn7VydhWn
	DtHtqzOhTcXBZhttJiBvmRUyMX2NKt0aZwVade//tG0LcUL0Leasg+JyMsKrXJ6TJNDoJD
	P6a4qrskK4KS0avs5Dw6FhFOyRl69Y8qNJZFlBrLArqjniKbh+HUxDBeRiVXOA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 07:12:09 +0200
Message-Id: <DJFBJM77757J.O3XZ0R6YJD4H@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 06/15] systemtap: upgrade 5.4 -> 5.5
Cc: "Alexander Kanavin" <alex@linutronix.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
 <20260619083305.3505156-6-alex.kanavin@gmail.com>
In-Reply-To: <20260619083305.3505156-6-alex.kanavin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 05:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239266

On Fri Jun 19, 2026 at 10:32 AM CEST, Alexander Kanavin via lists.openembed=
ded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

Hi Alex,

Thanks for the upgrade.

It looks like we got some reproducibility issue with this one:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/systemtap-locale-pl_5.5-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/systemtap-locale-pl_5.5-r0_x86-64-v3.ipk

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4217
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4219
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4220

It looks like systemtap.mo is a bit bigger:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260621-447krk67/=
packages/diff-html/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


