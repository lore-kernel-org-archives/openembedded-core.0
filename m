Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2C4C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 18:03:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2671.1784311369469222635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 11:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Bh+hh5vl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 457F61A1064;
	Fri, 17 Jul 2026 18:02:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18EE360361;
	Fri, 17 Jul 2026 18:02:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E79711BD0D05;
	Fri, 17 Jul 2026 20:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784311366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IwLEkcf6EN/gKg2TpWFU9LNCAbe3uAW7XDLesIgc9TU=;
	b=Bh+hh5vliJTnevk9gf48FmyKAuBFK2mmFQQOTdm5VgXxcfuXXkyLsbBFo1LrNdRSA80vGW
	m1xpxs2grYgVzKhAufkqD2Yk/ns7Lq1RwArQlY8kwlOKlukXzuKm2BEntGf6vio38hCaK7
	cGrMnQ0PEoC52vLmyAJBt09ai10rlbg6lR0sxOztyRBgUYnt6J7UpWXAMQ3xvEwnQU1Xb9
	NWOTSUqYdw47NKGsKYWWHu/E5zp8ZXcSyQ5J1slV5E4TsxB7DLoH+itdTO5qzHFOuJ8Eyk
	IiVvInbygFnYTMzSSjlqtIXJJXPH680BY45fRwQsIlZQLXMiEilWkAbqMSQD6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 20:02:43 +0200
Message-Id: <DK11L8A7P6BN.2E0LE48SCL6SU@bootlin.com>
Cc: <Randy.MacLeod@windriver.com>, <Shiva.Komati@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: fix service enablement for
 cross-install scenarios
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 18:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241221

On Thu Jul 16, 2026 at 8:15 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:
> When packages are installed outside of Yocto's normal image creation
> (e.g., using multistrap, debootstrap, or dpkg directly on a host),
> the postinst script fails to enable systemd services.
>
> The issue is that the entire enable logic is gated behind
> "if systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
> - If systemctl is absent on the host: the check fails, script is skipped
> - If host systemctl is present: it cannot find target unit files
>
> Fix this by separating the offline ($D set) and online ($D unset)
> code paths into distinct branches. The previous code used a single
> OPTS variable to switch between "--root=3D$D" (offline) and "" (online)
> within one unified block. This variable is removed because the two
> scenarios now have dedicated branches with different logic:
>
> - Offline ($D set): Tries "systemctl --root=3D$D preset" first, which
>   reads preset files from the target rootfs and creates symlinks
>   without needing the host systemctl to understand the target's unit
>   files. Falls back to "systemctl --root=3D$D enable" per service.
>
> - Online ($D unset): Same as before - enable, daemon-reload, preset,
>   restart. No behavioral change for on-target installs.
>
> The OPTS variable is no longer needed because each branch now directly
> uses the appropriate systemctl invocation for its context, making the
> intent clearer and the offline path functional.
>
> Fixes [YOCTO #14118]
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---

Hi Himani Ramesh,

I tried to pick this patch, but I can see some conflicts with the master
branch. Can you confirm this is targeting the master branch and based on
a recent master?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


