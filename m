Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.29685.1585190548031721577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 19:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MlgrKzCaQox/V27CYjZ3zmiAvBtMl5DjIt9WO7ItS6awpQmsArteWSOKebSuS50LjtvmF8VY6s
 kjzsHBa4g6lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 19:42:27 -0700
IronPort-SDR: mgwunBaHIgTBMxEQkS2ST0Ey49LuGADe/FSrpLeDHX7bhe3Wx182b5QKdWaZ1vouufPoToMg1S
 /ISFJOnoH5iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; 
   d="scan'208";a="358007438"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 19:42:27 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.189]) by
 PGSMSX102.gar.corp.intel.com ([169.254.6.245]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 10:36:57 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: Sakib Sajal <sakib.sajal@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] libpng: Fix CVE-2019-6129
Thread-Topic: [OE-core] [PATCH v3] libpng: Fix CVE-2019-6129
Thread-Index: AQHWAV0a7KLCOR/Q6k+VUZrjuoWAh6haKrxQ
Date: Thu, 26 Mar 2020 02:36:57 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F3034AD388@PGSMSX101.gar.corp.intel.com>
References: <20200323215034.144217-1-sakib.sajal@windriver.com>
In-Reply-To: <20200323215034.144217-1-sakib.sajal@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch has not yet been merged upstream and upstream has disputed the s=
ecurity impact of this CVE. So I am not sure if we should take this.

https://github.com/glennrp/libpng/issues/269

Has any distro taken this?

Thanks,

Anuj

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Sakib Sajal
> Sent: Tuesday, March 24, 2020 05:51 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3] libpng: Fix CVE-2019-6129
>=20
> Fix memory leak in png_create_info_struct.
>=20
> Upstream-Status: Submitted [https://github.com/glennrp/libpng/pull/293]
> CVE: CVE-2019-6129
>=20
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../libpng/0001-Repair-of-CVE-2019-6129.patch | 28 +++++++++++++++++++
>  .../libpng/libpng_1.6.37.bb                   |  5 +++-
>  2 files changed, 32 insertions(+), 1 deletion(-)  create mode 100644 met=
a/recipes-
> multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-201=
9-
> 6129.patch b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-201=
9-
> 6129.patch
> new file mode 100644
> index 0000000000..641e771c17
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129
> +++ .patch
> @@ -0,0 +1,28 @@
> +From c8205147753e6684accb73d79f932d0c028fcc80 Mon Sep 17 00:00:00 2001
> +From: tangyaofang <tangyaofang6666@163.com>
> +Date: Mon, 10 Jun 2019 11:30:15 +0800
> +Subject: [PATCH] Repair of CVE-2019-6129
> +
> +CVE: CVE-2019-6129
> +Upstream-Status: Submitted [https://github.com/glennrp/libpng/pull/293]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + contrib/tools/pngcp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/contrib/tools/pngcp.c b/contrib/tools/pngcp.c index
> +16d4e7f4d..a02d5b7ff 100644
> +--- a/contrib/tools/pngcp.c
> ++++ b/contrib/tools/pngcp.c
> +@@ -506,7 +506,7 @@ static void
> + display_clean_read(struct display *dp)  {
> +    if (dp->read_pp !=3D NULL)
> +-      png_destroy_read_struct(&dp->read_pp, NULL, NULL);
> ++      png_destroy_read_struct(&dp->read_pp, (dp->ip!=3DNULL ? &dp->ip :
> ++ NULL), NULL);
> +
> +    if (dp->fp !=3D NULL)
> +    {
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recip=
es-
> multimedia/libpng/libpng_1.6.37.bb
> index 8c53d11642..f33b942cd7 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> @@ -7,7 +7,10 @@ DEPENDS =3D "zlib"
>=20
>  LIBV =3D "16"
>=20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz
> \
> +           file://0001-Repair-of-CVE-2019-6129.patch \
> +          "
> +
>  SRC_URI[md5sum] =3D "015e8e15db1eecde5f2eb9eb5b6e59e9"
>  SRC_URI[sha256sum] =3D
> "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
>=20
> --
> 2.24.1

