Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF27FF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 07:24:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5980.1777447469505037823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 00:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ckHP8nSX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 375301A3470;
	Wed, 29 Apr 2026 07:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C53F601DF;
	Wed, 29 Apr 2026 07:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA3AD10729424;
	Wed, 29 Apr 2026 09:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777447466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sui8xule5gRpcNXc2WZq6q74MqOwLEl01xCQCfziThA=;
	b=ckHP8nSXw10tKa9vCqLXXkHhJ0b06qlL4RqAlLVTCqkOELBLr6JMBDtmvkB3gGNAKsz7HD
	ubVd0VEGSfsBNhls/TJSKFIJq+B9jmfwxpJJg3iwRAuIDCuHgXe35ra2ZeFnLWtpjqSURd
	27Y85cOXWayM/ksfS6iAdD7V1tiItZ2JUXQN6h9G29SgM8QiBVPUIyX2HqkkSA/nwf/+wh
	dvFaDjoQEAfYmFgEkix5Ggi/twVklXNUAgr4XVUDlloaUVVP12xW1T6pKeDHn6dE+D30IZ
	XXEvQXExjlvoQkXi8R+xcegkQDf3QqHkvj3EZPE5QpjSHTxzu3sNiFYEW45jww==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Date: Wed, 29 Apr 2026 09:24:25 +0200
Message-ID: <guQOcvruSnqgA-55eCHYSw@bootlin.com>
In-Reply-To: 
 <AS1PR10MB569741551B057DB782B91C58FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260426185025.13217-1-peter.marko@siemens.com>
 <RRV3rhtPRj-XxHaMgbEl5A@bootlin.com>
 <AS1PR10MB569741551B057DB782B91C58FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 07:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236082

Hello Peter,

On Tuesday, April 28, 2026 at 6:51=E2=80=AFPM, Marko, Peter wrote:
>=20
> > > Benjamin, any idea about this topic?
> >=20
> > Yes, sadly the CPE of sudo-rs is trifectatech:sudo.
> > Why this is the official CPE of sudo-rs, I don't know...
> >=20
> > What it is happening:
> >  - From https://cveawg.mitre.org/api/cve/CVE-2025-64170
> >    we extract vendor and product name, then we look the products databa=
se
> >    which is built in sbom-cve-check.
> >  - The returned CPE are "memorysafety:sudo", "trifectatech:sudo"
> >  - Then we check if the CPE in the SBOM matches with these CPE.
> >    Currently sudo is declared as: *:sudo, which matches trifectatech:su=
do.
>=20
> Hello Benjamin,
>=20
> I will sent CVE_PRODUCT update to get rid of some older sudo-rs CVE.
>=20
> However for these two CVEs, I can still only see "sudo-rs" as product, no=
t "sudo", also via link you have provided from cveawg.org/api.

Yes, but this is not a CPE. As explained previously (see the steps detailed
above in the previous email), using the vendor/product names extracted from
the associated field, we look in the products database for an associated CP=
E:
https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_check/pr=
oducts/products.toml#L1688

The associated CPE is "trifectatech:sudo" (which is used by the NVD databas=
e).
Why the NVD database provided this CPE, I don't know... But this is the
"official" CPE for sudo-rs as I am aware.

> Peter
>=20
> >=20
> > The easy fix is to declare the proper CPE of sudo using CVE_PRODUCT,
> > which should be set to "sudo_project:sudo".
> >=20
> > This behavior is documented here:
> > https://sbom-cve-check.readthedocs.io/en/latest/design.html#find-applic=
able-cve


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




