Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcY50-0007Tt-OS
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 09:23:59 +0200
Received: by wyg30 with SMTP id 30so2280160wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 00:20:14 -0700 (PDT)
Received: by 10.227.159.141 with SMTP id j13mr2652592wbx.108.1309504813631;
	Fri, 01 Jul 2011 00:20:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm2135478wbb.65.2011.07.01.00.20.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 00:20:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cf740fbc1c5f26487e14e8959cfc13f085ff95ff.1309503939.git.anders@chargestorm.se>
Date: Fri, 1 Jul 2011 09:20:06 +0200
Message-Id: <D041C15B-428E-432D-996B-EF7356B38E29@dominion.thruhere.net>
References: <cover.1309503939.git.anders@chargestorm.se>
	<cf740fbc1c5f26487e14e8959cfc13f085ff95ff.1309503939.git.anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v4 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 07:23:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul 2011, om 09:06 heeft Anders Darander het volgende geschreven:

> Also remove the other kernel24 references.
> Make everything dependent on kernel26 default.

Since there will be only one of each, can we just completely scrap there =
variables and put the items directly in the tasks?

regards,

Koen

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
> meta/recipes-core/tasks/task-base.bb |   24 ++++--------------------
> 1 files changed, 4 insertions(+), 20 deletions(-)
>=20
> diff --git a/meta/recipes-core/tasks/task-base.bb =
b/meta/recipes-core/tasks/task-base.bb
> index 3ff57ff..62432b4 100644
> --- a/meta/recipes-core/tasks/task-base.bb
> +++ b/meta/recipes-core/tasks/task-base.bb
> @@ -45,7 +45,7 @@ PACKAGES =3D ' \
>             ${@base_contains("DISTRO_FEATURES", "raid", =
"task-base-raid", "",d)} \
>             ${@base_contains("DISTRO_FEATURES", "zeroconf", =
"task-base-zeroconf", "", d)} \
>             \
> -            =
${@base_contains("MACHINE_FEATURES","kernel26","task-base-kernel26","task-=
base-kernel24",d)} \
> +            task-base-kernel26 \
>             '
>=20
> ALLOW_EMPTY =3D "1"
> @@ -58,12 +58,12 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> #
> # linux-hotplug or none
> #
> -HOTPLUG ?=3D "${@base_contains("MACHINE_FEATURES", "kernel24",  =
"linux-hotplug","",d)} "
> +HOTPLUG ?=3D ""
>=20
> #
> # pcmciautils for >=3D 2.6.13-rc1, pcmcia-cs for others
> #
> -PCMCIA_MANAGER ?=3D "${@base_contains('MACHINE_FEATURES', =
'kernel26','pcmciautils','pcmcia-cs',d)} "
> +PCMCIA_MANAGER ?=3D "pcmciautils"
>=20
> #
> # those ones can be set in machine config to supply packages needed to =
get machine booting
> @@ -79,7 +79,7 @@ RDEPENDS_task-base =3D "\
>     task-machine-base \
>     ${HOTPLUG} \
>     \
> -    ${@base_contains('MACHINE_FEATURES', =
'kernel26','task-base-kernel26','task-base-kernel24',d)} \
> +    task-base-kernel26 \
>     ${@base_contains('MACHINE_FEATURES', 'apm', 'task-base-apm', =
'',d)} \
>     ${@base_contains('MACHINE_FEATURES', 'acpi', 'task-base-acpi', =
'',d)} \
>     ${@base_contains('MACHINE_FEATURES', 'keyboard', =
'task-base-keyboard', '',d)} \
> @@ -155,17 +155,10 @@ RRECOMMENDS_task-distro-base =3D =
"${DISTRO_EXTRA_RRECOMMENDS}"
> RDEPENDS_task-machine-base =3D "${MACHINE_EXTRA_RDEPENDS}"
> RRECOMMENDS_task-machine-base =3D "${MACHINE_EXTRA_RRECOMMENDS}"
>=20
> -RDEPENDS_task-base-kernel24 =3D "\
> -    modutils-depmod"
> -
> RDEPENDS_task-base-kernel26 =3D "\
>     sysfsutils \
>     module-init-tools"
>=20
> -RRECOMMENDS_task-base-kernel24 =3D "\
> -    kernel-module-input \
> -    kernel-module-uinput"
> -
> RRECOMMENDS_task-base-kernel26 =3D "\
>     kernel-module-nls-utf8 \
>     kernel-module-input \
> @@ -221,21 +214,12 @@ RDEPENDS_task-base-pcmcia =3D "\
>=20
>=20
> RRECOMMENDS_task-base-pcmcia =3D "\
> -    ${@base_contains('MACHINE_FEATURES', 'kernel26', =
'${task-base-pcmcia26}', '${task-base-pcmcia24}',d)} \
>     kernel-module-pcmcia \
>     kernel-module-airo-cs \
>     kernel-module-pcnet-cs \
>     kernel-module-serial-cs \
>     kernel-module-ide-cs \
>     kernel-module-ide-disk \
> -    "
> -
> -task-base-pcmcia24 =3D "\
> -    ${@base_contains('DISTRO_FEATURES', 'wifi', 'hostap-modules-cs', =
'',d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'wifi', 'orinoco-modules-cs', =
'',d)} \
> -    "
> -
> -task-base-pcmcia26 =3D "\
>     ${@base_contains('DISTRO_FEATURES', 'wifi', =
'kernel-module-hostap-cs', '',d)} \
>     ${@base_contains('DISTRO_FEATURES', 'wifi', =
'kernel-module-orinoco-cs', '',d)} \
>     ${@base_contains('DISTRO_FEATURES', 'wifi', =
'kernel-module-spectrum-cs', '',d)}"
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



