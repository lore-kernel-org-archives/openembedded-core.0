Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F641088E71
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:38:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2001.1773941903391535334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VC62zM8f;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A0614E4271F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:38:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1736A60050
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:38:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E83510450A86;
	Thu, 19 Mar 2026 18:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773941900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bceXykhqQLL1k1rJ3AlaqKhFE76c8ZLojuGQ3axw8+U=;
	b=VC62zM8fs6+tZ+d7FnwbKvhCj9QwsOhnntzvPSOXFRPFfRv9wdxql7tDsCY6X8y4W8aVVB
	RmM6eqjl7OsOiF4tDjcvjBdlgVw6toSILQ30zS0iwlSjoFZUWUM1WdlFuv3xuLCLcW0i8t
	ItqE/MEFHJBfHcLWEFLQCChfte73W7Bu5Q5UAe6l5MZpSjCIM4/q7m1F668fkruiyL3JFr
	82yDgZ3htqAtfFzbMYkmpIZdC8/rK2IOZQuDWTEjYUiodw8Tru5iGLcmji9745pYQWy9fI
	yyO2VoaKoARgkZLOq6a0uo2Bo5S99uT/YnkffNu7vQdM6BiMvB3iJFDCRNStuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 18:38:18 +0100
Message-Id: <DH6XX5V3YO6B.2PRKV55NZP37I@bootlin.com>
Subject: Re: [OE-core] [PATCH] ltp: fix warning in
 remove_broken_musl_sources
Cc: <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233545

On Thu Mar 19, 2026 at 2:29 PM CET, Joao Marcos Costa via lists.openembedde=
d.org wrote:
> If this was originally intended to be an actual warning, it was not
> behaving as such: echo only prints to log.do_patch, so the message ends
> up hidden there.
>
> Replace 'echo' by bbwarn to display the warning message correctly.
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---

Hi Jo=C3=A3o,

Thanks for your patch.

>  meta/recipes-extended/ltp/ltp_20260130.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-ext=
ended/ltp/ltp_20260130.bb
> index 75c5b8b7bd..36432c15b2 100644
> --- a/meta/recipes-extended/ltp/ltp_20260130.bb
> +++ b/meta/recipes-extended/ltp/ltp_20260130.bb
> @@ -126,7 +126,7 @@ remove_broken_musl_sources() {
>  	[ "${TCLIBC}" =3D "musl" ] || return 0
> =20
>  	cd ${S}
> -	echo "WARNING: remove unsupported tests (until they're fixed)"
> +	bbwarn "remove unsupported tests (until they're fixed)"

So I believe this will add a WARNING on all musl builds, right? I'm not
sure we can really accept that.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


