Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ECFC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:58:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13656.1785995930460986520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QSUGmvZd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33CB11A1462
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 05:58:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0957C603D7;
	Thu,  6 Aug 2026 05:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE49411C3599F;
	Thu,  6 Aug 2026 07:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785995923; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=56YaTdEp75eL+MMORaOqovwfknyoRQlodOawF794VVM=;
	b=QSUGmvZd25QIiLVeEKe9po0wwmig3UMe7Wwz3f5EKpjiAPp3xjL9HtnG2a73wPZKXuxxbL
	v1ih3UGH1/ZUuedCx7LZ828kJv0PHJ0Q2zF/W3WMfn0kYSCBpKffqCvuCo9eviOwTdIsZ3
	zUKzQQXsDUw9EsJRwkgNUwO7hh3HR+qxqN/BjAkIFMmCQQdJLeOJRiZYQ+x+VK+rdIqQ8a
	tizFJsR0tf4QWM2aTxYyDU07Xy9Fqkg0RGcUkvBv5oBUN+tG5TKasl2Br4TsxWLgsUT5NV
	vbowpC00GnR5+lSB8ZI2bOIrHHmGv883g9PuYBZA/LaOmwGIl3/fcB98tNWZJQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 07:58:41 +0200
Message-Id: <DKHMPRMDWGEP.3NF324RFG6OHF@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alhe@linux.microsoft.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] bitbake.conf, rust-common.bbclass:
 include RUST_BUILD_SYS in the task hash
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
 <20260804220456.2342710-4-alhe@linux.microsoft.com>
In-Reply-To: <20260804220456.2342710-4-alhe@linux.microsoft.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242899

On Wed Aug 5, 2026 at 12:04 AM CEST, Alejandro Hernandez Samaniego via list=
s.openembedded.org wrote:
> RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
> tells bitbake that rust recipes should hash-match regardless of the
> build machine's triplet. In practice that is not true:
>
> rustc computes each crate's Strict Version Hash (SVH) using inputs
> that include the *stage0/stage1 bootstrap compiler* fingerprint, which
> in turn depends on the build host arch. That seed cascades through
> every dependent crate's mangled symbols and the packing order of
> rodata sections, so an sstate blob populated on one worker arch and
> reused on a differently-arched worker produces byte-different (but
> semantically identical) artifacts and fails the reproducibility
> selftest causing autobuilder intermittent issues when the sstate
> matches for the incorrect architecture.
>
> Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
> tracks the build triplet and mixed-arch autobuilder pools get an
> sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
> RUST_TARGET_SYS stay excluded because they're already covered by the
> target/host arch hash inputs.
>
> While this is not ideal, it should unblock the reproducible test case,
> another solution would be to patch rust sources manually and attempt
> to upstream that change.
>
> This also has the side-effect that multiple variants of the conflicting
> rust recipes sstate artifacts are created, but they'll be correctly used
> now in each architecture.
>
> Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
> declarations in rust-common.bbclass so future readers don't re-add
> the exclusion.
>
> Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
> different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
> graphy/cargo/librsvg, where previously the hashes matched despite the
> build machine change.
>
> [YOCTO #15554]
>
> Assisted-by: AI - OpenAI
> Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
> ---

Hi Alejandro,

It looks like this is breaking some selftests:

2026-08-05 10:11:05,494 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs.test_sstate_sdk_arch_same_hash (subunit.RemotedTestCase)
2026-08-05 10:11:05,494 - oe-selftest - INFO -  ... FAIL
...

2026-08-05 10:11:05,495 - oe-selftest - INFO - 6: 27/69 496/763 (108.24s) (=
2 failed) (sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash)
2026-08-05 10:11:05,495 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 416, in test_=
sstate_sdk_arch_same_hash
    self.sstate_hashtest("aarch64")
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 401, in sstat=
e_hashtest
    self.assertCountEqual(files1, files2)
    ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1238, in assertCountEqu=
al
    self.fail(msg)
    ~~~~~~~~~^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native=
/3.24.52.do_create_spdx.sigdata.469683d7e676bd4feadb3e363efaa9a55c47eb06559=
fcda0d3f5cf26473919c5'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native=
/3.24.52.do_populate_sysroot.sigdata.c29ff418823da4b52189a4cf7395c310a3c14f=
ed57eb24562cd0e387fe2235a3'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/gtk+3-native=
/3.24.52.do_create_package_spdx.sigdata.ede62d86abb84a871e239607d0a7173c6a9=
c45027aafffc624b37e2e1bb5111f'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/=
1.96.1.do_create_spdx.sigdata.76ed6652ba8e8eba4e8750240fa7a048fcc90e94b45e7=
53068a44560ef2e29f0'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/=
1.96.1.do_create_package_spdx.sigdata.4234a33aff5f4b52703a74c1caec189320647=
6f908c70b32c78e46dcc3e4fb38'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/=
1.96.1.do_compile.sigdata.67ed98cf74ac06f829d6432f4fd904779b2f6e540f588baea=
b3dcf0ac35a9c75'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/=
1.96.1.do_populate_sysroot.sigdata.3203f6ea1fd6bb92ed523ba0e1ef0464166f1e53=
92207ea002c35e0007d435f9'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3278758/tmp-sstatesamehash/stamps/x86_64-linux/rust-native/=
1.96.1.do_configure.sigdata.df7cc5717b4cbc2ccb19bdb823fb55193cc2f95049ac7e0=
7d440bc2da5590c96'
...

And same for sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash:
2026-08-05 10:07:29,974 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs.test_sstate_32_64_same_hash (subunit.RemotedTestCase)
2026-08-05 10:07:29,975 - oe-selftest - INFO -  ... FAIL
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4472
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4290

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


