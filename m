Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CBFCCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 05:56:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.25647.1761544588128937708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 22:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JjbYj1Sa;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0FEAC0CDF6;
	Mon, 27 Oct 2025 05:56:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB7A36062C;
	Mon, 27 Oct 2025 05:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EA8C102F24DB;
	Mon, 27 Oct 2025 06:56:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761544585; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sWyiSG4oxrKwIoDHhyPitFS8oRe/zbXtMXzCwnnliNI=;
	b=JjbYj1SaxYH9tYrNZTcpJ6gSobHFMf19yDL7avK7dZjZHpjyNVN/OR5cjG9Vcy7/pYHzKH
	j3+P6agABoDjMp++KKw2FXW60OTAt9gNnqknLPdhn10oz+uF2ZPB/J1NbFi3ST0cpcmSnQ
	nCZ4bXfxqEPKNzkp3ZqglGj1p5RhOr4WQAfNM9Y22Hxyc/pVVFM2735Hr29D2f8JHMKUFB
	KAdRsiG/KyfyFqjsXd2qrxfumzo2KrwHcZlA+1XNT5E0ZBUmLh4qHHEhLuN6ws0PPiXq28
	43UuDbtOJOmgTvfNyr20UOGyYcUGDCjQ8FaSk59ih6ak0pgIOi/OY/VGQLf9+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 06:56:17 +0100
Message-Id: <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
In-Reply-To: <20251025132107.9296-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225319

On Sat Oct 25, 2025 at 3:21 PM CEST, Pratik Farkase wrote:
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
> v5:
> - Added FILESEXTRAPATHS using ${BPN} for multilib-safe lookup of run-ptes=
t
> - Guarded run-ptest install in do_install_ptest() to avoid autobuilder fa=
ilures.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version, but we still have some ptest related errors:

AssertionError:
Failed ptests:
{'libxslt': ['runtest_returned_1', 'some_libxslt_tests_failed']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2496
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2535

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemuarm6=
4-ptest/core-image-ptest-libxslt/
https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux86-=
64-ptest/core-image-ptest-libxslt/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


