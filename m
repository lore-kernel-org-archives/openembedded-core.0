Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9001C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 09:03:52 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.42627.1712912625402150148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 02:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=Vq5IEvXq;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=jwY2zz2M;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1712912625; x=1744448625;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qNFkQVc6IlPeKO3xSCT9bH2Us0b39ncFGtvwo5stvdk=;
  b=Vq5IEvXq5AAhqO3OL0Y6/J+pXWrJUDczgPaRWqO4c4BVL6hgGn4rIzQZ
   afGIeeNHdiMP/MKhl+9VQwwuLrBhaY2iR6gGTUkzGK8Q/LbhJK/fwNv+L
   bp5OnJnX/2aaMQZt/1DtRNmDmWBOabo+tMrH34ciYOYZwjycux6PpIYxd
   ji47IAwM3q/pqIvYy/wkfiihiqNm5vV9rAlqNdDLEO1pJ/ezbPDHAuDrh
   H6H+eq5fr1iEsXtLt1x+36tEyIsHyBCVXFHsfur9WEOxCWY5pnZm0cLCH
   BrkM8Ai4aJ9SZpX+Fw448DnhxQWWNjj0etXW0lHAhkTCnoqzlnkwCp77U
   Q==;
X-IronPort-AV: E=Sophos;i="6.07,195,1708383600"; 
   d="scan'208";a="36385869"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Apr 2024 11:03:43 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53B6217410C;
	Fri, 12 Apr 2024 11:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1712912619;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qNFkQVc6IlPeKO3xSCT9bH2Us0b39ncFGtvwo5stvdk=;
	b=jwY2zz2Mk4si+V+ChFlQhsTAqfmvd7vc/v5FJ1b49n9OPBnXd0rJwIwb5Me0nKS+R6JEbO
	q727lkdmURl98OLZailHAeWZOeBjcPgykstwWjMAgQFDgG84y3giB0rvT1rlZwTiyBHZLy
	M7BdTDzZ+lWrOArpD/Do4oF8j3ZZT0AFdFuub9wimxIxoh+KnVUOE3D3gpMug88uUdv7NG
	xEmrDZLA6ioqId70Lx582sRMko+zoHNtEIEjp/lVP0/kIEmiqwyzN4R3qv9Vu6erij67xv
	0D7pew8hP9NeUTWAEfbA8EPQcu1Q3pflvdCXC2xOc4nXdmi4U+XA3GAwuHNqYg==
Message-ID: <a357002eff78472d58c5864cd6f258eb67450fea.camel@ew.tq-group.com>
Subject: Re: [OE-core] [kirkstone][PATCH] kernel.bbclass: check, if
 directory exists before removing empty module directory
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2024 11:03:38 +0200
In-Reply-To: <28425.1712842807693392990@lists.openembedded.org>
References: 
	<CAOSpxdZzM3yBsH9wKp9s8bskxSrpzSsb5AJJ8-t=W1-7mtuH8w@mail.gmail.com>
	 <28425.1712842807693392990@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 09:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198158

On Thu, 2024-04-11 at 06:40 -0700, Heiko wrote:
>=20
> =C2=A0Hi Steve,
>=20
> I created the patch as described
> here:=C2=A0https://docs.yoctoproject.org/4.0.17/contributor-guide/submit-=
changes.html#contributing-thro
> ugh-mailing-lists-why-not-using-web-based-workflows
>=20
> Only one line has been changed. Is it possible for you to change it?
>=20
> Best regards,
> Heiko


Thanks for sending the patch, I was about to submit a very similar one just=
 yesterday. Note that
this should be fixed in OE-core master/scarthgap first, then backported to =
kirkstone.

The issue with your patch is that it uses spaces instead of tabs for indent=
ation, which doesn't
match the original file. This may have happenen if you copied the patch con=
tent from a terminal, or
due to your mail user agent - issues like this are unfortunately common, wh=
ich is why `git send-
email` is the recommended way to submit patches.

Best regards,
Matthias

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

