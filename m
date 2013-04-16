Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US2wG-0001OV-Hs
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 12:16:53 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so148958eek.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=mr4Nnwk6EdL2CGdxq1+1g3/K0eMdBHWMaRH0vCMs9NE=;
	b=C+u6RU9JCDLZYJqRjxUlK+aLAZA+JhjmddWMVD/IckOqzc3quaiTT45VQx5lKbmT4Z
	gEPhsLezx8jr0sILe20XG7hysia7p/pr72qXG/dhRAMHpMzEhGCuOnKkYyCTZGIX2W/1
	uBKHwpL7mUuauOkeOkv8w9RvAdBzYhNG7OnqAQ9zD3yNdZfqCpkZtZK1zDqhNbMAp9gU
	XHWPS4PNoJC/i8bui0G9OeV5sDXenWU0gjdJ2oVU2ZN0cQvpct6dP2xcH9jaCKIrT0tq
	Xx8GEDtUIDk/wILKtJBChyrscp3aP6lYiH2MlIxBYdq6BdRL09+ExAtJJ4FJV/NmPf/7
	xbLw==
X-Received: by 10.15.48.4 with SMTP id g4mr4722033eew.28.1366106346474;
	Tue, 16 Apr 2013 02:59:06 -0700 (PDT)
Received: from ?IPv6:2001:610:612::54ef:65c2:8845:b14b?
	([2001:610:612:0:54ef:65c2:8845:b14b])
	by mx.google.com with ESMTPS id 8sm1844297eeg.15.2013.04.16.02.59.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 02:59:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366106058.8670.89.camel@ted>
Date: Tue, 16 Apr 2013 11:59:08 +0200
Message-Id: <EDFD893A-99B8-4C91-86DB-FFD37D78200E@dominion.thruhere.net>
References: <1366103412-10924-1-git-send-email-koen@dominion.thruhere.net>
	<1366106058.8670.89.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQl8nrg7w2DDSyAGhbTD8ZC7SGWB/xS0ldAWJNtSMUpe49OaCd3Z+HiAgCwZ6xvC+m19RzKS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: add libpng to DEPENDS
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
X-List-Received-Date: Tue, 16 Apr 2013 10:16:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 apr. 2013, om 11:54 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Tue, 2013-04-16 at 11:10 +0200, Koen Kooi wrote:
>> Pango links indirectly to libpng through the cairo-png dependency, =
but
>> does encode the libpng version in its .la files. Changing libpng
>> versions will make a rebuild fail, so let's cheat a bit to let sstate
>> rebuild pango as well to get around this.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-graphics/pango/pango.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> This doesn't follow. If pango -> cairo -> libpng and libpng changes,
> both cairo and pango will rebuild.

If it did get rebuilt it still had references to non-existent libpng16  =
.la in its .la files.

> What might be the problem is that autotools (or more likely libtool)
> isn't rebuilding correctly. This was solved with the separate build
> directory code. Have you enabled that?

Not that I know off. How do I do that?

regards,

Koen

>=20
> Cheers,
>=20
> Richard
>=20
>> diff --git a/meta/recipes-graphics/pango/pango.inc =
b/meta/recipes-graphics/pango/pango.inc
>> index f622903..c1beb9e 100644
>> --- a/meta/recipes-graphics/pango/pango.inc
>> +++ b/meta/recipes-graphics/pango/pango.inc
>> @@ -10,7 +10,7 @@ SECTION =3D "libs"
>> LICENSE =3D "LGPLv2.0+"
>>=20
>> X11DEPENDS =3D "virtual/libx11 libxft"
>> -DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv =
cairo elfutils harfbuzz"
>> +DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv =
cairo elfutils harfbuzz libpng"
>>=20
>> PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', =
'x11', '', d)}"
>> PACKAGECONFIG[x11] =3D "--with-x,--without-x,${X11DEPENDS}"
>=20
>=20



