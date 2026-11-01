Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13398.1793532955683870714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 03:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oXkhKWvN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5A2784E4132B;
	Sun,  1 Nov 2026 11:35:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20CBD60750;
	Sun,  1 Nov 2026 11:35:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B29410328678;
	Sun,  1 Nov 2026 12:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793532952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A7cHWUX/wio/woqrKNgSLJALaSBJ88mIM6ECnvaBtoY=;
	b=oXkhKWvNwWmu4KQis7NwSEYk5FefSuISJTI1bF/g1Bn0z82LqLMjvbtzrsxr6klfkbKYXq
	6Hjg78rtEou4EX9fK30vMQE/RSa6pkkTrigZiOZ/W1hQaADaUvky8fopxvKPs8fi5epwTQ
	bpuFBCgDPLKxpUL5qKcmkgOYVGZf9lwyVC1eHyy3k2M1zHfDkCSUwgLrHGCB9zkL+iKFzg
	hwRL+7aVTMoJBpclKYCSLMsR7htswTkgIugKWxEWkYou8WCWL8F4KNERa5v/I3f1+jB1yh
	wQHXxFnkKx5XYjZ5DoIT6PRNM8KilOvUCbd4MXgwFpb86lkRIWbhR2ZO/K1aeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 12:35:49 +0100
Message-Id: <DMJUDAJQHCD4.3UK0M2DOPO69V@bootlin.com>
Subject: Re: [OE-core] [PATCH] dbus: Let the ptest package install alongside
 dbus-broker
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261031205103.458712-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261031205103.458712-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 11:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249153

On Sat Oct 31, 2026 at 9:51 PM CET, Khem Raj via openembedded-core wrote:
> dbus-ptest RDEPENDS on dbus, both explicitly and through ptest.bbclass,
> and dbus-broker RCONFLICTS dbus. With VIRTUAL-RUNTIME_dbus =3D "dbus-brok=
er"
> (systemd pulls it in) core-image-ptest-dbus fails in do_rootfs:
>
>   package dbus-broker-37-r0.6.cortexa57 conflicts with dbus provided by d=
bus-1-1.16.2-r0.45.cortexa57
>   package dbus-ptest-1.16.2-r0.45.cortexa57 requires dbus, but none of th=
e providers can be installed
>
> The installed tests don't use the system bus. They start private buses
> with dbus-daemon (DBUS_TEST_DAEMON) and use dbus-send, so depend on the
> dbus-daemon and dbus-tools packages instead and drop the dbus dependency,
> like avahi does.
>
> With this the images using dbus-broker as the system bus also pass all 60=
 dbus
> ptests.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

It looks like this does not go very well. Most builds fail with:

ERROR: Nothing RPROVIDES 'dbus-daemon' (but /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.=
2.bb RDEPENDS on or otherwise requires it)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4953

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

