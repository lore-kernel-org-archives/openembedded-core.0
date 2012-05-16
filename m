Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUg8R-000553-JO
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 17:27:31 +0200
Received: by eekd49 with SMTP id d49so246041eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FqNmNa/VjNmf1iR6C20UqCG+bR8D3nNUwYTNadPXpvM=;
	b=YQUQLHe+9p5vgIQJh0kTMIeHFkANTpvM2ktRaEopAhSAnfSVEEO6gm7vC0EoAvNA3C
	eZAR7u1jtq5dFj1xnYPNTAfOaMJN6odGKe8qBgd4ztMYtKxcd3NkAw01670/NsMMEu2d
	SfExV8G0kdcubhbW7iYO2eJoUBKGF0mTzOeuXbomsFwebWXQzR49UnnAj0Qq8/SW+3kQ
	BabX8nrcDVvdiQhJNzcFb71JC3ktdr3IJtaj81C3mG62X5/aikV/THHR3f/2NiWkblb9
	6LugGtu7hwbsdWqGCMemR8dbSLQ0p1HnCL2OpcLdrwq6XVRCmiJETC6vg3zJu+cyckF7
	FU6w==
Received: by 10.14.119.193 with SMTP id n41mr725972eeh.96.1337181450185;
	Wed, 16 May 2012 08:17:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v7sm13801268eem.6.2012.05.16.08.17.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 08:17:29 -0700 (PDT)
Date: Wed, 16 May 2012 17:17:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120516151730.GD3154@jama.jama.net>
References: <1337173763-27981-1-git-send-email-gary@mlbassoc.com>
	<CA+chaQfhDC9crzPtxRbQ7NSvjDQRzYibiWPhTCOHd2bkhnuC3A@mail.gmail.com>
	<4FB3AC00.2070901@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4FB3AC00.2070901@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Fix X server on PowerPC when using GCC 4.7.x
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
X-List-Received-Date: Wed, 16 May 2012 15:27:31 -0000
X-Groupsio-MsgNum: 22207
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 07:30:40AM -0600, Gary Thomas wrote:
> On 2012-05-16 07:23, Martin Jansa wrote:
> > On Wed, May 16, 2012 at 3:09 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
> >> The function XaceHook() was trying to do something like this:
> >>    void *ptr;
> >>    switch(XX) {
> >>       case a:
> >>          define_some_structure A;
> >>          ptr =3D&A;
> >>          break;
> >>       case b:
> >>          define_some_structure B;
> >>          ptr =3D&B;
> >>          break;
> >>    }
> >>    call_some_function(ptr);
> >>
> >> Clearly this is not even legal - the scope of the variables A&  B
> >> is not well defined outside of the switch cases.  This code pattern
> >> stopped working on PowerPC with GCC>=3D 4.7.1 (it has worked forever
> >> up to&  including 4.6.3).  Replace this sequence with legal code:
> >>    switch(XX) {
> >>       case a:
> >>          define_some_structure A;
> >>          call_some_function(&A);
> >>          break;
> >>       case b:
> >>          define_some_structure B;
> >>          call_some_function(&B);
> >>          break;
> >>    }
> >> ---
> >>   .../fix-bogus-stack-variables.patch                |  130 ++++++++++=
++++++++++
> >>   .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
> >>   2 files changed, 132 insertions(+), 1 deletions(-)
> >>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive=
-1.7.99.2/fix-bogus-stack-variables.patch
> >>
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.=
2/fix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xser=
ver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
> >> new file mode 100644
> >> index 0000000..0946dfb
> >> --- /dev/null
> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-b=
ogus-stack-variables.patch
> >> @@ -0,0 +1,130 @@
> >> +Index: xorg-server-1.7.99.2/Xext/xace.c
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- xorg-server-1.7.99.2.orig/Xext/xace.c
> >> ++++ xorg-server-1.7.99.2/Xext/xace.c
> >> +@@ -87,8 +87,7 @@ void XaceHookAuditEnd(ClientPtr ptr, int
> >> +  */
> >> + int XaceHook(int hook, ...)
> >> + {
> >> +-    pointer calldata; /* data passed to callback */
> >> +-    int *prv =3D NULL;  /* points to return value from callback */
> >> ++    int res =3D Success;
> >> +     va_list ap;               /* argument list */
> >> +     va_start(ap, hook);
> >> +
> >> +@@ -109,8 +108,8 @@ int XaceHook(int hook, ...)
> >> +           rec.parent =3D va_arg(ap, pointer);
> >> +           rec.access_mode =3D va_arg(ap, Mask);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_DEVICE_ACCESS: {
> >> +@@ -119,8 +118,8 @@ int XaceHook(int hook, ...)
> >> +           rec.dev =3D va_arg(ap, DeviceIntPtr);
> >> +           rec.access_mode =3D va_arg(ap, Mask);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_SEND_ACCESS: {
> >> +@@ -131,8 +130,8 @@ int XaceHook(int hook, ...)
> >> +           rec.events =3D va_arg(ap, xEventPtr);
> >> +           rec.count =3D va_arg(ap, int);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_RECEIVE_ACCESS: {
> >> +@@ -142,8 +141,8 @@ int XaceHook(int hook, ...)
> >> +           rec.events =3D va_arg(ap, xEventPtr);
> >> +           rec.count =3D va_arg(ap, int);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_CLIENT_ACCESS: {
> >> +@@ -152,8 +151,8 @@ int XaceHook(int hook, ...)
> >> +           rec.target =3D va_arg(ap, ClientPtr);
> >> +           rec.access_mode =3D va_arg(ap, Mask);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_EXT_ACCESS: {
> >> +@@ -162,8 +161,8 @@ int XaceHook(int hook, ...)
> >> +           rec.ext =3D va_arg(ap, ExtensionEntry*);
> >> +           rec.access_mode =3D DixGetAttrAccess;
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_SERVER_ACCESS: {
> >> +@@ -171,8 +170,8 @@ int XaceHook(int hook, ...)
> >> +           rec.client =3D va_arg(ap, ClientPtr);
> >> +           rec.access_mode =3D va_arg(ap, Mask);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_SCREEN_ACCESS:
> >> +@@ -182,15 +181,15 @@ int XaceHook(int hook, ...)
> >> +           rec.screen =3D va_arg(ap, ScreenPtr);
> >> +           rec.access_mode =3D va_arg(ap, Mask);
> >> +           rec.status =3D Success; /* default allow */
> >> +-          calldata =3D&rec;
> >> +-          prv =3D&rec.status;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> ++          res =3D rec.status;
> >> +           break;
> >> +       }
> >> +       case XACE_AUTH_AVAIL: {
> >> +           XaceAuthAvailRec rec;
> >> +           rec.client =3D va_arg(ap, ClientPtr);
> >> +           rec.authId =3D va_arg(ap, XID);
> >> +-          calldata =3D&rec;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> +           break;
> >> +       }
> >> +       case XACE_KEY_AVAIL: {
> >> +@@ -198,7 +197,7 @@ int XaceHook(int hook, ...)
> >> +           rec.event =3D va_arg(ap, xEventPtr);
> >> +           rec.keybd =3D va_arg(ap, DeviceIntPtr);
> >> +           rec.count =3D va_arg(ap, int);
> >> +-          calldata =3D&rec;
> >> ++          CallCallbacks(&XaceHooks[hook],&rec);
> >> +           break;
> >> +       }
> >> +       default: {
> >> +@@ -208,9 +207,7 @@ int XaceHook(int hook, ...)
> >> +     }
> >> +     va_end(ap);
> >> +
> >> +-    /* call callbacks and return result, if any. */
> >> +-    CallCallbacks(&XaceHooks[hook], calldata);
> >> +-    return prv ? *prv : Success;
> >> ++    return res;
> >> + }
> >> +
> >> + /* XaceCensorImage
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.=
2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> >> index 360a0f3..dc17e2b 100644
> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> >> @@ -7,7 +7,7 @@ RDEPENDS_${PN} +=3D "xkeyboard-config"
> >>   EXTRA_OECONF +=3D "--disable-glx"
> >>
> >>   PE =3D "1"
> >> -PR =3D "r29"
> >> +PR =3D "r30"
> >>
> >>   SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar=
=2Ebz2 \
> >>         file://extra-kmodes.patch \
> >> @@ -21,6 +21,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-=
server-${PV}.tar.bz2 \
> >>         file://crosscompile.patch \
> >>         file://error-address-work-around.patch \
> >>         file://nodolt.patch"
> >> +        file://fix-bogus-stack-variables.patch \
> >>   #      file://kdrive-evdev.patch
> >>   #      file://kdrive-use-evdev.patch
> >>   #      file://enable-builtin-fonts.patch
> >> --
> >> 1.7.7.6
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > Isn't this better fix?
> > http://cgit.freedesktop.org/xorg/xserver/commit/Xext/xace.c?id=3D6dae7f=
3792611aace1df0cca63bf50c50d93de43
>=20
> Either way - they are pretty much the same (I had actually done it the
> freedesktop.org way before but I thought it obfuscated what was happening=
).
> I'm sure the person that wrote this was being clever, trying to have only
> one function  call, but a smart compiler will unwind this anyway and writ=
ing
> it out explicitly is easier to read...
>=20
> All I care is that it gets fixed and my X server starts working again :-)

I don't care about very old xserver-kdrive recipes, but from maintenance
POV it's imho much better to backport patch from newer version in upstream=
=20
then introduce something different.. at least for someone who will maybe
upgrade xserver-kdrive later to see that your patch is no longer needed
for newer versions...

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+zxQoACgkQN1Ujt2V2gBzj9ACgpkKwkAqoz7sv7fHph0Jgy3EV
3vEAoKelAojxNO259gK6TTaqvLoKhQgs
=jaIn
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
