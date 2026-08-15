Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAE9C5CFDB
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 16:20:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11701.1786810836798907996
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 09:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YNa1/PDk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 046001A166D;
	Sat, 15 Aug 2026 16:20:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1A65604AA;
	Sat, 15 Aug 2026 16:20:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 880B011C4F5C8;
	Sat, 15 Aug 2026 18:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786810830; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ntwTGsF7THe5k52oCDj73yScYTl9Yw4F29AcVkxOTDE=;
	b=YNa1/PDkzvOdZ5YGrQtdK0abW0Gz7BFVQuli+i1j/G87cjlzz/bBAWboCFeX638MZq0JTN
	33BxIwjcoFaDoDb5GYzwROXlQWZwJmLRQxKOKLxrG9tRp+g28bTjcwDbyAontshT1YPSFm
	NIKTjmXs4wA5d88RkUTzSWrKb5/W2v9sa5KHTfUMJ1PnP2d4u+7F44lKc2DNwk+mKLr/7R
	qE9EpilFcohMB2/8y9xwkCO1xmPZdQ3/Fe3eyAOKV2gORasoR5TJbVyCrrWnySgOKfQ36S
	frLTq/YjMY0eo0LVBMyNJESPYr/WpS0oJ8cLM2kQ/6pgZbnvnjPIv5D7E81skQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 18:20:28 +0200
Message-Id: <DKPNKQUB6NV8.2V3BZZIP7TQ90@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/7] openssl: upgrade 3.5.7 -> 4.0.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260814051829.35088-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260814051829.35088-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 16:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243497

On Fri Aug 14, 2026 at 7:18 AM CEST, Jaipaul Cheernam wrote:
> Upgrade OpenSSL from 3.5.7 to 4.0.1. This is a major version upgrade.
>
> Changelog: https://github.com/openssl/openssl/blob/openssl-4.0.1/CHANGES.=
md
>
> New CVE fixes not already in 3.5.7:
>   * CVE-2026-28386: Fixed OOB read in AES-CFB-128 on x86-64 with AVX-512
>   * CVE-2026-35188: Fixed double-free when checking OCSP stapled response
>   * CVE-2026-42765: Fixed NULL deref in cert verification with OCSP
>   * CVE-2026-42771: Fixed OOB read in X509_VERIFY_PARAM_set1_email()
>
> Major breaking changes in 4.0.0:
>   * Removed support for engines. The ENGINE API is fully removed.
>   * Removed support for SSLv3. SSLv3 has been deprecated since 2015.
>   * Removed support for the SSLv2 Client Hello.
>   * Removed per-version TLS method functions (SSLv3_method(),
>     TLSv1_method(), TLSv1_1_method(), TLSv1_2_method()).
>   * Removed c_rehash script tool. Use 'openssl rehash' instead.
>   * ASN1_STRING has been made opaque.
>   * Numerous API function signatures changed to include const qualifiers.
>   * libcrypto no longer cleans up globally allocated data via atexit().
>   * Added AKID verification checks when X509_V_FLAG_X509_STRICT is set.
>   * Support of deprecated elliptic curves in TLS disabled at compile-time
>     by default.
>
> Recipe changes:
>   * Drop 0001-Added-handshake-history-reporting-when-test-fails.patch
>     (merged upstream via PR #22481).
>   * Refresh remaining patches against the new version.
>   * Remove ENGINE API artifacts: engines package, dasync.so/ossltest.so
>     ptest installation, ENGINESDIR references, OPENSSL_ENGINES wrapper
>     variable, and cryptodev-linux PACKAGECONFIG.
>
> Tested: ptest on qemux86-64:
>   Files=3D362, Tests=3D4310, Result: PASS
>   Passed: 338, Skipped: 24 (fips, lms, rc5, tfo, compression,
>   sslversions, sslkeylogfile, external tests - all expected)
>   Failed: 0
>

Hi Jaipaul,

Thanks for your patch.

I gave it a go on the autobuilder, and we can see some build issues.

A first one (multilib related ?):
ERROR: lib32-openssl-4.0.1-r0 do_package: Execution of '/srv/pokybuild/yoct=
o-worker/multilib/build/build/tmp/work/x86-pokymllib32-linux/lib32-openssl/=
4.0.1/temp/run.multilibscript_rename.3735101' failed with exit code 1
...
| mv: cannot stat '/srv/pokybuild/yocto-worker/multilib/build/build/tmp/wor=
k/x86-pokymllib32-linux/lib32-openssl/4.0.1/package/usr/bin/c_rehash': No s=
uch file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function do_package finished
NOTE: recipe lib32-openssl-4.0.1-r0: task do_package: Failed
ERROR: Task (virtual:multilib:lib32:/srv/pokybuild/yocto-worker/multilib/bu=
ild/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.=
1.bb:do_package) failed with exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/4374
https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/4374

And a second one:
ERROR: openssl-4.0.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/openssl/4.0.1/temp/=
run.do_compile.3557282' failed with exit code 1
...
| ../sources/openssl-4.0.1/providers/implementations/keymgmt/ml_kem_kmgmt.c=
:25:10: fatal error: prov/der_wrap.h: No such file or directory
|    25 | #include "prov/der_wrap.h"
|       |          ^~~~~~~~~~~~~~~~~
| compilation terminated.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4341

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


