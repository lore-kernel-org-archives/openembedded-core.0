Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id BF93A60FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 18:47:33 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so4025020eae.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DuCIfgAOvXMIgKQAF17Ceih8gZYRGXp/IXof0Occ28s=;
	b=KOSqycK9n614NVNfSfZUhFtErsArvxUSjeKNVW0r20H6wJ929wZGHm1mxO1MeiC0iU
	bGWWF38j0CSjAKmt/aNT1sAvArcKwJeRL9qVWFwSU/PuEEAmmjAIKXOHz/tYCDKcgnQu
	v71kiiGtVH1SO+5bORRrk9U/8a1Ac0A927LKcuC1t7hAS0TpWKCPE3o9VXWUv9dwJWsv
	cgFwtY2scjwa+xCtTLotLgoSfTXE6ds43CXfACcXhRZ/QXzEqumJx3QQ7d/NhTz1BDo6
	2CTVC3+ofmWGyNUWMELXjzz0aRAETJFktkUfRdDoIDY0A+bhXc53hADiJ/KhdFjqR17R
	6GSQ==
X-Received: by 10.14.88.65 with SMTP id z41mr40253642eee.38.1378838855283;
	Tue, 10 Sep 2013 11:47:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm33615891eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 11:47:34 -0700 (PDT)
Date: Tue, 10 Sep 2013 20:49:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130910184900.GU11500@jama>
References: <1378833306-27394-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LaiEfUqXXz5UtaGzfFU2q1try_MHgbrUUViZcz=4jUXoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaiEfUqXXz5UtaGzfFU2q1try_MHgbrUUViZcz=4jUXoA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base: improve PACKAGECONFIG handling logic
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
X-List-Received-Date: Tue, 10 Sep 2013 18:47:34 -0000
X-Groupsio-MsgNum: 44785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pq8tEKHpn00JYbZk"
Content-Disposition: inline

--Pq8tEKHpn00JYbZk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 06:17:27PM +0100, Burton, Ross wrote:
> On 10 September 2013 18:15, Ross Burton <ross.burton@intel.com> wrote:
> > -                if num >=3D 3 and items[2]:
> > -                    extradeps.append(items[2])
> > -                if num >=3D 4 and items[3]:
> > -                    extrardeps.append(items[3])
> > -                if num >=3D 1 and items[0]:
> > -                    extraconf.append(items[0])
> > +                if items:
> > +                    extraconf.append(items.pop(0))
> > +                # Skip over disable
> > +                if items:
> > +                    items.pop(0)
> > +                if items:
> > +                    extradeps.append(items.pop(0))
> > +                if items:
> > +                    extrardeps.append(items.pop(0))
>=20
> I should note that in a PACKAGECONFIG[foo] such as ",,,foo" this will
> add some whitespace to EXTRA_OECONF and DEPENDS.  If this is a massive
> concern I can sort it, but the clear code trumps the odd extra
> whitespace in my mind.

EXTRA_OECONF/DEPENDS space will probably force do_compile/do_install
tasks to execute again, while RDEPENDS/RRECOMMENDS only PACKAGECONFIGs
could be enabled with only do_package re-executed.

I don't know how many PACKAGECONFIG options we have without first 3
parameters, but in your example with foo it would be significant change.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pq8tEKHpn00JYbZk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIvaZwACgkQN1Ujt2V2gBx6qgCeMpSgL0ColYdygj0WFkW4ELXi
9L0AnRCKyWfR4JlwZ/EOYFDTklbzGgn8
=/NWq
-----END PGP SIGNATURE-----

--Pq8tEKHpn00JYbZk--
