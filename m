Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9hse-0000mp-Vq
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 20:32:17 +0200
Received: by fxi1 with SMTP id 1so3387389fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bJULhPThi2G7VvEr45gCJ4RtVol+8wKTq7Z7iNX1WSw=;
	b=a63sG6OlEB56BiotNI666/uICvirR6ITXTDT6UE5uqwP0RPJAc+0OVMkxJXF80ixdw
	xgm6V2kTxrv5OXwgUU9aKIFPudkGcEd6jnUXhFJ001M4DuRsaH/q3gVjt31YEpi+Rr7w
	nvKO08fJXVIcgqlR86nQLHlrJg43cqhWsua2Y=
Received: by 10.223.30.153 with SMTP id u25mr18839616fac.104.1317407208058;
	Fri, 30 Sep 2011 11:26:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c1sm7746714fab.15.2011.09.30.11.26.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 11:26:47 -0700 (PDT)
Date: Fri, 30 Sep 2011 20:26:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930182641.GG7364@jama.jama.net>
References: <1317372422-7943-1-git-send-email-Martin.Jansa@gmail.com>
	<4E85FD5E.7060305@intel.com> <20110930174330.GF7364@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110930174330.GF7364@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] atk: add patch to replace G_CONST_RETURN with const
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
X-List-Received-Date: Fri, 30 Sep 2011 18:32:17 -0000
X-Groupsio-MsgNum: 10346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline

--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 07:43:30PM +0200, Martin Jansa wrote:
> On Fri, Sep 30, 2011 at 10:33:18AM -0700, Saul Wold wrote:
> > On 09/30/2011 01:47 AM, Martin Jansa wrote:
> > > * otherwise build fails when glib is 2.30.0 or newer (and G_DISABLE_D=
EPRECATED is enabled - like in atk)
> > >
> > > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > > ---
> > >   .../atk/atk-1.32.0/remove.G_CONST_RETURN.patch     |  628 +++++++++=
+++++++++++
> > >   meta/recipes-support/atk/atk_1.32.0.bb             |    5 +-
> > >   2 files changed, 632 insertions(+), 1 deletions(-)
> > >   create mode 100644 meta/recipes-support/atk/atk-1.32.0/remove.G_CON=
ST_RETURN.patch
> > >
> > > diff --git a/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETUR=
N.patch b/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
> > > new file mode 100644
> > > index 0000000..0cdf041
> > > --- /dev/null
> > > +++ b/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
> > > @@ -0,0 +1,628 @@
> > > +Upstream-Status: Accepted
> > > +
> > > +Similar patch is already included in 2.0.1 and newer
> > > +http://ftp.gnome.org/pub/gnome/sources/atk/2.0/atk-2.0.1.news
> > > +
> >=20
> > No Signed-off-by: in the patch header.
> >=20
> > If the newer version of atk is available, why not update atk in oe-core=
=20
> > to that version and not add this patch?
> >=20
> > Is there a reason we can't update to 2.0.1 at this time?
>=20
> I'm not atk expert so to minimize influence of such build fix I didn't
> want to upgrade to new major version. But if the 2.0 API is compatible
> feel free to update to 2.0.1.
>=20
> Btw: I've included this patch to "Glib related change" pull request
> later when I had more changes to send them as separate patches..

I've updated this patch in jansa/glib with SOB line and sent PATCHv2 to
ml.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6GCeEACgkQN1Ujt2V2gBzTygCgs9/NrN9eem0R9qLTrhS0yJVw
1kAAnjlbSiLai68vc0IuaNOJHjg2QjkG
=pNcM
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
