Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUm0Y-0001LN-65
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:43:46 +0200
Received: by wgbdr1 with SMTP id dr1so1045113wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s7OU7Aij6wcVhioGE2f+oHY9C92dO/RzxIkqPpHsp5Y=;
	b=RLVZEs0B1v6F9niZKF0J/HVMlS0WLCqNw9Qp8lbwjGARKXVO1MvGunmaYbBrXbaS3Z
	z1N+xWhDKx7yQGA96kC2uGZfrtfYe+zgAuA4UeUO5Q7IZJPHTmWl80lOGwalcLNQNhG0
	xEj0J5Irxw8D3WjYdduMejICP/ubzV8bM8w72+/t9s3dF6QhUt0aH6/p8yqC42D3P42W
	cLAgXUApj2P9tu8/M2+3/KIj8PfRjjC+MypnQFdvQnf9OkwDIwADeKzIX/H59c9TXzSu
	GDmWOkS3kPs7dn0O6xu3vj+kisAjoaGdGHeepgwpMms2l007RgQPn/e4FMS9oxMX0j4T
	96SQ==
Received: by 10.180.91.225 with SMTP id ch1mr11889917wib.18.1337204024474;
	Wed, 16 May 2012 14:33:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m1sm21091711wic.6.2012.05.16.14.33.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 14:33:43 -0700 (PDT)
Date: Wed, 16 May 2012 23:33:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120516213341.GA3164@jama.jama.net>
References: <1337203583-27729-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1337203583-27729-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v4] xserver-kdrive: Fix X server on PowerPC when built with GCC 4.7.x
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
X-List-Received-Date: Wed, 16 May 2012 21:43:46 -0000
X-Groupsio-MsgNum: 22253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 03:26:23PM -0600, Gary Thomas wrote:
> Newer versions of GCC uncovered illegal code practice which can cause
> runtime failures in the Xext/xace.c code.  This problem has been fixed up=
stream:
>   http://cgit.freedesktop.org/xorg/xserver/patch/Xext/xace.c?id=3D6dae7f3=
792611aace1df0cca63bf50c50d93de43
>   Subject: xace: Invalid reference to out-of-scope data.
>=20
> Incorporate this patch into the recipe, with a PR bump.
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../fix-bogus-stack-variables.patch                |  231 ++++++++++++++=
++++++
>  .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
>  2 files changed, 233 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7=
=2E99.2/fix-bogus-stack-variables.patch
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/f=
ix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xserver=
-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
> new file mode 100644
> index 0000000..d900fc3
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogu=
s-stack-variables.patch
> @@ -0,0 +1,233 @@
> +From 6dae7f3792611aace1df0cca63bf50c50d93de43 Mon Sep 17 00:00:00 2001
> +From: Chris Wilson <chris@chris-wilson.co.uk>
> +Date: Tue, 10 Aug 2010 18:30:20 +0000
> +Subject: xace: Invalid reference to out-of-scope data.
> +
> +The callback data passed by reference to the hook was allocated on stack
> +within the scope of the case statement. The compiler is free to reuse
> +any of that stack space whilst making the function call so we may end up
> +passing garbage into the callback.
> +
> +References:
> +
> +  Bug 18451 - Xorg server 1.5.2 SEGV during XFixesGetCursorImage()
> +  https://bugs.freedesktop.org/show_bug.cgi?id=3D18451
> +
> +v2: Drop the unrelated hunk that snuck in when ammending the commit
> +message.
> +
> +Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> +Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Signed-off-by: Keith Packard <keithp@keithp.com>
> +
> +Upstream-Status: accepted

Shouldn't this ^ be "Backport" as in v3?

Probably not worth doing v5, just wondering why did you change that to "acc=
epted".

> +---
> +(limited to 'Xext/xace.c')
> +
> +diff --git a/Xext/xace.c b/Xext/xace.c
> +index e10d837..c757cad 100644
> +--- a/Xext/xace.c
> ++++ b/Xext/xace.c
> +@@ -87,7 +87,18 @@ void XaceHookAuditEnd(ClientPtr ptr, int result)
> +  */
> + int XaceHook(int hook, ...)
> + {
> +-    pointer calldata;	/* data passed to callback */
> ++    union {
> ++	XaceResourceAccessRec res;
> ++	XaceDeviceAccessRec dev;
> ++	XaceSendAccessRec send;
> ++	XaceReceiveAccessRec recv;
> ++	XaceClientAccessRec client;
> ++	XaceExtAccessRec ext;
> ++	XaceServerAccessRec server;
> ++	XaceScreenAccessRec screen;
> ++	XaceAuthAvailRec auth;
> ++	XaceKeyAvailRec key;
> ++    } u;
> +     int *prv =3D NULL;	/* points to return value from callback */
> +     va_list ap;		/* argument list */
> +     va_start(ap, hook);
> +@@ -99,117 +110,86 @@ int XaceHook(int hook, ...)
> +      */
> +     switch (hook)
> +     {
> +-	case XACE_RESOURCE_ACCESS: {
> +-	    XaceResourceAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.id =3D va_arg(ap, XID);
> +-	    rec.rtype =3D va_arg(ap, RESTYPE);
> +-	    rec.res =3D va_arg(ap, pointer);
> +-	    rec.ptype =3D va_arg(ap, RESTYPE);
> +-	    rec.parent =3D va_arg(ap, pointer);
> +-	    rec.access_mode =3D va_arg(ap, Mask);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_RESOURCE_ACCESS:
> ++	    u.res.client =3D va_arg(ap, ClientPtr);
> ++	    u.res.id =3D va_arg(ap, XID);
> ++	    u.res.rtype =3D va_arg(ap, RESTYPE);
> ++	    u.res.res =3D va_arg(ap, pointer);
> ++	    u.res.ptype =3D va_arg(ap, RESTYPE);
> ++	    u.res.parent =3D va_arg(ap, pointer);
> ++	    u.res.access_mode =3D va_arg(ap, Mask);
> ++	    u.res.status =3D Success; /* default allow */
> ++	    prv =3D &u.res.status;
> + 	    break;
> +-	}
> +-	case XACE_DEVICE_ACCESS: {
> +-	    XaceDeviceAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.dev =3D va_arg(ap, DeviceIntPtr);
> +-	    rec.access_mode =3D va_arg(ap, Mask);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_DEVICE_ACCESS:
> ++	    u.dev.client =3D va_arg(ap, ClientPtr);
> ++	    u.dev.dev =3D va_arg(ap, DeviceIntPtr);
> ++	    u.dev.access_mode =3D va_arg(ap, Mask);
> ++	    u.dev.status =3D Success; /* default allow */
> ++	    prv =3D &u.dev.status;
> + 	    break;
> +-	}
> +-	case XACE_SEND_ACCESS: {
> +-	    XaceSendAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.dev =3D va_arg(ap, DeviceIntPtr);
> +-	    rec.pWin =3D va_arg(ap, WindowPtr);
> +-	    rec.events =3D va_arg(ap, xEventPtr);
> +-	    rec.count =3D va_arg(ap, int);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_SEND_ACCESS:
> ++	    u.send.client =3D va_arg(ap, ClientPtr);
> ++	    u.send.dev =3D va_arg(ap, DeviceIntPtr);
> ++	    u.send.pWin =3D va_arg(ap, WindowPtr);
> ++	    u.send.events =3D va_arg(ap, xEventPtr);
> ++	    u.send.count =3D va_arg(ap, int);
> ++	    u.send.status =3D Success; /* default allow */
> ++	    prv =3D &u.send.status;
> + 	    break;
> +-	}
> +-	case XACE_RECEIVE_ACCESS: {
> +-	    XaceReceiveAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.pWin =3D va_arg(ap, WindowPtr);
> +-	    rec.events =3D va_arg(ap, xEventPtr);
> +-	    rec.count =3D va_arg(ap, int);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_RECEIVE_ACCESS:
> ++	    u.recv.client =3D va_arg(ap, ClientPtr);
> ++	    u.recv.pWin =3D va_arg(ap, WindowPtr);
> ++	    u.recv.events =3D va_arg(ap, xEventPtr);
> ++	    u.recv.count =3D va_arg(ap, int);
> ++	    u.recv.status =3D Success; /* default allow */
> ++	    prv =3D &u.recv.status;
> + 	    break;
> +-	}
> +-	case XACE_CLIENT_ACCESS: {
> +-	    XaceClientAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.target =3D va_arg(ap, ClientPtr);
> +-	    rec.access_mode =3D va_arg(ap, Mask);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_CLIENT_ACCESS:
> ++	    u.client.client =3D va_arg(ap, ClientPtr);
> ++	    u.client.target =3D va_arg(ap, ClientPtr);
> ++	    u.client.access_mode =3D va_arg(ap, Mask);
> ++	    u.client.status =3D Success; /* default allow */
> ++	    prv =3D &u.client.status;
> + 	    break;
> +-	}
> +-	case XACE_EXT_ACCESS: {
> +-	    XaceExtAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.ext =3D va_arg(ap, ExtensionEntry*);
> +-	    rec.access_mode =3D DixGetAttrAccess;
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_EXT_ACCESS:
> ++	    u.ext.client =3D va_arg(ap, ClientPtr);
> ++	    u.ext.ext =3D va_arg(ap, ExtensionEntry*);
> ++	    u.ext.access_mode =3D DixGetAttrAccess;
> ++	    u.ext.status =3D Success; /* default allow */
> ++	    prv =3D &u.ext.status;
> + 	    break;
> +-	}
> +-	case XACE_SERVER_ACCESS: {
> +-	    XaceServerAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.access_mode =3D va_arg(ap, Mask);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_SERVER_ACCESS:
> ++	    u.server.client =3D va_arg(ap, ClientPtr);
> ++	    u.server.access_mode =3D va_arg(ap, Mask);
> ++	    u.server.status =3D Success; /* default allow */
> ++	    prv =3D &u.server.status;
> + 	    break;
> +-	}
> + 	case XACE_SCREEN_ACCESS:
> +-	case XACE_SCREENSAVER_ACCESS: {
> +-	    XaceScreenAccessRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.screen =3D va_arg(ap, ScreenPtr);
> +-	    rec.access_mode =3D va_arg(ap, Mask);
> +-	    rec.status =3D Success; /* default allow */
> +-	    calldata =3D &rec;
> +-	    prv =3D &rec.status;
> ++	case XACE_SCREENSAVER_ACCESS:
> ++	    u.screen.client =3D va_arg(ap, ClientPtr);
> ++	    u.screen.screen =3D va_arg(ap, ScreenPtr);
> ++	    u.screen.access_mode =3D va_arg(ap, Mask);
> ++	    u.screen.status =3D Success; /* default allow */
> ++	    prv =3D &u.screen.status;
> + 	    break;
> +-	}
> +-	case XACE_AUTH_AVAIL: {
> +-	    XaceAuthAvailRec rec;
> +-	    rec.client =3D va_arg(ap, ClientPtr);
> +-	    rec.authId =3D va_arg(ap, XID);
> +-	    calldata =3D &rec;
> ++	case XACE_AUTH_AVAIL:
> ++	    u.auth.client =3D va_arg(ap, ClientPtr);
> ++	    u.auth.authId =3D va_arg(ap, XID);
> + 	    break;
> +-	}
> +-	case XACE_KEY_AVAIL: {
> +-	    XaceKeyAvailRec rec;
> +-	    rec.event =3D va_arg(ap, xEventPtr);
> +-	    rec.keybd =3D va_arg(ap, DeviceIntPtr);
> +-	    rec.count =3D va_arg(ap, int);
> +-	    calldata =3D &rec;
> ++	case XACE_KEY_AVAIL:
> ++	    u.key.event =3D va_arg(ap, xEventPtr);
> ++	    u.key.keybd =3D va_arg(ap, DeviceIntPtr);
> ++	    u.key.count =3D va_arg(ap, int);
> + 	    break;
> +-	}
> +-	default: {
> ++	default:
> + 	    va_end(ap);
> + 	    return 0;	/* unimplemented hook number */
> +-	}
> +     }
> +     va_end(ap);
> + =20
> +     /* call callbacks and return result, if any. */
> +-    CallCallbacks(&XaceHooks[hook], calldata);
> ++    CallCallbacks(&XaceHooks[hook], &u);
> +     return prv ? *prv : Success;
> + }
> +=20
> +--
> +cgit v0.9.0.2-2-gbebe
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.b=
b b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> index 360a0f3..d90dc25 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} +=3D "xkeyboard-config"
>  EXTRA_OECONF +=3D "--disable-glx"
> =20
>  PE =3D "1"
> -PR =3D "r29"
> +PR =3D "r30"
> =20
>  SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2=
 \
>  	file://extra-kmodes.patch \
> @@ -20,6 +20,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-ser=
ver-${PV}.tar.bz2 \
>  	file://fix-newer-xorg-headers.patch \
>  	file://crosscompile.patch \
>  	file://error-address-work-around.patch \
> +        file://fix-bogus-stack-variables.patch \
>  	file://nodolt.patch"
>  #	file://kdrive-evdev.patch
>  #	file://kdrive-use-evdev.patch
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+0HTUACgkQN1Ujt2V2gBzgYQCffcYeAHauW41MP9os1er0Xzpa
jTUAnR0/ijbEfHGVf0oHa4NI4aKppGlF
=a7AH
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
