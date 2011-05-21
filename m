Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNgXc-0004hV-E1
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 09:24:28 +0200
Received: by pwj9 with SMTP id 9so2075997pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 00:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=T3GW1Hq/zOcm7n0fn4DE4/5hZdKOa4J7sYDzwxeMJrs=;
	b=LbtAfsv9bwbZTR97A4XOlrK9yi/l2EnYb4gruEsnxVpcH3Ndi27xiQbpB7/RXFHlt8
	6c32hAFJYV/b/Em49dyTZ+mfaVD4P/vs6r1vTm0IU3AuXxITKa3zdPCzUB4k1yno3r9T
	At3EHgs5Q1Nt8YRqPCEzt+yQ7HSBVegYNW6do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=c6fQttEsegGgRlAqR6MUMsnHBMmfxOAsmlaKhwRyfkok7mVNuLdtn+ZSfgzYYhM0hZ
	4VaTR070xZxHewIEWxaHm9BjyBxX9iR5z00/bJWejh6J0Z0saye4zFxP5KTcZuCTdbb/
	pdEbQf8zHODbHJKIRKs2VUMl8NHgc4PFKo50g=
Received: by 10.68.32.3 with SMTP id e3mr421309pbi.325.1305962347415;
	Sat, 21 May 2011 00:19:07 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id h7sm2955859pbg.74.2011.05.21.00.19.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 May 2011 00:19:06 -0700 (PDT)
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
	<1305959660.18415.252.camel@lenovo.internal.reciva.com>
In-Reply-To: <1305959660.18415.252.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <51ED17D8-BCDC-4A28-B537-5EBDAE71772B@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 May 2011 00:19:30 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 07:24:28 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On May 20, 2011, at 11:34 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
>> -DEPENDS =3D "avahi gtk+"
>> +DEPENDS =3D "avahi ${GTKDEP}"
>> +GTKDEP-libc-uclibc =3D ""
>> +GTKDEP =3D "gtk+"
>=20
> Does that really work?  Surely it should be "GTKDEP_libc-uclibc".
>=20

No it does not RP pointed it out earlier and I have since fixed it

>> -EXTRA_OECONF =3D " --with-gtk "
>> -
>> +EXTRA_OECONF_libc-glibc =3D " --with-gtk "
>> +EXTRA_OECONF_libc-uclibc =3D " --without-gtk --without-gnome "
>=20
> Can you make this use the same logic as above?
>=20

Is there a problem with this logic ?

>> +DESKTOPINSTALL =3D ""
>> +DESKTOPINSTALL_libc-glibc () {
>> +    install -d ${D}${datadir}/distcc/
>>     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/dis=
tcc/
>> }
>=20
> Likewise, or find some way to eliminate it entirely.
>=20
>> -
>> -PACKAGES +=3D "distcc-distmon-gnome"
>> +PACKAGES_append_libc-glibc =3D " distcc-distmon-gnome"
>=20
> Is that needed?
>=20

May be not it will just be empty in uclibc case
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


