Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBmky-0002ev-43
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 13:36:41 +0200
Received: by wwb17 with SMTP id 17so4657589wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 04:34:19 -0700 (PDT)
Received: by 10.227.197.21 with SMTP id ei21mr4874282wbb.107.1303126459608;
	Mon, 18 Apr 2011 04:34:19 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bd8sm3201643wbb.65.2011.04.18.04.34.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 04:34:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303126125.5518.118.camel@rex>
Date: Mon, 18 Apr 2011 13:34:18 +0200
Message-Id: <0E9C83CD-3E86-46B3-B749-6FAFB94E4BAF@dominion.thruhere.net>
References: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>
	<1303126125.5518.118.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Is BBCLASSEXTEND in .bbappend supposed to work?
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
X-List-Received-Date: Mon, 18 Apr 2011 11:36:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 13:28 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-04-18 at 12:55 +0200, Koen Kooi wrote:
>> Martin did some Xorg cleanup in meta-oe today and we're seeing some =
strange behaviour.  The recipe in question:
>>=20
>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ cat =
recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>> BBCLASSEXTEND =3D "native nativesdk"
>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$=20
>>=20
>> Bitbake-layers tells me:
>>=20
>> INFO: libxrender_0.9.6.bb:
>> INFO:   =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/l=
ibxrender_0.9.6.bbappend
>>=20
>> So the append is getting picked up, but bitbake gives me:
>>=20
>> ERROR: Nothing PROVIDES 'libxrender-native'
>> NOTE: Runtime target 'libnss-mdns' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['libnss-mdns', 'avahi', =
'gtk+', 'gtk+-native', 'libxrender-native']
>>=20
>> This is with HEAD of bitbake master.
>=20
> I did some experimentation here and this looks like bitbake-layers is
> seeing the file but bitbake is not. If I touch the libxrender .bb file
> and then run bitbake -DDD, I see the file mentioned in the logs:
>=20
> $ touch recipes-graphics/xorg-lib/libxrender_0.9.6.bb
> $ bitbake libxrender-native -DDD | grep append
> DEBUG: Appending .bbappend file =
/rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend to =
/rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
> DEBUG: BB =
/rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend: =
handle(data, include)
> DEBUG: LOAD =
/rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
>=20
> Can you confirm you're seeing that? Admittedly I just hacked a local
> checkout and I'm not using meta-oe.

I get:

koen@dominion:/OE/tentacle/build$ touch =
../sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9=
.6.bb=20
koen@dominion:/OE/tentacle/build$ bitbake libxrender-native -DDD | grep =
append
DEBUG: Appending .bbappend file =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/l=
ibxrender_0.9.6.bbappend to =
/OE/tentacle/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libx=
render_0.9.6.bb
DEBUG: BB =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/l=
ibxrender_0.9.6.bbappend: handle(data, include)
DEBUG: LOAD =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/l=
ibxrender_0.9.6.bbappend

It then chokes on renderproto-native, which gets fixes by touching the =
.bb. So it looks like bitbake has some caching issues.


>=20
> Do you need to add *.bbappend to BBFILES in layer.conf ?

I have that already :)=


