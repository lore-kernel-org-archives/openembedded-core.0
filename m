Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BA11C60939
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 09:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 444B92E5E1;
	Thu,  1 Dec 2016 10:29:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id cCtXsU57zDzH; Thu,  1 Dec 2016 10:28:58 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id B88522E37F;
	Thu,  1 Dec 2016 10:28:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F3DE1A08D;
	Thu,  1 Dec 2016 10:28:58 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 944801A08C;
	Thu,  1 Dec 2016 10:28:58 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  1 Dec 2016 10:28:58 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 880E12BC;
	Thu,  1 Dec 2016 10:28:58 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 1 Dec 2016 10:28:58 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 1 Dec 2016 10:28:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/2 V5] systemd: Upgrade to 232
Thread-Index: AQHSSb4hj1q4IDcZxUeXR0ao+wKtXqDy1SnQ
Date: Thu, 1 Dec 2016 09:28:58 +0000
Message-ID: <6bd14a6cb6904f409632cae7f29ae287@XBOX02.axis.com>
References: <20161128212606.26139-1-raj.khem@gmail.com>
In-Reply-To: <20161128212606.26139-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V5] systemd: Upgrade to 232
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
X-List-Received-Date: Thu, 01 Dec 2016 09:29:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 28 november 2016 22:26
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2 V5] systemd: Upgrade to 232
>=20
> * Drop support for rcS.d SysV init scripts.
>   These are prone to cause dependency loops, and almost all packages
> with
>   rcS scripts now ship a native systemd service.
>=20
> * Drop mount propagation patch, it only happens with libseccomp, OE
> doesnt
>   enable it
>=20
> * kdbus option has disappeared from configure
>=20
> * Ignore dev-so for PN now since systemd introduced private .so see
>   https://github.com/systemd/systemd/issues/3810

Rather than adding:

INSANE_SKIP_${PN} +=3D "dev-so"

would it not be more appropriate to add=20
${systemd_unitdir}/libsystemd-shared.so to FILES_${PN}-dev, i.e.:

-FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd"
+FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd ${systemd_unitdir}/libsystemd-share=
d.so"

The binaries are linked with libsystemd-shared-232.so which ends up in=20
${PN} as usual.

> * Add libnss* to PACKAGES_DYNAMIC for libnss-resolve to work correctly
>=20
> * Forward port systemd-boot patches to systemd-232
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

//Peter


