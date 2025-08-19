Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340FACA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 05:46:33 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.7178.1755582384518437092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 22:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KSLH3uq1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E26AFC6B39C;
	Tue, 19 Aug 2025 05:46:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C3B860697;
	Tue, 19 Aug 2025 05:46:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F4A51C2288FB;
	Tue, 19 Aug 2025 07:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755582381; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KEnCtYigpfn79T6esQfYl7lDPA2PLqKu+QnjD2Uq0Rs=;
	b=KSLH3uq1GeI+duaXdM4k+U2tDJAmGQPZw8xhqZjwRdZpQ2ffsS0ayl1QWQXE4vUDL1B6KH
	mvDjKBpSMRwTdN8mAvlAiGb+v242+msFERe1RV/rADS34Z5/Hqk4TNGrhmWzFf3RYZ7kP6
	OAaGdPcA3l15aQ9VaMIHM/iMSYsH9AloCbZNFs8GCnbMldqzQa5zDUi1eeaDS93pKu8wKU
	LgbjriXOP8HPiotnETb9XPUAwc9hMJ1uMY33sep7EoRhFZ8q24fBKsyTn4kGS/R5N1o4oV
	iv3yGO1OG+GygsRzOtsk03/I12gBcVHui+e1t2jku3oinosiD0ogpLuwAh7Lhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 07:46:17 +0200
Message-Id: <DC660IEPZE9T.1VEW6S4PFZICU@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv4 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250817201832.2462509-1-pkj@axis.com>
In-Reply-To: <20250817201832.2462509-1-pkj@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 05:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222073

On Sun Aug 17, 2025 at 10:18 PM CEST, Peter Kjellerstedt via lists.openembe=
dded.org wrote:
> It is needed when support for both systemd and sysvinit are enabled.
>
> This also adds a patch for systemctl to allow the path to
> systemd-sysv-install to be specified in runtime. This is needed because
> the hardcoded path that is built into systemctl does not match the path
> to where it will eventually be executed.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---

Hi Peter,

Thanks for the new version. However, it looks like I still have similar
failures:

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Postinstall scriptlets of =
['iptables', 'openssh-sshd', 'sysklogd', 'volatile-binds', 'systemd-network=
d', 'at', 'cronie', 'logrotate', 'only, configuration required on target', =
'nfs-utils-client', 'nfs-utils', 'psplash', 'run-postinsts'] have failed. I=
f the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2222
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2206
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2267
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3283356/raw_inlin=
e

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


