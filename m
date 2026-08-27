Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650F2C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:25:35 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36382.1787837126436498111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 06:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=qEQI7dD+;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=EYxcN2Wl;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7C4DB1400011;
	Thu, 27 Aug 2026 09:25:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 27 Aug 2026 09:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787837125;
	 x=1787923525; bh=CtgY2lld/LD8rqCWtTuecqSV48MP4boDEmbOeFs+6+I=; b=
	qEQI7dD+N+15scaAM7FBXM6UtZhs7uoTRwqR5CoezogDuOYc5fum62Iv2yEPxNf+
	ynFzZgw+twHJr/QIBDAGcx/ENtA2sy0K80pR6PCDfEtd0F122oQ0dfC3Uvz7XtzZ
	+iO4v8G/+atoSU/+5JiNi3Gn2QOC4C9hs/ibySrKj3OQafFEmixJbFJY6NzksNzD
	h0h31zfoOMf6nlaVgD871iIe0/9TyQCuoBmp2WJZfoIJbObCqgX05D2MM1aHpqrE
	3udoK/WGlHgKtsmHixkFVzAALmnKtC3ei9GT4NNvJ2A0j/f0ZwPoEhRVD1POTes5
	6nz8tDaB8eCdgywvhAMYiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787837125; x=1787923525; bh=C
	tgY2lld/LD8rqCWtTuecqSV48MP4boDEmbOeFs+6+I=; b=EYxcN2Wl3GDV2LuyC
	YzZCq+j1/cR+0UDygK4qOKvX+UjhB7J0lmo3ybPN26XPP/c9PEiNxMWp0cEdsmtR
	59ltuMVDAwcNdlYngF8cz5lB/qXrU8K0niHzAEDzcSSX9DtvLF0mb9H6IMQFdUdh
	HL9A8xAznJTAyKKbx40cHVRqywlDic6SnYz5dAX4gO3Iuk7XekPz7VkxMjhCJd83
	TtUUHQO3vA/I3muNCgCom3BZwRK3lgUqoGyJAQyTaW1xLWJLOJ26TW3+wECbP+HJ
	Si9m8ir6oGp8fgtVwGj9Jx/9cd3bNu3xO24fJ+ejklI0VIFe3clO1WENUajWVumW
	+kysQ==
X-ME-Sender: <xms:xTqQambmDS-8Op4oIuVLehZmklAvOY7ajwYA_CJ4uZjRkV68YR_yLg>
    <xme:xTqQavZchjhVYS7n66FOf-f9AeNsgS1S-CqFmRJz1VIotazK3-0EHeKQguNPP12Vm
    1MYvgUFuIyu-pMF1CG-ws5GIqTjwmsd8CROa6L1RVhHCs5niAePCo-g>
X-ME-Received: <xmr:xTqQaumOywMAklFf0Bl7I84IT06tALwUiPw5p22hG6NB27WAl6jeUgJ0-7L8qu8KlZ9tiaPTpqXjdvMJBBxMJrZb8kZrr5i0dLhmn6M>
X-ME-Proxy-Cause: dmFkZTE660GdneR2vMRSuqWPIof4U9jmy1G/6/XTVkeBc89lDi45vJjkmIMS6FyiP1bidp
    qjZrEuJgcoR0Lv9Z9U3uOde0qw7jMygKaqI3srw5i2PqVpy0b/P443bRUtsRE+JCgGZdxQ
    F4cONeqwStb8vnQt6UgMiRDX+abJnKN3tZ+bj8NPv76cAmkU4EK5m9574V2woYqUBPHCKa
    dwNnDxd3MizB5YGhI3wuly3FsZD0h/RbUGiGvo0FdaWSXwjPdpWMJYS3jOtxyesvHwRG4W
    02YOAJnyGjnLCi8acwrrzLYXSvOmlfXeHVPJzoe0FNALeIKiYavljj4YuXRqZAXsBOTVlR
    YzKz/QfxqbqMU3/zwQlVigDElc2bxC6t1vfAK+v/PAn5OLJSukC3a/z85HNrtrQaA16hH1
    yvprxKzRa9X+GBNCBdujGAfWvakAKqxPdjkbVW7MBvGEhggNVncdWWKHwFlSiO4Lz+lD2b
    TeJYZo6/vjLDsR1Sx4ipz/DRiaYoec6tLNQ/txp/zogKi+QpgsKFPWaefxG8x9NzkhE28/
    +2rd5AwgsZ9KCngueCBihFsWI/aYMHrTgPVYfmJp3FRj2bQSkfResXwcT8jDO528V2AI3O
    k6odi/wBqOnaa0USWvxA9jAmpwO+6v0FsXfJDO1YACImv6n/OmK7DIoag9SA
X-ME-Proxy: <xmx:xTqQajx4t3TMRR_B3FBxxyOcb5L8xxFd_BAOvkt3pLwqlpVckv36GA>
    <xmx:xTqQakOXOlGrvveuS_emqXx3lldoRK0dEg2jnFCpmmIxUBBQymocpA>
    <xmx:xTqQavSENGNbgst2V7td9xDEdHbZcY7qUz3iFqQ1NdwoZmV68jKLjA>
    <xmx:xTqQaqaGVHHXd2af-aBRlIb2UiVy3ecDhippUluCiNPYYz3AaDmAzQ>
    <xmx:xTqQapq0exLB0E4pGx7ktY_ywuqVr4FheWSSD9kOJIs_nlNZJTos1TLT>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 09:25:24 -0400 (EDT)
Message-ID: <c70d63515c72d28e1427a2e53fc8cafd7f0fc952.camel@pbarker.dev>
Subject: Re: [PATCH v2 2/5] vex: skip the VEX symlink when IMAGE_LINK_NAME
 is empty
From: Paul Barker <paul@pbarker.dev>
To: Thomas Roos <roosesweb@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2026 14:25:23 +0100
In-Reply-To: <20260819062208.680468-3-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
	 <20260819062208.680468-1-roosesweb@gmail.com>
	 <20260819062208.680468-3-roosesweb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 13:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244490

On Wed, 2026-08-19 at 08:22 +0200, Thomas Roos wrote:
> An empty IMAGE_LINK_NAME left a bare ".vex.json" symlink in the deploy
> directory. Skip the link, as image.bbclass and rootfs-postcommands do.
>=20
> AI-Generated: Uses Claude Opus 5
> Signed-off-by: Thomas Roos <roosesweb@gmail.com>
> ---
>  meta/classes/vex.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
> index b3c2aca..eee3af6 100644
> --- a/meta/classes/vex.bbclass
> +++ b/meta/classes/vex.bbclass
> @@ -204,7 +204,8 @@ python vex_write_rootfs_manifest () {
>      with open(manifest_name, "w") as f:
>          json.dump(json_data, f, indent=3D2)
> =20
> -    update_symlinks(manifest_name, link_path)
> +    if link_name:
> +        update_symlinks(manifest_name, link_path)

Using link_name in the conditional and link_path in the function
argument is confusing. Perhaps we should move the link_path assignment
inside this conditional? It's not used anywhere else.

    if link_name:
        link_path =3D os.path.join(deploy_dir, "%s.vex.json" % link_name)
        update_symlinks(manifest_name, link_path)

Best regards,

--=20
Paul Barker


