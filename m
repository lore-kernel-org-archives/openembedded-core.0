Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbNox-0002XS-0k
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 04:14:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2011 19:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,435,1304319600"; d="scan'208";a="19059339"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2011 19:10:52 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 10:09:33 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 28 Jun 2011 10:09:32 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 10:09:32 +0800
Thread-Topic: [Draft design][RFC] Running postinst at rootfs generation time
Thread-Index: Acw1OGv20YOf+eBySXe2fCe41OT8wQ==
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 28 Jun 2011 02:14:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all, below is an initial investigation about the task and we'll continue=
 to further look into it.

In poky we have 2 types of postinst scripts:  one (type-1) can be (and has =
already been) run at rootfs generation time and the other (type-2) has to b=
e delayed to the first-boot of target device. Type-2 makes target device's =
first-boot slow and it would be great if we can fix it and convert it to ty=
pe-1.

We can instrument a first-boot with minimal/sato first to see which postins=
talls take the most time and then prioritise those ones to fix.

I figurerd out a list of 33 recipes in total(recipes with the same name but=
 with different versions are counted once) we possibly need to fix.
For the recipes, we need try to find recipe-specific ways(use appropriately=
 modified native utilities to generate caches, files, etc as necessary on t=
he target filesystem).

11 recipes: these could be easily fixed if we add the properly-adjusted uti=
lities "adduser, addgroup, pwconv, etc". Scott is actually adding the utili=
tes: http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dsgarma=
n/useradd-rebased&id=3D99e54d9696104ed38ec1e3464e17aa1f9b8d98ac
meta/recipes-devtools/distcc/distcc_2.18.3.bb
meta/recipes-extended/cronie/cronie_1.4.7.bb
meta/recipes-extended/at/at_3.1.12.bb:47
meta/recipes-support/hal/hal.inc:45
meta/recipes-core/dbus/dbus.inc:49
meta/recipes-connectivity/openssh/openssh_5.8p2.bb
meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
meta/recipes-graphics/x11-common/xserver-nodm-init.bb
meta/recipes-multimedia/pulseaudio/pulseaudio.inc:87
meta/recipes-extended/shadow/shadow_4.1.4.3.bb:125
meta/classes/libc-package.bbclass

6  recipes: these should be easily fixed since the scripts are not related =
to special native utilites.
meta/recipes-extended/sudo/sudo.inc
meta/recipes-extended/sysklogd/sysklogd.inc
meta/classes/update-rc.d.bbclass
meta/recipes-connectivity/ppp/ppp_2.4.5.bb
meta/recipes-graphics/pango/pango.inc
meta/recipes-gnome/gtk+/gtk+.inc
=20
4 recipes: we may need to add gtk-update-icon-cache-native.
meta/classes/gtk-icon-cache.bbclass
meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc

3 recipes: need to add gconftool-2-native?
meta/classes/gconf.bbclass
meta/recipes-graphics/mutter/mutter.inc
meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb

3 recipes: "dpkg --configure, opkg-cl configure": looks it's possible to fi=
x them if we specify proper parematers?
meta/recipes-devtools/dpkg/dpkg.inc
meta/recipes-devtools/opkg/opkg_svn.bb
meta/recipes-devtools/opkg/opkg_0.1.8.bb

1 recipe: prelink: we could propablly fix it, but I'm not sure yet.
meta/recipes-devtools/prelink/prelink_git.bb

1 recipe: "/etc/init.d/populate-volatile.sh update ; DBUSPID=3D`pidof dbus-=
daemon`": We can't fix this one.
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc

The below 4 recipes need the related utilities and need more investigation.=
=20

1 recipe: update-modules
meta/recipes-kernel/update-modules/update-modules_1.0.bb

1 recipe: systemctl
meta/recipes-connectivity/avahi/avahi.inc

1 recipe: fc-cache
meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb:37

1 recipe: gtk-query-immodules-2.0
meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb

Thanks,
-- Dexuan


