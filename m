Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20325.1793111998096274881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 07:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k244ouv0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8CD5EC79AB4;
	Tue, 27 Oct 2026 14:40:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 067BD603BD;
	Tue, 27 Oct 2026 14:39:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB89E10329093;
	Tue, 27 Oct 2026 15:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793111991; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5upKtZ7gmq5UpQIsWkpkMJmWgo6zR8kkCPtL1fMmr8M=;
	b=k244ouv0jcGmevjfoQaA8MZ1rSPYMIxm/93QT1k2Ff2wkHuKpiwpJO+TKoAHvnO3AVv0J0
	4jyK9NBGLU9tSEVdwCChZQ250QCEnmDIZcmZRHZtBNE4pnBZKM87Xdl6JY/iE5/YbDcvMM
	KsS35O8yUJvbeMe/wH/KqA/bO+SDl90zduxRuJvCaAiXt3IT225X8f77RA3ALxH15c0uDR
	8BhM9ADsNES2L69iZz3p/34dVmpHq8n57Ub4WlexEOoHdoBop4KG2NbFniA2BbI5oHuGuW
	qXp9jkKN6RimbnRjKe6vXT+VIGvxYbZlK9i/+Cj6nPunopggxnM27sqQtA6U6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 15:39:50 +0100
Message-Id: <DMFP5GHG44I1.34QV0THODLF26@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v5 0/6] Implement SPDX for deploy tasks
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 14:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248751

On Mon Oct 26, 2026 at 10:45 PM CET, Joshua Watt via lists.openembedded.org=
 wrote:
> he SPDX use case for file system image has been well defined since SPDX
> was first implemented, however there has always been a desire to also
> express SPDX output for other non-image deliverables (primarily, those
> that have a do_deploy task or similar). These types of tasks cannot
> easily use the traditional method of having a separate SPDX task that
> runs to create their SPDX output as this causes lots of problems with
> the way dependencies are specified. Instead, it is desirable for these
> tasks to directly produce SPDX output that can be consumed by other
> tasks that depend on them.
>
> This patch series adds support for this. Any sstate task that starts
> with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> will run a postfunc to generate SPDX output that describes what is being
> deployed. For classical do_deploy tasks, this is setup to be easy by
> automatically capturing all the deployed output files in the SPDX data,
> but other tasks can be added as well.
>
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
>

Hi Joshua,

Thanks for the new version.

I believe this is the source of this warning:

WARNING: core-image-full-cmdline-1.0-r0 do_create_image_sbom_spdx: The foll=
owing SPDX IDs were unable to be resolved:
  http://spdxdocs.org/openembedded-alias/by-doc-hash/6e0461f8d0ebcd6cab741f=
f4175cb1256279c1657d809f71c257fb2a0991e7ca/eudev/UNIHASH/package/eudev

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4908

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

