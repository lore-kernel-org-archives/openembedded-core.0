Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5706B7F96F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:23:11 +0000 (UTC)
IronPort-SDR: OOtNzGzQNHYEPOU2EuPBhHgAlCR91TbAjITflsufeKCl2E4I832zQ2AJJF9ffjfglTolVD5nts
	YNv1R+tHksyLqJxX9BCNT25tsq2D2txXzAk7Hd3XQMtzQSnMwM8NY/LPTOG+0VHCrRkTWsq2S4
	TiB9KfpcZC1YwwpQXLKVacZ+2av/70Uj3JzSMPZh5KyttHDcCXzZvrFucv/B+LfUxHCjLGybwl
	c89tujW9zO0jFdipIMN8kndVg+3wKjGCGtyglK9mkZWgTdxoM5Dwd5YikpFEufKND1ZBi5EB4m
	GOQ=
X-IronPort-AV: E=Sophos;i="5.69,282,1571695200"; 
   d="scan'208";a="3293093"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [master][zeus][PATCH 2/2] libtirpc: Make it easy to
	disable the installation of legacy headers
Thread-Index: AdWruoWoTI2B8oLkS2SGSslD/nqHJg==
Date: Thu, 5 Dec 2019 22:22:48 +0000
Message-ID: <3082aa3cab14404d97c7f3c03af84462@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [master][zeus][PATCH 2/2] libtirpc: Make it easy to disable the installation of legacy headers
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
X-List-Received-Date: Thu, 05 Dec 2019 22:23:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 december 2019 23:07
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [master][zeus][PATCH 2/2] libtirpc: Make it easy to di=
sable the installation of legacy headers
>=20
> Providing symbolic links to the header files to replace the old
> corresponding glibc headers seems like a band aid for applications
> that have not been updated to cope with the lack of the RPC headers
> from glibc. Additionally they clash with glibc if an older version of
> glibc is used that still provides the header files. To remedy this,
> make it easy to disable the installation of the legacy headers by not
> setting the legacy-headers PACKAGECONFIG.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../libtirpc/libtirpc_1.1.4.bb                | 23 +++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/reci=
pes-extended/libtirpc/libtirpc_1.1.4.bb
> index 91e0ce6fd2..3c84694161 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> @@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
>  SRC_URI[md5sum] =3D "f5d2a623e9dfbd818d2f3f3a4a878e3a"
>  SRC_URI[sha256sum] =3D "2ca529f02292e10c158562295a1ffd95d2ce8af97820e353=
4fe1b0e3aec7561d"
>=20
> +PACKAGECONFIG =3D "legacy-headers"

I set the legacy-headers PACKAGECONFIG by default to maintain the=20
compatibility with zeus-22.0.1. However, it can be argued that it=20
should not be set to maintain compatibility with zeus-22.0.0. In=20
our case, the change between 22.0.0 and 22.0.1 broke the build=20
for a couple of our products that build using an older glibc.

> +PACKAGECONFIG[legacy-headers] =3D ""
> +
>  inherit autotools pkgconfig
>=20
>  EXTRA_OECONF =3D "--disable-gssapi"
> @@ -24,16 +27,18 @@ EXTRA_OECONF =3D "--disable-gssapi"
>  do_install_append() {
>  	chown root:root ${D}${sysconfdir}/netconfig
>=20
> -	for dir in rpc rpcsvc; do
> -		install -d ${D}${includedir}/$dir
> -		for link_header in ${D}${includedir}/tirpc/$dir/*; do
> -			if [ -f $link_header ] &&
> -			   [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
> -				ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir=
/$(basename $link_header)
> -			fi
> +	if [ "${@bb.utils.filter('PACKAGECONFIG', 'legacy-headers', d)}" ]; the=
n
> +		for dir in rpc rpcsvc; do
> +			install -d ${D}${includedir}/$dir
> +			for link_header in ${D}${includedir}/tirpc/$dir/*; do
> +				if [ -f $link_header ] &&
> +				   [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
> +					ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$di=
r/$(basename $link_header)
> +				fi
> +			done
>  		done
> -	done
> -	ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
> +		ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
> +	fi
>  }
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.21.0

//Peter


