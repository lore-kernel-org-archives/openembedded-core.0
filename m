Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D9C282DE
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:40:51 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.3059.1741912842155963867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 17:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=prL+nvwR;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0eXPV1527809
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 19:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741912833;
	bh=JNItLAB/Ho63uQbKYHZD2IRxX+mOvTchmQdIqw3hFmo=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=prL+nvwRScsSFDAJni4os4QS3arjETAEI76sLIx07yI4nFfVh884+P7UFhPxB5Pb+
	 dIfVOmo9n0lGWvenrwk2KQU9eEzqWEVFKvG7Rv/Rx/OtU6BdGYKbn6khPIuW3zHRcb
	 jPkwTffN/HkMIvXWBc/qKfYqmsg2OgbGBL+wvELs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0eXPB022762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 19:40:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:40:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:40:32 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0eWqh017406;
	Thu, 13 Mar 2025 19:40:32 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Mar 2025 19:40:32 -0500
Message-ID: <D8FKKC7RIWR4.9RZ841GRRX0U@ti.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [OE-core] [PATCH] bzip2: add libbz2.so.1.0 link for compat
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314002937.672768-1-rs@ti.com>
 <182C83EDE0EF5771.27055@lists.openembedded.org>
In-Reply-To: <182C83EDE0EF5771.27055@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212816

On Thu Mar 13, 2025 at 7:29 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Add a link from libbz2.so.1.0 to libbz2.so.${PV} for compatibility with
> other distributions.
>
> A handfull of distributions are still using the "Makefile-libbz2_so" to
> generate libbz2 and bzip2-shared. This creates a library with a soname
> of "libbz2.so.1.0". This library link is not provide by default in
> autotools builds so add one here as Gentoo does now [1].
>
> This has been addressed upstream already, but there hasn't been a stable
> release since then [2].
>
> [1] https://bugs.gentoo.org/338321
> [2] https://gitlab.com/bzip2/bzip2/-/merge_requests/42
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-ex=
tended/bzip2/bzip2_1.0.8.bb
> index 78138d1543..02d81e7069 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -62,6 +62,11 @@ do_install_ptest () {
>  	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
>  }
> =20
> +# add the following link for cross-distro compatibility
> +do_install:append () {
> +	ln -s libbz2.so.${PV} "${D}${libdir}/libbz2.so.1.0"
> +}
> +
>  FILES:libbz2 =3D "${libdir}/lib*${SOLIBS}"
> =20
>  RDEPENDS:${PN}-ptest +=3D "make bash"

Sorry for the spam. These are not part of the RFC series and should be igno=
red.
Old patches I forgot to clean out of my pwd.

