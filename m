Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Ra1eW-00017m-Uj; Mon, 12 Dec 2011 09:54:29 +0100
Received: by eaal1 with SMTP id l1so1012284eaa.6
	for <multiple recipients>; Mon, 12 Dec 2011 00:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZFK0Y65v9iCdSRCIL+sEHbRyDBkriKp04vWRZav7j+U=;
	b=nELD0kua27zbagGapG7PC7T+XYpU7sQeUEzcNAP6kwcGcQ3nj8W2voBskdoCGk2wtT
	nVI6WzBlUT7k6lw0zkiZHe5zhvtwEbXEyzHTpgZCHUXeFHi+WFMfRcRuxYPOQly17X9c
	JZMfDmerceV0O4KiwBs0zUwYvsueAHBdReOIk=
Received: by 10.213.98.68 with SMTP id p4mr3209342ebn.109.1323679654822;
	Mon, 12 Dec 2011 00:47:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm72689053eeh.5.2011.12.12.00.47.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 00:47:34 -0800 (PST)
Date: Mon, 12 Dec 2011 09:47:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111212084731.GD3783@jama.jama.net>
References: <20111212084206.608CB10332@opal>
MIME-Version: 1.0
In-Reply-To: <20111212084206.608CB10332@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Kernel version has extra '+' when kernel is built from git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2011 08:54:29 -0000
X-Groupsio-MsgNum: 14080
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline

--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 08:42:06AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: c486dfa4013b37972c1a1e4df8616eb6f49de498
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dc486dfa4013b37972c1a1e4df8616eb6f49de498
>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Sun Dec 11 09:46:28 2011 +0100
>=20
> kernel bbclass: sync with OE-core
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

If you're working on shared linux.inc in meta-oe, could you please
integrate this:

do_configure_prepend() {
#otherwise it gets extra '+' "2.6.37+"
#because:
#$ scripts/setlocalversion . =3D> +
#$ make kernelversion =3D> 2.6.37
#$ make kernelrelease =3D> 2.6.37+
  rm -rf ${S}/.git
}

I have to do this in every git recipe as I don't like dirs like
/lib/modules/2.6.37+

Maybe it should be fixed on kernel.bbclass level, because linux-yocto
suffers the same ie /lib/modules/3.0.12-yocto-standard+

Ccing oe-core for that..

>=20
> ---
>=20
>  meta-oe/classes/kernel.bbclass |  105 +++++++++++++++++++++++-----------=
------
>  1 files changed, 61 insertions(+), 44 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dmeta-openembedded.git/?a=3Dcommi=
tdiff;h=3Dc486dfa4013b37972c1a1e4df8616eb6f49de498
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7lv6MACgkQN1Ujt2V2gBzWMQCfd4mxft4Enq6hrlTdVs5G98GA
QSkAoLEunLnp7PwBgC83kV4tKbupknca
=lcH9
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
