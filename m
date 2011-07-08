Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QfDj9-000329-88
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:16:27 +0200
Received: by wwi18 with SMTP id 18so1737766wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 09:12:34 -0700 (PDT)
Received: by 10.227.174.11 with SMTP id r11mr1942363wbz.11.1310141554643;
	Fri, 08 Jul 2011 09:12:34 -0700 (PDT)
Received: from [172.16.66.153] (host-131-196-68-109.spectrum1.uk.sharedband.net
	[109.68.196.131])
	by mx.google.com with ESMTPS id c17sm7805394wbh.46.2011.07.08.09.12.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 09:12:33 -0700 (PDT)
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<73f52ab56a2f932082e954f5650896cdee010fee.1310132765.git.otavio@ossystems.com.br>
	<1310139528.20015.894.camel@rex>
In-Reply-To: <1310139528.20015.894.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <834CF89E-9509-4847-9AC1-A0F9581CDE20@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 17:12:28 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] fix SDK building due TARGET_ARCH use in installation path
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
X-List-Received-Date: Fri, 08 Jul 2011 16:16:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I'll take a look when I get back into the country next week

Op 8 jul. 2011 om 16:38 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
>> TARGET_ARCH makes the building too fragile since it changes during
>> building of target and nativesdk binaries thus making it difficult to
>> handle a proper path for installation of binaries. The fix for it is
>> to move it to toolchain tarball name.
>>=20
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> meta/classes/populate_sdk.bbclass |    2 +-
>> meta/conf/bitbake.conf            |    2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sd=
k.bbclass
>> index 089ed9a..03b6d0f 100644
>> --- a/meta/classes/populate_sdk.bbclass
>> +++ b/meta/classes/populate_sdk.bbclass
>> @@ -9,7 +9,7 @@ SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${TARGET_SYS}"
>>=20
>> TOOLCHAIN_HOST_TASK ?=3D "task-sdk-host-nativesdk task-cross-canadian-${T=
RANSLATED_TARGET_ARCH}"
>> TOOLCHAIN_TARGET_TASK ?=3D "task-core-standalone-sdk-target task-core-sta=
ndalone-sdk-target-dbg"
>> -TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
>> +TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-${SDK_ARCH}-${TARGET_ARCH}-toolch=
ain-${DISTRO_VERSION}"
>>=20
>> RDEPENDS =3D "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>> DEPENDS =3D "virtual/fakeroot-native sed-native"
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index bdaa35d..cc2b8e2 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -341,7 +341,7 @@ DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
>>=20
>> PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
>>=20
>> -SDK_NAME =3D "oecore-${SDK_ARCH}-${TARGET_ARCH}"
>> +SDK_NAME =3D "oecore-sdk-${DISTRO}"
>> SDKPATH =3D "/usr/local/${SDK_NAME}"
>> SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
>=20
> I'd really like Koen to take a look at this with his Angstrom hat on. I
> still suspect the better fix for this is likely to end up with:
>=20
> SDK_NAME =3D "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> -SDKPATH =3D "/usr/local/${SDK_NAME}"
> +SDKPATH =3D "/usr/local/oecore-sdk-${DISTRO}"
> SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
>=20
> Certainly having TARGET_ARCH in SDKPATH is a bad idea but I think the
> SDK_NAME variable could make sense as it is originally...
>=20
> Cheers,
>=20
> Richard
>=20


