Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A17C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 08:59:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18146.1784624380892011209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 01:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mtOOkKz6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E56A4E40E98
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 08:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E29E60368;
	Tue, 21 Jul 2026 08:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6B6C11BD1290;
	Tue, 21 Jul 2026 10:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784624377; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7WOj7evuZzpb+DwDYOITbbLdSd5WQ6tSxCa+z+W6byI=;
	b=mtOOkKz6caOtuC5NZ7+lBhjrOIAdfYAfblm9HbLoQkiictJkJ1B0ltG35t5CthXCjp1gsO
	BqNdX8ZbYYiWD1C6arLgw5a4jfgs/1PFeBN9Cr+P0DGqCerKXG7+/1SIkSREebRyum7SWV
	LN6XGmr4GLgS442B2xVjZfeyCoaKnDV7k8lwRKMDW+nCA0xb6/gKrX3oOkkl5S5jaNdH+s
	KZznIht0NIDGLpFdjxSc8DX4ENBYIfknuve1BkWqPLoRJKIrS1Jt+aWgVPUy5L3npTWNpT
	JXP9LTUnA+oarrJKkz1ESDqQaD9ePTpr/wkZ9AlOHS5W6V6YanZbjafnRsx2Cw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 10:59:35 +0200
Message-Id: <DK44JK3QR4SC.3DJQQJPJZW4ER@bootlin.com>
Subject: Re: [OE-core] [meta][PATCH v3 2/3] oeqa/selftest: Add
 go-vendor.bbclass selftest suite
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <john.ripple@keysight.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260717213253.3454786-1-john.ripple@keysight.com>
 <20260717213253.3454786-3-john.ripple@keysight.com>
In-Reply-To: <20260717213253.3454786-3-john.ripple@keysight.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 08:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241512

On Fri Jul 17, 2026 at 11:32 PM CEST, John Ripple via lists.openembedded.or=
g wrote:
> Add govendor.py with two test classes that cover the behaviors fixed and
> defined in go-vendor.bbclass:
>
> GoVendorSrcUriTests (offline, ~10 s): unit tests for go_src_uri() parsed
> via bb.tinfoil; verifies the basic URI shape, path/pathmajor/subdir/repla=
ces
> encoding, and that non-git VCS omits the git-specific nobranch/protocol f=
lags.
>
> GoVendorTaskTests: runs do_go_vendor once against the real recipetool-go-=
test
> project and checks that external deps land in vendor/, *_test.go files ar=
e
> excluded, pathmajor=3D/v5 falls back to the repo root when no v5/ subdir =
exists,
> modules.txt is reproduced in vendor/, a local replacement (./is) appears =
as
> a symlink, and the S/src/GO_IMPORT/vendor -> S/src/import/vendor symlink =
is
> created.
>
> Exclude the govendor test recipes from world builds since they are only m=
eant
> to be built directly by the govendor test suite.
>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---

Hi John,

Thanks for your patch.

> --- /dev/null
> +++ b/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Selftest fixture: go_src_uri parameter variants"
> +LICENSE =3D "CLOSED"

Using "CLOSED" is now deprecated, if you rebase on today master you will
see an error:

WARNING: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1874=
317/meta-selftest/recipes-test/govendor/go-vendor-src-uri_1.0.bb: go-vendor=
-src-uri: LICENSE is using "CLOSED", which is deprecated. Convert to using =
a license ref pointing to an actual license file, e.g.
LICENSE =3D "LicenseRef-go-vendor-src-uri-CLOSED"

Can you send a new version of this series, with the licence fixed?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


