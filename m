Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB8DC369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:32:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.71219.1744104750883340292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hik7HEri;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5389WROk1132707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 04:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744104748;
	bh=E7KohbdXFNJvzjL2sDnHjz7wZHztoDwAlO/QVBU6czs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hik7HEriKr9FpaxEnY276FybJMJHytr+oGJrH3lDwWNgou95bQbdDR+/QL2EuVcG8
	 CiJXKA4DtsCS/Pflra/5D4B4zjyxQiNMmH6m7GhYyyygz/WNcQycl2OWTn/RMe2gz/
	 +TziKnFKvF0Lj3NXsdDt4f9/owtZq6Bwgf+vvuIA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5389WRhw119713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 04:32:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 04:32:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 04:32:27 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5389WQt5053470;
	Tue, 8 Apr 2025 04:32:27 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 8 Apr 2025 15:02:17 +0530
Message-ID: <D915J3E6G0ZD.ZKPFOZVQH935@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
        <openembedded-core@lists.openembedded.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <reatmon@ti.com>, <afd@ti.com>,
        <denys@ti.com>
Subject: Re: [OE-core] [RFC PATCH] u-boot: kernel-fitimage: add
 pre-processing hooks
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250401135010.3278105-1-anshuld@ti.com>
 <efb987833e5a0b7147972519b3d1efe9cb3e8735.camel@gmail.com>
In-Reply-To: <efb987833e5a0b7147972519b3d1efe9cb3e8735.camel@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214516

On Wed Apr 2, 2025 at 12:52 PM IST, Adrian Freihofer wrote:
> Hi Anshul
>
> The kernel-fitimage.bbclass is already a bit complicated because of the
> many special cases it supports. The patch looks like it adds support
> for another very special use case to the kernel, which makes it even
> more complicated. Especially when patches come without test cases, this
> makes the situation worse.
>

I can add test cases for the patch but since you're already reworking
fitImage generation, it would be better to see how that goes first than
to add further complexity to the fitImage class.

> Adding the same code multiple times does not look like an elegant
> solution. This is of course also because of the existing code base. I'm
> working on a re-implementation in Python, which would probably allow to
> do this much more elegant.
> https://web.git.yoctoproject.org/poky-
> contrib/commit/?h=3Dadrianf/fitimage-improvements
> Note: I have a newer version which I will push soon.
> The next version of these patches will move the FIT image generation
> out of the kernel recipe into a separate recipe. This would also allow
> to have a customized recipe in your layer which does the pre-
> processing. That would be much simpler than doing this in the context
> of the complicated kernel recipe.
> The plan is here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12912
>

Thanks for the work, I will try out your patches and update later.

> Did you also consider to implement this feature in uboot mkimage?
> mkimage is supposed to do the signing of all the artifacts in the FIT
> image. There are 2 modes supported:
>  * FIT_SIGN_INDIVIDUAL=3D1: Sign all the image artifacts and the
>    configuration nodes
>    This mode looks like doing what your patches try to do
>    indepepndently from mkimage.
>  * IT_SIGN_INDIVIDUAL=3D0: Sign only the configuration nodes.
> Since your hook is related to signing: Is it the right approach to do
> half of the signing process in OE-core when the design is currently
> such that mkimage can normally do this completely on its own?
>

This is not really useful in this case, I want the binaries to be signed
before they are processed by mkimage, i.e. the file in /incbin/ should
already be signed before mkimage processes the its.

Regards,
Anshul

