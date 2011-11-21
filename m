Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RScXG-0008CX-KK
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 23:40:24 +0100
Received: by faat2 with SMTP id t2so6650355faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=cRtpol8nGYZcRtCA/wF6ctSSL3YC9L6HbDFoRK8UsDc=;
	b=O3unhUrVc7UdWQiqCTPJs7qF4XkW2+QlFkg4WqOsathLLDj9nIUdiGLM5PSBOdknvB
	BEeIlCxKVod0KCGx13nEeXvHJEeuSIdpjnIlcctSmF66QWwHWiBWDJH4AKIir/G6YjjD
	egtt3pzJuB858yIHKzDrUJjMiNXAnNVaBbTdw=
Received: by 10.152.148.168 with SMTP id tt8mr10532175lab.7.1321914832088;
	Mon, 21 Nov 2011 14:33:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 21 Nov 2011 14:33:21 -0800 (PST)
In-Reply-To: <1321908500.3347.4.camel@lenovo.internal.reciva.com>
References: <1321906980-16016-1-git-send-email-raj.khem@gmail.com>
	<1321908500.3347.4.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Nov 2011 14:33:21 -0800
Message-ID: <CAMKF1sppcoVAMemyt7KRnk0jXyNvYL0rf_XjtWNF6q3H27ko2g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: Unbreak native build when using TCLIBC=uclibc
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
X-List-Received-Date: Mon, 21 Nov 2011 22:40:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 12:48 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-11-21 at 12:23 -0800, Khem Raj wrote:
>> A recent change introduced EXTRA_OECONF_append_libc-uclibc =3D "
>> --with-versioned=3Dno " this change has a side effect when
>> building alsa-lib-native using TCLIBC=3Duclibc the override
>> kicks in uninvited and hence build the native package without symbol
>> version information. This mean libasound.so which is needed by other
>> packages from build host e.g. libSDL.so does not have required symbols
>> and linking with libSDL fails, one such case ends in SDL support
>> in qemu-native being silently disabled.
>>
>> We make sure that override is only enabled for target recipe
>
> This seems like the wrong solution to the problem. =C2=A0Shouldn't you be
> inhibiting the libc-uclibc OVERRIDE at source for native builds
> (assuming the host system isn't using uClibc)?

yes I thought of that that libc-uclibc/libc-glibc overrides should only
pertain to target recipes and not extend to native/nativesdk. This would
need probably redoing the overrides in native bbclass. I did not pursue it
since it would need lot more testing which I could not afford atm.

>
> It also seems as though there ought to be a more generic place to encode
> the knowledge that uClibc doesn't do symbol versioning. =C2=A0Having to h=
ack
> it into EXTRA_OECONF for every recipe seems... suboptimal.
>

while the feature is generic it does not seem to have impact on lot of
recipes

> p.
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb | =C2=A0 10 ++++=
++----
>> =C2=A01 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/re=
cipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
>> index 83e663d..fa96998 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
>> @@ -14,7 +14,7 @@ BBCLASSEXTEND =3D "native nativesdk"
>> =C2=A0#FIXME: remove the following
>> =C2=A0ARM_INSTRUCTION_SET =3D "arm"
>>
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =C2=A0SRC_URI =3D "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar=
.bz2 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-tstamp-declaration.=
patch"
>> @@ -27,10 +27,12 @@ inherit autotools pkgconfig
>> =C2=A0require alsa-fpu.inc
>> =C2=A0EXTRA_OECONF +=3D "${@get_alsa_fpu_setting(bb, d)} "
>>
>> -EXTRA_OECONF =3D "--with-cards=3Dpdaudiocf --with-oss=3Dyes --disable-p=
ython"
>> -
>> -EXTRA_OECONF_append_libc-uclibc =3D " --with-versioned=3Dno "
>> +EXTRA_OECONF =3D "--with-cards=3Dpdaudiocf --with-oss=3Dyes --disable-p=
ython ${VERSIONEDSYMS}"
>>
>> +VERSIONEDSYMS =3D ""
>> +VERSIONEDSYMS_libc-uclibc =3D "--with-versioned=3Dno"
>> +VERSIONEDSYMS_virtclass-native =3D ""
>> +VERSIONEDSYMS_virtclass-nativesdk =3D ""
>> =C2=A0PKGSUFFIX =3D ""
>> =C2=A0PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


