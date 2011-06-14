Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWZ2H-0003jz-Fm
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 21:12:26 +0200
Received: by wye20 with SMTP id 20so4739367wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 12:09:00 -0700 (PDT)
Received: by 10.227.205.19 with SMTP id fo19mr7019148wbb.58.1308078539564;
	Tue, 14 Jun 2011 12:08:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ej7sm5263883wbb.19.2011.06.14.12.08.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 12:08:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308077638-20075-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 21:08:56 +0200
Message-Id: <A020EFCD-BE3E-4EED-AFA0-4B2433CDED9D@dominion.thruhere.net>
References: <1308077638-20075-1-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] eglibc_2.12.bb: Remove already upstreamed fix-for-make-3.82.diff
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
X-List-Received-Date: Tue, 14 Jun 2011 19:12:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Testing it now

Op 14 jun 2011, om 20:53 heeft Khem Raj het volgende geschreven:

> This patch is already applied to eglibc 2.12 branch as seen here
> =
http://www.eglibc.org/cgi-bin/viewcvs.cgi/branches/eglibc-2_12/libc/manual=
/Makefile?rev=3D12230&sortby=3Ddate&r2=3D12230&r1=3D10495
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../eglibc/eglibc-2.12/fix-for-make-3.82.diff      |   27 =
--------------------
> meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
> 2 files changed, 1 insertions(+), 29 deletions(-)
> delete mode 100644 =
meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
>=20
> diff --git =
a/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff =
b/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
> deleted file mode 100644
> index 89fff79..0000000
> --- a/meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: Inappropriate [Backport]
> -
> -Make 3.82, as shipped with Fedora 14, fixes some holes in the parser =
which in
> -turn breaks behaviour of some Makefiles. Most notably eglibc's.
> -
> -http://www.mail-archive.com/bug-make@gnu.org/msg06220.html
> -
> -Fix back-ported from glibc/eglibc revision control.
> -
> -JL 13/10/10
> -
> -Index: libc/manual/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libc.orig/manual/Makefile
> -+++ libc/manual/Makefile
> -@@ -243,7 +243,10 @@ ifdef objpfx
> - .PHONY: stubs
> - stubs: $(objpfx)stubs
> - endif
> --$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
> -+$(objpfx)stubs ../po/manual.pot:
> -+	$(make-target-directory)
> -+	touch $@
> -+$(objpfx)stamp%:
> - 	$(make-target-directory)
> - 	touch $@
> -=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb =
b/meta/recipes-core/eglibc/eglibc_2.12.bb
> index d851b5d..fe2f51d 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -1,7 +1,6 @@
> require eglibc.inc
>=20
> DEPENDS +=3D "gperf-native"
> -FILESPATHPKG =3D. "eglibc-svn:"
> PR =3D "r14"
>=20
> SRCREV =3D "14158"
> @@ -14,7 +13,7 @@ SRC_URI =3D =
"svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH};proto=3Dhttp=

>            file://mips-rld-map-check.patch \
>            file://etc/ld.so.conf \
>            file://generate-supported.mk \
> -	   file://fix-for-make-3.82.diff"
> +	  "
> SRC_URI_append_virtclass-nativesdk =3D " file://ld-search-order.patch"
> S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



