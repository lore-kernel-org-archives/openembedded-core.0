Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82952FF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 07:25:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38002.1777274751091153644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 00:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E77YAodT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DCFF8C5CD43;
	Mon, 27 Apr 2026 07:26:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C33A7600D1;
	Mon, 27 Apr 2026 07:25:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C24A41072001B;
	Mon, 27 Apr 2026 09:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777274748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VNERuq0XNWHClF73E6fnK9DuvkNViiu2sDn5kQ7+i/w=;
	b=E77YAodT9zllfXMRAerjNofJQRxS6bvHs8ZDZVEBULu12hWeXvWnDRmft0q24IVKxSyhcs
	8a77EAT6cSm0F8nhfqHe3d/fgjZuG6Ims3sTkCsysh8X9Pv0+hn3z59GzxOph7jm8gw0H4
	AQ591wHQdMG645cwtLA3P2Gi5kqkjNQ2cwpWdphtLZuslB2NnXWAm6T6KctZXYiB6Y+o3K
	XylsvaDOzfRANfLzMz/PoxGEPc+adumUwFQzbKKkGxg8WkJ5X/0HaGBGKaKGLS03H85u5f
	O6Op8DCIb0RlNn8yRMojwlG4xrIxnxbR7o3dfP4Ofmhbqntrku0JGBSIydv5Uw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
 "ross.burton@arm.com" <ross.burton@arm.com>,
 "jpewhacker@gmail.com" <jpewhacker@gmail.com>,
 "olivier.benjamin@bootlin.com" <olivier.benjamin@bootlin.com>,
 "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
Date: Mon, 27 Apr 2026 09:25:45 +0200
Message-ID: <7o6_XKvhQ267WrzPXGIUdQ@bootlin.com>
In-Reply-To: 
 <AS1PR10MB5697161BED467E81C606A1D7FD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
 <20260422-update-sbom-cve-check-and-depends-v1-1-4646f840ce48@bootlin.com>
 <AS1PR10MB5697161BED467E81C606A1D7FD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235988

Hello Peter,

On Sunday, April 26, 2026 at 9:22=E2=80=AFPM, Marko, Peter wrote:
> I have sent ton of new false-positive cleanup commits this weekend.
> For many I couldn't find any explanation why they reappeared.
> Since there were also new true positives I think this is fine.
>=20
> But there should be a follow-up investigation for most of my commits to i=
dentify why those false-positives appeared and if the tooling can be fixed.
> Peter

The current behavior of sbom-cve-check is documented here:
https://sbom-cve-check.readthedocs.io/en/latest/design.html#find-applicable=
=2Dcve

I don't think that the tool is not currently working as designed, but maybe
there are wrong entries the product database. Also maybe we could improve
the algorithm to try to reduce the number of false-positives.
The main problem is that the current state of the CVEs databases is not gre=
at.
This is really not an easy problem to solve.

Most of the time, the proper solution is going to define CVE_PRODUCT.

If you have a list of CVEs that need to be investigated, could you send it.
This way I could explain or investigate why there is a problem?

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




