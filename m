Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UKXDY-0006Kv-S6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 17:59:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 09:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="219076954"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Mar 2013 09:42:11 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.19]) with mapi id
	14.01.0355.002; Tue, 26 Mar 2013 16:42:08 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Koen Kooi
	<koen@dominion.thruhere.net>, Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5 -
	upgrade real-life tests
Thread-Index: AQHOKkDaGsaqYW+oukOKxclq+xdVLQ==
Date: Tue, 26 Mar 2013 16:42:07 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1621A8A5@IRSMSX102.ger.corp.intel.com>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<1364216841-32600-3-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1364216841-32600-3-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5 - upgrade real-life tests
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
X-List-Received-Date: Tue, 26 Mar 2013 16:59:31 -0000
X-List-Received-Date: Tue, 26 Mar 2013 16:59:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

Initial status:

QEmu machine core-image-sato.

Follow the /update/upgrade/install path as below:

Fact: bluez5, at this point, is not an upgrade path for bluez4.
Logical conclusion would be that bluez 5 and bluez4 should be provided only=
 with RCONFLICTS (case 2), so that doing an:
opkg upgrade
would not work, otherwise, user will conclude that, at this stage, bluez5 i=
s a replacement for bluez4, which, simply, is not true (Case 1).

Forcing user to remove bluez4 and install manually bluez5 will suggest that=
 bluez5 is not compatible with bluez4, so not a replacement.

In conclusion, in my opinion, we should go with RCONFLICTS only for bluez5.=
3 PU.

See cases below.

Please advise.

Case 1:
bluez4 and bluez5: reciprocal RREPLACES and RCONFLICTS
root@qemux86:~# opkg update
Downloading http://192.168.7.1/upg-ipk/all/Packages.gz.
Inflating http://192.168.7.1/upg-ipk/all/Packages.gz.
Updated list of available packages in /var/lib/opkg/local_repo_all.
Downloading http://192.168.7.1/upg-ipk/i586/Packages.gz.
Inflating http://192.168.7.1/upg-ipk/i586/Packages.gz.
Updated list of available packages in /var/lib/opkg/local_repo_i586.
Downloading http://192.168.7.1/upg-ipk/qemux86/Packages.gz.
Inflating http://192.168.7.1/upg-ipk/qemux86/Packages.gz.
Updated list of available packages in /var/lib/opkg/local_repo_qemux86.
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg list-upgradable | grep bluez
libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0
bluez4 - 4.101-r6.0 - 5.3-r0.0
root@qemux86:~# opkg install bluez5
Multiple replacers for bluez5, using first one (bluez4).
Package bluez4 is already installed on root.
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg upgrade
Upgrading libasound-module-bluez on root from 4.101-r6.0 to 5.3-r0.0...
Downloading http://192.168.7.1/upg-ipk/i586/libasound-module-bluez_5.3-r0.0=
_i586.ipk.
Removing obsolete file /usr/share/alsa/bluetooth.conf.
Removing obsolete file /usr/lib/alsa-lib/libasound_module_ctl_bluetooth.so.
Removing obsolete file /usr/lib/alsa-lib/libasound_module_pcm_bluetooth.so.
Upgrading bluez5 (5.3-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
Installing libical (0.48-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
Removing package bluez4 from root...
Configuring libical.
Configuring libasound-module-bluez.
Configuring bluez5.
root@qemux86:~# opkg list-installed | grep bluez
bluez5 - 5.3-r0.0
libasound-module-bluez - 5.3-r0.0
root@qemux86:~#=20

Case 2:
bluez4 and bluez5: reciprocal RCONFLICTS (only)
root@qemux86:~# opkg list-upgradable
libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0
root@qemux86:~# opkg install bluez5
Installing bluez5 (5.3-r0.0) to root...
Collected errors:
 * check_conflicts_for: The following packages conflict with bluez5:
 * check_conflicts_for: 	bluez4 *=20
 * opkg_install_cmd: Cannot install package bluez5.
root@qemux86:~# opkg upgrade bluez5
Installing bluez5 (5.3-r0.0) to root...
Collected errors:
 * check_conflicts_for: The following packages conflict with bluez5:
 * check_conflicts_for: 	bluez4 *=20
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg remove bluez4
No packages removed.
Collected errors:
 * print_dependents_warning: Package bluez4 is depended upon by packages:
 * print_dependents_warning: 	ofono
 * print_dependents_warning: 	packagegroup-base-bluetooth
 * print_dependents_warning: 	connman
 * print_dependents_warning: These might cease to work if package bluez4 is=
 removed.

 * print_dependents_warning: Force removal of this package with --force-dep=
ends.
 * print_dependents_warning: Force removal of this package and its dependen=
ts
 * print_dependents_warning: with --force-removal-of-dependent-packages.
root@qemux86:~# opkg remove --force-depends bluez4
Removing package bluez4 from root...
root@qemux86:~# opkg list-installed | grep bluez
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg install bluez5
Installing bluez5 (5.3-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
Installing libical (0.48-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
Configuring libical.
Configuring bluez5.
root@qemux86:~# opkg list-installed | grep bluez
bluez5 - 5.3-r0.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~#=20



-----Original Message-----
From: Iorga, Cristian=20
Sent: Monday, March 25, 2013 3:07 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH V3 2/2] bluez4: conflicts with/replaces bluez5

- RCONFLICTS/RREPLACES bluez5

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes=
-connectivity/bluez/bluez4_4.101.bb
index 3ea2f25..2e98043 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
=20
-PR =3D "r5"
+PR =3D "r6"
=20
 SRC_URI +=3D "file://bluetooth.conf \
             file://sbc_mmx.patch \
@@ -11,6 +11,9 @@ SRC_URI +=3D "file://bluetooth.conf \  SRC_URI[md5sum] =
=3D "fb42cb7038c380eb0e2fa208987c96ad"
 SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad=
75fe52846f7487"
=20
+RCONFLICTS_${PN} =3D "bluez5"
+RREPLACES_${PN} =3D "bluez5"
+
 do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
 	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
--
1.7.10.4



