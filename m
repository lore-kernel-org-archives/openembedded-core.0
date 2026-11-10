Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16201.1794301967168237652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 01:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZTydL0bq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C40D64E41535
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:12:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9954660012;
	Tue, 10 Nov 2026 09:12:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03E72103293D1;
	Tue, 10 Nov 2026 10:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794301964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qiWj9Bn2MUL9evT1eowm4//StL4oDB9TqwAied5f96c=;
	b=ZTydL0bqIbOgsrBrsxUc1hWriHE9Y0LHL0lMKWWSNKOpp4a46ppDM8wy25nyHPJhSgoTeQ
	hQPns54V4efVD0ptxl4byufgWH7lDWfhI/zjKVKq8sw+b+GGgP11WROlCfkFSktybM9CCu
	g1IpG3gfVuRWRxkIS+ZLRU2oi3RY7/kQZ+YU7IhAT4Tu9Wc1CzKYwBXgxakebNJfjMYe1E
	xDEF7HW5c16NvZcsv4Kni6qYDTl0Gh9u8XbaYlzmxOYmRreYWpoF3jaOU5+zmcy7JO2Zs6
	ZE+sJCri4ivzSCRZICyIIb8bOneAzYtOfaN5x6z9eOjlKIqXhSgy1DnmVln9Mg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 10:12:42 +0100
Message-Id: <DMREYM1S51G2.10R2U2S5VUY5M@bootlin.com>
Subject: Re: [OE-core][PATCH v2] log4cplus: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261104083458.12316-1-pratik.farkase@est.tech>
 <20261105081814.16384-1-pratik.farkase@est.tech>
In-Reply-To: <20261105081814.16384-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249912

On Thu Nov 5, 2026 at 9:18 AM CET, Pratik Farkase wrote:
> Build the GNU Autotest based test suite and run it under ptest, following
> the tar ptest pattern: the generated testsuite is shipped together with
> atconfig/atlocal, whose build-host paths and tool locations are rewritten
> to the on-target ptest directory. The test programs use libtool -no-insta=
ll,
> so the real binaries are installed with libtool.
>
> Tested on qemuriscv64 with ptest-runner.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

Hi Pratik,

Thanks for the v2, I confirm it builds correctly now.

> --- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
> +++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
> @@ -16,6 +16,78 @@ SRC_URI[sha256sum] =3D "374175c22fabe752eb1c20138e732b=
69ae191e641f92d32c9432985cd8
>  UPSTREAM_CHECK_URI =3D "https://github.com/log4cplus/log4cplus/releases"
>  UPSTREAM_CHECK_REGEX =3D "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
> +
> +SRC_URI +=3D "file://run-ptest"
> +
> +RDEPENDS:${PN}-ptest +=3D "bash diffutils gawk grep sed ${PN}"
> +
> +INSANE_SKIP:${PN}-ptest +=3D "buildpaths"

You should be able to remove this INSANE_SKIP now: embedding build paths
is likely the reason the v1 was not passing the reproducibility tests.
Now that reproducibility tests succeed, QA should also pass here.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

