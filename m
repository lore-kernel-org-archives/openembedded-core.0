Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S59yQ-0004jc-Le
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 07:03:42 +0100
Received: by wera1 with SMTP id a1so3722078wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 21:55:06 -0800 (PST)
Received: by 10.180.86.9 with SMTP id l9mr1320901wiz.15.1331099705851;
	Tue, 06 Mar 2012 21:55:05 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm34213000wic.0.2012.03.06.21.55.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 21:55:04 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F567B1E.5060003@opendreambox.org>
Date: Wed, 7 Mar 2012 06:55:03 +0100
Message-Id: <C62AEB47-77D3-4B6F-B8DD-2C7268EDAF3A@dominion.thruhere.net>
References: <cover.1331053126.git.sgw@linux.intel.com>
	<b00d6f957a3ac9bcdab9dda1e887ad36b3bab852.1331053126.git.sgw@linux.intel.com>
	<4F567B1E.5060003@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQno/dgHWk8jQ7/VGPRFKvzqtgnDfLJjnroU8u2940OVUZkKmZ8d9g08YN1ifwxEA9kSMsa0
Subject: Re: [CONSOLIDATED PULL 17/20] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Wed, 07 Mar 2012 06:03:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mrt. 2012, om 22:01 heeft Andreas Oberritter het volgende =
geschreven:

> On 06.03.2012 18:03, Saul Wold wrote:
>> From: Koen Kooi <koen@dominion.thruhere.net>
>>=20
>> As usual, this creates problems for upgrade paths, but splitting out =
the lib is worth the short term hassle
>=20
> Sorry, if I'm missing the obvious, but how is this different than the
> patch I submitted to do the same thing with bzip2 and libbz2, which =
got
> rejected by Koen?

It's different because there's a matching patch to meta-oe that bumps =
the PR for affected packages. Squashfstools has its own internal lzma =
lib, so no linking problems in oe-core.

regards,

Koen


>=20
> See http://patches.openembedded.org/patch/22015/ .
>=20
> Regards,
> Andreas
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-extended/xz/xz_5.0.3.bb |    9 ++++++++-
>> 1 files changed, 8 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb =
b/meta/recipes-extended/xz/xz_5.0.3.bb
>> index bae71ec..e8f96b6 100644
>> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
>> +++ b/meta/recipes-extended/xz/xz_5.0.3.bb
>> @@ -14,8 +14,15 @@ SRC_URI =3D =
"http://tukaani.org/xz/xz-${PV}.tar.gz"
>> SRC_URI[md5sum] =3D "fefe52f9ecd521de2a8ce38c21a27574"
>> SRC_URI[sha256sum] =3D =
"10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
>>=20
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>> inherit autotools gettext
>>=20
>> +PACKAGES =3D+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
>> +
>> +FILES_liblzma =3D "${libdir}/liblzma*${SOLIBS}"
>> +FILES_liblzma-dev =3D "${includedir}/lzma* =
${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la =
${libdir}/pkgconfig/liblzma.pc"
>> +FILES_liblzma-staticdev =3D "${libdir}/liblzma.a"
>> +FILES_liblzma-dbg =3D "${libdir}/.debug/liblzma*"
>> +
>> BBCLASSEXTEND =3D "native"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



