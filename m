Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE28CC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:14:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2354.1741979660925983797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gx0x6Nmh;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52EJEAIq1775815
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 14:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741979650;
	bh=ecTMOKkfIVU0v8pEht3y9eudNskMdnisOnGQoF2uGD8=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=Gx0x6NmhqRhHalHWTCVGan7vkrep8ujdZ4hkoi7Tbtg9HpBlEy5/ADSYO1+SCsR36
	 NjHFOPdpuJsSaPmPneSGV/UsllgiCOQm/sk7OqUxDds84xpy/Ps+JNIWpW/xBNtlqf
	 UG4a1M5MJoJdiwZlZHCc+nXioTvs+93ZI+Y5bThM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52EJEACG030878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 14:14:10 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 14:14:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 14:14:09 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52EJE9xH094498;
	Fri, 14 Mar 2025 14:14:09 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 Mar 2025 14:14:09 -0500
Message-ID: <D8G88ZDV4PX6.1Z1L5E9XBFF8X@ti.com>
CC: <otavio.salvador@ossystems.com.br>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][RFC 0/3] Display manager proposal for x11 and wayland
From: Randolph Sapp <rs@ti.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314002937.672768-1-rs@ti.com>
 <CANNYZj98ByWNO+dPwKXGr-9_w5Z_ajwYqMAbWo_u8sdUAsYEWA@mail.gmail.com>
In-Reply-To: <CANNYZj98ByWNO+dPwKXGr-9_w5Z_ajwYqMAbWo_u8sdUAsYEWA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212858

On Fri Mar 14, 2025 at 4:14 AM CDT, Alexander Kanavin wrote:
> On Fri, 14 Mar 2025 at 01:30, <rs@ti.com> wrote:
>> Example implementation of emptty for weston-init following the request o=
n the
>> previous RFC [1] and previous example [2]. This variant is applicable to=
 master.
>>
>> This packages emptty and a default configuration for emptty as "emptty" =
and
>> "emptty-conf" respectively. This allows the existing init packages to ov=
erride
>> the configuration similar to the way grub boot configs are handled.
>>
>> The weston-init package still handles the weston config and weston user =
setup as
>> it always has. The only real difference from a consumer standpoint is th=
at the
>> autologin group for the weston user changed from "wayland" to the more g=
eneric
>> "nopasswdlogin".
>>
>> [1] https://lists.openembedded.org/g/openembedded-core/message/212640
>> [2] https://lists.openembedded.org/g/openembedded-core/message/212785
>
> I quickly checked this locally. There are some issues that need to be
> addressed before this goes to the autobuilder:
>
> 1. WARNING: emptty-0.13.0-r0 do_recipe_qa: QA Issue: Recipe emptty in
> /srv/work/alex/poky/meta/recipes-graphics/emptty/emptty_0.13.0.bb does
> not have an assigned maintainer. Please add an entry into
> meta/conf/distro/include/maintainers.inc. [missing-maintainer]

Yeah. I wouldn't mind maintaining this package and can set that. Just didn'=
t
know if there was someone I needed to check with before I did that.

> 2. With default poky config:
>
> ERROR: Nothing RPROVIDES 'pam-plugin-succeed-if' (but
> /srv/work/alex/poky/meta/recipes-graphics/emptty/emptty_0.13.0.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'pam-plugin-succeed-if' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['pam-plugin-succeed-if']
> ERROR: Required build target 'emptty' has no buildable providers.
> Missing or unbuildable dependency chain was: ['emptty', 'pam-plugin-succe=
ed-if']
>
> You should either make the pam dependency optional (via PACKAGECONFIG
> subject to pam in DISTRO_FEATURES), or use REQUIRED_DISTRO_FEATURES.

Good point. I added the PACKAGECONFIG to remove pam support, that should al=
so
toggle the runtime dep on pam-plugin-succeed-if. Will address in the proper
series.

> 3. Again, with default poky config:
>
> NOTE: Multiple providers are available for runtime virtual-emptty-conf
> (emptty, weston-init)
> Consider defining a PREFERRED_RPROVIDER entry to match virtual-emptty-con=
f
>
>
> Alex

That last note is perplexing. Patch 3/3 is literally setting the default ru=
ntime
provider for virtual-emptty-conf. I'm also seeing the following notice thou=
gh:

NOTE: Multiple providers are available for runtime libnss-mdns (avahi-libns=
s-mdns, mdns)   =20
Consider defining a PREFERRED_RPROVIDER entry to match libnss-mdns         =
                                                 =20
Is there some other variable I need to set for master? Is that message now =
being
printed if 2 package are being produced?  If that's the case I can check th=
e
PREFERRED_RPROVIDER variable and conditionally prevent producing the emptty=
-conf
package, but that feels a little hacky. Anyone have any better ideas about =
that?

- Randolph

