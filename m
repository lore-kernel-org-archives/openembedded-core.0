Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9612.1794475026255388006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 01:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OJ14Qxog;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E73F21A1621
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 09:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B32DA5FF85;
	Thu, 12 Nov 2026 09:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CD8411BC030A;
	Thu, 12 Nov 2026 10:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794475023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uAqKGm5w4E9Qp2f66tdVMxseYAaFhg/OerymzactW7s=;
	b=OJ14QxogZjCZoTytR1FJSGJXfRP3PXwlz1V3+VCtiFvtCWaGBCik0iQIOlcGkjZ3WHwYxV
	1yjAkK1Eng85ODaBs2kQLd6IwZ25/xsrHc973oE6W7Z14ZH+AIWPMsLYVQ8qZrEKyCkGzi
	bSv1Ab5sh/fWybGWsCvehzRf/d1IvDKRin8uOE1tIa6SRT/N4LFBFrE15qfDeubWxzLnnf
	zZ3xQkN7clnQkd4wKBq2D0aogKnm+mKcyArjXbQ+hA1Jbba0dKl+j87GxwYjAjyPFSWL6b
	yZl/Q1AQ2511LX35E00g9ikIVMGgRYSfti+L1wJ+RAtRgl5/dUCXQDLNzYeJrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 10:16:59 +0100
Message-Id: <DMT4AZG7HHGE.3SZFW7TTHZV29@bootlin.com>
Cc: "Ross Burton" <ross.burton@arm.com>, "Thomas Roos" <thomas@roosesweb.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <roosesweb@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.1
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261108192525.1082675-1-thomas@roosesweb.de>
 <20261108214236.1294076-1-thomas@roosesweb.de>
In-Reply-To: <20261108214236.1294076-1-thomas@roosesweb.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 09:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250080

On Sun Nov 8, 2026 at 10:42 PM CET, Thomas Roos via openembedded-core wrote=
:
> PyAV 19.0.0, which Home Assistant 2026.11 pins for its stream and
> generic camera integrations, requires Cython 3.3: its generated code
> uses __Pyx_BEGIN_CRITICAL_SECTION, which Cython 3.2 does not provide.
>
> 3.3.1 contains the upstream fixes for the non-deterministic generated
> code that held back the 3.3.0 upgrade (cython#8045, #7982, #8025).
>
> Cython 3.3 still fails intermittently when it builds itself in
> parallel (cython#7997; #8008 and #8013 are not merged). Clean builds
> of python3-cython-native with PARALLEL_MAKE =3D "-j 32" failed 6 out of
> 20 times with 3.3.1 (and 8 out of 20 with 3.3.0), with the refnanny
> error seen on the autobuilder. With PARALLEL_MAKE =3D "" all 20 builds
> passed, so build serially for now.
>
> Refresh the line numbers of the build path patch for 3.3.1.
>
> License-Update: none, LICENSE.txt is unchanged.
> AI-Generated: Claude Code, Claude Opus 5.5
> Signed-off-by: Thomas Roos <thomas@roosesweb.de>
> ---

Hi Thomas,

Thanks for the new version.

It does look better, but it looks like we still see some intermittent
reproducibility issues. I had it on my branch for a few days, and
suddenly we had a failed test:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/python3-cython-dbg_3.3.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/python3-cython-src_3.3.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/python3-cython_3.3.1-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/python3-cython-dbg_3.3.1-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/python3-cython-src_3.3.1-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/python3-cython_3.3.1-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/python3-cython-3.3.1-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/python3-cython-dbg-3.3.1-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/python3-cython-src-3.3.1-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5342
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20261111-opb4ps2w/=
packages/diff-html/

Can you have a look at the issue?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

