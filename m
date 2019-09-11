Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4A17E648
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 17:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C2804184C6;
	Wed, 11 Sep 2019 19:07:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tT0FfSNyJ9TL; Wed, 11 Sep 2019 19:07:12 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B36FC182C7;
	Wed, 11 Sep 2019 19:07:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F2561A08C;
	Wed, 11 Sep 2019 19:07:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 934AD1A081;
	Wed, 11 Sep 2019 19:07:12 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 11 Sep 2019 19:07:12 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 86CC52DC3;
	Wed, 11 Sep 2019 19:07:12 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by XBOX04.axis.com (10.0.5.18)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Wed, 11 Sep 2019 19:07:12 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Wed, 11 Sep 2019 19:07:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Wes Lindauer <wesley.lindauer@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake: cooker: Ensure bbappends are found in
	stable order
Thread-Index: AdVow1ih3LNsarQYRZWAtaSDEa7PqA==
Date: Wed, 11 Sep 2019 17:07:12 +0000
Message-ID: <8ca1565a5fa846fbb77c1f2680e1a169@xbox06.axis.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] bitbake: cooker: Ensure bbappends are found in stable order
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
X-List-Received-Date: Wed, 11 Sep 2019 17:07:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Wes Lindauer
> Sent: den 28 augusti 2019 23:38
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] bitbake: cooker: Ensure bbappends are found
> in stable order
>=20
> Thanks to wildcards in bbappend filenames, it's possible to have
> multiple bbappends that apply to the same recipe in the same directory.
> In order to get sstate hits between different workspaces, we want to
> apply those bbappend files in a consistent order.  Since readdir()
> returns files in a non-deterministic order between workspaces (based on
> inode number and/or time of creation), we'll need to sort its result in
> order to have any consistency.
>=20
> Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
> ---
>  bitbake/lib/bb/cooker.py | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> index 0607fcc708..a9ee142aa5 100644
> --- a/bitbake/lib/bb/cooker.py
> +++ b/bitbake/lib/bb/cooker.py
> @@ -1869,6 +1869,7 @@ class CookerCollectFiles(object):
>              (bbappend, filename) =3D b
>              if (bbappend =3D=3D f) or ('%' in bbappend and bbappend.star=
tswith(f[:bbappend.index('%')])):
>                  filelist.append(filename)
> +        filelist.sort()
>          return filelist
>=20
>      def collection_priorities(self, pkgfns, d):
> --
> 2.14.5

I don't think this was a good idea at all. Before, bbappends were applied=20
in the priority order of the layers, but this change throws the sorting=20
based on priority out the window and might cause bbappend files for higher=
=20
layers to be applied before lower layers' bbappend files.

Please revert this change, and rethink how to maintain a stable order for=20
bbappend files from the same directory without affecting bbappend files=20
from different layers.

//Peter


