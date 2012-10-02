Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJAtN-0004GU-Dg
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:24:41 +0200
Received: by wgbdq11 with SMTP id dq11so4453273wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WUUUI4BQk39Moc1xy2C51DiKPp2/0MboxWQciM3FJqM=;
	b=LSpxWzDlwxPgo90og8bohIyZ+ncEozUlln2OoLscvTeZC2bUTcHbBgGqjeBrQKAmjO
	sbs3f6X4YGZZDlND8WaOQBkWOTtgIqTrHMshnNAo0VsSsHYEqIWgvejmduPdqfP2n3p6
	iyqGhw6/6dmylShQMIkhPNx8YClQtxq5j82vx7T5torBeUzxntg3Z4OiDrjCDFtb5BzO
	C1PC6Md2BkLSrDY4CA47jtc/5bySLKgruOotJi1F+18NTLLv8VkCXmLfDgI/bfuZgK5D
	xZg3AXgZupIelBAilZq3VYHnI/6XYeNKrKNTnd1sNDEEY8atOdX3RN2AMHd9V4Xr70li
	fIrw==
Received: by 10.216.181.67 with SMTP id k45mr90775wem.17.1349215902541;
	Tue, 02 Oct 2012 15:11:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm4698941wiy.11.2012.10.02.15.11.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 15:11:41 -0700 (PDT)
Date: Wed, 3 Oct 2012 00:11:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121002221141.GG15881@jama.jama.net>
References: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
	<1349215253.4422.79.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1349215253.4422.79.camel@x121e.pbcl.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Add detail to shared area warning
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
X-List-Received-Date: Tue, 02 Oct 2012 22:24:41 -0000
X-Groupsio-MsgNum: 30268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline

--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 11:00:53PM +0100, Phil Blundell wrote:
> On Tue, 2012-10-02 at 15:00 -0700, Saul Wold wrote:
> > -        bb.warn("The recipe is trying to install files into a shared a=
rea when those files already exist. Those files are:\n   %s" % "\n   ".join=
(match))
> > +        bb.warn("The %s recipe is trying to install files into a share=
d area when those files already exist (please fix %s). Those files are:\n  =
 %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match)))
>=20
> That seems potentially misleading: the file that needs fixing isn't
> necessarily the one that triggers this warning.  What would be ideal
> would be to have it output the names of all recipes that have tried to
> stage the files in question so that the user can make an informed
> decision about which one ought to be putting them there.

Maybe something like master.list was before
http://git.openembedded.org/openembedded-core/commit/?id=3D603daf343ad3f18c=
8adb799e3625ae2a18d94f56
with added recipe name, but that doesn't detect files already=20
stored in sysroot directly from do_configure/do_compile etc like RP
suspects python recipe is doing in this case.

And yes it does, to use that to compile own extensions later.

do_compile:
        install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
        install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
        install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
        install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/c=
onfig/
=2E.


Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBrZp0ACgkQN1Ujt2V2gBx0tgCgjuyi0HFzZApgwIK8QX1SVIVj
2EMAnAzoEx/lNPccM/t87bgzvnf6B9yH
=8OqG
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
