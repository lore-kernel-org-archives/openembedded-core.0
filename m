Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RW9yZ-00064r-0A
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:59:11 +0100
Received: by qaea17 with SMTP id a17so4774728qae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=dlRh7YrRx6KcP1QB+kcQOT4pSIMwBgwL2eEztaTL/vQ=;
	b=s350iBauIvZXBKdlumaMnWKAshdyxHLc4NEhzlZkkZMOlku+gDDgGhWtDISK5KxeNI
	MpecTjWHDO3aEfttk7vENsb3uVLX7iNtsZpwpLem/ADHq+IhjHmrlPdHPBCxL1VA79Vg
	QFuUtOqD5PRBt/xuHDzWVnbu594mmTZ7Vy+kY=
Received: by 10.229.73.6 with SMTP id o6mr1541590qcj.10.1322758348688; Thu, 01
	Dec 2011 08:52:28 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Thu, 1 Dec 2011 08:52:07 -0800 (PST)
In-Reply-To: <116BB784-D819-4E20-AA54-999AFD65D943@dominion.thruhere.net>
References: <4ED7AD99.3060302@gmail.com>
	<116BB784-D819-4E20-AA54-999AFD65D943@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Dec 2011 09:52:07 -0700
X-Google-Sender-Auth: Z6MFQrF6Q8IS2ZrvxG_tBUdRMVM
Message-ID: <CABcZAN=UjL8BS0CWkrDsk4s5nQL1h58Xj7n9PRYKdx1O6UPsow@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lzop-1.03: add recipe
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
X-List-Received-Date: Thu, 01 Dec 2011 16:59:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 9:46 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> Op 1 dec. 2011, om 17:38 heeft Christopher Larson het volgende geschreven=
:
>
>> This is needed by some kernels when CONFIG_KERNEL_LZO=3Dy (specifically,=
 given
>> the current defconfig, this affects linux-omap4 2.6 in the meta-ti layer=
).
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>> meta/recipes-support/lzop/lzop/acinclude.m4 | =C2=A0390 ++++++++++++++++=
+++++++++++
>> meta/recipes-support/lzop/lzop_1.03.bb =C2=A0 =C2=A0 =C2=A0| =C2=A0 25 +=
+
>> 2 files changed, 415 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
>> create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
>>
>> diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-suppo=
rt/lzop/lzop_1.03.bb
>> new file mode 100644
>> index 0000000..02a5590
>> --- /dev/null
>> +++ b/meta/recipes-support/lzop/lzop_1.03.bb
>> @@ -0,0 +1,25 @@
>> +inherit autotools
>
> That should go below SUMMARY/DESCRIPTION/DEPENDS

Personally, I think the fact that inherits are immediate is a problem,
one we won't be able to fix in the long term unless we switch the
recipes to a layout more like this one. But if maintaining the style
standard is more important than that, I'll change it.

>> +SUMMARY =3D "Real-time file compressor"
>> +DESCRIPTION =3D "lzop is a compression utility which is designed to be =
a companion to gzip. \n\
>> +It is based on the LZO data compression library and its main advantages=
 over \n\
>> +gzip are much higher compression and decompression speed at the cost of=
 some \n\
>> +compression ratio. The lzop compression utility was designed with the g=
oals \n\
>> +of reliability, speed, portability and with reasonable drop-in compatib=
ility \n\
>> +to gzip."
>> +DEPENDS +=3D "lzo"
>
> I see the DEPENDS +=3D pattern a lot, what are we prepending to? Especial=
ly with the inherit going below this assignemnt.

I see it as being a statement of intent. I want to add this
dependency. I don't want to *replace* all dependencies. Regardless of
what the previous value was, I think this is a better reflection of my
intent.

>> +PR =3D "r0"
>> +
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddfeaf3dc4beef4f5a7bdbc35b197=
f39e \
>> + file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D6797bd3ed0a1a49327b=
7ebf9366ebd86"
>> +
>> +SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://acinclude.m4"
>> +
>> +do_configure () {
>> + =C2=A0 =C2=A0ln -sf ../acinclude.m4
>> + =C2=A0 =C2=A0autotools_do_configure
>> +}
>> +
>> +BBCLASSEXTEND +=3D "native"
>
> nativesdk as well I guess.

K.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


