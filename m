Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 621106B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D30B0182CB;
	Mon, 11 Mar 2019 05:20:28 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dTP8TWr_4BlY; Mon, 11 Mar 2019 05:20:28 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5FF5718242;
	Mon, 11 Mar 2019 05:20:28 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4552C1A05B;
	Mon, 11 Mar 2019 05:20:28 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A1631A058;
	Mon, 11 Mar 2019 05:20:28 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Mar 2019 05:20:28 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 2E2D62D53;
	Mon, 11 Mar 2019 05:20:28 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Mar 2019 05:20:28 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 11 Mar 2019 05:20:27 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Khem Raj (raj.khem@gmail.com)" <raj.khem@gmail.com>
Thread-Topic: Can't build product that uses DEFAULTTUNE="arm926ejs"
Thread-Index: AdTXwGozNpZtoMkdRIy3RTSRsKSVkQ==
Date: Mon, 11 Mar 2019 04:20:27 +0000
Message-ID: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Can't build product that uses DEFAULTTUNE="arm926ejs"
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
X-List-Received-Date: Mon, 11 Mar 2019 04:20:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm trying to build with master of OE-core and one of our products now=20
fails with:

ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker=20
    (see sanity.conf). Following is the list of potential problems / adviso=
ries:

    Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t armv=
5=20
    armv5t armv5e armv5te arm926ejste arm926ejse <BSP name withheld>) for=20
    DEFAULTTUNE (arm926ejs) does not contain TUNE_PKGARCH (arm926ejst).

I believe this is due to commit ac83d22e (arm-tunes: Remove -march option i=
f=20
mcpu is already added). If I build with Thud, TUNE_PKGARCH is "arm926ejste"=
.
The  lack of the "e" at the end when building with master seems to be due t=
o=20
the definition of ARMPKGSFX_DSP as=20
"${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}" an=
d=20
the fact that after commit ac83d22e, TUNE_FEATURES no longer contains 'armv=
5'.

//Peter


