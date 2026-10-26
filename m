Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39595.1793008331554758218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 02:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DjupZc52;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7AE071A1339
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 09:52:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40FC460740;
	Mon, 26 Oct 2026 09:52:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73ADA10328E76;
	Mon, 26 Oct 2026 10:52:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793008328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+cJxLkFD0pAeRzjn6e/0V+Xi8FLzwN3IZsM8MdfCVvs=;
	b=DjupZc52CtXKLY1rgxLCBccMYgEXJg8spXlfkrB5mBBDjYdepP67HSGvIr8HnJXeGiMLaZ
	yE0eWhdJo+At1tWAGkJx2iA8bXVrEiX1og9kdnPoSIGRNhFWuKERv3avwgvaJE9t+vghHL
	7QGBIP4kCqVhoCRxRYTqxLkRiQLVyBuszdjNBfq5B0i4NUmJruviJNJRre0nhNDNp25ofe
	UL05jT+pWaGvkBBAAKAiyjmWFp/L+EF0Bl/1s0eCV7PfBmQiOpkH6azSN4CeCarVJNPQe2
	pl6kdVpiAwgxk/FZLiJlAabHY9HkZLhqoTJ7idiFIQ7hYc7JFdjE5B77ZOUq2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 10:52:06 +0100
Message-Id: <DMEOEM1AQMXF.2G3AUDYC8DEOF@bootlin.com>
Subject: Re: [OE-core] [PATCH 6/6] icu: Upgrade 78.3 -> 79.1
Cc: "Trevor Gamblin" <tgamblin@baylibre.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
 <20261023112949.77631-6-jaipaul.cheernam@est.tech>
In-Reply-To: <20261023112949.77631-6-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 09:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248659

On Fri Oct 23, 2026 at 1:29 PM CEST, Jaipaul Cheernam wrote:
> Release: https://github.com/unicode-org/icu/releases/tag/release-79.1
>
> - Refresh existing patches
> - 0001-test-Add-support-ptest.patch updated for 79.1
> - Drop copying of testdata as it is part of source now [1]
> - Increase ptest QEMU memory to 4G: new 79.1 overflow test
>   ICU-23537 allocates a ~2G buffer, which OOM-kills the test on
>   the default 1G guest [2]
>
> - ptest results (qemux86-64)
>   995 tests passed, 0 failed, 0 skipped.
>
> License-Update: Copyright years updated.
>
> [1] https://github.com/unicode-org/icu/commit/a9fdce608194b080e1b1372e2dd=
b53d98822a7ca
> [2] https://github.com/unicode-org/icu/commit/d37a22cb9921a76268e325fdca7=
d3e70a6851191
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for your patch.

It looks like this is failing on riscv:

AssertionError:
Failed ptests:
{'icu': 'START: ptest-runner\n'
...
        'ERROR: Exited from signal Killed (9)\n'
        'DURATION: 1561\n'}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2672

As usual, qemu is way slower on this platform and might show issues
hidden on other platforms.

Can you work on the issue?
Trevor, any thought about it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

