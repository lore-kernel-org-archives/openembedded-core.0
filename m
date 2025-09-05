Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76405CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 11:07:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.18916.1757070464602624475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 04:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BzhDNpYB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 245044E40BAA
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 11:07:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1FD56060B;
	Fri,  5 Sep 2025 11:07:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18DFF102F1C9A;
	Fri,  5 Sep 2025 13:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757070459; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ewOFNRTcowc2eBm5k/tKmYGGjY6IF82dc3qnHuTHAww=;
	b=BzhDNpYBiKO+vw7dYnI3r5y5/F+GPvZ8rSS2HLaNBb1HJiGvQli5KrLul1P8Y96IBJA/xd
	OvjYes5KkpkWBdnt7q4GhVvYnZuxDoq9PoLNyZjBHTz+Qp2S85I46o+TcJjF/m/67ui8qt
	pXFFpWuLa+TNE8W451hNB1cxrpQMiCmOtgODeRAmJ2EQL8MtIbn49ryRNmnGAbnA8aLP8M
	KH7B4CHuz6IdcMiv6dRbvhLbODn9Ygtt1pVOqfHTBL/ObDNR5PLpGgn9NNhyvhZUmJ4GWz
	OLt5YjFe15zSGaBmA+jTB/zi6uvm+urqRf4gaD8ZEeWCZMeL+zRsa/lu+JBHUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 13:07:30 +0200
Message-Id: <DCKTHPPY024Z.VPM4BWNDVWIG@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] librsvg: add ptest support
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250904112140.2762452-1-skandigraun@gmail.com>
In-Reply-To: <20250904112140.2762452-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 11:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222991

On Thu Sep 4, 2025 at 1:21 PM CEST, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> The suite is quick, it takes ~5 seconds on my machine to execute.
>
> The tests consist of 2 or 3 parts, depending on how one counts them.
>
> The apitest PACKAGACONFIG compiles tests for the c-interface, as part of
> the main meson build. This apitest expects test data to be present in
> a folder relative the test binary: ../../rsvg/tests folder.
>
> ptest-cargo compiles two sets of test: rsvg-convert tests, and generic as=
sorted
> tests for the library, in multiple binaries.
>
> The rsvg-convert tests expect test data to be present in a "tests" folder=
,
> in the same folder where the test binaries are.
>
> The library tests expect the tests to be in a folder called "tests", that=
's
> location is specified by the CARGO_MANIFEST_DIR environment variable.
>
> As part of compiling the cargo tests, rsvg-convert is also compiled speci=
fically
> for the tests, however it is not supposed to be different from the actual=
 binary.
> It is deleted from the test set, because of two reasons:
> 1. It is not bit-identical to the actually installed rsvg-convert (it is =
compiled differently,
>    with cargo only, without meson)
> 2. ptest-cargo class treated it as a test binary, and tried to execute it=
, which resulted
>    in failing/hanging test.
>
> It is avoided by not installing this binary, but rather use the real rsvg=
 package
> as a runtime dependency, and create a symlink to it in the run-ptest scri=
pt.
>
> Added liberation-fonts as a runtime dependency to the tests - the rsvg-co=
nvert
> tests require some fonts to be available to be able to render during some
> svg->pdf conversion tests.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

I believe we see two issues on the autobuilder.

First, we do have a reproducibility error:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/librsvg-2-ptest_2.61.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/librsvg-2-ptest_2.61.0-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/librsvg-2-ptest-2.61.0-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2422
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250905-lgqh2ddp/=
packages/diff-html/

Also, there is some build error. This one only appears on some platforms
and seems a bit intermittent.

ERROR: librsvg-2.61.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-w=
orker/qemuarm64-ptest/build/build/tmp/work/cortexa57-poky-linux/librsvg/2.6=
1.0/temp/run.do_configure.3967314' failed with exit code 1
...
| ../sources/librsvg-2.61.0/meson.build:357:4: ERROR: Problem encountered: =
error: error loading target specification: could not find specification for=
 target "aarch64-poky-linux-gnu"

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2191
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2417

Can you have a look, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


