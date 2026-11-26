Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9197.1795676088169830351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 22:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rF5YFcUc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B81764E41775
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 06:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CD5C60237;
	Thu, 26 Nov 2026 06:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 383AA11E6B098;
	Thu, 26 Nov 2026 07:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795676085; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z1b+VEQdQ3y68SsARd3q9qE3qjRhhX7KfOMvjsVy3UU=;
	b=rF5YFcUcxaOiWVBN7uR6VkkqwRZNNWmXJW1bJVxB0Eztkl2H3JEFV0lqAPjcyDczQbI/Ti
	uLkmwI+DvarlmQc5XkNQJIhxgJe3S8S4PHEnkGF/1kx8/AxbTbWMEV96m1kfJIgMseCFDN
	Tkzcc+/CnPPYFnYkPMszmyhWdbv4LjcyWtxo2C4MFXAp8JQYlurMS/vY9jlahF3BicdJuw
	3WvIQzVCB4QxLJpZ07odhu+498V6Bh/2KE5WDla1kW4GPOxfwFerjUWMbi5iyNRxKc1V6/
	t9xYOAFXIy6j4fZR/QKI6mMYx8MO2SnKFPfTMGTCKq6gOFUdblWapXRh9AcM2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 07:54:42 +0100
Message-Id: <DN4Y1O8L620L.BPN15JQFEOTB@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/18] python3: fix packaging of
 libdir/python3.15/config/
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261125163927.1835785-1-ross.burton@arm.com>
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 06:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251281

On Wed Nov 25, 2026 at 5:39 PM CET, Ross Burton via openembedded-core wrote=
:
> The manifest explicitly used ${prefix}/lib/ instead of ${libdir}, which
> may have either been correct historically or a mistake.
>
> Either way, if ${libdir} is not "lib" then this means config/ is packaged
> into -misc instead of -core.  Use ${libdir} for reliable packaging.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Thanks for your series. One of these patches is triggering this error:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-ltp/build/layers/openembedde=
d-core/meta/lib/oeqa/runtime/cases/ltp.py", line 81, in test_ltp_help
    self.assertEqual(status, 0, msg=3Dmsg)
AssertionError: 1 !=3D 0 : Failed to get ltp help. Output: Traceback (most =
recent call last):
  File "/usr/bin/kirk", line 8, in <module>
    sys.exit(run())
             ~~~^^
  File "/usr/lib/python3.15/site-packages/libkirk/main.py", line 422, in ru=
n
    libkirk.com.discover(os.path.join(currdir, "channels"))
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.15/site-packages/libkirk/com.py", line 175, in dis=
cover
    obj =3D libkirk.plugin.discover(ComChannel, path)
  File "/usr/lib/python3.15/site-packages/libkirk/plugin.py", line 105, in =
discover
    spec.loader.exec_module(module)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
  File "<frozen importlib._bootstrap_external>", line 751, in exec_module
  File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_remo=
ved
  File "/usr/lib/python3.15/site-packages/libkirk/channels/qemu.py", line 1=
4, in <module>
    import secrets
ModuleNotFoundError: Standard library module 'secrets' was not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/4855
https://autobuilder.yoctoproject.org/valkyrie/#/builders/98/builds/4911

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

