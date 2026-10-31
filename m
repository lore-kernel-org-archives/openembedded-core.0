Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2922.1793436056658575857
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 01:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q2TgVQcp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EBD401A139D
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 08:40:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFFD86076B;
	Sat, 31 Oct 2026 08:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FB4310329038;
	Sat, 31 Oct 2026 09:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793436054; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AVcq3tGKNJG/HYEfecduTztcxX66e62kTE2ZeGtO/uw=;
	b=Q2TgVQcpsOoTrs2Rx2g48V8Jjnw0fsz2miNd9obADDOBohCguZ2haz4Y1u8geafWxth2JF
	lytO7hIuj2W3DzRhcxv9rVg4vZdoMhYFw+cXaZPRHSUKMEjFd+oOBnebiNGCg4rWveeLsK
	gAxy/Qgas3k/ySEv+9JJyYFDWW0389T3NF890SaUr3UmfXTgevgcRjUPuWTr2nIJPHTAxO
	nBd7WkQm5myfUPdzqpjOYjp/QTOj1hRXBTDY1kcyeqLIFDHMqNT/gRc1x+I/G/kh+OhSwm
	QJ10Np5AODQarinxoFfTeA4674e3cBt3XXwNDYJfC0jBV5gjXI3pD1Y8I4r/Hw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 09:40:52 +0100
Message-Id: <DMIW0SRCNBTY.2KB4NAIZPNP8M@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] python3: Upgrade 3.14.10 -> 3.15.2
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261029210636.16016-1-jaipaul.cheernam@est.tech>
 <20261029210636.16016-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20261029210636.16016-3-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 08:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249144

On Thu Oct 29, 2026 at 10:06 PM CET, Jaipaul Cheernam wrote:
> ReleaseNotes: https://docs.python.org/3/whatsnew/changelog.html#python-3-=
15-2-final
>
> - Drop patches which are part of upstream release
>   - 0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
>   - 0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
>   - 0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
>   - valid-dists.patch
> - Add --without-system-libmpdec as EXTRA_OECONF configure option
>   (--with-system-libmpdec is needed new package mpdecimal [1])
> - Bump PYTHON_BASEVERSION to 3.15 in python3-dir.bbclass
> - Update python3-manifest
> - Refresh existing patches
> - Add two fixes needed for the new release
>   - 0001-gh-160881-Fix-test_is_python_process_non_python_subp.patch
>   - 0001-configure-clear-RUNSHARED-when-cross-compiling.patch
>
> Verification:
> - Built python3 for glibc and musl
> - verified ptest for all 34 python3 packages which supports ptest
>
> [1] https://github.com/python/cpython/issues/115119
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the new version, it does fix the previous issues.

Yet we still have a failure in glib:

AssertionError:
Failed ptests:
{'glib-2.0': ['glib/memory-monitor-portal.test',
              'glib/power-profile-monitor-portal.test',
              'glib/power-profile-monitor-dbus.test',
              'glib/memory-monitor-dbus.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4842
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4813
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2699

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

