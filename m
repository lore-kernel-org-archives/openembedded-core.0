Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F998CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 06:10:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43681.1778479801301808172
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 23:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fVdjc9Le;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C449C5E151;
	Mon, 11 May 2026 06:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E18E1601E1;
	Mon, 11 May 2026 06:09:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C1651081A7B5;
	Mon, 11 May 2026 08:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778479798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C15CsWr7Ns8hKoPLMsLk2aFsbqs2m3lTWYELOfwi7W8=;
	b=fVdjc9LezDgIEDRCiPf67DD5d4eOamRuWBgAQOy5qdKXlzVGmgbyv+oHsb6aDwBsG0cJuV
	RWfjR9phuxMmBM/mh3FFvl0Zo1C0XSJKpC9rnpd3/Y811pJn+r6LIX258wd1pfR6PV8nmu
	wjsmDWcdIn+fFAyAGU1WKP/1Qc2a8C1s2L2FWsfl87keJa/92FQ0v7ZOTGb9envX/MegLX
	CbJw9KQademqgGgOXMWbniVCieozwgB6s0YnP6LNgkuFGIufa/lItCrSxG9fVvRX0gz6LA
	I24f7sn+tGIHWuovBeACdWiRpfXJqvzosnAZL6T4ouOEP4T9OGvLarrYpkW8mw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 08:09:55 +0200
Message-Id: <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
In-Reply-To: <20260508113653.21478-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 06:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236776

On Fri May 8, 2026 at 1:36 PM CEST, Pratik Farkase wrote:
> Add ptest support for libffi using all upstream test suites: bhaible,
> call, closures, complex, go, and threads.
>
> Tests are compiled on-target against the installed libffi. Headers
> (including the generated fficonfig.h) and a linker symlink are installed
> in the ptest directory to avoid depending on libffi-dev.
>
> Tested on qemux86-64 with ptest-runner: 199 PASS, 0 FAIL, 2 SKIP (349s).
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the patch.

Do you have any clue about why this is triggering some selftest
failures? I'm a bit surprised by that, but I confirm it comes from this
patch:

2026-05-10 16:16:13,784 - oe-selftest - INFO - locales.LocalesTest.test_loc=
ales_off (subunit.RemotedTestCase)
2026-05-10 16:16:13,787 - oe-selftest - INFO -  ... FAIL
...
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-c, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps=
]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-=
deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
...
2026-05-10 16:19:03,004 - oe-selftest - INFO - locales.LocalesTest.test_loc=
ales_on (subunit.RemotedTestCase)
2026-05-10 16:19:03,005 - oe-selftest - INFO -  ... FAIL
...
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-c, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps=
]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-=
deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
NOTE: Setscene tasks completed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3929
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3827
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3696


I also note some is install error:

ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf. Co=
mmand '...' returned 1:
...
Error: Transaction test error:
  file /usr/bin/g++ conflicts between attempted installs of lib64-g++-symli=
nks-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
  file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks-15=
.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
  file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-symli=
nks-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32


Finally, I note a ptest failures (on riscv64). This one look like
intermittent, if it happens too often, we might want to exclude the
failing test:

Failed ptests:
{'libffi': ['libffi.complex/complex_int']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1576


I will try to run more tests, as again, I'm a bit surprised by some of
these failures.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


