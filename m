Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8196AF9D0CC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 12:28:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17666.1776169695693021746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 05:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WLs4Hjv7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85B384E4299A
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 12:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5545D60410;
	Tue, 14 Apr 2026 12:28:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D060104500A0;
	Tue, 14 Apr 2026 14:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776169692; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tm7t9/jh/nLOeb3ImSiZltcEhBzOZ7unCnDsFvkM9B8=;
	b=WLs4Hjv7zaT1zgko7OWi6b+KLYFS44WSZEQdIUR6hSjr78+Iz/EC3o21mm4ydA34QZF0IH
	TKs7ECFomqTexoAQ9w9uoKbxDEjJNvVAu8bDSyr+Fcp/NhWncveiwcdFbxqQeo/dXliCsP
	EiAn4YEGH+snz8pdif510YToQVQV0FxHtHFFdpxMhE36PDNTCPtiCTGT4r4N+QI3MBrVEJ
	Z7kN1KEml4m6VCXVpELQHIpwyGI1lyzFIB2vEyWlQ4KVf0qrfUX7j/0TeJqKZhhMcNXbqb
	IcVbpKENjqPD6EVtwIAUx6UEZIro9Sig1HLdPH7n8nSSbE5pBuZsHZ3bMj8JEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 14:28:11 +0200
Message-Id: <DHSVLVSPJVIA.3O7O5GO5SMAIY@bootlin.com>
Subject: Re: [OE-core] [PATCH] apr: remove -std=gnu23 from apr_rules.mk to
 fix reproducibility
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260412105750.3342374-1-martin.jansa@gmail.com>
In-Reply-To: <20260412105750.3342374-1-martin.jansa@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 12:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235156

On Sun Apr 12, 2026 at 12:57 PM CEST, Martin Jansa via lists.openembedded.o=
rg wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> With the updated ax_prog_cc_for_build.m4 from
> apr: fix build with autoconf-2.73
> it now correctly detects -std=3Dgnu23 usability on host gcc and doesn't
> try to use it e.g. with gcc-13 which doesn't support it, but that causes
> build reproducibility issue between builds on such hosts as
> CC_FOR_BUILD is included in installed /usr/share/build-1/apr_rules.mk
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-a5w4mcr=
k/packages/diff-html/
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---

This fix got merged, but it looks like this is not enough: we sometimes
have a whitespace diff, like on this build:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260414-82oogy25/=
packages/diff-html/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


