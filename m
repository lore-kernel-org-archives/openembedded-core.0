Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4443D73D2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 14:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FEova8029130; Wed, 15 Apr 2015 15:51:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FA9V178Hhg_I; Wed, 15 Apr 2015 15:51:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FEpFQI029152
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Apr 2015 15:51:27 +0100
Message-ID: <1429109475.6976.124.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yocto User <yocto_user@gmx.com>
Date: Wed, 15 Apr 2015 15:51:15 +0100
In-Reply-To: <552E7098.9040304@gmx.com>
References: <552E7098.9040304@gmx.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] expect: install header files in usual location
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
X-List-Received-Date: Wed, 15 Apr 2015 14:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-15 at 10:07 -0400, Yocto User wrote:
> This patch resolves [Bug 7552] where the headers for the expect library 
> were installed into the wrong location.

Few minor comments/tweaks needed:

The correct form for bug numbers is:

[YOCTO #7552]

> 
> ---
>   meta/recipes-devtools/expect/expect_5.45.bb |   12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-devtools/expect/expect_5.45.bb 
> b/meta/recipes-devtools/expect/expect_5.45.bb
> index 264f007..4129ab1 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.bb
> @@ -18,7 +18,7 @@ RDEPENDS_${PN} = "tcl"
> 
>   inherit autotools
> 
> -PR = "r1"
> +PR = "r2"

No need to bump PR now.

>   SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>              file://0001-configure.in.patch \
> @@ -40,8 +40,7 @@ do_install_append() {
>           sed -e 's|$dir|${libdir}|' -i 
> ${D}${libdir}/expect${PV}/pkgIndex.tcl
>   }
> 
> -EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
> -                 --with-tcl=${STAGING_LIBDIR} \
> +EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
>                    --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
>                    --enable-shared \
>                    --enable-threads \
> @@ -52,12 +51,9 @@ EXTRA_OEMAKE_install = " 'SCRIPTS=' "
>   FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
>                       ${libdir}/.debug \
>                      "
> +
>   FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
> -                   ${STAGING_INCDIR}/expect.h \
> -                   ${STAGING_INCDIR}/expect_tcl.h \
> -                   ${STAGING_INCDIR}/expect_comm.h \
> -                   ${STAGING_INCDIR}/tcldbg.h \
> -                   ${includedir}/*.h \
> +                   ${includedir} \
>                     "

Isn't this included in FILES_${PN}-dev by default?

Cheers,

Richard


