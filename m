Return-Path: <bartlomiej.kucharczyk@nokia.com>
Received: from demumfd002.nsn-inter.net (demumfd002.nsn-inter.net
	[93.183.12.31])
	by mail.openembedded.org (Postfix) with ESMTP id A87607638A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:23:37 +0000 (UTC)
Received: from demuprx016.emea.nsn-intra.net ([10.150.129.55])
	by demumfd002.nsn-inter.net (8.15.1/8.15.1) with ESMTPS id
	t6SGNb7e001270
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:23:37 GMT
Received: from DEMUHTC001.nsn-intra.net ([10.159.42.32])
	by demuprx016.emea.nsn-intra.net (8.12.11.20060308/8.12.11) with ESMTP
	id t6SGNaTH003235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 18:23:36 +0200
Received: from DEMUHTC012.nsn-intra.net (10.159.42.43) by
	DEMUHTC001.nsn-intra.net (10.159.42.32) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 28 Jul 2015 18:23:36 +0200
Received: from DEMUMBX005.nsn-intra.net ([169.254.5.210]) by
	DEMUHTC012.nsn-intra.net ([10.159.42.43]) with mapi id 14.03.0248.002;
	Tue, 28 Jul 2015 18:23:36 +0200
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Why python-native is not available via '#!/usr/bin/env python'?
Thread-Index: AdDJUcCISKZI2iHRQzm2hGkQE6d4Zw==
Date: Tue, 28 Jul 2015 16:23:35 +0000
Message-ID: <6F44F925AFE971408EDDDD548F9B486F1989D378@DEMUMBX005.nsn-intra.net>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.159.42.126]
MIME-Version: 1.0
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
	further information)
X-purgate-size: 1462
X-purgate-ID: 151667::1438100617-000063FD-67AD38E3/0/0
Subject: Why python-native is not available via '#!/usr/bin/env python'?
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
X-List-Received-Date: Tue, 28 Jul 2015 16:23:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

During integrating a Python tool (both: native and nativesdk) into a Yocto =
layer, the following questions came to my mind.

My problem was that [native-sysroot]/usr/bin/python was too long (complete =
shebang greater than 128 characters).=20
Changing it naively to `/usr/bin/env python` caused the tool to use host Py=
thon (which was missing required Python modules).
I've found that it is possible to use '#!/usr/bin/env nativepython' for nat=
ive. But this solution requires ugly sed in do_install, in recipe for my to=
ol:

	do_install_append_class-native() {
		sed -i '1 c\#!/usr/bin/env nativepython' ${D}${bindir}/binary
	}

Q1. What are the reasons behind that `/usr/bin/env python` refer to the hos=
t tool instead the native one?

Q2. Is there any plan to automate shebang adjustments for native python so =
that it is not affected by too-long-shebang issue? distutils.bbclass alread=
y has similar logic, but not enabled for native...

 # listing file: "meta/classes/distutils.bbclass"
 52         if test -e ${D}${bindir} ; then
 53             for i in ${D}${bindir}/* ; do \
 54                 if [ ${PN} !=3D "${BPN}-native" ]; then
 55                         sed -i -e s:${STAGING_BINDIR_NATIVE}/python-nat=
ive/python:${bindir}/env\ python:g $i
 56                 fi
 57                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
 58             done
 59         fi

Cheers!
Bartlomiej

