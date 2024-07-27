Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C182EC3DA61
	for <webhook@archiver.kernel.org>; Sat, 27 Jul 2024 23:18:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26315.1722122247781074870
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jul 2024 16:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jDicW7GU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46RNHRX2006256
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 18:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722122247;
	bh=LJ763dqBEfCAe6BZIJNDYJBzr8RrgFFmQnxysbQcNOE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jDicW7GU6Dz4kKVKZF8XcOwij30jvQrTst9EFAmRtl8XqA9LidU5AH/M8pmdATpx4
	 BRQChLHS3eRsH30eBK/lDopjlAwvkcgPZ07BqTVQbCRFiUMXBbYAUUXcAxD5nd+IhP
	 /FVF5kndjNCPGqzHnH6dyXi39armlqC9uWRBvMRs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46RNHRgL008957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 18:17:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 27
 Jul 2024 18:17:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 27 Jul 2024 18:17:26 -0500
Received: from [10.249.36.67] ([10.249.36.67])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46RNHQF7112230
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 18:17:26 -0500
Message-ID: <8981350c-31a1-484e-9629-975ef9d71113@ti.com>
Date: Sat, 27 Jul 2024 18:17:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] scarthgap runtime SPDX error
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <17E633EE7065C255.2837@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E633EE7065C255.2837@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 46RNHRX2006256
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 23:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202563


Nevermind... I see the patch right below this that looks like it might=20
fix it.  I'll test the patch series out and see if it works.


On 7/27/2024 5:56 PM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
> We started seeing a new error on scarthgap on Friday.
>=20
> ERROR: No runtime SPDX document found for bt-enable, False=20
> sstate:bt-enable:all-oe-linux:1.0:r1:allarch:12:=20
> sstate:bt-enable::1.0:r1::12:
>=20
> The package it is referring to changes from image to image and run to=20
> run, but we only get a single error message.
>=20
> If I do a build not using the sstate-cache, the build works fine.=C2=A0=
 If I=20
> then update our shared sstate-cache with those rebuilt files and run a=20
> second build using the cache, the error comes back.
>=20
> I don't see anything obvious in the two bitbake commits and handful on=20
> oe-core.=C2=A0 I've spent all day today trying to do the two step proce=
ss to=20
> see if I can find the commit that causes this.
>=20
> Has anyone else seen anything like this in your scarthgap builds=20
> starting Friday?
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202562): https://lists.openembedded.org/g/openembed=
ded-core/message/202562
> Mute This Topic: https://lists.openembedded.org/mt/107585320/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

