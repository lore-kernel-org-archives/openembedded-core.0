Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3553794DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EE7A418325;
	Fri, 28 Sep 2018 11:11:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id q49btNImwR7G; Fri, 28 Sep 2018 11:11:36 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 63FEF18563;
	Fri, 28 Sep 2018 11:11:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52C301E099;
	Fri, 28 Sep 2018 11:11:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46E2B1E08E;
	Fri, 28 Sep 2018 11:11:17 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 28 Sep 2018 11:11:17 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 36B22221D;
	Fri, 28 Sep 2018 11:11:17 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 28 Sep 2018 11:11:16 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 28 Sep 2018 11:11:16 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 28 Sep 2018 11:11:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Zhaolong Zhang <zhangzl2013@126.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [meta-oe][PATCH v2] rpm: fix rpm path in nativesdk
Thread-Index: AQHUVwj94MqTNdRKI0u4H5Ecr446zKUFZ1Lw
Date: Fri, 28 Sep 2018 09:11:16 +0000
Message-ID: <35c22fa63952439c8cc1736fb8914899@XBOX02.axis.com>
References: <1538124327-25753-1-git-send-email-zhangzl2013@126.com>
In-Reply-To: <1538124327-25753-1-git-send-email-zhangzl2013@126.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH v2] rpm: fix rpm path in nativesdk
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
X-List-Received-Date: Fri, 28 Sep 2018 09:11:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Zhaolong Zhang
> Sent: den 28 september 2018 10:45
> To: openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org; zhangzl2013@126.com
> Subject: [OE-core] [meta-oe][PATCH v2] rpm: fix rpm path in nativesdk
>=20
> Fix the incorrect path inside the nativesdk 'rpmdeps' wrapper:
>=20
> In os.path.relpath(), it was assumed that all the WRAPPER_TOOLS are in
> {bindir}, and all the relative paths was calculated based on {bindir}.
>=20
> However, the assumption was not true for 'rpmdeps' because it is in
> {libdir}/rpm/. So the path in rpmdeps wrapper was incorrectly calculated=
=20
> to ..../usr/lib/lib/rpm.
>=20
> To fix this, we can simply use $OECORE_NATIVE_SYSROOT as the base path,
> instead of the complicated runtime path calculation.
>=20
> The patch also fix the hard coded path in 'find-provides' and 'find-
> provides' for nativesdk.

Change the second 'find-provides' to 'find-requires'.

> Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
> ---
>=20
> v1 --> v2:
>   1. upgrade commit message.
>   2. change ${libdir} to ${libdir_nativesdk}
>   3. change ${datadir} to {prefix_nativesdk}/share
>=20
>  meta/recipes-devtools/rpm/rpm_4.14.2.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devto=
ols/rpm/rpm_4.14.2.bb
> index 46f8837..361e554 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> @@ -103,12 +103,15 @@ do_install_append_class-native() {
>  do_install_append_class-nativesdk() {
>          for tool in ${WRAPPER_TOOLS}; do
>                  create_wrapper ${D}$tool \
> -                        RPM_CONFIGDIR=3D'`dirname $''realpath`'/${@os.pa=
th.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
> -                        RPM_ETCCONFIGDIR=3D'$'{RPM_ETCCONFIGDIR-'`dirnam=
e $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('=
bindir', True))}/..} \
> -                        MAGIC=3D'`dirname $''realpath`'/${@os.path.relpa=
th(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
> +                        RPM_CONFIGDIR=3D$OECORE_NATIVE_SYSROOT/${libdir_=
nativesdk}/rpm \
> +                        RPM_ETCCONFIGDIR=3D$OECORE_NATIVE_SYSROOT/${base=
_prefix} \
> +                        MAGIC=3D$OECORE_NATIVE_SYSROOT/${prefix_nativesd=
k}/share/misc/magic.mgc \
>                          RPM_NO_CHROOT_FOR_SCRIPTS=3D1
>          done
>=20
> +        sed -i -e 's:\/usr\/lib\/rpm\/:$OECORE_NATIVE_SYSROOT\/usr\/lib\=
/rpm\/:' ${D}${libdir}/rpm/find-provides
> +        sed -i -e 's:\/usr\/lib\/rpm\/:$OECORE_NATIVE_SYSROOT\/usr\/lib\=
/rpm\/:' ${D}${libdir}/rpm/find-requires
> +
>          rm -rf ${D}/var
>  }
>=20
> --
> 1.9.1

//Peter


