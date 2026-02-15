Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE59EF586D
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 08:54:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22179.1771145663962623925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 00:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IM5fvLJV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB848C19D14;
	Sun, 15 Feb 2026 08:54:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E81D606CE;
	Sun, 15 Feb 2026 08:54:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A86010369044;
	Sun, 15 Feb 2026 09:54:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771145650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/bedOOlV8Q1PBhnA1wjEG6phg7nF62LAkYIWwdb39gI=;
	b=IM5fvLJV4F9WdOwfpwKXd0bCiWTqEIRx+oyRSfnKlVqH6WFtc6iN+HWGCydCyIBR8dNuMm
	phacRzvtysMWnlgajZCw9aTmdZiKDmMq14wNmxjbOAdGdBh7UxeRILvSQ+S8kw78S4oUuU
	GIx+z5yBEiDejjKRpG2y0Snt5xP+L0JQJOG2IrdUu9eSdIcrdRF1jHaGnRMIpPKJ8I3KHs
	EpuqyLnRYeQwZ5SqyWQO9JZVf9TnO6hhMWs1hxOnWV10YEQYVKmZDsfb0vwP77+DtGM6ok
	4sAckpw6jbLwNxWrWuppUPvP2cQnN2AusspsxASJplEWlGpblgUM1tmYHyh8GA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 09:54:05 +0100
Message-Id: <DGFEQCUUIEW0.2TQTA9GWZH8SK@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC 0/4] Oe-selftest for Clang, LLVM, LLD
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 08:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231155

On Tue Feb 3, 2026 at 3:03 PM CET, Deepesh via lists.openembedded.org Varat=
harajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for both
> native and target builds of Clang, LLVM, and LLD.
>
> Summary of changes:=20
> -Patch 1: Disable clang-tools-extra tests because Clang's CMake cannot=20
>           see the llvm-bcanalyzer target.
> -Patch 2: Enabled the required CMake flags for clang, llvm & lld tests
> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
> -Patch 4: Fix rust build failure by replacing target llvm-config with nat=
ive
>
> Testing:
> 1. The test suite has been successfully validated on x86-64, arm64, riscv=
64,
> and arm32 for all three components.
> 2. Clang, LLVM & LLD all together ~80K tests are there and we currently=
=20
> ~200 tests to exclude list which are failing (0.25%).
>
> WIP:
> LLVM target tests are currently failing on x86. This is under investigati=
on
> and will be addressed
>
> Deepesh Varatharajan (4):
>   clang-tools-extra: disable tests
>   clang: Enable tests for llvm, clang, lld
>   oeqa/selftest/clang: Add selftest for Clang/LLVM/LLD
>   rust: Fix rust build failure
>
>  meta/lib/oeqa/selftest/cases/clang.py         | 301 ++++++++++++++++++
>  .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
>  meta/recipes-devtools/clang/clang_git.bb      |   3 +-
>  meta/recipes-devtools/clang/common.inc        |   1 +
>  meta/recipes-devtools/clang/lld_git.bb        |   2 +-
>  meta/recipes-devtools/clang/llvm_git.bb       |  11 +-
>  meta/recipes-devtools/rust/rust_1.92.0.bb     |   5 +-
>  7 files changed, 389 insertions(+), 8 deletions(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
>  create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-to=
ols-extra-test.patch

Hi Deepesh,

Thanks for this series. I know it's still RFC, but it went in my
week-end batch of RFC patches tested on the autobuilder.

So far, we had the following issues:

2026-02-14 17:23:02,046 - oe-selftest - INFO - clang.ClangFamilyNativeSelfT=
est.test_clang_family_native (subunit.RemotedTestCase)
2026-02-14 17:23:02,049 - oe-selftest - INFO -  ... FAIL
...
subprocess.CalledProcessError: Command '/srv/pokybuild/yocto-worker/oe-self=
test-armhost/build/build-st-1314344/tmp/work/aarch64-linux/clang-native/21.=
1.8/build/bin/llvm-lit --filter-out 'arm|i386|x86_64|x86|mips|riscv|riscv64=
|ppc|ppc64|hexagon|sparc|sparcv9|msp430|loongarch|Mac|macho|Darwin|OSX|wasm=
|Windows|Win|MinGW|COFF|zos|FreeBSD|aix|fuchsia|ve' '/srv/pokybuild/yocto-w=
orker/oe-selftest-armhost/build/build-st-1314344/tmp/work/aarch64-linux/cla=
ng-native/21.1.8/build/test' -o '/srv/pokybuild/yocto-worker/oe-selftest-ar=
mhost/build/build-st-1314344/tmp/work/aarch64-linux/clang-native/21.1.8/tem=
p/clang-native-results.log'' returned non-zero exit status 127.
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3316
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3214
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3090

A second one:

2026-02-14 18:07:00,151 - oe-selftest - INFO - 2: 1/1 8/21 (222.35s) (0 fai=
led) (clang.LLDSelfTestSystemEmulated.test_lld)
2026-02-14 18:07:00,152 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/selftest/cases/clang.py", line 298, in test_lld
    raise AssertionError(f"llvm-lit failed for LLD: {output}")
AssertionError: llvm-lit failed for LLD: sh: line 1: cd: /srv/pokybuild/yoc=
to-worker/qemux86-tc/build/build-st-2874234/tmp/work/core2-32-poky-linux/ll=
d/21.1.8/build/bin: No such file or directory

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/3136
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3113

And a third one:

2026-02-14 21:12:51,873 - oe-selftest - INFO - 3: 1/1 21/21 (18519.15s) (0 =
failed) (clang.LLVMSelfTestSystemEmulated.test_llvm)
2026-02-14 21:12:51,873 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuriscv64-tc/build/layers/openembedde=
d-core/meta/lib/oeqa/selftest/cases/clang.py", line 217, in test_llvm
    raise AssertionError(f"llvm-lit failed for LLVM: {output}")
AssertionError: llvm-lit failed for LLVM: /srv/pokybuild/yocto-worker/qemur=
iscv64-tc/build/build-st-2197806/tmp/hosttools/ld.gold: line 2: /usr/bin/ld=
.gold: No such file or directory
-- Testing: 22642 of 57881 tests, 4 workers --
...
Process ForkServerPoolWorker-2:
Traceback (most recent call last):
  File "/usr/lib/python3.14/multiprocessing/pool.py", line 131, in worker
    put((job, i, result))
    ~~~^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/multiprocessing/queues.py", line 397, in put
    self._writer.send_bytes(obj)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^
  File "/usr/lib/python3.14/multiprocessing/connection.py", line 206, in se=
nd_bytes
    self._send_bytes(m[offset:offset + size])
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/multiprocessing/connection.py", line 444, in _s=
end_bytes
    self._send(header + buf)
    ~~~~~~~~~~^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/multiprocessing/connection.py", line 400, in _s=
end
    n =3D write(self._handle, buf)
BrokenPipeError: [Errno 32] Broken pipe

https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1041
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/3210

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


