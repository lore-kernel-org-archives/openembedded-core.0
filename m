Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B16ACD3427
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 13:09:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29555.1778418555203410002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 06:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vKiXHMod;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA7404E42C79;
	Sun, 10 May 2026 13:09:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 791625FB4B;
	Sun, 10 May 2026 13:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 881AD10819A18;
	Sun, 10 May 2026 15:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778418549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bUHmncHONKN9O9xqr9VAhDd0uWvbEgl8rd4t2aHhAJg=;
	b=vKiXHModf6wW5QXBjREpakHZYwL0FuLNZRq00/ntCH91B86HV20eM31i8ALKxBs9fgt01O
	sNy3pYMgCPdgeKIfWZmKsgG3RZIhrk3cuJH7bf98uRByg7AcuQVFtF6HnSeqzyFekmGGDw
	wsXkhdKa3w0vuFMhiqUWRxgE9MPjvnLSoap+OKMnJOnL7TEn7r0WrhXDrnkB/1mI/L/l+6
	EwrV3eIAlrPi5vFWk8I93Tn7A/yqduXdBCCxGZ8t2QPC2T9phvVl/VxS+LR5z8j/ingYF3
	SkJarTpsjoNyrEDZ/UwJ0GnLB8lSKhnxjCyy2XyUZ7fW/NV8/5WQqYihnIjTiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 May 2026 15:09:05 +0200
Message-Id: <DIF0RD92PLUT.GBWK3UG1TBKH@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/7] gcc: Upgrade GCC to 16.1 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Randy.MacLeod@windriver.com>,
 <khem.raj@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 May 2026 13:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236769

On Thu May 7, 2026 at 7:32 PM CEST, Hemanth Kumar M D via lists.openembedde=
d.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> This patch series upgrades GCC to 16.1 and includes the required
> runtime and compatibility fixes identified during testing in OE-Core.
>
> The series also includes fixes for packages failing to build with
> GCC 16, updates for libatomic runtime handling, and packaging
> changes for newly generated libatomic_asneeded files.
>

Hi Hemanth,

Thanks for the upgrade.

We can see various failures on the autobuilder:

gn build failure with musl:
ERROR: gn-0+git-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/mu=
sl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/gn/0+git/temp/=
run.do_compile.1800795' failed with exit code 1
...
| In file included from ../sources/gn-0+git/src/gn/pool.cc:5:
| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a =
type
|    26 |   int64_t depth() const { return depth_; }
|       |   ^~~~~~~
| ../sources/gn-0+git/src/gn/pool.h:11:1: note: 'int64_t' is defined in hea=
der '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
|    10 | #include "gn/item.h"
|   +++ |+#include <cstdint>
|    11 |
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3801
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3762
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/2470

ruby build error:
ERROR: lib32-ruby-4.0.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ruby/4=
.0.3/temp/run.do_compile.246705' failed with exit code 1
...
| compiling ../../../sources/ruby-4.0.3/ext/openssl/ossl_x509attr.c
| /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokyml=
lib32-linux/lib32-ruby/4.0.3/build/i686-linux-gnu-fake.rb: [BUG] Bus Error =
at 0x00007fb9686ec000
| ruby 4.0.3 (2026-04-21 revision 85ddef263a) +PRISM [x86_64-linux-gnu]
|
| -- Control frame information --------------------------------------------=
---
| c:0003 p:---- s:0009 e:000008 l:y b:---- DUMMY  [FINISH]
| c:0002 p:---- s:0006 e:000005 l:y b:---- CFUNC  :require
| c:0001 p:0000 s:0003 E:0004f0 l:y b:---- DUMMY  [FINISH]
|
| -- Ruby level backtrace information -------------------------------------=
---
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3762

Failed selftest:
2026-05-10 08:35:41,719 - oe-selftest - INFO - buildoptions.ToolchainOption=
s.test_toolchain_fortran (subunit.RemotedTestCase)
2026-05-10 08:35:41,723 - oe-selftest - INFO -  ... FAIL
...
ERROR: libgfortran-16.1.0-r0 do_package: QA Issue: libgfortran: Files/direc=
tories were installed but not shipped in any package:
  /usr/lib/gcc/aarch64-poky-linux/16.1.0/libcaf_shmem.a
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
libgfortran: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: libgfortran-16.1.0-r0 do_package: Fatal QA errors were found, failin=
g task.
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3928
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3823
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3695

Failed ptests (all platforms):
{'elfutils': ['run-strip-nothing.sh', 'run-strip-g.sh']}
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1572
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3631
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3646

Failed ptests (musl only):
{'libc-test': ['functional_argv-static',
               'functional_basename-static',
               'functional_clocale_mbfuncs-static',
               'functional_clock_gettime-static',
               'functional_crypt-static',
               'functional_dirname-static',
               'functional_env-static',
               'functional_fcntl-static',
               'functional_fdopen-static',
               'functional_fnmatch-static',
       'functional_fscanf-static',
...
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/386
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/369

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


