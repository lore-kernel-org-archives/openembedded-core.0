Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8200106705A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:40:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24691.1773330008839625609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sV16xwiR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A236A4E42652;
	Thu, 12 Mar 2026 15:40:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FB935FDEB;
	Thu, 12 Mar 2026 15:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD2A110369DD8;
	Thu, 12 Mar 2026 16:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773330005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6ateD2FPcpf9ZxhOOiC1goClghCcWteDaxB+c/+H3wA=;
	b=sV16xwiRMyvKmfZKUiW72ZzvG7f8Zt7i9490QmPtx06XU4TIhyms4MYZ691s6p/LPd+7JL
	Tr3/B+JfCMlHM3epAQpkdbhz3zp+XE7nODnoqymB4Ea4ZJPyn7tNJlu0Ooj24YIHKoXqk4
	nq6hTucXINrXX5cU5Epe159w+eyE2OF9CYbFsOh2Yr+Z6zyKj0LGC8L0zsySs/332B4/lO
	7hqzJ2wASKpSoD/aRZzaBl/W10ztFEheynYNp/uKhGAzWsWIZaSVgWupMKs2cnkWwKsfaS
	QhBJgST8ZtCMg9iluaya3FL5kTtOPzjgy+esdVpP0zOywPoJLFgONHGbdg3U4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 16:40:00 +0100
Message-Id: <DH0X0RNEZR2D.UVFBI733H09E@bootlin.com>
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
Cc: <alex.kanavin@gmail.com>, "Ross Burton" <ross.burton@arm.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com> <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org> <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com> <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com> <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com> <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com> <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com> <DGY2F6IHB5J8.19O12JA60I1SB@bootlin.com> <99c8b40e-3776-45da-b606-39e66d931640@windriver.com>
In-Reply-To: <99c8b40e-3776-45da-b606-39e66d931640@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232981

Hi Robert,

On Thu Mar 12, 2026 at 2:43 PM CET, Robert Yang via lists.openembedded.org =
wrote:
>
> And for the other failures such as:
> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepe=
nds on=20
> locale-base-c, but it isn't a build dependency? [build-deps]
>
> I can reproduce them without rpm 6. I will leave them atm, and focus on r=
pm 6=20
> upgrading.
>

Yes, sorry I should have told you: I also had the glibc upgrade patches,
so glib failures are probably not related to your series.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


