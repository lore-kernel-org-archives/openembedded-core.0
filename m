Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15746.1793815498210907143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 10:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S/TN2Uc3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04D3C4E41404;
	Wed,  4 Nov 2026 18:04:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDB4F60770;
	Wed,  4 Nov 2026 18:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AED4410329206;
	Wed,  4 Nov 2026 19:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793815495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hgoiZW7BvdoHVYu+DaDdE8iIHh9UC6rUJXd1wYW41Vw=;
	b=S/TN2Uc3O2G4xixKuxBbiEoBFrGx+qh1MFIt4zK+xJUFdzc7qScjsuiqvNUrpREtbdZnYW
	+/U+Tgw+Hlo8Q57y3Sx0/FjnmlMfpHgly1+kUCVAzH4OHibZY8qrTzXWOnvxQLZ6iRGIJU
	oRjBF1hexrCxoCHNb5duaJTeHQNHEfEbmWMVBX6T21daSQib7tfbW5VzJEJR7SHKCLZjym
	mXXt/mePqyADt6UdsEQCfvHLlPBH6r/2Orge7ji3TaCAtFNEPT3yR6mRHaKrQ52ObQOFmf
	o6S/Z8bOi7H+imwt3+R4FTz+4eLmI57gGt0XRKYkcB7g7AiGAdafP0lRmfV42g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 19:04:52 +0100
Message-Id: <DMMMISSKFSB9.EFZ7EVHQ5AE7@bootlin.com>
Subject: Re: [OE-core][PATCH] log4cplus: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261104083458.12316-1-pratik.farkase@est.tech>
In-Reply-To: <20261104083458.12316-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 18:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249411

On Wed Nov 4, 2026 at 9:34 AM CET, Pratik Farkase wrote:
> Build the GNU Autotest based test suite and run it under ptest, following
> the tar ptest pattern: the generated testsuite is shipped together with
> atconfig/atlocal, whose build-host paths and tool locations are rewritten
> to the on-target ptest directory. The test programs use libtool -no-insta=
ll,
> so the real binaries are installed with libtool.
>
> The headers-compilation group is skipped as it recompiles the public
> headers, which needs a toolchain that is not present in the image.
>
> Tested on qemuriscv64 with ptest-runner.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

It looks like the ptest recipe is failing reproducibility tests:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/log4cplus-ptest_2.2.1-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/log4cplus-ptest_2.2.1-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/log4cplus-ptest-2.2.1-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5295

Diffoscope output can be found here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20261104-ggu_ffd6/=
packages/diff-html/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

