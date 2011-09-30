Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9amy-0004yV-6m
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 12:57:56 +0200
Received: by bke11 with SMTP id 11so1653588bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bW1FeSUGrIZa3iVs93cXKvBIkmJxT6OQzTmYqgdJIqc=;
	b=eAGDIr517g+NdvjDDbk17NEL2Uf6G9QG0TsV6JtlazMUGBq7Orl7JDB75/bEncGTiY
	0m5g5QgsEQlzBhqXUAU45uxzO+FlueTILLcmiG5hPKJSrxzfglqdm9HKEI1NXXR1/z9a
	fpLZQjJddM/rQLDDwM+Stltm9Cuw8FA7X2S8k=
Received: by 10.204.153.209 with SMTP id l17mr7762870bkw.129.1317379947353;
	Fri, 30 Sep 2011 03:52:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex8sm4544598bkc.2.2011.09.30.03.52.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 03:52:26 -0700 (PDT)
Date: Fri, 30 Sep 2011 12:52:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930105219.GA15856@jama.jama.net>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<121b26267ee494182d88e07b7fe63761088b8bde.1317367429.git.Martin.Jansa@gmail.com>
	<1317374312.12332.132.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317374312.12332.132.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 09/13] xserver-nodm-init: merge some changes from meta-oe
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
X-List-Received-Date: Fri, 30 Sep 2011 10:57:56 -0000
X-Groupsio-MsgNum: 10269
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 10:17:25AM +0100, Richard Purdie wrote:
> On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> > * /etc/X11/Xusername handling should be moved to x11-common so the same
> >   username and logic is used from initscript and when user starts it
> >   from terminal
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../x11-common/xserver-nodm-init/xserver-nodm      |   30 ++++++------=
--------
> >  1 files changed, 9 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver=
-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> > index c707a4b..9cd7904 100755
> > --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> > +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
> > @@ -8,10 +8,7 @@
> >  # Default-Stop:      0 1 6
> >  ### END INIT INFO
> > =20
> > -killproc() {            # kill the named process(es)
> > -        pid=3D`/bin/pidof $1`
> > -        [ "$pid" !=3D "" ] && kill $pid
> > -}
> > +. /etc/init.d/functions
> > =20
> >  read CMDLINE < /proc/cmdline
> >  for x in $CMDLINE; do
> > @@ -25,25 +22,16 @@ done
> > =20
> >  case "$1" in
> >    start)
> > +    # We don't want this script to block the rest of the boot process
> > +    if [ "$2" !=3D "background" ]; then
> > +      $0 $1 background &
> > +    else
> >         . /etc/profile
> > -       username=3Droot
> > +
> >         echo "Starting Xserver"
> > -       if [ -f /etc/X11/Xusername ]; then
> > -           username=3D`cat /etc/X11/Xusername`
> > -           # setting for rootless X
> > -           chmod o+w /var/log
> > -           chmod g+r /dev/tty[0-3]
> > -           chmod o+rw /dev/input/*
> > -           # hidraw device is probably needed
> > -           if [ -e /dev/hidraw0 ]; then
> > -               chmod o+rw /dev/hidraw*
> > -           fi
> > -       fi
> > -       # Using su rather than sudo as latest 1.8.1 cause failure [YOCT=
O #1211]
> > -       su -l -c '/etc/X11/Xserver&' $username=20
> > -       # Wait for the desktop to say its finished loading
> > -       # before loading the rest of the system
> > -       # dbus-wait org.matchbox_project.desktop Loaded
> > +       . /etc/X11/xserver-common
> > +       xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xse=
ssion.log 2>&1
> > +    fi=20
> >    ;;
]> > =20
> >    stop)
>=20
> This is not "merge some changes from meta-oe", this is "overwrite
> whatever is in oe-core with meta-oe" :(.
>=20
> The above wipes out rootless X support.

Sorry about that and please ignore this patch..

I've started moving rootless X support from not only xserver-nodm-init
to unified x11-common/xserver-common, but because I didn't finish it
I've removed xserver-common from this patchset and sent it here for=20
review (ie because ant asked me to).

> I've noticed this theme in several of the patches where for example a
> decent long DESCRIPTION and a separate short SUMMARY are replaced with a
> single one line SUMMARY.

I'll recheck this, but I was really trying to keep whatever was better
in orginal recipes, so if it's the case somewhere I'll fix it and send
updated patch, sorry about that.

> The fact you've done this means I'm going to have to go over every line
> of changes in this and double check what is happening. Some of the
> patches look ok but some like this are not.

BTW: meta-oe patchset wasn't sent because git was offline..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Fn2MACgkQN1Ujt2V2gBz96wCffhk0tTH70zw/lxfHlR4THhTH
yA4An25ddWriambjo4NbVgNUr7fJDFI+
=BQ6h
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
