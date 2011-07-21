Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QjpAu-0003dc-8l
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:04:08 +0200
Received: by wwi18 with SMTP id 18so844393wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 02:00:01 -0700 (PDT)
Received: by 10.216.24.82 with SMTP id w60mr8087281wew.99.1311238800816;
	Thu, 21 Jul 2011 02:00:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id v11sm694664weq.33.2011.07.21.01.59.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 02:00:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c8db967984b6d29fcf5587ed083c2d6ad4445b1f.1311234759.git.kai.kang@windriver.com>
Date: Thu, 21 Jul 2011 10:59:53 +0200
Message-Id: <3B35EFEB-74CE-40EB-82B2-BD538EB86554@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<c8db967984b6d29fcf5587ed083c2d6ad4445b1f.1311234759.git.kai.kang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 04/10] polkit: Support PAM
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
X-List-Received-Date: Thu, 21 Jul 2011 09:04:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Modify configuration "polkit-1" in /etc/pam.d/ for supporting pam.
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 =
++++++++++++++++++++
> meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +++-
> 2 files changed, 27 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>=20
> diff --git =
a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch =
b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
> new file mode 100644
> index 0000000..fa145ac
> --- /dev/null
> +++ b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
> @@ -0,0 +1,23 @@
> +polkit: No system-auth in poky, we can use common-* in place of it.

Poky or oe-core? And can we provide system-auth instead of patching the =
world?


> +
> +Upstream-Status:Inappropriate [configuration]
> +
> +Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> +
> +--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
> ++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
> +@@ -350,10 +350,10 @@
> +     PAM_FILE_INCLUDE_PASSWORD=3Dsystem
> +     PAM_FILE_INCLUDE_SESSION=3Dsystem
> + else
> +-   PAM_FILE_INCLUDE_AUTH=3Dsystem-auth
> +-   PAM_FILE_INCLUDE_ACCOUNT=3Dsystem-auth
> +-   PAM_FILE_INCLUDE_PASSWORD=3Dsystem-auth
> +-   PAM_FILE_INCLUDE_SESSION=3Dsystem-auth
> ++   PAM_FILE_INCLUDE_AUTH=3Dcommon-auth
> ++   PAM_FILE_INCLUDE_ACCOUNT=3Dcommon-account
> ++   PAM_FILE_INCLUDE_PASSWORD=3Dcommon-password
> ++   PAM_FILE_INCLUDE_SESSION=3Dcommon-session
> + fi
> +=20
> + AC_SUBST(PAM_FILE_INCLUDE_AUTH)
> diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb =
b/meta/recipes-extended/polkit/polkit_0.101.bb
> index 6769914..da1d581 100644
> --- a/meta/recipes-extended/polkit/polkit_0.101.bb
> +++ b/meta/recipes-extended/polkit/polkit_0.101.bb
> @@ -7,8 +7,10 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D155db86cdbafa7532b41f390409283eb \
>                     =
file://docs/polkit/html/license.html;md5=3D07ddbf5f29e44c80c99be19c1690ec1=
f"
>=20
> SRC_URI =3D "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
> -           file://introspection.patch"
> -PR =3D "r0"
> +           file://introspection.patch \
> +           file://polkit-1_pam.patch"
> +
> +PR =3D "r1"
> DEPENDS =3D "libpam expat dbus-glib eggdbus intltool"
> RDEPENDS_${PN} =3D "libpam"
> EXTRA_OECONF =3D "--with-authfw=3Dpam --with-os-type=3Dmoblin =
--disable-man-pages --disable-gtk-doc --disable-introspection"
> --=20
> 1.7.5.1.300.gc565c
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



