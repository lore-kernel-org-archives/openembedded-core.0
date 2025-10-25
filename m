Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D084FCCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 10:42:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.3345.1761388943341942420
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Oct 2025 03:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rXSpp8Mx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DD66DC0AFDD
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 10:42:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8D4860704;
	Sat, 25 Oct 2025 10:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4694102F24B5;
	Sat, 25 Oct 2025 12:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761388940; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2IjG/jGSh/mN9CuroOkJNPH0e+ScMwhlO8EBZQ3W6PM=;
	b=rXSpp8Mx2eTHsVo19XSQKrV7t8UxDuJwEOti6Qx85K/wpsP+Xojrcs2oGtLxTiU01mjogx
	/Xsd/7FdSXIKsoDtHNHL3u4+v5YnzKvWJYF1fh6qoO+92vrZ6N0jScdNOCrPXvxH/k0iv6
	67BLFnC/lhRuls8Cnrlw2JSbQgQ2xKs9SdijElN8oDbxW7ItYg5WPdTAVOMKFWQbskDLsM
	y9L6O6Yyrd88ROJFF/mWqCHpbU38jrdlpVlCm6Gw176rGtNLmzx2ElBgqViSmhb2e9eyor
	N4mPqOJR01hJ4sNzBwwfCce9M1c6f2TB3RvSFm+SAPqBxpBr/yZcOTS56HpbQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 12:42:16 +0200
Message-Id: <DDRC9MRK2AIG.3678WEEWAGRAT@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] libxslt: add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251022204136.8276-1-pratik.farkase@est.tech>
 <20251023153459.49699-1-pratik.farkase@est.tech>
In-Reply-To: <20251023153459.49699-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 10:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225306

On Thu Oct 23, 2025 at 5:34 PM CEST, Pratik Farkase wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Enable --with-plugins only when ptest is enabled, per review feedback.
>
> v3:
> - Remove unconditional --with-plugins (leftover from v2)
>
> v4:
> - adapt run-ptest to emit PASS: or FAIL: lines for each test
> - run-ptest installation with proper permissions
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version.

It looks like we got another issue now:

ERROR: libxslt-1.1.43-r0 do_install_ptest_base: Execution of '/srv/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/libx=
slt/1.1.43/temp/run.do_install_ptest_base.9881' failed with exit code 1
...
| install: cannot stat '/srv/pokybuild/yocto-worker/qemux86-world/build/bui=
ld/tmp/work/x86-64-v3-poky-linux/libxslt/1.1.43/run-ptest': No such file or=
 directory
| WARNING: /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x=
86-64-v3-poky-linux/libxslt/1.1.43/temp/run.do_install_ptest_base.9881:209 =
exit 1 from 'install -m 0755 /srv/pokybuild/yocto-worker/qemux86-world/buil=
d/build/tmp/work/x86-64-v3-poky-linux/libxslt/1.1.43/run-ptest /srv/pokybui=
ld/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/lib=
xslt/1.1.43/image/usr/lib64/libxslt/ptest/'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2636

Can you have a look at this error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


