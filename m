Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5136ACA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 14:30:26 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10723.1791383415787053740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 07:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=HDZatmR9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Wch1jVSa;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ADC3D1400113
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 10:30:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 Oct 2026 10:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791383414;
	 x=1791469814; bh=ksEtF8SLUVkya3+HavKtVLjCduEleMtuIfj5dsiT2lA=; b=
	HDZatmR96jZ+U4dyOOk6nL+RnsaCPZOKdIB73n7vqdgqrD+/FAiRwAy2uhkXWJVw
	AxpJqQI54wywX1DYW/tr9ohqRAk09SbnxY4mxRMHydZJmQG7Z0NHYYBWkOfWBqnc
	ZOxoB6TAMB53I/V6b2KGExCtFQTuhGi8gXkmHZIFLTzeTB1+XFpC1MSsY1naifoa
	viYhqlDx0fHgI10B8l4ka/hXTqO28Q4j36IbmQzIAtkstkt7RuyeEmuAPLCFGvk/
	3OoG/yBWLoavvyuekYTalhfWvGttgiH07q0gRjtjLkFl4h6Y5T6qMdjVRH8bnNaZ
	voFUdFGl8hwJKCt14XWMKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791383414; x=
	1791469814; bh=ksEtF8SLUVkya3+HavKtVLjCduEleMtuIfj5dsiT2lA=; b=W
	ch1jVSa9emFKxi212GXhdv4pdiL8Lk1mKqRM0PmMyPvDS2NrO8NovI/zvfWxCAjw
	UFp8Cni3XTQRk+YWb4PMn4kTrblGmyE5Z+d2kVu8/O8XuIeEOfez9urQDgKiud4y
	vcWoW0zH7B/1h+PDXLIEyKobFzrZehdLt1xbCxLyKN5G1F/plY+pIOIFr4zOkBG8
	CdtM1OEPsenIRS8x481QEkQN+eAGosx7WjIPkYDgRhn2LwfAlnvNuOQGUks9DqTy
	KQa9yaI+vs3cxQfA55MrZE1YrM1p6mwmV3ExgLqO1HA028pI8tCYNv6Ca1Gg716i
	KCUKBowUznYgp7ESGvfdw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791383414; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:h7xPKTI6QXHUa71fd/fj2UvZMqhrUwHtd5dbMXbR/8O6lEt
	vWqHPcyxWGldLB20aYnas6J3VvyO+iMes1o7w6pS0V6lPajSp45vC/RXdXxtI5+4
	qnGwZPBVPZ/aBJmT+xYvXVN6oP2A6vcno6Cl+QjjXO48W8sa48NX/rGYEzDobpZd
	zYTvbB1+N9vmnZ551uV6FFgZtguZ6Qn+1U5MdA8HtDjxrJc4AbNXJ+ckJQlQr9Oy
	F/5qmZFf/xhT2XsyakoGlej1hlElUtV9drCgfzY/2m9Wbn5WXBwhskPQjNZEsocO
	mm/CrlhtGgNtWtYuE6CcWFBJBkLGVJ/JugPU/Hw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:ncBAvjB5SM4owttPfwVCcNoqQMXeeb0OkmyyojgJQTo=:d02z+VXEEdJoX/bsUCxvDHDJ4Rzd3RGCkQYBXX2/Qcs=;
X-ME-Sender: <xms:dlfGat46kzcMrX2zZgpShfv-UYJRoExT3nT0u6bD7EPEmlU1V5CgMQ>
    <xme:dlfGaiV8DWtQLBRAJVYvx4QGQB84Jzpam4cS95TLP7zviDgqsFWEs3oLiaZxhZoev
    VEW7Ieev8cqBdOP200BdAJb1yVhMwd2TWVy-48K_swgvdaeFQo13KRX>
X-ME-Received: <xmr:dlfGah0i4W5TgicEKZhGJGrI1RQDFuZ58T1uEPtxlrjpUW00wIGqPQFmcomw1h1xGOOFIH09AUQnZ0aUMcP7-P0>
X-ME-Proxy-Cause: dmFkZTGqDY1TxSS+HW9fkjQOANoiVFNtVhnWnsucuEihUWT6mE896j0XIbed3g544jPwVA
    eyKGGZr1jSJhgCJeFRZrt8aZ8Ldu0pNU4aAbnTfBarVJjYP4dFjd8YmRgH6OfjdFsTWhhl
    +wGWMIWRWjF6zZbUFT9UjGsHLyXFpN5QV/279wPQQ3wsLvoUZb+fanmQGT8eWYNqHbIJXE
    BL8RXKZYCMIfgBABJKjmEFUvy4t8Q9EComvhK+gYGE6mKzQY6rX+XWBfhTHcMIqjjgMhxr
    zlGB+KydVtBbV+sDA7k3/kJxQrc+1pWAnJ/Uyt0jToXCDK1639qD8Ycmw8wWnxFV6R8VmV
    It+92sqOMILEnZin6gPbuInYV1whqE+ReJjIs5OaOTuuXc1KBUGhu6wgnQ4j3ngtaVFC8n
    GN4j21SWtYz8Bws2m37FBBDnN4aGArGSd18sOUdO3gshTNFIVQGmcCXnPTOq32s76VrY+N
    7oY9zyXqmL6jVOhJT2s1MK9ZFTqGFxr6UZyEyUXK2NDh9yOJBdgdeK9vQaQtLaPUXYKnU1
    1zDo+xB13OXa+z2NykIb5E7XdMfHEjuX6YPxzPipaVMCuct/VBvr7VFC/M4Uf72glAeORx
    c1cHJyW3UNcX4wsMr67m6PqWL0b7ua9sNtiFryfr+iPSuxVtD1pddwoHORzw
X-ME-Proxy: <xmx:dlfGav0XCPw4fayBjUF_XmlTX7-5WpRgrQ4tJVl0rgF4DgeKjxWPuw>
    <xmx:dlfGak8AnYLjJJtwrrz0E67gpppigruiKio2x5oa9KWmvr6K7yVxZQ>
    <xmx:dlfGas2chYCa0ZIiIrK03lsTyQ7AYlN9XJ220BX7KZkyomkxSO2SiQ>
    <xmx:dlfGah_7koTPcIeWBS90yr39sGFtSI2coz7nFZzXV54jZNYQQBjq9g>
    <xmx:dlfGatwX3R4rgubiKHUpkbkO6OM4YGB3B6N1gwqNqabFgDSj3lGEN_sK>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 10:30:13 -0400 (EDT)
Message-ID: <9032ce70465fe1664635c7a3c4eef470c774092e.camel@pbarker.dev>
Subject: Re: [PATCH] Revert "tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF"
From: Paul Barker <paul@pbarker.dev>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Date: Wed, 07 Oct 2026 15:30:10 +0100
In-Reply-To: <20261006214254.1556824-1-denis@denix.org>
References: <20261006214254.1556824-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 14:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247400

On Tue, 2026-10-06 at 17:42 -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> While this change has good intentions, unfortunaly, it completely
> breaks baremetal setup (at least for ARM arch).
>=20
> The line this change removes seems to mask an underlying issue,
> but until that issue is fully understood and resolved, let's
> revert it and restore the working baremetal behavior.
>=20
> For more details please see the following discussion:
> https://lists.openembedded.org/g/openembedded-core/topic/121486589
>=20
> This reverts commit 020d5f018616bc48eae3a23d5498dec3c78a1386.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta/conf/distro/include/tclibc-baremetal.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/di=
stro/include/tclibc-baremetal.inc
> index 6043cb6654..abea5a7162 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -18,6 +18,7 @@ USE_NLS ?=3D "no"
>  IMAGE_LINGUAS =3D ""
>  LIBC_DEPENDENCIES =3D ""
> =20
> +EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-headers"

Hi Denys,

I wonder if the fix is that this should be:

    EXTRA_OECONF:append:pn-gcc-cross-${TARGET_ARCH}

Best regards,

--=20
Paul Barker


