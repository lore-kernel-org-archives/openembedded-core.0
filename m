Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900EBE9B357
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:48:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157876.1772448496510378032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RLGjiY3u;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FB3CC40F8F
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Mar 2026 10:48:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB04D5FE89;
	Mon,  2 Mar 2026 10:48:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C3D110369530;
	Mon,  2 Mar 2026 11:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772448494; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+TAR552/o/Nk4qPEZfNJ+kRy5xiqfNf3EZDCB9i1viA=;
	b=RLGjiY3ud2IPHVVV9PRO5VeG/xsdpMrhyzGwQ9wfJoR7NXnHoePCUnFrSikkxfAA6ctFjH
	68qoLdXGFyc4r06itqk0odw6z0kT5FrfypOvHttI6SHmX8E29SZX99iZyppVsBEslwH9Gd
	NjSxAIiGLYcqVq1whrS1OwTN4AWPMJBife5g2aGNvTqWzQgL1V7ZDXdCHQKqIAqRHge0x1
	/ujtZJdPKfBB36HKnvpizF/12PyCAa05YWD6c0I+3VAZH5ikU+Si0MtU/0AFgCqDd2G+U+
	WrWHP3pxqB6bTZcD3hHmu48B0ZGD2tNmByrG/4ijY+6G9LEPFsnTKTx7c+6tPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:48:12 +0100
Message-Id: <DGS8JWNFLTW8.3E7NT6B8E8GNP@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/4 V2] Oe-selftest for Clang, LLVM, LLD
Cc: <Randy.Macleod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232194

On Mon Mar 2, 2026 at 7:49 AM CET, Deepesh via lists.openembedded.org Varat=
harajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>
> v2 changes:
> - Enable required CMake flags only when running the testsuite.
> - Ensure default build time and package sizes remain unaffected.
>
> Summary of changes:
> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>           detect the llvm-bcanalyzer target.
> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
>           when CLANG_ENABLE_TESTSUITE is set to "1".
> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
> -Patch 4: Fix rust build failure by replacing target llvm-config with nat=
ive
>

Hi Deepesh,

Thanks for the new version, but it looks like we now have some failing
tests:

2026-03-02 09:52:32,943 - oe-selftest - INFO - clang.ClangSelfTestSystemEmu=
lated.test_clang (subunit.RemotedTestCase)
2026-03-02 09:52:32,943 - oe-selftest - INFO -  ... FAIL
...
AssertionError: llvm-lit failed for Clang: llvm-lit: /srv/pokybuild/yocto-w=
orker/qemuarm-tc/build/build-st-3082983/tmp/work-shared/llvm-project-source=
-21.1.8-r1/sources/llvm-project-21.1.8.src/llvm/utils/lit/lit/llvm/subst.py=
:133: fatal: Did not find FileCheck in /srv/pokybuild/yocto-worker/qemuarm-=
tc/build/build-st-3082983/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cl=
ang/21.1.8/recipe-sysroot/usr/bin
...
2026-03-02 09:54:51,485 - oe-selftest - INFO - clang.LLVMSelfTestSystemEmul=
ated.test_llvm (subunit.RemotedTestCase)
2026-03-02 09:54:51,485 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 09:55:49,997 - oe-selftest - INFO - clang.LLDSelfTestSystemEmula=
ted.test_lld (subunit.RemotedTestCase)
2026-03-02 09:55:49,997 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3224
https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3222
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1118

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


