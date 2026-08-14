Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72FFC5DF69
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 04:55:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6619.1786683332668364845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 21:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AS7WSLEr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73BAB1A1623;
	Fri, 14 Aug 2026 04:55:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47CF26046D;
	Fri, 14 Aug 2026 04:55:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7EDD11C4E7A2;
	Fri, 14 Aug 2026 06:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786683325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jutYMv9gTCbCSYJ0689EJKkD1HDkj5fz+BvDFMkYDXk=;
	b=AS7WSLErLS6VOengXKJSbunQ3FwNRLHJzW4FBamvo3V0OyDOcPMtQhpiq/uzXFEDDHeTw7
	CPmtN20KPnTMUIJgYWSVhK/+dHN7hPQrBquSJufUOe55g5mCdJ2SSu5VT/MnQ52DQgdxni
	kfSCMsre69mDVeBkAPGgPI8ws3rtcuEWvsgSaPuaDXdqVCx/Ca03W4z7GBv3ZmLS9awqfF
	yaZXRBq8FTzedIbq/NNU61eItJoG8hFuFBp2nBpKRMSYOCTEOnOgkslpDmKCYUhrLgktzK
	RjiACjNBo6RzP1XPhB/NtJlIKVQdSqVAfpzDna1+9xcDk+UFqsL3POMe8Cnl0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 06:55:23 +0200
Message-Id: <DKOEDNQ6X1BT.2JG17EYFNI6EO@bootlin.com>
Subject: Re: [OE-core][PATCH] libpng: skip pngimage-full test on riscv64
Cc: <pratik.farkase@est.tech>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810181923.3091327-1-tgamblin@baylibre.com>
In-Reply-To: <20260810181923.3091327-1-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 04:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243395

On Mon Aug 10, 2026 at 8:19 PM CEST, Trevor Gamblin wrote:
> The libpng ptest suite fails intermittently on the Autobuilder. This
> seems to be tied to the pngimage-full test, which is the last one to run
> and differs from pngimage-quick by using an --exhaustive flag to
> indicate that a very wide variety of feature/configuration combos for
> the libpng library should be tested. Disable the suite by patching
> Makefile.am to exclude it, then conditionally include the patch for
> riscv64 systems with a SRC_URI override.
>
> For comparison, here's what the test suite output looks like with the
> patch applied (note the last handful of results before the summary):
>
> |PASS: tests/pngunknown-discard
> |PASS: tests/pngunknown-if-safe
> |PASS: tests/pngunknown-sAPI
> |PASS: tests/pngunknown-sTER
> |PASS: tests/pngunknown-save
> |PASS: tests/pngunknown-vpAg
> |PASS: tests/pngimage-quick
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary for libpng 1.6.58
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |# TOTAL: 35
> |# PASS:  35
> |# SKIP:  0
> |# XFAIL: 0
> |# FAIL:  0
> |# XPASS: 0
> |# ERROR: 0
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |make[1]: Leaving directory '/usr/lib/libpng/ptest/src'
> |DURATION: 464
> |END: /usr/lib/libpng/ptest
> |2026-08-10T18:09
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemuriscv64:~#
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch.

It looks like the inner patch fails to apply, probably because of your
other libpng changes:

ERROR: libpng-1.6.58-r0 do_patch: Applying patch '/srv/pokybuild/yocto-work=
er/qemuriscv64/build/layers/openembedded-core/meta/recipes-multimedia/libpn=
g/files/0001-Makefile.am-drop-pngimage-full-from-TESTS.patch' on target dir=
ectory '/srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/work/riscv6=
4imafdc-poky-linux/libpng/1.6.58/sources/libpng-1.6.58'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemuriscv64/build/bui=
ld/tmp/work/riscv64imafdc-poky-linux/libpng/1.6.58/recipe-sysroot-native/et=
c/quiltrc push', 1, 'stdout: Applying patch 0001-Makefile.am-drop-pngimage-=
full-from-TESTS.patch
patching file Makefile.am
Hunk #1 FAILED at 109.
1 out of 1 hunk FAILED -- rejects in file Makefile.am
Patch 0001-Makefile.am-drop-pngimage-full-from-TESTS.patch does not apply (=
enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2113
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/2107

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


