Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C77C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:48:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123.1784476116786257106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sxTWWfi+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 89F441A10E4;
	Sun, 19 Jul 2026 15:48:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A608601A5;
	Sun, 19 Jul 2026 15:48:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB33411BD3C85;
	Sun, 19 Jul 2026 17:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784476113; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ntRzLBWz0x23SblOaAhlNI75DTojyAAuRaqZ/e2RSc=;
	b=sxTWWfi+S0fiYMLDtGiRHJL0zgopc4BoM/NeBUfW/r1kGMnw9x0N78WA8X2DdB7aESXQ2t
	QxMSnRYzp3ob0kfHQHSA4YNAr+FQKXTYRxHRur95dT5ui4Bsn/iOVvCdXGwuECPSrXsXx2
	iOzx0CVsfzLjSU6RskTStP+gtvm6bxTL466+RB0/uJ26MMciETkMrxk14xBjNdbLEMIZu/
	SD6HC5r5Dozu0XpoDvq/sKOhe5UfAO9Lxq1SiYTq92QHANLJtxdxjIffX+md0Q6tp5oKn/
	+6Hz0znRbBNCwhLrWCrZA1hA3oyemaFft7hEY3zMwMxdup6NlGL2U4PTKEeOZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:48:31 +0200
Message-Id: <DK2NZKOH7YES.HOC3NSFPK2ZL@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 0/6] wic: ship its tools, and add an
 SDK_FEATURES lever
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260717133421.3510970-1-twoerner@gmail.com>
In-Reply-To: <20260717133421.3510970-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241295

On Fri Jul 17, 2026 at 3:34 PM CEST, Trevor Woerner via lists.openembedded.=
org wrote:
> wic shells out to a range of host-side tools but does not declare them,
> so wherever it is installed as a package (rather than run from the
> bitbake do_image_wic task, which has the wic-tools native sysroot on
> PATH) it works only by chance depending on what the host has installed.
>
> Patch 1 fixes that directly: wic gains RDEPENDS on the tools it runs, so
> they are installed alongside it in every variant that packages it.
>
> The rest of the series turns "what optional tools go into the SDK" into
> an explicit, self-documenting choice. It introduces SDK_FEATURES, a list
> in the same spirit as DISTRO_FEATURES / MACHINE_FEATURES / IMAGE_FEATURES=
:
> a developer reads the setting and knows exactly what their SDK contains.
>
>   - patch 2 adds SDK_FEATURES and gates wic on the "wic" feature (off by
>     default);
>   - patch 3 moves the existing (unconditional, arch-gated) qemu addition
>     behind a "qemu" feature, on by default so nothing regresses;
>   - patch 4 adds an opt-in "sbom" feature (SPDX + SBOM/CVE tooling);
>   - patch 5 moves the cross-canadian gdb behind a "gdb" feature, on by
>     default; binutils and gcc stay unconditional since a cross-compiler
>     is intrinsic to an SDK;
>   - patch 6 adds an opt-in "lldb" feature for developers who prefer it.
>
> The default SDK_FEATURES is "gdb qemu", so an unmodified configuration
> produces the same SDK as before. The intent is to present the full range
> of knobs and let review settle which belong on by default; the split
> across separate patches is deliberate so each can be debated on its own.
> SDK_FEATURES is a plain list, so downstream layers can define their own
> features (for example a cgdb feature in meta-openembedded) the same way.
>

Hi Trevor,

Thanks for the new version. It looks like we have 2 selftest fails:

2026-07-19 07:16:57,038 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_allarch_samesigs (subunit.RemotedTestCase)
2026-07-19 07:16:57,040 - oe-selftest - INFO -  ... FAIL
...
ERROR: When reparsing /tmp/selftest-fetchvua2hn0x/test.bb:do_checkuri, the =
basehash value changed from eaf531c7d0304fd45f77fab173d0399db2b76e45cd46487=
426eb74bae7d4b7bb to 2cdec1b5839750d0c5998dd35b7ab7380727d2fa3a33aed8641444=
28d3a78f7d. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_checkuri -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_checkuri -Sprintdiff

ERROR: When reparsing /tmp/selftest-fetchvua2hn0x/test.bb:do_fetch, the bas=
ehash value changed from 72505ac7986134cca1a5bf96409e922ca39d8b70914218c968=
f9a8b3d508bc81 to b34ab448c19b41b81625a8e8ffa143940fa6c6a3c9db18ecec38e83ee=
0e3b7bb. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_fetch -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_fetch -Sprintdiff
...
2026-07-19 07:21:21,814 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_nativesdk_samesigs_multilib (subunit.RemotedTestCase)
2026-07-19 07:21:21,814 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4320
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4376
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4142

I also got this error that might be related:

ERROR: Nothing RPROVIDES 'grub' (but /srv/pokybuild/yocto-worker/check-laye=
r/build/layers/openembedded-core/meta/recipes-support/wic/wic_0.3.1.bb RDEP=
ENDS on or otherwise requires it)
grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPA=
TIBLE_HOST)
NOTE: Runtime target 'grub' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['grub']
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'wic', =
'grub']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/4231

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


