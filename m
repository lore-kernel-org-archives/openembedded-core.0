Received: from mail-lb0-f176.google.com ([209.85.217.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U7o3t-00028F-8C
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 15:20:55 +0100
Received: by mail-lb0-f176.google.com with SMTP id s4so5031926lbc.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=neGwvBBAwASbvvLjylR/faaHyB7P0kW1MAbYUaTIMxc=;
	b=tiMqWTOqs1Q2dKjQ70mhWpcZ32a7/TkI1ybKHChyCDMC2PSaJsImsz2cFwTqqeJsYq
	pa0Ea91hyuAM9s0KacDjw4M8Vv7+9YfDVr+/fiq+CzYF2d+Cs57d23txwCNc8ghbmzPY
	GHSnjDAmC/rH4qhM0c2owXOR2zUt2VR0riX6/GlkyG2Evu9a24fv8vKWXSd1/a4ZkA46
	lvlGBRhzZcPa7MgvTUIC6PonRpgij/LnQ6+0C9ikiA5IXNJaDxA8lKEsiQbeGCKyHRx4
	dg1tBWOBS37tm2f1jTPx0qkNMl6JFSjeV2kuerSzP63PhFDZLXjqAzRPX6iXY4hRzxfs
	S7tw==
MIME-Version: 1.0
X-Received: by 10.152.123.194 with SMTP id mc2mr14443191lab.7.1361282679194;
	Tue, 19 Feb 2013 06:04:39 -0800 (PST)
Received: by 10.114.28.73 with HTTP; Tue, 19 Feb 2013 06:04:39 -0800 (PST)
In-Reply-To: <1361279644-17675-2-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-2-git-send-email-bjst@enea.com>
Date: Tue, 19 Feb 2013 15:04:39 +0100
Message-ID: <CAC1BbcQ5dY8G5qsu6LSx2J9MdW8ePqE7eFhf7g0LoxRS726qKA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: Daniel Dai <daniel.dai@enea.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] busybox: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 14:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 19 February 2013 14:13, Bj=F6rn Stenberg <bjst@enea.com> wrote:
> From: Daniel Dai <daniel.dai@enea.com>
>
>
> Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>
> ---
>  meta/recipes-core/busybox/busybox.inc       |    2 +-
>  meta/recipes-core/busybox/busybox_1.20.2.bb |   10 ++++++++++
>  meta/recipes-core/busybox/files/run-ptest   |   11 +++++++++++
>  3 files changed, 22 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/files/run-ptest
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 972e7d0..bd1581c 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -35,7 +35,7 @@ CONFFILES_${PN}-mdev =3D "${sysconfdir}/mdev.conf"
>
>  RRECOMMENDS_${PN} =3D "${PN}-syslog ${PN}-udhcpc"
>
> -inherit cml1 update-rc.d
> +inherit cml1 update-rc.d ptest
>
>  # internal helper
>  def busybox_cfg(feature, features, tokens, cnf, rem):
> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-c=
ore/busybox/busybox_1.20.2.bb
> index 783261e..b2e5d47 100644
> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> @@ -28,9 +28,19 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-=
${PV}.tar.bz2;name=3Dtarball \
>             file://fix-for-spurious-testsuite-failure.patch \
>             file://busybox-1.20.2-kernel_ver.patch \
>             file://stat-usr-bin.patch \
> +           file://run-ptest \
>             file://testsuite-du-du-k-works-fix-false-positive.patch"
>
>  SRC_URI[tarball.md5sum] =3D "e025414bc6cd79579cc7a32a45d3ae1c"
>  SRC_URI[tarball.sha256sum] =3D "eb13ff01dae5618ead2ef6f92ba879e9e0390f95=
83bd545d8789d27cf39b6882"
>
>  EXTRA_OEMAKE +=3D "V=3D1 ARCH=3D${TARGET_ARCH} CROSS_COMPILE=3D${TARGET_=
PREFIX} SKIP_STRIP=3Dy"
> +
> +do_install_append () {
> +    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
> +        ptest_do_install
> +        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
> +        cp ${B}/.config      ${D}${PTEST_PATH}/
> +        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
> +    fi
> +}
> diff --git a/meta/recipes-core/busybox/files/run-ptest b/meta/recipes-cor=
e/busybox/files/run-ptest
> new file mode 100644
> index 0000000..8eadce9
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +current_dir=3D"`readlink -f $0`"

quoting the return value of a subshell is a bit arcane. Furthermore
you should nowadays make habit of using $()
current_dir=3D$(readlink -f $0)

> +export bindir=3D"`dirname $current_dir`"
likewise
> +
> +cd testsuite
> +if [ $? -ne 0 ]; then
> +        exit 1
> +fi

just
cd testsuite || exit 1

> +
> +./runtest -v | sed  -e 's/^SKIPPED:/SKIP:/' | sed -e 's/^UNTESTED:/SKIP:=
/'

| sed -e 's/^(SKIPPED|UNTESTED):/SKIP:/'

thanks,


