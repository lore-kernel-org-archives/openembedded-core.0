Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNvGV-0004e1-1E
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 01:07:23 +0200
Received: by eye27 with SMTP id 27so1543302eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 16:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=rLB7wUyAS2Z6LBLM33FZDwQUu+pKS1FjkrZac7sLtkU=;
	b=NHj55VP+hRWEUHe7xY9luEsQQTK7O5hXm4v+FPi9sLqeTnAPWirhW/l0s9VIsL/t2y
	BjEkgMZubIi5tbE+g6yO+CSSWfHhEak5u50uPDvDnjmVhwBqTSUj64wR/cPKPlWf0tni
	/keWj9mPvopygYFyIP7oX5WT20X13dSyPGfr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=VtDOSy5v89Fdk9CbYw5Z09TUGJddv5l4z7SUFBe4r7zXuYASFS06XXrJIGjCSoP9C9
	QTR9MEhuABAP0a2udNafbiQH2WPPSfiH56j0vvFaeEQ1EfLB2whOFaTGXnGj41ytdqMw
	Us8jrRdtv5XL1fD4qJA7bG3P/dTBJRzqnf5YE=
Received: by 10.14.119.1 with SMTP id m1mr325625eeh.44.1306019062301; Sat, 21
	May 2011 16:04:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Sat, 21 May 2011 16:03:52 -0700 (PDT)
In-Reply-To: <2A972D3F-1633-4B54-8E59-87D815DECDAD@dominion.thruhere.net>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
	<1305959660.18415.252.camel@lenovo.internal.reciva.com>
	<51ED17D8-BCDC-4A28-B537-5EBDAE71772B@gmail.com>
	<2A972D3F-1633-4B54-8E59-87D815DECDAD@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 May 2011 16:03:52 -0700
Message-ID: <BANLkTin-6yeHq3R9drDBysuHXWquQfOiDw@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 May 2011 23:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2011 at 12:17 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 21 mei 2011, om 09:19 heeft Khem Raj het volgende geschreven:
>
>>
>>
>> -Khem
>>
>> On May 20, 2011, at 11:34 PM, Phil Blundell <pb@pbcl.net> wrote:
>>
>>> On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
>>>> -DEPENDS =3D "avahi gtk+"
>>>> +DEPENDS =3D "avahi ${GTKDEP}"
>>>> +GTKDEP-libc-uclibc =3D ""
>>>> +GTKDEP =3D "gtk+"
>>>
>>> Does that really work? =C2=A0Surely it should be "GTKDEP_libc-uclibc".
>>>
>>
>> No it does not RP pointed it out earlier and I have since fixed it
>>
>>>> -EXTRA_OECONF =3D " --with-gtk "
>>>> -
>>>> +EXTRA_OECONF_libc-glibc =3D " --with-gtk "
>>>> +EXTRA_OECONF_libc-uclibc =3D " --without-gtk --without-gnome "
>>>
>>> Can you make this use the same logic as above?
>>>
>>
>> Is there a problem with this logic ?
>>
>>>> +DESKTOPINSTALL =3D ""
>>>> +DESKTOPINSTALL_libc-glibc () {
>>>> + =C2=A0 =C2=A0install -d ${D}${datadir}/distcc/
>>>> =C2=A0 install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadi=
r}/distcc/
>>>> }
>>>
>>> Likewise, or find some way to eliminate it entirely.
>>>
>>>> -
>>>> -PACKAGES +=3D "distcc-distmon-gnome"
>>>> +PACKAGES_append_libc-glibc =3D " distcc-distmon-gnome"
>>>
>>> Is that needed?
>>>
>>
>> May be not it will just be empty in uclibc case
>
> since ALLOW_EMPTY is not set, this change is unneeded.

I have include these comments in the new version pushed to pull
branch. Hopefully this time its ok.


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


