Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 40E4178217
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0367032039C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:02:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PoVoVVwH0u7G
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:02:26 +0200 (CEST)
Received: from t460p (p57A610EC.dip0.t-ipconnect.de [87.166.16.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CB22C32005CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:02:26 +0200 (CEST)
Date: Mon, 19 Jun 2017 14:02:25 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170619140225.5cfdc2a6@t460p>
In-Reply-To: <20170619103238.2626-1-git@andred.net>
References: <20170619103238.2626-1-git@andred.net>
MIME-Version: 1.0
Subject: Re: [PATCH] connman: fix nftables dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jun 2017 12:02:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 19 Jun 2017 11:32:38 +0100
Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>=20
> When building with nftables support, connman doesn't ever
> depend on the nftables command line tool.
>=20
> connman will depend on libmnl and libnftnl at build and
> run time. In addition, the nftables rules it creates
> depend on various kernel modules being present.
>=20
> Update the PACKAGECONFIG to reflect this.
>=20

packageconfig creates runtime dependencies for the modules you added. This
will cause problems if the modules are built into the kernel binary. You
should add runtime recommendations instead.

Regards,
Andreas

> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index ab18f2fe01..132a58ff40 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -51,7 +51,7 @@ PACKAGECONFIG[l2tp] =3D "--enable-l2tp --with-l2tp=3D${=
sbindir}/xl2tpd,--disable-l2t
>  PACKAGECONFIG[pptp] =3D "--enable-pptp --with-pptp=3D${sbindir}/pptp,--d=
isable-pptp,,pptp-linux"
>  # WISPr support for logging into hotspots, requires TLS
>  PACKAGECONFIG[wispr] =3D "--enable-wispr,--disable-wispr,gnutls,"
> -PACKAGECONFIG[nftables] =3D "--with-firewall=3Dnftables ,,nftables,nftab=
les"
> +PACKAGECONFIG[nftables] =3D "--with-firewall=3Dnftables ,,libmnl libnftn=
l,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-modu=
le-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 =
kernel-module-nft-nat"
>  PACKAGECONFIG[iptables] =3D "--with-firewall=3Diptables ,,iptables,iptab=
les"
> =20
>  INITSCRIPT_NAME =3D "connman"


