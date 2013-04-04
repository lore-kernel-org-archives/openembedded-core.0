Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNmlM-0003Ai-Ip
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:11:46 +0200
Received: by mail-da0-f42.google.com with SMTP id n15so1178554dad.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Jqjdok4PpIh42fBm0jGQ7e3XTg0VJRHdwTZfmsHLst4=;
	b=BeyXqYvk+ptoRG6YF9Y8GAM4GuDQ7cV+ln/zKSM30iPDzWKFnKJmNSy+4u63ISGGMf
	QUyFTOeuU7TeeY8AevmdivKF0XksOcvO0NOBfBO7d8QrU/7f10OYPzt4ScYw8aNmDFEC
	Cf315qk7qANJb7I7Ey+8IPC3OfkM5vGmmILXRnkh1AU4WhwAT4D7amKEEc12BCyqikJV
	Yanw3w/m2XTm6GoDNgia36V7xpg9a4HSiVjSLtT2n8jrz7h0oeGNkkUS0HsPLsvpS0KT
	renfidJujAhonGzl23d1mpRsRNj/ER7NtHxcwt31CKZJHCz+lW2+gRU0ddIuOMscIijN
	aZCA==
X-Received: by 10.66.149.73 with SMTP id ty9mr10403528pab.66.1365090870666;
	Thu, 04 Apr 2013 08:54:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id to7sm12005285pab.0.2013.04.04.08.54.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 08:54:29 -0700 (PDT)
Date: Thu, 4 Apr 2013 17:54:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130404155430.GE1271@jama.dyndns-home.com>
References: <1365006940-3863-1-git-send-email-Martin.Jansa@gmail.com>
	<1365078717.6526.101.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1365078717.6526.101.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] rm_work: keep do_fetch, do_write_srcrev stamps
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
X-List-Received-Date: Thu, 04 Apr 2013 16:11:46 -0000
X-Groupsio-MsgNum: 37432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline

--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 01:31:57PM +0100, Richard Purdie wrote:
> On Wed, 2013-04-03 at 18:35 +0200, Martin Jansa wrote:
> > * otherwise do_fetch/do_write_srcrev/do_rmwork is reexecuted for each r=
ecipe included in image
> >   on every build
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/rm_work.bbclass | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> > index 1642af7..2d0eb1b 100644
> > --- a/meta/classes/rm_work.bbclass
> > +++ b/meta/classes/rm_work.bbclass
> > @@ -60,6 +60,14 @@ do_rm_work () {
> >                  i=3Ddummy
> >                  break
> >                  ;;
> > +            *do_fetch*)
> > +                i=3Ddummy
> > +                break
> > +                ;;
> > +            *do_write_srcrev*)
> > +                i=3Ddummy
> > +                break
> > +                ;;
> >              *do_build*)
> >                  i=3Ddummy
> >                  break
>=20
> We cannot do this, it is not in keeping with the rest of the system and
> will break things and set a dangerous precedent.
>=20
> If something subsequently tries to do some operation assuming do_fetch
> already ran, it would run again assuming the do_fetch data is there and
> it may not be. Right now the way things are setup with do_fetch will
> happen to work out ok in most cases with the above but its the wrong
> message to send out. For the do_write_srcrev case, it also means that in
> some cases the revision will be written out, in other cases it will not
> be and I don't think the inconsistency between the two is correct.

OK, I haven't seen any issues with current state (only do_unpack was
touching WORKDIR afaik, so do_fetch stamp wasn't "invalidated" by
WORKDIR removal) but maybe I just haven't found the right corner case.

> The other ways I can see to solve this are:
>=20
> a) put do_write_srcrev under sstate
> b) change do_write_srcrev to a postfunc of do_fetch
> c) change the "addtask write_srcrev after do_fetch before do_build" to
> be before do_install.
>=20
> The trouble with c) is that it will cause the sstate checksums to change
> when enabling buildhistory (which happens anyway but is rather annoying
> and we should be trying to fix that, not make it worse). b) is therefore
> looking the more attractive option at this point.

I like b) too, because I don't care about srcrev change if foo wasn't
fetched here (if all sstate archives for foo are reused from SSTATE_MIRROR)

But maybe some people will have different use-case for write_srcrev and
will expect to get complete set of SRCREVs from
openembedded-core/scripts/buildhistory-collect-srcrevs
when executed on any builder. But that's something which can be improved
in 1.5, fixing do_fetch reexecution with rm_work or with other tasks
covered from SSTATE_MIRROR would be nice in 1.4 (Or at least add option
to disable do_write_srcrev task completely).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFdojYACgkQN1Ujt2V2gBynOACgrlFepeCn2wNy//XKgiCKHuL2
EfMAn089dJxNcKXi7dQAp3VyEPweDMpM
=5V0b
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
