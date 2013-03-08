Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UE5lg-0003B1-4h
	for Openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 23:28:01 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so1641082pbb.41
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2013 14:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=fwz5peh3hDvcIhNiMzRm1nuGhENgB0P254f+WaxXSrA=;
	b=mYELimJ5U9nCHFWhDQW/ME7OQWX6cGTmZKmHX0F2CzdL3QZ3eOi4tfOaZMSuv5M3Rb
	fL1auk3lRn7Z8xZUzNolWsDb6MwLb2Bgcyj7anHOH8j8pOQOKDwtA5T+Fr9sKY2oBgy1
	+CPnqJWp0UluITQ5vM63EJ+QBHTt3NDpydLaZkyuZN5pxAwi/ykanoPi05hNvARPBX67
	zUcF4Ewy/lAWmCf0x/r5Z8ilv1JUUk3xg+69mCcQB25T94aMTIYjhSDiO44OwX4gYWSB
	d86niVMU5GvI1bqnb434V2qOCD+Ne0i7T9pmjm4uv9L60WAtdBtKXz6OgL63E6Bv0YPZ
	8bHg==
X-Received: by 10.69.1.70 with SMTP id be6mr5951415pbd.185.1362780685247;
	Fri, 08 Mar 2013 14:11:25 -0800 (PST)
Received: from sa-nc-apg-191.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id i10sm6954692pbd.1.2013.03.08.14.11.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 14:11:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
Date: Fri, 8 Mar 2013 14:11:22 -0800
Message-Id: <6A439775-3C47-4E34-949C-83FC024875A4@gmail.com>
References: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
To: Rich Dubielzig <rich.dubielzig@windriver.com>
X-Mailer: Apple Mail (2.1499)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Handle QA warnings in nativesdk (denzil)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 22:28:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 8, 2013, at 2:07 PM, Rich Dubielzig =
<rich.dubielzig@windriver.com> wrote:

> /var/db/Makefile and /opt/(sdk path)/etc/ld.so.conf were not
> being properly handled by the do_package task in
> eglibc-nativesdk.  /var/db is now deleted and /etc/ld.so.conf
> is being included in the -utils subpackage.
>=20
> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
> ---
> meta/recipes-core/eglibc/eglibc-package.inc |    3 ++-
> meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
> 2 files changed, 3 insertions(+), 2 deletions(-)

Could you rebase it on master please ?

>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-core/eglibc/eglibc-package.inc
> index 3298dea..d51d943 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -50,7 +50,7 @@ FILES_${PN}-dev_append +=3D "${bindir}/rpcgen =
${libdir}/*_nonshared.a \
> FILES_${PN}-staticdev_append +=3D "${libdir}/*.a ${base_libdir}/*.a"
> FILES_nscd${PKGSUFFIX} =3D "${sbindir}/nscd*"
> FILES_${PN}-mtrace =3D "${bindir}/mtrace"
> -FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"
> +FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/* =
${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
> FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug ${libdir}/audit/.debug"
> FILES_catchsegv${PKGSUFFIX} =3D "${bindir}/catchsegv"
> RDEPENDS_catchsegv${PKGSUFFIX} =3D "libsegfault"
> @@ -121,5 +121,6 @@ PACKAGE_PREPROCESS_FUNCS +=3D =
"eglibc_package_preprocess"
> eglibc_package_preprocess () {
> 	rm -rf =
${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
> 	rm -rf ${PKGD}/${libdir}/locale
> +	rm -rf ${PKGD}/var
> }
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb =
b/meta/recipes-core/eglibc/eglibc_2.15.bb
> index fe93b4b..b4bf692 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
> SRCREV =3D "17386"
>=20
> DEPENDS +=3D "gperf-native"
> -PR =3D "r11"
> +PR =3D "r12"
> PR_append =3D "+svnr${SRCPV}"
>=20
> EGLIBC_BRANCH=3D"eglibc-2_15"
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



