Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1QoNDx-0000zN-So; Wed, 03 Aug 2011 00:14:05 +0200
Received: by wyg30 with SMTP id 30so184626wyg.6
	for <multiple recipients>; Tue, 02 Aug 2011 15:09:44 -0700 (PDT)
Received: by 10.216.185.19 with SMTP id t19mr2252704wem.8.1312322983989;
	Tue, 02 Aug 2011 15:09:43 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r48sm139413weq.2.2011.08.02.15.09.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 15:09:43 -0700 (PDT)
References: <CAD=GYpYeDmU6CN1MzztiKsf+tfOrWgBmkGfQoSpSRhoToDDskg@mail.gmail.com>
In-Reply-To: <CAD=GYpYeDmU6CN1MzztiKsf+tfOrWgBmkGfQoSpSRhoToDDskg@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <53D0B8FD-2805-4C48-8B5E-669A96CD9962@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 3 Aug 2011 00:09:33 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd-gnome-image do_rootfs failure
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
X-List-Received-Date: Tue, 02 Aug 2011 22:14:06 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 2 aug. 2011 om 23:57 heeft Joel A Fernandes <agnel.joel@gmail.com> het vo=
lgende geschreven:

> I'd like to report a possible problem with oe-core that I'm not sure how t=
o fix:

./oebb.sh update







>=20
> On running a "bitbake systemd-gnome-image", the do_rootfs stage fails
> saying certain packages are missing.
>=20
> On digging further, I find that the opkg.conf that opkg-cl uses (in
> image.bbclass do_rootfs function) has the following contents:
>=20
> arch all 1
> arch any 6
> arch noarch 11
> arch arm 16
> arch beagleboard 21
> src oe file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2=
010_x-eglibc/deploy/ipk
> src oe-all file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstr=
om_2010_x-eglibc/deploy/ipk/all
> src oe-beagleboard
> file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-e=
glibc/deploy/ipk/beagleboard
>=20
> But there is no entry for:
> file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-e=
glibc/deploy/ipk/armv7a
>=20
> As a result, many packages like xserver-xorg are not found by opkg and
> the do_rootfs stage fails.
>=20
> This could be a potential problem in package_generate_ipkg_conf in
> ./openembedded-core/meta/classes/package_ipk.bbclass (?)
>=20
> Here is the build log:
> [..]
> ++ echo any
> ++ sed -e s/arm/i686/
> + sdkarch=3Dany
> + extension=3D-nativesdk
> + '[' any =3D all -o any =3D any -o any =3D noarch ']'
> + extension=3D
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/any/Packages
> ']'
> + for arch in '$ipkgarchs'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/noarch/Packages
> ']'
> ++ echo noarch
> ++ sed -e s/arm/i686/
> + sdkarch=3Dnoarch
> + extension=3D-nativesdk
> + '[' noarch =3D all -o noarch =3D any -o noarch =3D noarch ']'
> + extension=3D
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/noarch/Packages
> ']'
> + for arch in '$ipkgarchs'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/arm/Packages
> ']'
> ++ echo arm
> ++ sed -e s/arm/i686/
> + sdkarch=3Di686
> + extension=3D-nativesdk
> + '[' i686 =3D all -o i686 =3D any -o i686 =3D noarch ']'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/i686-nativesdk/Packages
> ']'
> + for arch in '$ipkgarchs'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/beagleboard/Packages
> ']'
> + echo 'src oe-beagleboard
> file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-e=
glibc/deploy/ipk/beagleboard'
> ++ echo beagleboard
> ++ sed -e s/arm/i686/
> + sdkarch=3Dbeagleboard
> + extension=3D-nativesdk
> + '[' beagleboard =3D all -o beagleboard =3D any -o beagleboard =3D noarch=
 ']'
> + '[' -e /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010=
_x-eglibc/deploy/ipk/beagleboard-nativesdk/Packages
> ']'
> + multilib_archs=3D
> + mkdir -p /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_20=
10_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-=
r0/temp/
> + STATUS=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_20=
10_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-=
r0/rootfs/var/lib/opkg/status
> + mkdir -p /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_20=
10_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-=
r0/rootfs/var/lib/opkg
> + opkg-cl -f /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_=
2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/opkg.conf
> -o /home/joel/angstrom-o
> e/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-ang=
strom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite update
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs//=
v
> ar/lib/opkg/lists/oe.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs//=
v
> ar/lib/opkg/lists/oe-all.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/beagleboard/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs//=
v
> ar/lib/opkg/lists/oe-beagleboard.
> + export INSTALL_PACKAGES_ATTEMPTONLY_IPK=3D
> + INSTALL_PACKAGES_ATTEMPTONLY_IPK=3D
> + export INSTALL_PACKAGES_LINGUAS_IPK=3Dlocale-base-en-us
> + INSTALL_PACKAGES_LINGUAS_IPK=3Dlocale-base-en-us
> + export INSTALL_TASK_IPK=3Drootfs
> + INSTALL_TASK_IPK=3Drootfs
> + export INSTALL_ROOTFS_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/bu=
ild/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/syste=
md-gnome-image-1.0-r0/rootfs
> + INSTALL_ROOTFS_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp=
-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnom=
e-image-1.0-r0/rootfs
> + export INSTALL_CONF_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/buil=
d/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd=
-gnome-image-1.0-r0/opkg.conf
> + INSTALL_CONF_IPK=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp-a=
ngstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-=
image-1.0-r0/opkg.conf
> + export 'INSTALL_PACKAGES_NORMAL_IPK=3Dconnman-plugin-loopback
> openssh-sftp udev e2fsprogs-blkid htop rsyslog cpufrequtils systemd
> connman-plugin-wifi connman task-gnome-themes avahi-daemon
> e2fsprogs-e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> connman-systemd task-gnome avahi-utils task-xserver avahi-systemd
> shadow dropbear-systemd tinylogin angstrom-task-boot
> task-gnome-xserver-base connman-plugin-ethernet'
> + INSTALL_PACKAGES_NORMAL_IPK=3D'connman-plugin-loopback openssh-sftp
> udev e2fsprogs-blkid htop rsyslog cpufrequtils systemd
> connman-plugin-wifi connman task-gnome-themes avahi-daemon e2fspro
> gs-e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> connman-systemd task-gnome avahi-utils task-xserver avahi-systemd
> shadow dropbear-systemd tinylogin angstrom-task-boot task-g
> nome-xserver-base connman-plugin-ethernet'
> + export INSTALL_PACKAGES_MULTILIB_IPK=3D
> + INSTALL_PACKAGES_MULTILIB_IPK=3D
> + package_install_internal_ipk
> + local target_rootfs=3D/home/joel/angstrom-oe/setup-scripts-core/build/tm=
p-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gno=
me-image-1.0-r0/rootfs
> + local conffile=3D/home/joel/angstrom-oe/setup-scripts-core/build/tmp-ang=
strom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-im=
age-1.0-r0/opkg.conf
> + local 'package_to_install=3Dconnman-plugin-loopback openssh-sftp udev
> e2fsprogs-blkid htop rsyslog cpufrequtils systemd connman-plugin-wifi
> connman task-gnome-themes avahi-daemon e2fsprogs-
> e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> connman-systemd task-gnome avahi-utils task-xserver avahi-systemd
> shadow dropbear-systemd tinylogin angstrom-task-boot task-gnom
> e-xserver-base connman-plugin-ethernet'
> + local package_attemptonly=3D
> + local package_lingusa=3D
> + local package_multilib=3D
> + local task=3Drootfs
> + mkdir -p /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_20=
10_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-=
r0/rootfs/var/lib/opkg/
> + local 'ipkg_args=3D-f
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/opkg.con=
f
> -o /home/joel/a
> ngstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagle=
board-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite'
> + opkg-cl -f /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_=
2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/opkg.conf
> -o /home/joel/angstrom-o
> e/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-ang=
strom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite update
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs//=
v
> ar/lib/opkg/lists/oe.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs//=
v
> ar/lib/opkg/lists/oe-all.
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/beagleboard/Packages.
> Updated list of available packages in
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs//=
v
> ar/lib/opkg/lists/oe-beagleboard.
> + '[' xlinux-gnueabi =3D xlinux ']'
> + '[' xlinux-gnueabi =3D xlinux-gnueabi ']'
> + '[' '!' -z '' ']'
> + '[' '!' -z 'connman-plugin-loopback openssh-sftp udev
> e2fsprogs-blkid htop rsyslog cpufrequtils systemd connman-plugin-wifi
> connman task-gnome-themes avahi-daemon e2fsprogs-e2fsck task-gn
> ome-fonts task-gnome-apps systemd-compat-units connman-systemd
> task-gnome avahi-utils task-xserver avahi-systemd shadow
> dropbear-systemd tinylogin angstrom-task-boot task-gnome-xserver-base
> connman-plugin-ethernet' ']'
> + opkg-cl -f /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_=
2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.=
0-r0/opkg.conf
> -o /home/joel/angstrom-o
> e/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-ang=
strom-linux-gnueabi/systemd-gnome-image-1.0-r0/rootfs
> --force-overwrite install connman-plugin-loopback openssh-sft
> p udev e2fsprogs-blkid htop rsyslog cpufrequtils systemd
> connman-plugin-wifi connman task-gnome-themes avahi-daemon
> e2fsprogs-e2fsck task-gnome-fonts task-gnome-apps systemd-compat-units
> co
> nnman-systemd task-gnome avahi-utils task-xserver avahi-systemd shadow
> dropbear-systemd tinylogin angstrom-task-boot task-gnome-xserver-base
> connman-plugin-ethernet
> Unknown package 'connman-plugin-loopback'.
> Unknown package 'openssh-sftp'.
> Unknown package 'udev'.
> Unknown package 'e2fsprogs-blkid'.
> Unknown package 'htop'.
> Unknown package 'rsyslog'.
> Unknown package 'cpufrequtils'.
> Unknown package 'systemd'.
> Unknown package 'connman-plugin-wifi'.
> Unknown package 'connman'.
> Installing task-gnome-themes (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/task-gnome-themes_1.0-r9_all.ipk.
> Unknown package 'avahi-daemon'.
> Unknown package 'e2fsprogs-e2fsck'.
> Installing task-gnome-fonts (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/task-gnome-fonts_1.0-r9_all.ipk.
> Installing task-gnome-apps (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/task-gnome-apps_1.0-r9_all.ipk.
> Installing systemd-compat-units (1.0-r10) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/systemd-compat-units_1.0-r10_all.ipk.
> Unknown package 'connman-systemd'.
> Installing task-gnome (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/task-gnome_1.0-r9_all.ipk.
> task-gnome: unsatisfied recommendation for ofono
> Unknown package 'avahi-utils'.
> Installing task-xserver (1.0-r0) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/beagleboard/task-xserver_1.0-r0_beagleboard.ipk=
.
> Unknown package 'avahi-systemd'.
> Installing shadow (4.1.4.3-r3) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/beagleboard/shadow_4.1.4.3-r3_beagleboard.ipk.
> Installing dropbear-systemd (v1-r0) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/dropbear-systemd_v1-r0_all.ipk.
> Unknown package 'tinylogin'.
> Installing angstrom-task-boot (1.0-r1) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/beagleboard/angstrom-task-boot_1.0-r1_beagleboa=
rd.ipk.
> angstrom-feed-configs: unsatisfied recommendation for opkg
> Installing task-gnome-xserver-base (1.0-r9) to root...
> Downloading file:/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angst=
rom_2010_x-eglibc/deploy/ipk/all/task-gnome-xserver-base_1.0-r9_all.ipk.
> mime-support: unsatisfied recommendation for file
> Unknown package 'connman-plugin-ethernet'.
> Configuring systemd-compat-units.
> Collected errors:
> * opkg_install_cmd: Cannot install package connman-plugin-loopback.
> * opkg_install_cmd: Cannot install package openssh-sftp.
> * opkg_install_cmd: Cannot install package udev.
> * opkg_install_cmd: Cannot install package e2fsprogs-blkid.
> * opkg_install_cmd: Cannot install package htop.
> * opkg_install_cmd: Cannot install package rsyslog.
> * opkg_install_cmd: Cannot install package cpufrequtils.
> * opkg_install_cmd: Cannot install package systemd.
> * opkg_install_cmd: Cannot install package connman-plugin-wifi.
> * opkg_install_cmd: Cannot install package connman.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-themes:
> *      gnome-icon-theme *      gtk-engine-thinice *
> gtk-engine-redmond95 *  gtk-theme-crux *        gtk-engine-clearlooks
> *         gtk-engine-hcengine *   gtk-theme-clearlooks *
> gnome-icon-theme *      gtk-theme-thinice *     gnome-icon-theme *
> gtk-engine-crux-engine *        gtk-theme-redmond *
> gtk-engine-glide *      gtk-theme-mist *
> * opkg_install_cmd: Cannot install package task-gnome-themes.
> * opkg_install_cmd: Cannot install package avahi-daemon.
> * opkg_install_cmd: Cannot install package e2fsprogs-e2fsck.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-fonts:
> *      mkfontdir *     eglibc (>=3D 2.12) *      mkfontscale *
> fontconfig *    fontconfig-utils *
> * opkg_install_cmd: Cannot install package task-gnome-fonts.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-apps:
> *      epiphany *      matchbox-terminal *     x11vnc *
> * opkg_install_cmd: Cannot install package task-gnome-apps.
> * opkg_install_cmd: Cannot install package connman-systemd.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome:
> *      gnome-keyring *         gnome-bluetooth *       nautilus *
> gtk-engine-clearlooks *         gtk-theme-clearlooks *  gdm *
> gnome-settings-daemon *         gnome-panel *   gnome-power-manager *
> gnome-control-center *  gnome-system-monitor *  upower *
> gnome-disk-utility *    connman-gnome *         connman-plugin-ntpd *
> gdm-systemd *   gpe-scap *      bash *  udisks *
> * opkg_install_cmd: Cannot install package task-gnome.
> * opkg_install_cmd: Cannot install package avahi-utils.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-xserver:
> *      xserver-xorg *  xf86-input-mouse *      xf86-input-keyboard *
> xf86-input-evdev *      xf86-video-omapfb *
> * opkg_install_cmd: Cannot install package task-xserver.
> * opkg_install_cmd: Cannot install package avahi-systemd.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for shadow:
> *      libpam-runtime *        pam-plugin-env *
> pam-plugin-shells *     pam-plugin-faildelay *  pam-plugin-securetty *
> pam-plugin-limits *     pam-plugin-nologin *    pam-plugin-motd *
>  eglibc (>=3D 2.12) *      pam-plugin-group *      pam-plugin-mail *
>   pam-plugin-rootok *     libpam (>=3D 1.1.4) *     pam-plugin-lastlog
> *
> * opkg_install_cmd: Cannot install package shadow.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for dropbear-systemd:
> *      dropbear *      systemd *
> * opkg_install_cmd: Cannot install package dropbear-systemd.
> * opkg_install_cmd: Cannot install package tinylogin.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for angstrom-task-boot:
> *      busybox *       netbase *       opkg *  base-passwd *
> * opkg_install_cmd: Cannot install package angstrom-task-boot.
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for task-gnome-xserver-base:
> *      xvinfo *        dbus-x11 *      xdg-utils *     xhost *
> xset *  xrandr *        xinetd *        xauth *         xrdb *  xinit
> *
> * opkg_install_cmd: Cannot install package task-gnome-xserver-base.
> * opkg_install_cmd: Cannot install package connman-plugin-ethernet.
> ERROR: Function 'do_rootfs' failed (see
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/work/beagleboard-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/temp/log=
.do_rootfs.32044
> for further information)
> (END)
>=20
>=20
> Thanks,
> Joel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


