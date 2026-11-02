Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8219.1793608706024886489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 00:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y5Krxeg7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD1C21A1402
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 08:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AF1260750;
	Mon,  2 Nov 2026 08:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B642C103290E8;
	Mon,  2 Nov 2026 09:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793608702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cl+ihiCepwJFeXT1C1yqZkWXnGd86XkFZA55PwlfmXw=;
	b=Y5Krxeg7A5hsWv7qJ6YTDtRxAwst67gvAvp2qJz4e/7TZ0iRrZa6l/Ix+DFwVuLHbiebtK
	sf+FsMiQbv83yarq5e9gi2YQldi43kOiFX6cZPc/w6GZ0BLMlFByEAhHawY2ODLnqGxAIl
	k2drVe/dh/BEp2Tck4zVozwJn9Q3m6AuaoSub5CO/2h30t5TFIYA3dBlUkfQ+ps/sStSn2
	RDWjW0HHOjDhEepEazkvtYodyYK4d43xTS/eLZ1tQeMF4N55Ug5I7mz33cR5dy+pGLKckX
	M09uWI4IW0i6TSXX4zRSLt5kLl4tpgcajhthpe3bp2KD7c4sM8XzhZG0TgIZKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 09:38:19 +0100
Message-Id: <DMKL7XPJHDJJ.38S3LSGZG46RW@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] dbus: Let the ptest package install
 alongside dbus-broker
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261101154955.1417945-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261101154955.1417945-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 08:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249195

On Sun Nov 1, 2026 at 4:49 PM CET, Khem Raj via openembedded-core wrote:
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

Sorry, we still have a similar error:

ERROR: Nothing RPROVIDES 'dbus-daemon' (but /srv/pokybuild/yocto-worker/gen=
ericx86-64/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.=
2.bb RDEPENDS on or otherwise requires it)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4957

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

