Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B239C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 11:49:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12945.1789559346448441450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 04:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U0/PDz4i;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4992B1A0876;
	Wed, 16 Sep 2026 11:49:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1902860337;
	Wed, 16 Sep 2026 11:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD14E11C7B026;
	Wed, 16 Sep 2026 13:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789559339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w/l5VhSVwZeTEodsvguto7XRjLbzjfE1UkE0H6qwKl0=;
	b=U0/PDz4i+6TYxYzGPQezDLxxBZcqEf8oYMI9AtMCbfTYSOfgNfPcYqH9VVRhDaT/t7+dAV
	k8/G7eXVLV0PuHQiW1yhIbK8MXNgdfRzbBUu5z2dKmAT3wDbpuTcI80uZWCFlQZ9sR0Vl3
	evVilnJ9cpklURJ03uikl0iXNHypB2BmePCj73hml3aHl4IvyY71RcTZxj4e3/E5XRIbNs
	yIaJKR3iA+VgxgmXnUdL4ehk2cDBEhJYrm0DQJno0ePbhUEmsvpmfIjhKWg+VXH8V2hPLl
	Kv3kJaqkS1unlOQtiFD4rntDhscwRuuJ3mCIsLjg2XagtIGUbqWYbodpf4Iw9A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 13:48:55 +0200
Message-Id: <DLGPU9H3OWC3.O9CIGBIM0C0G@bootlin.com>
Subject: Re: [OE-core][PATCH v4] systemd: re-enable ptest support
Cc: <mathieu.dubois-briand@bootlin.com>, <jose.quaresma@oss.qualcomm.com>,
 <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>, <raj.khem@gmail.com>,
 <richard.purdie@linuxfoundation.org>, <Shiva.Komati@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260909085518.640950-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260909085518.640950-1-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 11:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245954

Hi,

On Wed Sep 9, 2026 at 10:55 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:
> ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
> when the recipe switched to meson, as there was no easy way to install
> and run the test suite. Current systemd and meson resolve this: the
> meson 'install-tests' option installs the unit-test binaries and a
> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
> run-unit-tests.py already emits PASS:/SKIP: results per test.
>
> Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests
> and -Dinstall-tests and pulls in python3-pefile-native (needed to build
> the boot hwids test). do_install_ptest relocates the installed tests
> into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which
> needs a booted system). A run-ptest wrapper drives run-unit-tests.py,
> and systemd is registered in ptest-packagelists.inc.
>
> The test/units integration tests, which require a booted system, are
> out of scope here and can be addressed separately.
>
> Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342
> unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and
> systemd-ptest packages cleanly with no QA errors.
>
> [YOCTO #16386]

I think this is triggering the following error on our test infra:

Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/check-layer/build/laye=
rs/openembedded-core/meta/recipes-core/systemd/systemd_261.3.bb: QA Issue: =
Package systemd-ptest is skipping required QA tests. [debug-files]
ERROR: /srv/pokybuild/yocto-worker/check-layer/build/layers/openembedded-co=
re/meta/recipes-core/systemd/systemd_261.3.bb: Fatal QA errors were found, =
failing task.

Full log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8951661=
/raw_inline
Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/b=
uilds/4717

This is happening when checking the meta-mingw layer with check-layer thoug=
h=E2=80=A6

Do you mind looking into it?

Thanks,
Antonin

