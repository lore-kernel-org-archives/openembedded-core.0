Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMRT4-00054X-Lo
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:06:14 +0200
Received: by wwb17 with SMTP id 17so882451wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:03:20 -0700 (PDT)
Received: by 10.216.229.150 with SMTP id h22mr3795126weq.68.1305666200465;
	Tue, 17 May 2011 14:03:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k63sm482202wed.47.2011.05.17.14.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 14:03:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
Date: Tue, 17 May 2011 23:03:17 +0200
Message-Id: <3F9AD32B-28F9-4EC4-87A4-827AAB6CA6B7@dominion.thruhere.net>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Tue, 17 May 2011 21:06:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2011, om 22:57 heeft Khem Raj het volgende geschreven:

> With default-setup being pulled in via bitbake.conf and task-core-boot
> being pulled into all images in distros, we need
> to have some variables that distro's can override if need be
> This is a backport from angstrom/OE. It will help distros which
> e.g. would like to use busybox-mdev instead of udev and similarly
> for login manager these variables can be defined in distro policies

The whole idea of IMAGE vars is that they can be overridden by image =
recipes. Putting the vars in a tasks defeats that.

regards,

Koen



>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/conf/distro/include/default-distrovars.inc |   13 +++++++++++++
> meta/recipes-core/tasks/task-core-boot.bb       |    8 ++++----
> 2 files changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc =
b/meta/conf/distro/include/default-distrovars.inc
> index 9b1d0ee..3b78d66 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -6,6 +6,19 @@ OEINCLUDELOGS ?=3D "yes"
> KERNEL_CONSOLE ?=3D "ttyS0"
>=20
> PCMCIA_MANAGER ?=3D "pcmciautils"
> +#
> +# udev, devfsd, busybox-mdev (from busybox) or none
> +#
> +IMAGE_DEV_MANAGER ?=3D "udev"
> +#
> +# sysvinit, upstart
> +#
> +IMAGE_INIT_MANAGER ?=3D "sysvinit"
> +IMAGE_INITSCRIPTS ?=3D "initscripts"
> +#
> +# tinylogin, getty
> +#
> +IMAGE_LOGIN_MANAGER ?=3D "tinylogin"
>=20
> IMAGE_LINGUAS ?=3D "en-us en-gb"
> LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
> diff --git a/meta/recipes-core/tasks/task-core-boot.bb =
b/meta/recipes-core/tasks/task-core-boot.bb
> index 5aea771..af2c2ee 100644
> --- a/meta/recipes-core/tasks/task-core-boot.bb
> +++ b/meta/recipes-core/tasks/task-core-boot.bb
> @@ -21,13 +21,13 @@ RDEPENDS_task-core-boot =3D "\
>     base-files \
>     base-passwd \
>     busybox \
> -    initscripts \
> +    ${IMAGE_INITSCRIPTS} \
>     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", =
d)} \
>     modutils-initscripts \
>     netbase \
> -    sysvinit \
> -    tinylogin \
> -    udev \
> +    ${IMAGE_INIT_MANAGER} \
> +    ${IMAGE_LOGIN_MANAGER} \
> +    ${IMAGE_DEV_MANAGER} \
>     ${VIRTUAL-RUNTIME_update-alternatives} \
>     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
>=20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



