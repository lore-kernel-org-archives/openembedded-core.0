Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA9937E269
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 23:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 33441181DE;
	Tue,  2 Jul 2019 01:34:02 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id snX16xif9Swg; Tue,  2 Jul 2019 01:34:01 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C9FB41809C;
	Tue,  2 Jul 2019 01:34:00 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7C51E099;
	Tue,  2 Jul 2019 01:34:00 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F0EC1E098;
	Tue,  2 Jul 2019 01:34:00 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  2 Jul 2019 01:34:00 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 92F2127D8;
	Tue,  2 Jul 2019 01:34:00 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by XBOX01.axis.com (10.0.5.15)
	with Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 2 Jul 2019 01:34:00 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Tue, 2 Jul 2019 01:34:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
Thread-Index: AQHVL8H4hiSqMABPGkWtMYigx2N1Iqa2aPsQ
Date: Mon, 1 Jul 2019 23:34:00 +0000
Message-ID: <9b4441e390c842ef8d12442f872ada93@xbox06.axis.com>
References: <cover.1561954425.git.Qi.Chen@windriver.com>
	<8253aa4004e6a23f783cd930c222138f86d9fa3c.1561954425.git.Qi.Chen@windriver.com>
In-Reply-To: <8253aa4004e6a23f783cd930c222138f86d9fa3c.1561954425.git.Qi.Chen@windriver.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Mon, 01 Jul 2019 23:34:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Chen Qi
> Sent: den 1 juli 2019 06:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
>=20
> Check the existence of systemd before using systemctl to preset units.
> This is because even if 'systemd' is in DISTRO_FEATURES, it's possible
> that systemd is not even installed. e.g. container-test-image in
> meta-selftest layer.
>=20
> As systemd DEPENDS on systemd-systemctl-native, the existence of systemd
> also ensures the existence of systemd-systemctl-native.
>=20
> This would fix the following test case when using systemd as the init
> manager.
>=20
>   containerimage.ContainerImageTests.test_expected_files
>=20
> Also remove the IMAGE_EXTRADEPENDS setting, as nothing references this
> variable.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d2b2fb9..7daa97e 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -666,10 +666,11 @@ reproducible_final_image_task () {
>  }
>=20
>  systemd_preset_all () {
> -    systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only pre=
set-all
> +    if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
That should be ${systemd_system_unitdir}, which will also use the correct p=
ath=20
(it is /lib/systemd/system, not /lib/systemd/systemd).

> +	systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only preset=
-all
> +    fi
>  }
>=20
> -IMAGE_EXTRADEPENDS +=3D "${@ 'systemd-systemctl-native' if bb.utils.cont=
ains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contain=
s('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''}"
>  IMAGE_PREPROCESS_COMMAND_append =3D " ${@ 'systemd_preset_all;' if bb.ut=
ils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils=
.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} re=
producible_final_image_task; "
>=20
>  CVE_PRODUCT =3D ""
> --
> 1.9.1

//Peter


