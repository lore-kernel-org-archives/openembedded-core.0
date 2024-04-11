Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7664C00A94
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 18:36:05 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.web11.21393.1712849900997375926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 08:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dolcini.it header.s=default header.b=mGBmr0Zk;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5FE841FA03
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 17:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1712849899;
	bh=oJpzBcVQhC8nFEgJTZRtvcPwRj9uXS//CVwxobRXaAQ=;
	h=Received:From:To:Subject;
	b=mGBmr0Zk0gFQa2yCljy0Dxmyvzm6dtQrZSqOn44eV1Xt/2uYvDoCMk4kViPaOJqh1
	 3J6AeBovdPdKJewavsCkXSQPn8D/7A5gVN9KobXx7vRRrzH1uSU3ohupWlgz8QLpkh
	 CoPv+f7FSPuDlgKcSOBmIUubVcF+3nv4JjOxfkYy3aZMcW97tb+fQXQTkG/4DjoXAU
	 Mc6uj4REh2GCJJRCBzqC6OD1W60o4hdpQ1twDzOsBGidCgbUTzSdd46hdYlnwrqWtN
	 vYzH6ADQaVZmRYfR7WG4teGNlBFS0yOYs2pZ1EEt+4j03Pah9sa2IIrlmXKo6r6hkw
	 K1p3kwMJbJ24A==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 1396C7F950; Thu, 11 Apr 2024 17:38:19 +0200 (CEST)
Resent-From: Francesco Dolcini <francesco@dolcini.it>
Resent-Date: Thu, 11 Apr 2024 17:38:19 +0200
Resent-Message-ID: <ZhgD66YOsn5p1BoE@gaggiata.pivistrello.it>
Resent-To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2024 17:31:23 +0200
From: "Francesco Dolcini" <francesco@dolcini.it>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] systemd: make predictable name mac policy opt-out
Message-ID: <20240411153114.GA25633@francesco-nb>
References: <20240408070450.27686-1-peter.marko@siemens.com>
 <2E4C61C4-1C5A-46C8-A193-3C484F5D634A@arm.com>
 <AS1PR10MB5697E503E226D55C1F88550FFD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AS1PR10MB5697E503E226D55C1F88550FFD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 18:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198185

Hello Marko and Ross

On Wed, Apr 10, 2024 at 06:04:30PM +0000, Marko, Peter wrote:
> From: Ross Burton <Ross.Burton@arm.com>=20
> > On 8 Apr 2024, at 08:04, Peter Marko via lists.openembedded.org <pete=
r.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >=20
> > > Even the patch says it's inappropriate for upstream, and it's also
> > > inappropriate for some downstream projects, too.  So make it
> > > possible to opt-out on it.
> >
> > I=E2=80=99m looking at these patches because of the fallout from the =
use of
> > matches in the interfaces file.   Presumably you want to make this
> > opt-out for concrete reasons, can you explain what broke?
>=20
> Basically, we have networkmanager and firewalld configuration matching
> interface names.  In addition, also our applications are hardcoding
> the interface names to be able to configure interfaces on demand.
> Switching to dynamic names is not realistic.
>=20
> After upgrading from 5.0_M3 to 5.0_M4 our wlan0 interface gets renamed
> by udev and thus networking breaks.  Unlike our ethernet ports with
> names defined in device tree, wifi chip uses external vendor kernel
> module so I'm not sure if I'm able to configure a stable kernel name
> for it.

I can confirm that this is an issue also for my use case, for similar
reasons.

Francesco


