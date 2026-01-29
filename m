Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2741D61006
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:18:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12610.1769685483193966883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vRpcm0TO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F2CB1A2AFE
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:18:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35344606B6;
	Thu, 29 Jan 2026 11:18:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 258A6119A868D;
	Thu, 29 Jan 2026 12:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769685480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g5kQRQsv5vxg7wLsywsNXKdDcALh8S/EEOrPXFaWM2g=;
	b=vRpcm0TOM4Eob84J1OPyZAfAzI7axSYHGmBjBbV+KPUfqLWKaOdEzWcARiNV1qzEdhH5zl
	ckOPv+7DaOj1vY2vBG2Y4iljOXRklGvCDf/oaBdrFS1DEgS/Y3CYWkNDDDgdy5iNGME6l0
	OinztNIqnZQujEJRUlJ54jDc00LNcuFT8kTQ2XVcgPpj7cihJ025dDLMdUXK5qDqhYsBaM
	wzDEq2TnPL/oUptH6njSYFZvjMMM/vfU1rEuLbc0ZkOo1Z5zR5OovrNldzYclWYIVJkhuX
	GLiVUtwbupjQIVRxxESTnzhkYz1+R0T8Z83wuT27i72r7rLgEeJvFI0vJlCUeQ==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 12:17:59 +0100
Message-Id: <DG1159ZW7WWD.1S10T841PJ8PX@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] openssh: add variable for key path
Cc: <openembedded-core@lists.openembedded.org>, <paul@pbarker.dev>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <patrick.vogelaar.dev@mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
 <20260125091540.8808-1-patrick.vogelaar.dev@mailbox.org>
In-Reply-To: <20260125091540.8808-1-patrick.vogelaar.dev@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230132

Hi,

On Sun Jan 25, 2026 at 10:15 AM CET, Patrick Vogelaar via lists.openembedde=
d.org wrote:
> This patch adds a variable for the key directory path. This is especially
> useful when working with a read-only file system where you want to
> specify the location e.g. on a r/w partition. To be consistent, the
> change was also done for the read write path.
>
> For changing the path simply create a bbappend and override the
> variable.
>
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
> ---
>  .../openssh/openssh_10.2p1.bb                    | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_10.2p1.bb
> index 866129573f..d8ea487ae3 100644
> --- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
> @@ -99,6 +99,10 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_PATH_PASSWD_PROG=
=3D${bindir}/passwd"
>  # We don't want to depend on libblockfile
>  CACHED_CONFIGUREVARS +=3D "ac_cv_header_maillock_h=3Dno"
> =20
> +# This allows overriding the key location
> +OPENSSH_HOST_KEY_DIR_READONLY_CONFIG ?=3D "/var/run/ssh"
> +OPENSSH_HOST_KEY_DIR ?=3D "/etc/ssh"

Thanks for the patch, it was merged in master. As a follow-up, could you
send patches to document these variables in
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/varia=
bles.rst?

And add a note here
https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides=
/release-notes-6.0.rst#n24?

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


