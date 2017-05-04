Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08548774EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 08:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 790C518488;
	Thu,  4 May 2017 10:46:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id F7Y7zJYfPHwi; Thu,  4 May 2017 10:46:24 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id CEE941847A;
	Thu,  4 May 2017 10:46:24 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60A9A1A092;
	Thu,  4 May 2017 10:46:24 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 499551A091;
	Thu,  4 May 2017 10:46:24 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  4 May 2017 10:46:24 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 3A68C284D;
	Thu,  4 May 2017 10:46:24 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 4 May 2017 10:46:24 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 4 May 2017 10:46:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Thread-Topic: Regression with RPM4 and unversioned DSOs
Thread-Index: AdLEsoPKOyEk7xv/RUaij3j/OAHacQ==
Date: Thu, 4 May 2017 08:46:24 +0000
Message-ID: <c70316f009e94504b29ff2b9d177dd33@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Regression with RPM4 and unversioned DSOs
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
X-List-Received-Date: Thu, 04 May 2017 08:46:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There seems to be a serious regression with the introduction of RPM4=20
and packages that install unversioned DSOs. We unfortunately have a=20
lot of those, and after building one of our products with Pyro it is=20
now missing almost 80 packages due to missing generated runtime=20
dependencies.=20

Previously the RPMs had dependencies on the required DSOs, but that=20
no longer seems to be the case, and there are only dependencies on=20
the packages providing the DSOs.

Here is an example for one of our packages. First the output from=20
rpm -q --requires for the package built with Pyro:

$  rpm -q --requires -p tmp/deploy/rpm/mips32r2el_nf/apta-utility-1.3.0-r0.=
10.mips32r2el_nf.rpm
libc6 >=3D 2.25
rpmlib(CompressedFileNames) <=3D 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <=3D 4.0-1

And then the output for the same package built with Morty:

$ rpm -q  --requires -p tmp/deploy/rpm/mips32r2el_nf/apta-utility-1.3.0-r0.=
2.mips32r2el_nf.rpm
ld.so.1
ld.so.1(GLIBC_2.4)
libapta.so
libc.so.6
libc.so.6(GLIBC_2.0)
libc.so.6(GLIBC_2.2)
libc.so.6(GLIBC_2.3)
libc.so.6(GLIBC_2.3.4)
libc.so.6(GLIBC_2.4)
libc.so.6(GLIBC_2.7)
libc6 >=3D 2.24
libubihelper.so

Please note the lack of dependencies on libapta and libubihelper in=20
the package built with Pyro.

Since I would very much like to avoid having to add explicit runtime=20
dependencies for all those dependencies that were previously automatically=
=20
detected, which would be a nightmare, I am now looking for any help as to=20
where to find the code that adds the dependencies on the packages providing=
=20
DSOs and to see if it is possible to change it to also detect dependencies=
=20
on unversioned DSOs.

//Peter


