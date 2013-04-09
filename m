Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UPOT5-0002cj-6r
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 04:39:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r392MATY023698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 19:22:10 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 8 Apr 2013 19:22:10 -0700
Message-ID: <51637BC3.2040702@windriver.com>
Date: Tue, 9 Apr 2013 10:24:03 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1365401439.git.kai.kang@windriver.com>
	<cc464b33c56579c26179fa20c7354c328b4e080c.1365401439.git.kai.kang@windriver.com>
	<5162DBCE.8060904@windriver.com>
In-Reply-To: <5162DBCE.8060904@windriver.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r392MATY023698
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libpng12: rename libpng_1.2.50 to libpng12
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
X-List-Received-Date: Tue, 09 Apr 2013 02:39:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B404=E6=9C=8808=E6=97=A5 23:01, Mark Hatle wrote:
> On 4/8/13 4:12 AM, Kang Kai wrote:
>> As Mark's suggestion, rename libpng_1.2.50 to libpng12 that
>> multi-versions libpng could coexist. And drop files that conflict with
>> higher version.
>>
>> We want to make sure we have both the old and new versions to meet LSB
>> compliance (for people who have that enabled) as well as the new versi=
on
>> for newer applications.
>>
>> CC: Mark Hatle <mark.hatle@windriver.com>
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> .../{libpng_1.2.50.bb =3D> libpng12_1.2.50.bb} | 18 +++++++++++++++---
>> 1 files changed, 15 insertions(+), 3 deletions(-)
>> rename meta/recipes-lsb4/libpng/{libpng_1.2.50.bb =3D>=20
>> libpng12_1.2.50.bb} (62%)
>>
>> diff --git a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb=20
>> b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
>> similarity index 62%
>> rename from meta/recipes-lsb4/libpng/libpng_1.2.50.bb
>> rename to meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
>> index 8fdc41b..43ff75a 100644
>> --- a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb
>> +++ b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
>> @@ -8,14 +8,26 @@ LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dc3d807a85c09ebdff087f18b4969ff96 \
>> DEPENDS =3D "zlib"
>> PR =3D "r0"
>>
>> +PN =3D "libpng12"
>> +S =3D "${WORKDIR}/libpng-${PV}"
>> +
>> SRC_URI =3D=20
>> "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.=
xz"
>>
>> SRC_URI[md5sum] =3D "a3e00fccbfe356174ab515b5c00641c7"
>> SRC_URI[sha256sum] =3D=20
>> "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
>>
>> +BINCONFIG_GLOB =3D "${PN}-config"
>> +
>> inherit autotools binconfig pkgconfig
>>
>> -PACKAGES =3D+ "${PN}12"
>> +do_install_append() {
>> + unlink ${D}/${includedir}/png.h
>> + unlink ${D}/${includedir}/pngconf.h
>

Hi Mark,

> You should move those two into a subdirectory called=20
> "${D}/${includedir}/libpng12/"
>
> That way they will still be available for anyone who needs them.
Files
/usr/include/libpng12/png.h
/usr/include/libpng12/pngconf.h

already exist. Those two files unlinked link to them and conflict with=20
libpng16.

>
>> +
>> + unlink ${D}/${libdir}/libpng.la
>> + unlink ${D}/${libdir}/libpng.so
>> + unlink ${D}/${libdir}/libpng.a
>
> The .la, .a seen above should be similarly renamed to be libpng12...=20
> The .so should be dropped, as anyone who needs the alternative version=20
> would need to directly specify it.

Same reason. They are links to libpng12.*.

>
>> + unlink ${D}/${libdir}/pkgconfig/libpng.pc
>
> Should be renamed to be libpng12.pc.
>
> (Note both the .la and .pc files will likely need to be modified to=20
> reference the correct header and library paths.)

libpng12.pc exists too, and the patch I checked that are right.

>
>> -FILES_${PN}12 =3D "${libdir}/libpng12${SOLIBS}"
>> -RPROVIDES_${PN}-dev +=3D "${PN}12-dev"
>> + unlink ${D}/${bindir}/libpng-config
>> +}
>
> The above should be renamed to be "libpng12-config".
Link file too.

> (Again, make sure that the results of it match the renamed .a/.so and=20
> include paths.)
>
> --Mark
>

Thanks for detailed review, I'll add some comment to make it clear.

--=20
Regards,
Neil | Kai Kang



