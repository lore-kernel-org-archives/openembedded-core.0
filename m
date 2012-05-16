Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUeLk-0006rL-O1
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 15:33:09 +0200
Received: by yhjj56 with SMTP id j56so830311yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sR0uaCLBvmPbYgvM/8utlpNQIxWgkO5RAn2KJ5TPb2A=;
	b=o5nyTWpK9RlQmneF4aN3vcdx3BMfYAo4dqsRauwVy0JqrwE8ZFkjLGElml3Htqu5je
	aYXN1rdl0p+u/ysfoWxlLqdCbzRg7vlb+sJTk32meweJQDDgGXfNEvhY+YXUOGHI4uTA
	rFbq5NdJ2yFhFMc6862NynnM8FuMUiqNThlee8slaG93R7cO7FmSSnH6OEvYyzyCUujS
	L8UYPTpjTA/8nWD163RTpsWdK6NmOZjHCKt81jRmJ+SIvRk6D6AqFD92KA+fdvRUZMJW
	sc64hYzt5QiY2kD7lRbt505SPKH2Utv2DOlIo5TId6K9FmnniOzAi+px2qk/TP2gT0Cx
	rLPQ==
MIME-Version: 1.0
Received: by 10.236.75.232 with SMTP id z68mr3578133yhd.6.1337174586824; Wed,
	16 May 2012 06:23:06 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Wed, 16 May 2012 06:23:06 -0700 (PDT)
In-Reply-To: <1337173763-27981-1-git-send-email-gary@mlbassoc.com>
References: <1337173763-27981-1-git-send-email-gary@mlbassoc.com>
Date: Wed, 16 May 2012 15:23:06 +0200
Message-ID: <CA+chaQfhDC9crzPtxRbQ7NSvjDQRzYibiWPhTCOHd2bkhnuC3A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 16 May 2012 13:33:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 3:09 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> The function XaceHook() was trying to do something like this:
> =C2=A0 void *ptr;
> =C2=A0 switch(XX) {
> =C2=A0 =C2=A0 =C2=A0case a:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_some_structure A;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D &A;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> =C2=A0 =C2=A0 =C2=A0case b:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_some_structure B;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D &B;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> =C2=A0 }
> =C2=A0 call_some_function(ptr);
>
> Clearly this is not even legal - the scope of the variables A & B
> is not well defined outside of the switch cases. =C2=A0This code pattern
> stopped working on PowerPC with GCC >=3D 4.7.1 (it has worked forever
> up to & including 4.6.3). =C2=A0Replace this sequence with legal code:
> =C2=A0 switch(XX) {
> =C2=A0 =C2=A0 =C2=A0case a:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_some_structure A;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_some_function(&A);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> =C2=A0 =C2=A0 =C2=A0case b:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_some_structure B;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_some_function(&B);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> =C2=A0 }
> ---
> =C2=A0.../fix-bogus-stack-variables.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0130 ++++++++++++++++++++
> =C2=A0.../xorg-xserver/xserver-kdrive_1.7.99.2.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 +-
> =C2=A02 files changed, 132 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdriv=
e-1.7.99.2/fix-bogus-stack-variables.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/f=
ix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xserver=
-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
> new file mode 100644
> index 0000000..0946dfb
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogu=
s-stack-variables.patch
> @@ -0,0 +1,130 @@
> +Index: xorg-server-1.7.99.2/Xext/xace.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- xorg-server-1.7.99.2.orig/Xext/xace.c
> ++++ xorg-server-1.7.99.2/Xext/xace.c
> +@@ -87,8 +87,7 @@ void XaceHookAuditEnd(ClientPtr ptr, int
> + =C2=A0*/
> + int XaceHook(int hook, ...)
> + {
> +- =C2=A0 =C2=A0pointer calldata; /* data passed to callback */
> +- =C2=A0 =C2=A0int *prv =3D NULL; =C2=A0/* points to return value from c=
allback */
> ++ =C2=A0 =C2=A0int res =3D Success;
> + =C2=A0 =C2=A0 va_list ap; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* argument list */
> + =C2=A0 =C2=A0 va_start(ap, hook);
> +
> +@@ -109,8 +108,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.parent =3D va_arg(ap, pointer);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.access_mode =3D va_arg(ap, Mask)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_DEVICE_ACCESS: {
> +@@ -119,8 +118,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.dev =3D va_arg(ap, DeviceIntPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.access_mode =3D va_arg(ap, Mask)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_SEND_ACCESS: {
> +@@ -131,8 +130,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.events =3D va_arg(ap, xEventPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.count =3D va_arg(ap, int);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_RECEIVE_ACCESS: {
> +@@ -142,8 +141,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.events =3D va_arg(ap, xEventPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.count =3D va_arg(ap, int);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_CLIENT_ACCESS: {
> +@@ -152,8 +151,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.target =3D va_arg(ap, ClientPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.access_mode =3D va_arg(ap, Mask)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_EXT_ACCESS: {
> +@@ -162,8 +161,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.ext =3D va_arg(ap, ExtensionEntr=
y*);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.access_mode =3D DixGetAttrAccess=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_SERVER_ACCESS: {
> +@@ -171,8 +170,8 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.client =3D va_arg(ap, ClientPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.access_mode =3D va_arg(ap, Mask)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_SCREEN_ACCESS:
> +@@ -182,15 +181,15 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.screen =3D va_arg(ap, ScreenPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.access_mode =3D va_arg(ap, Mask)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.status =3D Success; /* default a=
llow */
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prv =3D &rec.status;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D rec.status;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_AUTH_AVAIL: {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XaceAuthAvailRec rec;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.client =3D va_arg(ap, ClientPtr)=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.authId =3D va_arg(ap, XID);
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 case XACE_KEY_AVAIL: {
> +@@ -198,7 +197,7 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.event =3D va_arg(ap, xEventPtr);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.keybd =3D va_arg(ap, DeviceIntPt=
r);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rec.count =3D va_arg(ap, int);
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calldata =3D &rec;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], &rec=
);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 default: {
> +@@ -208,9 +207,7 @@ int XaceHook(int hook, ...)
> + =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 va_end(ap);
> +
> +- =C2=A0 =C2=A0/* call callbacks and return result, if any. */
> +- =C2=A0 =C2=A0CallCallbacks(&XaceHooks[hook], calldata);
> +- =C2=A0 =C2=A0return prv ? *prv : Success;
> ++ =C2=A0 =C2=A0return res;
> + }
> +
> + /* XaceCensorImage
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.b=
b b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> index 360a0f3..dc17e2b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} +=3D "xkeyboard-config"
> =C2=A0EXTRA_OECONF +=3D "--disable-glx"
>
> =C2=A0PE =3D "1"
> -PR =3D "r29"
> +PR =3D "r30"
>
> =C2=A0SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.ta=
r.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://extra-kmodes.patch \
> @@ -21,6 +21,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-ser=
ver-${PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crosscompile.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://error-address-work-around.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nodolt.patch"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-bogus-stack-variables.patch \
> =C2=A0# =C2=A0 =C2=A0 =C2=A0file://kdrive-evdev.patch
> =C2=A0# =C2=A0 =C2=A0 =C2=A0file://kdrive-use-evdev.patch
> =C2=A0# =C2=A0 =C2=A0 =C2=A0file://enable-builtin-fonts.patch
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Isn't this better fix?
http://cgit.freedesktop.org/xorg/xserver/commit/Xext/xace.c?id=3D6dae7f3792=
611aace1df0cca63bf50c50d93de43


