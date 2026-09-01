Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECF6C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2839.1788250244034225691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vA3oLlfh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2A1F1A192F;
	Tue,  1 Sep 2026 08:10:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F8AC6053C;
	Tue,  1 Sep 2026 08:10:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AD1911C78AAE;
	Tue,  1 Sep 2026 10:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788250241; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HBzVgYDuZKrkWarshiTtubF576g3ygt4XNWlUAToE+Y=;
	b=vA3oLlfhVaAtH1P57cv40H6Itmo7FVN9kQiw/zJ9nxJcxmY3FfXIJ6YOLpRbgFRfKaFiNQ
	TxtL1MHC6Xt7TOjC3gKNapdTsRz3YtdMR7Qqa1wfLyuu8GbEZHoQ4kRtuQE8FtvP1XJ6IA
	fAhpMW5olivBQ3CMIS+syqZ1tMWtbRh3k1jij7ZnyLI0n6HpCbWCP//pLYyasuvDtZkx2p
	oGQaz/puygyfJAzxOGX0s6BACLERysDAW3dhIGt/RTGVgagq09kc96R6OsryFx17aUUXfr
	52Sd2rQfgfHnkzvuMYlVoWZsFLtd95DByftkfwmfkaL9qVwracZa4kVovBH42g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 10:10:36 +0200
Message-Id: <DL3TSXRF336O.2A2WSRP1RG8ZM@bootlin.com>
Subject: Re: [OE-core] [PATCHv4] boost-asio: Add recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <gustali@axis.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260831080952.2703441-1-gustali@axis.com>
In-Reply-To: <20260831080952.2703441-1-gustali@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244805

On Mon Aug 31, 2026 at 10:09 AM CEST, Gustav Lindberg via lists.openembedde=
d.org wrote:
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.
>
> Signed-off-by: Gustav Lindberg <gustali@axis.com>
> ---
>  .../boost/boost-asio/boost_asio.cpp           |  1 +
>  .../boost/boost-asio_1.92.0.bb                | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost-asio/boost_asio.cpp
>  create mode 100644 meta/recipes-support/boost/boost-asio_1.92.0.bb
>
> diff --git a/meta/recipes-support/boost/boost-asio/boost_asio.cpp b/meta/=
recipes-support/boost/boost-asio/boost_asio.cpp
> new file mode 100644
> index 0000000000..bf00c8ff26
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost-asio/boost_asio.cpp

Hi Gustav,

Thanks for the new version. It is still failing on the autobuilder:

ERROR: boost-asio-1.92.0-r0 do_package_qa: QA Issue: File /usr/lib/.debug/l=
ibboost_asio.so.1.92.0 in package boost-asio-dbg contains reference to TMPD=
IR [buildpaths]
ERROR: boost-asio-1.92.0-r0 do_package_qa: QA Issue: File /usr/lib/.debug/l=
ibboost_asio.so.1.92.0 in package boost-asio-dbg contains a reference to th=
e build host HOME directory. If upstream hardcodes a directory path that ma=
tches your home, you can set OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in t=
he recipe. [buildpaths]
ERROR: boost-asio-1.92.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4560
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4543

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


