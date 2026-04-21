Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E90F8FA70
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 12:44:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27532.1776775488918527502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 05:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i5D/aO0D;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5859F4E42A97
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 12:44:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25861600D2;
	Tue, 21 Apr 2026 12:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29F9E1046082F;
	Tue, 21 Apr 2026 14:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776775485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LgNFCZ+oEUEjdsUmAq2p+viqsPFlQ766nt3tzwIBPuk=;
	b=i5D/aO0DfOwk0n6rqaLeN/a7Z9FGOBcMESKmp+7dcw0C5oC01AcozgVaeDA3zOY/3itn+L
	SgU59s5DJFxu2nQv1IVptL9zfkwRBxMEha85O4FRyV9BH+6vc7eqPJgNv9yvBUUwj85Eqb
	l7d+B8f626zY7TQ+JSHmtAmi/XaN+03yKJLPHWl/eA7lHu9ri/F+4ojLRnoasfKBAAL/XN
	IPWZsJKzrUX4mktS05ysz34wnunGlHWimqcsSDkSd468C36hKJyK0XrpNr8ayDYYWTpEGy
	rVGy1pG5FL6eWAWCjTmWaMqZrmoyS6k6Iq0ECfowlyWWQK5SAi3oQ9mn/qxBwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 14:44:43 +0200
Message-Id: <DHYUCCNDYUDR.1S88LEZPSWYY1@bootlin.com>
Subject: Re: [OE-core] [PATCH] sbom-cve-check-common: print warnings on
 unpatched CVEs
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
References: <20260421-sbom-cve-check-warnings-v1-1-df7861a0a0bc@bootlin.com>
 <9369197a4e7f2d032decc797406ecba201fe6799.camel@pbarker.dev>
In-Reply-To: <9369197a4e7f2d032decc797406ecba201fe6799.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 12:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235676

Hi Paul,

On Tue Apr 21, 2026 at 1:08 PM CEST, Paul Barker wrote:
[...]
>> +SBOM_CVE_CHECK_SHOW_WARNINGS ?=3D "1"
>> +SBOM_CVE_CHECK_SHOW_WARNINGS[doc] =3D "Show warning messages when unpat=
ched CVEs are found. \
>> +Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
>> +
>> +def show_warnings_from_file(cvecheck_export_file):
>> +    import json
>> +    report =3D {}
>
> We shouldn't need to initialise report here as it is always set if we
> get past the try block below.

Yes indeed

[...]
>
> I think this can be:
>
>     show_warnings =3D bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_W=
ARNINGS"))

And yes this works too and is slightly shorter. I'll send a v2

Thanks!
Antonin

