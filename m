Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DC7C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:19:05 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.7597.1715843941064341174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 00:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=JK6aMPRO;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Rx3LxKpRTp3vbpXBvcTJfPVAWlGHmLSAGLdkp41rNtI=; b=JK6aMPROi5u9PkaNh8c+PsJ+Jr
	8Ct8t8fBkUpW7FgmH01GGdQSxHMiSqWPzzTKpLmJl7e61PUiOTorXlpkBFqx1ATlrRWj5MCVvu3X9
	stUbVvvk7maGewsIJz57C2J7Jd3AAQfSEbuSyue2miuDM/tbAxVdduBceRYl24RTCNPVLsvsELM9D
	6bKmUcsHWKEmYHOQZF49G1QKgpo56eli2cGIBqAm+bsvnFrY8XsTyu5EPbJzLfdkfxQz6Im3UlOmS
	SzzmPWzyIi/AccRwopNPnxJyn1ZdCEA4aBTkx3wMdKYEFesmWItQvcFuKLV9GG3SQKHlPQFmRDQ3w
	Fjz5QQiQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s7VOE-000BU6-UI; Thu, 16 May 2024 09:18:58 +0200
Received: from [185.17.218.86] (helo=[192.168.64.76])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s7VOE-000EeV-1g;
	Thu, 16 May 2024 09:18:58 +0200
Message-ID: <b086b556700672d356ce463c99aa351881997c3a.camel@geanix.com>
Subject: Re: [OE-core] [PATCH 05/10] base: Switch UNPACKDIR to a subdir of
 WORKDIR
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2024 09:18:58 +0200
In-Reply-To: <20240515115620.420558-5-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
	 <20240515115620.420558-5-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27276/Wed May 15 10:26:29 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 07:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199439

On Wed, 2024-05-15 at 12:56 +0100, Richard Purdie wrote:
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b2c500d8739..75c850760f6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -405,7 +405,7 @@ STAMP =3D
> "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> =C2=A0STAMPCLEAN =3D "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
> =C2=A0BASE_WORKDIR ?=3D "${TMPDIR}/work"
> =C2=A0WORKDIR =3D "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
> -UNPACKDIR ??=3D "${WORKDIR}"
> +UNPACKDIR ??=3D "${WORKDIR}/sources-unpack"
> =C2=A0T =3D "${WORKDIR}/temp"
> =C2=A0D =3D "${WORKDIR}/image"
> =C2=A0S =3D "${WORKDIR}/${BP}"

Why not use

  UNPACKDIR ??=3D "${WORKDIR}/sources"

like it's done in the individual recipes?


And shouldn't we do=C2=A0

  S =3D ?? "${UNPACKDIR}/${BP}"

also?

// Martin

