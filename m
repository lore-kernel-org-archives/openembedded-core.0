Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1521.1793207197531382744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 10:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xL0xyKPK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 43F184E41359
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 17:06:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B38D60769;
	Wed, 28 Oct 2026 17:06:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3FA9103290E9;
	Wed, 28 Oct 2026 18:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793207190; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jkTxL1eXTM+cNCPyAoH58IyuoWl9sQr1plATquIxdPw=;
	b=xL0xyKPKNbdpitTK5qbyUx0rS7U15MziyqmzU7Mf9WnXFhKUVYOJDm0jzO0oXHQ+P+Vr4I
	HD7de1YDOdO79qPbDVPwki4hztmq+XRx5cXREGZx83XhFVZziXCEmCJwDhzUDfujPyR5jV
	Id4dIN5TlRmaJqjIQcfyzjH2uE6I5Tz2RwcJphoMC+p+SAAvdP+ip752Pv8rUf+kYOxpfJ
	pVZpBUmqN7+uIeQ80o1RwcdK2LCl5Y0UhhnnQbblWvfjkv7YfxVULITKxmOpvZBiMx8H+T
	rQrQEul915as7slQKx0/wPiaavA4aC7JIi3GC4NyWN1ObBpSYePMi6NKUzRrAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 18:06:29 +0100
Message-Id: <DMGMWA7MWN01.208IRBNAKUKDJ@bootlin.com>
Subject: Re: [OE-core][PATCH v6 0/7] Implement SPDX for deploy tasks
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 17:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248824

On Tue Oct 27, 2026 at 11:47 PM CET, Joshua Watt via lists.openembedded.org=
 wrote:
> The SPDX use case for file system image has been well defined since SPDX
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

It looks like the last fix broke something:

ERROR: ovmf-native-edk2-stable202605-r0 do_deploy: No deployed artifacts fo=
und in /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x=
86_64-linux/ovmf-native/edk2-stable202605/deploy-ovmf-native

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4759
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4914
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4934
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5144

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

