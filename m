Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A9A8E7837E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4B4782E45A;
	Thu, 15 Jun 2017 16:05:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DbcDo5M2aD0R; Thu, 15 Jun 2017 16:05:07 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E3F452E4DD;
	Thu, 15 Jun 2017 16:05:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 957E51A080;
	Thu, 15 Jun 2017 16:05:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A6B21A07E;
	Thu, 15 Jun 2017 16:05:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Jun 2017 16:05:07 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 7E94EF02;
	Thu, 15 Jun 2017 16:05:07 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 16:05:07 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 16:05:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 09/11] package_rpm.bbclass: Filter out unwanted
	file deps for nativesdk packages
Thread-Index: AQHS5d+9JQMn2UOgWk68yzw7PZUnzqIl889g
Date: Thu, 15 Jun 2017 14:05:07 +0000
Message-ID: <592effe7fdc94279bb04d65c1b7ede27@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<08af10d045a72ea2101d9f3fae9c3fccd7b4a565.1497534748.git.pkj@axis.com>
	<ecaf5f12-2cf6-38fa-8f58-c9196ade9c85@linux.intel.com>
In-Reply-To: <ecaf5f12-2cf6-38fa-8f58-c9196ade9c85@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 09/11] package_rpm.bbclass: Filter out unwanted file deps for nativesdk packages
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
X-List-Received-Date: Thu, 15 Jun 2017 14:05:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 15 juni 2017 16:00
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 09/11] package_rpm.bbclass: Filter out
> unwanted file deps for nativesdk packages
>=20
> On 06/15/2017 04:53 PM, Peter Kjellerstedt wrote:
> > Filter out any file dependencies on absolute paths and any
> > dependencies on Perl modules for nativesdk packages. It is assumed
> > that they will be provided by the native host if needed, and they
> mess
> > up the dependency handling if they are present.
>=20
> Does this mean you can also drop the "bin/sh" hack from here in the
> same
> file?
>=20
>      print_deps(srcrprovides + (" /bin/sh" if
> srcname.startswith("nativesdk-") else ""), "Provides",
> spec_preamble_top, d)
>=20
>=20
> Alex

No, unfortunately not. I tried it, but it turns out rpm adds the=20
dependency itself even if it is not specified in the .spec file=20
due to the postinst scriptlet.

//Peter


