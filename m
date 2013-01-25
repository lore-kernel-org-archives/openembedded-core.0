Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TylCW-000361-SA
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:28:21 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so262111pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 07:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=+icdIILq4D8fgSdUwQreyDyvT9+kRZv0e+NDkJhf2tM=;
	b=uefaYur2WO+GVmvtzS5cHy+0ptOWO2DCZVIVh/lvhJ3qj8WNhPCS2orv+WlSI7U8M4
	h+WwWOIRgSxZ+ZY4tR0SJcfpbvdKj5dGvGXqjhtOJCQVwRPgvvfjMynXvxLoFGA7v3Po
	rMojZIB2JHohpn7dFofX1awWKkcWQ1owtfnzWdUIG8psaFGLKCCEr6FxATyLLIcjzRRK
	SlFRsR9IeIJQMQoT2o4gL/ZDSG6yAplW10ar7AHMRV0vkP+LtHGlJEu32Lehzyw4BPNE
	M6/oCQZv78nP+tV5zhmAMkQ9iT/7EeFRdLvkG9Qr1SGVcTK/+u4Sn6f++h6QfsI93XDy
	5A/A==
X-Received: by 10.68.233.201 with SMTP id ty9mr15341275pbc.14.1359126765686;
	Fri, 25 Jan 2013 07:12:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm1032532paw.8.2013.01.25.07.12.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 07:12:44 -0800 (PST)
Date: Fri, 25 Jan 2013 16:12:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130125151241.GJ3200@jama>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 15:28:21 -0000
X-Groupsio-MsgNum: 34442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2WS97oupGEGbYNpW"
Content-Disposition: inline

--2WS97oupGEGbYNpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 03:04:25PM +0000, Burton, Ross wrote:
> On 25 January 2013 14:59, Radu Moisan <radu.moisan@intel.com> wrote:
> > +# "multi-user" vs "graphical"
> > +SYSTEMD_DEFAULT_TARGET ?=3D "multi-user"
>=20
> Default to "graphical", so we're not regressing and just introducing a
> warning if someone doesn't set this and doesn't have X.

Or empty by default (add quotes in that test -n below).

>=20
> > @@ -95,6 +95,11 @@ do_install() {
> >         install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfi=
les.d/
> >
> >         install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${syscon=
fdir}/tmpfiles.d/
> > +
> > +
> > +       if [ -n ${SYSTEMD_DEFAULT_TARGET} ]; then
> > +               ln -s ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGE=
T}.target ${D}${sysconfdir}/systemd/system/default.target
> > +       fi
>=20
> This will have to happen at image construction time and not package
> generation time, as different images may have different targets but
> share the same systemd package.
>=20
> A rootfs-time postinstall script would work, but isn't very nice.  I
> wonder if there's a better solution, hooking into the image creation
> should work.
>=20
> (thinks)
>=20
> Ross
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2WS97oupGEGbYNpW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlECoOkACgkQN1Ujt2V2gBxC1gCdEuUwj00MpbkPCaz18DmCDQyX
P68An2LW/zVLTZO1g2ll4YjnBaMbqQzL
=6zJ/
-----END PGP SIGNATURE-----

--2WS97oupGEGbYNpW--
