Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFA4B6079F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Oct 2018 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 00E7918357;
	Sat, 27 Oct 2018 12:36:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id b8n706J6ZS75; Sat, 27 Oct 2018 12:36:04 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 30AA1182C9;
	Sat, 27 Oct 2018 12:36:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E42A1A077;
	Sat, 27 Oct 2018 12:36:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 130D01A05E;
	Sat, 27 Oct 2018 12:36:04 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 27 Oct 2018 12:36:04 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 070CB1E57;
	Sat, 27 Oct 2018 12:36:04 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 27 Oct 2018 12:36:04 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sat, 27 Oct 2018 12:36:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe] Using libpam with systemd but without systemd-logind
Thread-Index: AQHUbUki25E+FtFjzEOCbghYu+CZyaUyPRHg
Date: Sat, 27 Oct 2018 10:36:03 +0000
Message-ID: <35db1d5a43494aba81579d2eb2c7c6ff@XBOX04.axis.com>
References: <4d527ec6c1ac5415dcc51bf71ad4d6cf@linux.vnet.ibm.com>
In-Reply-To: <4d527ec6c1ac5415dcc51bf71ad4d6cf@linux.vnet.ibm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [oe] Using libpam with systemd but without systemd-logind
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
X-List-Received-Date: Sat, 27 Oct 2018 10:36:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[ This discussion really belongs on the openembedded-core mailing list=20
  since it concerns libpam and systemd, both of which are part of OE-Core,=
=20
  so that is where I am responding. However, I have kept openembeded-devel=
=20
  as bcc: to inform of this move. ]

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Matt Spinler
> Sent: den 26 oktober 2018 17:25
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] Using libpam with systemd but without systemd-logind
>=20
> Hi,
>=20
> Our embedded system uses systemd and libpam, but doesn't use systemd's
> logind package.
>=20
> The libpam recipe,
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipe=
s-extended/pam/libpam_1.3.0.bb#L149,
> will add pam_systemd.so to common-session if it detects systemd is
> used.
>=20
> However, systemd will only even build pam_systemd.so if the logind
> package is enabled, shown here:
> https://github.com/systemd/systemd/blob/15b1180945f2cfa0f7938626ff060c8b5=
2606a1a/meson.build#L1747
>=20
> So in our case, since we are explicitly disabling logind, pam will
> complain in the journal about not being able to find pam_systemd.so.
>=20
> As logind isn't a systemd distro feature, I'm not sure how libpam can
> really know that it doesn't need to add pam_systemd.so to common-session?
>=20
> Does anyone have any ideas on ways to handle this?
>=20
> Thanks,
> Matt

I am by no means any PAM expert, but prefixing the line inserted into=20
/etc/pam.d/common-session with a '-' should make libpam not output=20
anything to the logs if pam_systemd.so does not exist.

//Peter


