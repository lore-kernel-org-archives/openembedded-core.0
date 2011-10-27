Received: from smtp25.4emm.com ([69.18.222.26])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RJGvX-0005Mw-UA
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 05:46:48 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB25.4emm.local ([fe80::2427:17db:eac2:a71%12]) with mapi id
	14.01.0289.001; Wed, 26 Oct 2011 23:40:47 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC] Fix libgcc nativesdk to install libgcc.a in
	good	location for tools
Thread-Index: AQHMlFYxAgE1mMF0JEiKge8TLNmtjpWPjBBA
Date: Thu, 27 Oct 2011 03:40:45 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1AA850@MBX20.4emm.local>
References: <1312980634.6733.62.camel@phil-desktop>
	<1319684838-24527-1-git-send-email-msm@freescale.com>
In-Reply-To: <1319684838-24527-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [RFC] Fix libgcc nativesdk to install libgcc.a in good	location for tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 03:46:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Matthew McClintock
> Sent: Thursday, 27 October 2011 11:07 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC] Fix libgcc nativesdk to install libgcc.a in good=
 location
> for tools
>=20
> This fixes an issue where we cannot find -lgcc when linking. We
> update the path to libgcc.a so the library can be installed
> correctly
>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> I really doubt this is the correct fix and I'm no expert but it's
> here for comments. This fixes a real u-boot cross compile build
> issue
>=20
> The previous mv command was failing as the files did not exist
> and I also rejiggered the packages since I was not sure if
> gdb-cross-canadian-powerpc-dev was included in my tarball of
> the toolchain
>=20
>  meta/recipes-devtools/gcc/libgcc_4.6.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-
> devtools/gcc/libgcc_4.6.bb
> index 63a46ec..7f3ac55 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> @@ -8,9 +8,8 @@ PACKAGES =3D "\
>    ${PN}-dev \
>    "
>=20
> -FILES_${PN} =3D "${base_libdir}/libgcc*.so.*"
> +FILES_${PN} =3D "${base_libdir}/libgcc*"
>  FILES_${PN}-dev =3D " \
> -  ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
>=20
> @@ -29,9 +28,10 @@ do_install () {
>  	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
>  		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
>  	else
> -		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
> +		cp ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc*
> ${D}${base_libdir}
>  	fi
>=20
> +
>  	chown -R root:root ${D}
>  	chmod +x ${D}${base_libdir}/libgcc_s.so.*
>  }
> --
> 1.7.6.1
>=20

Is this perhaps related to the following issue: http://lists.linuxtogo.org/=
pipermail/openembedded-core/2011-October/011556.html ?
Some builds had trouble finding libgcc due to a sysroot misconfiguration, w=
hich has since been fixed in master.

James



