Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14923.1794295132332099004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=emWMEU2L;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B07871A15F4
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8673560012;
	Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1353C103293C1;
	Tue, 10 Nov 2026 08:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794295130; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S2u2m1vaxmCoPwyXn52gN6jhfz57fleN48ndjY81wP4=;
	b=emWMEU2LjLTUh33BuUPB4V44vdpz6JIBWSM8ac1whmlIKtePf9aQ+mWFwQ4JBCjylOubic
	yvON0Rqs3DMnP6X+jMiV2NlDNZPWbTjK/sn5IKenqc3UAOkwm4QqV4fOlQ5Pl3SO3OQEWs
	ga2a6sFmMIak1jM1r3MhLsnBWl93WrdalcdUXSsOajVetT2dCrIWbMO1Zd3G0j6m8g0SBV
	KYDBbqHAAJlZe2O/8M7OSw0U4FfGs6VsWwZDgKB++q4HSZezwuYAHEYGs3+FgeHNz8VAda
	cAcZF8/6/ByLcs8ObOeZPB36tImnaTbKbn4DZWahKyoReFA1qVBEsJ1pZTnBhw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 08:18:47 +0100
Message-Id: <DMRCJE7GVD4S.27N9L2M4QLIIY@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] python3: remove obsolete reformatting of
 _sysconfigdata*.py
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109143827.3411115-1-ross.burton@arm.com>
In-Reply-To: <20261109143827.3411115-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249907

On Mon Nov 9, 2026 at 3:38 PM CET, Ross Burton via openembedded-core wrote:
> The python3 recipe currently reformats the _sysconfigdata*.py files after
> they are modified to remove build paths, as the files may be wrapped
> differently based on the length of strings[1].
>
> However, this wrapping was due to the use of pprint.pprint(), which
> since Python 3.13 is no longer used to generate the sysconfigdata[2].
>
> As such, remove the reformatting as it is no longer needed.
>
> [1] oe-core ec8a2b310d5 ("python3: Reformat sysconfig")
> [2] python 5ecedbd2669 ("gh-106789: avoid importing pprint from sysconfig=
 (#106790)")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Thanks for your patch.

I have a lot of python related things in my branch, but I suspect this
series is responsible of the following failure. I will drop it to
confirm.

ERROR: python3-3.14.10-r0 do_package_write_rpm: Execution of '/srv/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/pytho=
n3/3.14.10/temp/run.BUILDSPEC.2769789' failed with exit code 1
...
| Processing files: python3-tests-3.14.10-r0.core2_64
| error: Directory not found: /srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/pytho=
n3.14/test/__pycache__
| error: Directory not found: /srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/pytho=
n3.14/test/test_tools/__pycache__
| error: File not found: /srv/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/python3.14=
/test/test_tools/__pycache__/test_compute_changes.cpython-314.pyc
| error: File not found: /srv/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/python3.14=
/test/test_tools/__pycache__/__init__.cpython-314.pyc
| error: File not found: /srv/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/python3.14=
/test/test_tools/__pycache__/test_makeunicodedata.cpython-314.pyc
| error: File not found: /srv/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/python3.14=
/test/test_tools/__pycache__/__main__.cpython-314.pyc
| error: File not found: /srv/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/work/core2-64-poky-linux/python3/3.14.10/package/usr/lib/python3.14=
/test/test_tools/__pycache__/test_msgfmt.cpython-314.pyc
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5006
(You can ignore groff issues in the log).

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

