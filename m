Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F68CD8C9E
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.247.1763051464338671460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 08:31:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NuQ7N7bl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9BB86C10F59;
	Thu, 13 Nov 2025 16:30:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5958D60710;
	Thu, 13 Nov 2025 16:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 086EA102F1B8F;
	Thu, 13 Nov 2025 17:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763051460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HAJnQsrJMuZjqErEG3In74OTjdQDmpxsnbzba3FndEs=;
	b=NuQ7N7blTHOCMoniDP2+7TAo3W213+VOle9WLXVIXrBnoiYt0DI0NFKcKTC/57ZPuid0Ej
	4Ib8JRsuJucpBstyJt3ixte768FdaJAoFKCgcuvA5v5kfZHxDHTEkpKh5BzqV7IcOzhyi6
	SWKO6iNJlSKt2yHmSP3YGwyaCIiwMOmkj9XGZFnzz2t+8Wu6CWcEWJBVw97AUABw3wnFxk
	7DwU2sZBPfJFlxJsHcvNIyjevX6zAktQEszotf6u1qbVMFhid265moyrNjNn8MZeAmgf28
	xPFneuoIprIU+K4IjH5nhv6ZgAqsHWsaZ7M0vp8aUE2RHUAF0OPlIfhFOMRb3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Nov 2025 17:30:59 +0100
Message-Id: <DE7PKZ44N6OD.2PE268VIQ6BX6@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] ptest-cargo.bbclass: Add support for
 CARGO_BIN_EXE_<name> environment variables
Cc: <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <andreas.stergiopoulos@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
 <20251112155730.646159-4-andreas.stergiopoulos@smile.fr>
In-Reply-To: <20251112155730.646159-4-andreas.stergiopoulos@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 16:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226252

On Wed Nov 12, 2025 at 4:57 PM CET, Andreas Stergiopoulos via lists.openemb=
edded.org wrote:
> This commit takes the installation paths collected during package install=
ation and
> sets them up as environment variables in the run-ptest script. This is ne=
cessary as
> the integration tests require the executable binary to run successfully.
>
> The paths collected are not those of the artifacts created during cargo t=
est, but the
> paths where the artifacts in the system. The intention for this choice wa=
s to ensure
> that the tested binaries are those who are actually executed by the user =
and vice
> versa.
>
> Env has been used instead of export, as export explicitly does not suppor=
t dashes "-"
> when setting up environment variables. The execution environment is set u=
p inside the
> function exec_in_env. For every binary executable artifact collected, one=
 environment
> variable is added irregardles of whether it is needed or not.
>
> Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
> ---

Hi Andreas,

Thanks for your patch.

It looks like this is breaking some ptests:

AssertionError:
Failed ptests:
{'rpm-sequoia': ['/usr/lib/rpm-sequoia/ptest/symbols-4b3369365cdc8879']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2612
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/732

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20251113-72/testresults/qemux86-6=
4-ptest/core-image-ptest-rpm-sequoia/
https://valkyrie.yocto.io/pub/non-release/20251113-72/testresults/qemuriscv=
64-ptest/core-image-ptest-rpm-sequoia/

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


