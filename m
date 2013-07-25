Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A7C776A962
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 05:53:53 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so1580781pab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=l6clVgHgkRB++LYIWBwDp4OVhoZq3nWXDEmJTqaLJuc=;
	b=g5sWbdIRuc0liQyoRvNHEjuC7W5wqa6UiHi+GkVZ2KCYXus8AEzS0baPiQPS983srk
	GvgHaG4WfcZGCoXg/DvI/I30syd8TVmeN9ETcu3zXvTE65z9rX60qPFUr9v3xcpZy6nE
	ktziqNug/lDAeEZM1p5M7JckWA4AIbmbfFd+AVcXHVLdU3E/VR0faFHtY3S2/yqfZjKw
	jsxPco8sFhoJT+pu7LepclijDP3vL9muTXoUZG6PBqq0/twvUJaFAAv3viL0oUsyenvJ
	tIH3lgkoLvvlaeQFThFcWA6WmvJBN0sBjEr8PSPuGCD8QTLdSujaKcYOxhzorsWpzOVT
	UD/A==
X-Received: by 10.68.115.131 with SMTP id jo3mr46172856pbb.133.1374731634111; 
	Wed, 24 Jul 2013 22:53:54 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id lo1sm7537703pab.19.2013.07.24.22.53.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 22:53:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1374481350.6719.83.camel@bril0118.bri.st.com>
Date: Wed, 24 Jul 2013 22:53:51 -0700
Message-Id: <35FBC86C-4C61-48E0-9C0D-68A773E17F50@gmail.com>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
To: =?iso-8859-1?Q?Andr=E9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Thu, 25 Jul 2013 05:53:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 22, 2013, at 1:22 AM, Andr=E9 Draszik <andre.draszik@linaro.org> =
wrote:

> Hi,
>=20
> Instead of penalising everybody, would it be possible to make this
> change dependent on the build machine (ram + swap)? Or to only add
> -Wl,--no-keep-memory if the build failed without it?

penalty is not as much when you do parallel builds. However it will be =
good
to measure how much extra built time is needed when this options is =
active.
if its regressing the build time considerably then we need to make a =
choice.


>=20
> Not sure if it would make any difference, but do you see this only =
with
> full debug enabled (-ggdb)? If yes, can the debug flags be changed, or
> that linker flag only be added, if full debug is enabled?
>=20
>=20
> Cheers,
> Andre'
>=20
> On Mon, 2013-07-22 at 15:51 +0800, Kai Kang wrote:
>> Build webkit-gtk occupies lot of memory and fails on some host:
>> | =
...tmp/sysroots/i686-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-lin=
ux/4.8.1/ld:
>> failed to set dynamic section sizes: Memory exhausted
>> | collect2: error: ld returned 1 exit status
>> | make[1]: *** [libwebkitgtk-1.0.la] Error 1
>>=20
>> Add ld option to fix it.
>>=20
>> Refer to:
>> http://comments.gmane.org/gmane.os.opendarwin.webkit.devel/20078
>>=20
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb =
b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
>> index 5691d3f..90625a3 100644
>> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
>> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
>> @@ -60,6 +60,8 @@ CPPFLAGS_append_powerpc =3D " =
-I${STAGING_INCDIR}/pango-1.0 \
>>=20
>> EXTRA_AUTORECONF =3D " -I Source/autotools "
>>=20
>> +# Fix compile error: "ld: failed to set dynamic section sizes: =
Memory exhausted"
>> +LDFLAGS +=3D " -Wl,--no-keep-memory"
>>=20
>> #| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member =
function 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) =
[with T =3D JSC::Structure, JSC::HandleTypes<T>::ExternalType =3D =
JSC::Structure*, JSC::HandleSlot =3D JSC::JSValue*]':
>> #| ./Source/JavaScriptCore/heap/Handle.h:141:79:   instantiated from =
'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T =3D =
JSC::Structure, JSC::Handle<T>::ExternalType =3D JSC::Structure*]'
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


