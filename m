Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12571755AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6CGTRPG022130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jul 2018 09:29:28 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.237]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0399.000;
	Thu, 12 Jul 2018 09:29:27 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-10963
Thread-Index: AQHUGKJCLQVgnSgozkq/XER0y1RXuqSJlP+A//+LTBCAAqhQaA==
Date: Thu, 12 Jul 2018 16:29:26 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F350882A@ALA-MBD.corp.ad.wrs.com>
References: <20180710230346.156994-1-joe.slater@windriver.com>
	<5ae15c76-ddaf-fbe5-4fac-1149af924b41@gmail.com>,
	<007BD92917A2324FA403BCF9A464CF84F3508181@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F3508181@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.131]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] tiff: security fix CVE-2018-10963
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
X-List-Received-Date: Thu, 12 Jul 2018 16:29:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Should this be resubmitted?  I could always remove the comment about 4.0.8.=
    Joe=0A=
________________________________________=0A=
From: Slater, Joseph=0A=
Sent: Tuesday, July 10, 2018 4:56 PM=0A=
To: akuster808; openembedded-core@lists.openembedded.org=0A=
Subject: RE: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-109=
63=0A=
=0A=
Yes, it is not clear.  What it means is that the patch was applied to 4.0.8=
 code, but not, I think, 4.0.8 code as seen on openembedded-core before 4.0=
.8 was obsolete.  It still applies for 4.0.9.=0A=
=0A=
Joe=0A=
=0A=
-----Original Message-----=0A=
From: akuster808 [mailto:akuster808@gmail.com]=0A=
Sent: Tuesday, July 10, 2018 4:48 PM=0A=
To: Slater, Joseph; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] tiff: security fix CVE-2018-109=
63=0A=
=0A=
=0A=
=0A=
On 07/10/2018 04:03 PM, Joe Slater wrote:=0A=
> Denial of service described at https://nvd.nist.gov/vuln/detail/CVE-2018-=
10963.=0A=
>=0A=
> Signed-off-by: Joe Slater <joe.slater@windriver.com>=0A=
> ---=0A=
>  .../libtiff/files/CVE-2018-10963.patch             | 41 ++++++++++++++++=
++++++=0A=
>  meta/recipes-multimedia/libtiff/tiff_4.0.9.bb      |  1 +=0A=
>  2 files changed, 42 insertions(+)=0A=
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-10963.=
patch=0A=
>=0A=
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch b=
/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch=0A=
> new file mode 100644=0A=
> index 0000000..13a1eb5=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch=0A=
> @@ -0,0 +1,41 @@=0A=
> +From de144fd228e4be8aa484c3caf3d814b6fa88c6d9 Mon Sep 17 00:00:00 2001=
=0A=
> +From: Even Rouault <even.rouault@spatialys.com>=0A=
> +Date: Sat, 12 May 2018 14:24:15 +0200=0A=
> +Subject: [PATCH] TIFFWriteDirectorySec: avoid assertion. Fixes=0A=
> + http://bugzilla.maptools.org/show_bug.cgi?id=3D2795.=0A=
> + CVE-2018-10963=0A=
> +=0A=
> +---=0A=
> +CVE: CVE-2018-10963=0A=
> +=0A=
> +Same patch as applied to 4.0.8.=0A=
I don't know what that means. The fix is in 4.0.8 or this patch applies=0A=
cleanly to 4.0.8 or affects < 4.0.8.=0A=
- armin=0A=
=0A=
> +=0A=
> +Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/de144f...]=
=0A=
> +=0A=
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>=0A=
> +=0A=
> +---=0A=
> + libtiff/tif_dirwrite.c |    7 +++++--=0A=
> + 1 file changed, 5 insertions(+), 2 deletions(-)=0A=
> +=0A=
> +diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c=0A=
> +index 2430de6..c15a28d 100644=0A=
> +--- a/libtiff/tif_dirwrite.c=0A=
> ++++ b/libtiff/tif_dirwrite.c=0A=
> +@@ -695,8 +695,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int i=
magedone, uint64* pdiroff)=0A=
> +                                                             }=0A=
> +                                                             break;=0A=
> +                                                     default:=0A=
> +-                                                            assert(0); =
  /* we should never get here */=0A=
> +-                                                            break;=0A=
> ++                                                            TIFFErrorEx=
t(tif->tif_clientdata,module,=0A=
> ++                                                                       =
 "Cannot write tag %d (%s)",=0A=
> ++                                                                       =
 TIFFFieldTag(o),=0A=
> ++                                                                       =
     o->field_name ? o->field_name : "unknown");=0A=
> ++                                                            goto bad;=
=0A=
> +                                             }=0A=
> +                                     }=0A=
> +                             }=0A=
> +--=0A=
> +1.7.9.5=0A=
> +=0A=
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.0.9.bb=0A=
> index 8c3bba5..e8e2a11 100644=0A=
> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb=0A=
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb=0A=
> @@ -9,6 +9,7 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}=
.tar.gz \=0A=
>             file://CVE-2017-9935.patch \=0A=
>             file://CVE-2017-18013.patch \=0A=
>             file://CVE-2018-5784.patch \=0A=
> +           file://CVE-2018-10963.patch \=0A=
>            "=0A=
>=0A=
>  SRC_URI[md5sum] =3D "54bad211279cc93eb4fca31ba9bfdc79"=0A=
=0A=

