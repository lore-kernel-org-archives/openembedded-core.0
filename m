Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB8C60721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 03:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0CF0F1832C;
	Thu, 14 Feb 2019 04:05:25 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 72Gi4TK77fEm; Thu, 14 Feb 2019 04:05:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 531271853E;
	Thu, 14 Feb 2019 04:05:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 333CE1A05F;
	Thu, 14 Feb 2019 04:05:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 276651A064;
	Thu, 14 Feb 2019 04:05:22 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Feb 2019 04:05:22 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 1B4B336F;
	Thu, 14 Feb 2019 04:05:22 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Feb 2019 04:05:21 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 14 Feb 2019 04:05:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: Check BuildStarted for
	HOSTTOOLS
Thread-Index: AQHUxA6sahyIlajtWE6QG2C6G5HCT6Xel2eA
Date: Thu, 14 Feb 2019 03:05:21 +0000
Message-ID: <02b5abb67627419e92bce1ce29d22510@XBOX04.axis.com>
References: <cover.1550113052.git.liezhi.yang@windriver.com>
	<b897d0a2643af36791269bf303b0d0dd74a47411.1550113052.git.liezhi.yang@windriver.com>
In-Reply-To: <b897d0a2643af36791269bf303b0d0dd74a47411.1550113052.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/1] base.bbclass: Check BuildStarted for HOSTTOOLS
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
X-List-Received-Date: Thu, 14 Feb 2019 03:05:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 14 februari 2019 03:59
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] base.bbclass: Check BuildStarted for
> HOSTTOOLS
>=20
> There might be no bb.event.ConfigParsed event bitbake server is
> running,
> so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed when
> BuildStarted.
>=20
> Fixed:
> $ export BB_SERVER_TIMEOUT=3D-1
> $ bitbake quilt-native
> $ rm -fr tmp
> $ bitbake quilt-native
> ERROR: Error running gcc  --version: /bin/sh: gcc: command not found
>=20
> This error is caused by enable_uninative(), it runs twice (ConfigParsed
> and
> BuildStarted), the error would happen when there is no ConfigParsed
> event
> (no hosttools is created), but BuildStarted. This patch can fix the
> problem.
>=20
> [YOCTO #13022]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f1a3c0e..283cb0f 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -224,7 +224,11 @@ base_eventhandler[eventmask] =3D
> "bb.event.ConfigParsed bb.event.MultiConfigParsed
>  python base_eventhandler() {
>      import bb.runqueue
>=20
> -    if isinstance(e, bb.event.ConfigParsed):
> +    # There might be no bb.event.ConfigParsed event bitbake server is ru=
nning,
> +    # so check bb.event.BuildStarted to make sure HOSTTOOLS_DIR existed =
when
> +    # BuildStarted.
> +    if isinstance(e, bb.event.ConfigParsed) or \
> +            (isinstance(e, bb.event.BuildStarted) and not os.path.exists=
(d.getVar('HOSTTOOLS_DIR'))):

I don't think you want to do this here since not all of this if statement=20
should be done for the BuildStarted event. I think it is better to add a=20
separate if statement just for the HOSTTOOLS part (see below). Also, I don'=
t=20
think you should be checking if the HOSTTOOLS_DIR exists, because the=20
contents of ${HOSTTOOLS} and ${HOSTTOOLS_NONFATAL} may have changed, in=20
which case any new tools need to be added to the directory.

>          if not d.getVar("NATIVELSBSTRING", False):
>              d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
>          d.setVar('BB_VERSION', bb.__version__)
> --
> 2.7.4

This is my suggestion for how to split the current handling of=20
bb.event.ConfigParsed (also note that I corrected the comment before the ne=
w=20
if statement):

    if isinstance(e, bb.event.ConfigParsed):
        if not d.getVar("NATIVELSBSTRING", False):
            d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
        d.setVar('BB_VERSION', bb.__version__)

    # There might be no bb.event.ConfigParsed event if the bitbake server i=
s
    # running, so check bb.event.BuildStarted too to make sure ${HOSTTOOLS_=
DIR}
    # exists.
    if isinstance(e, bb.event.ConfigParsed) or isinstance(e, bb.event.Build=
Started):
        # Works with the line in layer.conf which changes PATH to point her=
e
        setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
        setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL'=
, d, fatal=3DFalse)

//Peter


