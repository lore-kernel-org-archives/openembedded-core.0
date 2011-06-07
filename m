Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTsNc-0006S8-Co
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:15:20 +0200
Received: by wye20 with SMTP id 20so3898721wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 02:12:03 -0700 (PDT)
Received: by 10.227.164.202 with SMTP id f10mr6125704wby.92.1307437923156;
	Tue, 07 Jun 2011 02:12:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm1524634wbb.32.2011.06.07.02.12.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 02:12:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <ad653a2eecb7ec8ce662067f342f3a07792c5c86.1307436402.git.dongxiao.xu@intel.com>
Date: Tue, 7 Jun 2011 11:12:01 +0200
Message-Id: <16ADF76C-CBB1-4C0F-86E3-E799E466A9FD@dominion.thruhere.net>
References: <cover.1307436402.git.dongxiao.xu@intel.com>
	<ad653a2eecb7ec8ce662067f342f3a07792c5c86.1307436402.git.dongxiao.xu@intel.com>
To: Dongxiao Xu <dongxiao.xu@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: "poky@yoctoproject.org Project" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 2/5] connman: Upgrade to version 0.73
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
X-List-Received-Date: Tue, 07 Jun 2011 09:15:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 jun 2011, om 10:54 heeft Dongxiao Xu het volgende geschreven:

> Enable ofono plugin into sato image.
> Remove the fix-shutdown-ap-disconnect.patch since the original logic =
no longer exists.
> Add Upstream-Status information for patches.
>=20
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>

How different is this from the connman 0.74 in meta-oe?



> ---
> .../connman-0.65/fix-shutdown-ap-disconnect.patch  |   42 =
--------------------
> .../add_xuser_dbus_permission.patch                |    2 +
> .../connman/{connman-0.65 =3D> connman-0.73}/connman |    0
> .../{connman-0.65 =3D> connman-0.73}/dbusperms.patch |    2 +
> meta/recipes-connectivity/connman/connman.inc      |    2 +-
> .../connman/{connman_0.65.bb =3D> connman_0.73.bb}   |    8 ++--
> 6 files changed, 9 insertions(+), 47 deletions(-)
> delete mode 100644 =
meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.=
patch
> rename meta/recipes-connectivity/connman/{connman-0.65 =3D> =
connman-0.73}/add_xuser_dbus_permission.patch (94%)
> rename meta/recipes-connectivity/connman/{connman-0.65 =3D> =
connman-0.73}/connman (100%)
> rename meta/recipes-connectivity/connman/{connman-0.65 =3D> =
connman-0.73}/dbusperms.patch (91%)
> rename meta/recipes-connectivity/connman/{connman_0.65.bb =3D> =
connman_0.73.bb} (74%)
>=20
> diff --git =
a/meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnec=
t.patch =
b/meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnec=
t.patch
> deleted file mode 100644
> index a0ad099..0000000
> --- =
a/meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnec=
t.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Schedule delayed scan when being disconnected from an AP
> -
> -When being disconnected from an AP, a delayed scan is scheduled to =
make
> -sure the AP is still there. wpa_supplicant removes a BSS from its bss =
list
> -when it disappears from the scan results twice in a row.
> -
> -Author: Samuel Ortiz <sameo@linux.intel.com>
> -Ported by Dongxiao Xu <dongxiao.xu@intel.com>
> -
> -diff -ruN connman-0.56-orig/plugins/supplicant.c =
connman-0.56/plugins/supplicant.c
> ---- connman-0.56-orig/plugins/supplicant.c	2010-09-25 =
15:08:21.242927383 +0800
> -+++ connman-0.56/plugins/supplicant.c	2010-09-25 =
15:12:46.346136858 +0800
> -@@ -2184,6 +2184,15 @@
> - 				scanning =3D=3D TRUE ? "started" : =
"finished");
> - }
> -=20
> -+static gboolean delayed_scan(gpointer user_data)
> -+{
> -+	struct supplicant_task *task =3D user_data;
> -+
> -+	supplicant_scan(task->device);
> -+
> -+	return FALSE;
> -+}
> -+
> - static void state_change(struct supplicant_task *task, DBusMessage =
*msg)
> - {
> - 	DBusError error;
> -@@ -2277,7 +2286,13 @@
> - 				task_connect(task);
> - 			} else
> - 				task->network =3D NULL;
> -+		} else {
> -+			if (task->state =3D=3D WPA_DISCONNECTED)
> -+				g_timeout_add_seconds(10, delayed_scan, =
task);
> -+
> -+			remove_network(task);
> - 		}
> -+
> - 		break;
> -=20
> - 	default:
> diff --git =
a/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission=
.patch =
b/meta/recipes-connectivity/connman/connman-0.73/add_xuser_dbus_permission=
.patch
> similarity index 94%
> rename from =
meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.p=
atch
> rename to =
meta/recipes-connectivity/connman/connman-0.73/add_xuser_dbus_permission.p=
atch
> index 787d49b..764c689 100644
> --- =
a/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission=
.patch
> +++ =
b/meta/recipes-connectivity/connman/connman-0.73/add_xuser_dbus_permission=
.patch
> @@ -1,6 +1,8 @@
> Some platform (like atom-pc) enables rootless X,
> thus we need to add the xuser in the list.
>=20
> +Upstream-Status: Inappropriate [configuration]
> +
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>=20
> diff -ruN connman-0.65-orig/src/connman-dbus.conf =
connman-0.65/src/connman-dbus.conf
> diff --git a/meta/recipes-connectivity/connman/connman-0.65/connman =
b/meta/recipes-connectivity/connman/connman-0.73/connman
> similarity index 100%
> rename from meta/recipes-connectivity/connman/connman-0.65/connman
> rename to meta/recipes-connectivity/connman/connman-0.73/connman
> diff --git =
a/meta/recipes-connectivity/connman/connman-0.65/dbusperms.patch =
b/meta/recipes-connectivity/connman/connman-0.73/dbusperms.patch
> similarity index 91%
> rename from =
meta/recipes-connectivity/connman/connman-0.65/dbusperms.patch
> rename to =
meta/recipes-connectivity/connman/connman-0.73/dbusperms.patch
> index 100af03..c331654 100644
> --- a/meta/recipes-connectivity/connman/connman-0.65/dbusperms.patch
> +++ b/meta/recipes-connectivity/connman/connman-0.73/dbusperms.patch
> @@ -1,3 +1,5 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> Index: git/src/connman-dbus.conf
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- git.orig/src/connman-dbus.conf	2009-05-26 00:34:35.000000000 =
+0100
> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
> index fb970ed..f6565a5 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                     =
file://src/main.c;beginline=3D1;endline=3D20;md5=3D4b55b550fa6b33cc2055ef3=
0dd262b3e"
>=20
> DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables"
> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
> +RDEPENDS_${PN} =3D "wpa-supplicant resolvconf ofono"
>=20
> INITSCRIPT_NAME =3D "connman"
> INITSCRIPT_PARAMS =3D "start 05 5 2 3 . stop 22 0 1 6 ."
> diff --git a/meta/recipes-connectivity/connman/connman_0.65.bb =
b/meta/recipes-connectivity/connman/connman_0.73.bb
> similarity index 74%
> rename from meta/recipes-connectivity/connman/connman_0.65.bb
> rename to meta/recipes-connectivity/connman/connman_0.73.bb
> index 852f8dc..ffe0074 100644
> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.73.bb
> @@ -1,5 +1,5 @@
> require connman.inc
> -PR =3D "r1"
> +PR =3D "r0"
>=20
> EXTRA_OECONF +=3D "\
>   ac_cv_path_WPASUPPLICANT=3D/usr/sbin/wpa_supplicant \
> @@ -16,14 +16,14 @@ EXTRA_OECONF +=3D "\
>   --disable-udev \
>   --disable-polkit \
>   --enable-client \
> +  --enable-ofono \
>   --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var"
>=20
> SRC_URI  =3D "\
>   ${KERNELORG_MIRROR}/linux/network/connman/connman-${PV}.tar.gz \
> -  file://fix-shutdown-ap-disconnect.patch \
>   file://add_xuser_dbus_permission.patch \
>   file://connman \
> "
>=20
> -SRC_URI[md5sum] =3D "bd714da295ed2d2d91a49539f4c4fa3a"
> -SRC_URI[sha256sum] =3D =
"a1c1d93da6bb4c2d8ae53293b06f237e02f5e796d2bba73ec639a466d05259c3"
> +SRC_URI[md5sum] =3D "01085b2ed8f7b11a41724f1528720cc7"
> +SRC_URI[sha256sum] =3D =
"b71ff2c3925ea82a7ebf818685f809e595d5c47d767005dfb149c6264b098417"
> --=20
> 1.7.1
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



