Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWH20-0001Jl-10
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 01:31:12 +0100
Received: by bkbzv15 with SMTP id zv15so2427224bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 16:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FMFhhhomlmgbN5mL7BQLQDN5ME28qhJXuhSr0JyN8XU=;
	b=Ww+eRQcbsVrpHeUrF+0DNo+YHnxufwZtq1s1EEy642rWwZn+iaNIxVlbcjCu5l2kjo
	UIxftu2fkSgM5LjfT+rGL4pzhLXDcppzbk8Pk53/196UQshaDSNDUpjLBRh4gs0IF+B3
	d0SR9kMddXH2qmjKmr/dguxOLM+3qC/6hTVS4=
Received: by 10.204.50.88 with SMTP id y24mr9798005bkf.53.1322785469863;
	Thu, 01 Dec 2011 16:24:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm15112697bka.6.2011.12.01.16.24.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 16:24:28 -0800 (PST)
Date: Fri, 2 Dec 2011 01:24:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111202002416.GF32202@jama.jama.net>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
	<9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
	<1322741889.17484.115.camel@ted>
	<20111201124146.GD19917@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111201124146.GD19917@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 1/4] sysstat: don't run populate-volatile.sh update in do_rootfs or without populate-volatile.sh
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
X-List-Received-Date: Fri, 02 Dec 2011 00:31:12 -0000
X-Groupsio-MsgNum: 13501
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/8E7gjuj425jZz9t"
Content-Disposition: inline

--/8E7gjuj425jZz9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 01:41:46PM +0100, Martin Jansa wrote:
> On Thu, Dec 01, 2011 at 12:18:09PM +0000, Richard Purdie wrote:
> > On Thu, 2011-12-01 at 13:02 +0100, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-extended/sysstat/sysstat.inc       |    7 ++++++-
> > >  meta/recipes-extended/sysstat/sysstat_10.0.2.bb |    2 +-
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes=
-extended/sysstat/sysstat.inc
> > > index 2936f96..ca40ab5 100644
> > > --- a/meta/recipes-extended/sysstat/sysstat.inc
> > > +++ b/meta/recipes-extended/sysstat/sysstat.inc
> > > @@ -22,7 +22,12 @@ do_install() {
> > >  }
> > > =20
> > >  pkg_postinst_${PN} () {
> > > -        /etc/init.d/populate-volatile.sh update
> > > +        if [ -n "$D" ]; then
> > > +                exit 1
> > > +        fi
> >=20
> > I'm confused. Can't we exit 0 here since the system will have run
> > populate-volatile.sh update at rootfs time or first boot as needed so we
> > don't need to run it again?
> >=20
> > See recipes-core/dbus/dbus.inc or pulseaudio for similar examples.
>=20
> Ah I didn't know about importance of return value in this case and I was
> looking at=20
> meta/classes/module.bbclass
> meta/recipes-connectivity/avahi/avahi.inc
> for similar examples.
>=20
> I'll learn how it's changing behavior and why avahi has exit 1 in 2/3
> and exit 0 in 1/3 postinst and then I'll send updated patch if needed,
> but now I'm 5 hours late to daywork.. :).

Now after reading
3.1.6. Post Install Scripts
in manual
http://www.yoctoproject.org/docs/1.1/poky-ref-manual/poky-ref-manual.html#u=
singpoky-extend-addpkg-postinstalls

I'm confused too and wondering if dbus and pulseaudio are best examples..
dbus:
pkg_postinst_dbus() {
        if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                /etc/init.d/populate-volatile.sh update
        fi
}

so it this will succeed every time in do_rootfs (even with test expression =
false), so it will be marked as installed=20
and postinst won't be called on first boot, but will be called after every =
upgrade. Is that what we really want?

pulseaudio:
pkg_postinst_${PN}-server() {
        # can't do this offline
        if [ "x$D" !=3D "x" ]; then
                exit 1
        fi

        if [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
            ${sysconfdir}/init.d/populate-volatile.sh update
        fi
}

this looks the same as my postinst in sysstat (only difference is '"x$D" !=
=3D "x"' instead of shorter '-n "$D"')
and if I understand it right now, then this is better then what's in dbus.i=
nc, because
during rootfs we maybe have /etc/init.d/populate-volatile.sh in $D but do w=
e want to call=20
/etc/init.d/populate-volatile.sh on host? Or does it automagically prepend =
$D to every path=20
when it's executing postinst scripts in do_rootfs or does it some sort of c=
hroot to $D?

Even if we prefix the path with $D in postinst like:
$D${sysconfdir}/init.d/populate-volatile.sh update
the populate-volatile.sh script has hardcoded paths like '/etc/volatile.cac=
he' and '/etc/ld.so.cache'
inside, so it won't work very well when executed on host (without chrooting=
) and we should postpone it=20
to be executed really on target and that's why we need 'exit 1'.

If I'm wrong please correct me and update "3.1.6. Post Install Scripts" to =
be more clear about this issues.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/8E7gjuj425jZz9t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7YGrAACgkQN1Ujt2V2gBwRUgCfYDs4onPVBlVH30SNx4JKwC+g
8aEAn3qzw3SQDJzWRjwJRG0zjV0kj0qO
=P7o6
-----END PGP SIGNATURE-----

--/8E7gjuj425jZz9t--
