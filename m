Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPUHD-0000pX-H7
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 08:42:35 +0200
Received: by wwb17 with SMTP id 17so301182wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 23:39:32 -0700 (PDT)
Received: by 10.227.100.219 with SMTP id z27mr443661wbn.45.1306391966120;
	Wed, 25 May 2011 23:39:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fw15sm242062wbb.10.2011.05.25.23.39.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 23:39:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306359819.27470.68.camel@rex>
Date: Thu, 26 May 2011 08:39:23 +0200
Message-Id: <2B594DEA-7E22-4A54-A23D-338CE61B9EED@dominion.thruhere.net>
References: <1306354721-16325-1-git-send-email-koen@dominion.thruhere.net>
	<1306359819.27470.68.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: split X11 dependant dbus-launch into its own subpackage
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
X-List-Received-Date: Thu, 26 May 2011 06:42:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mei 2011, om 23:43 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-05-25 at 22:18 +0200, Koen Kooi wrote:
>> This makes dbus usable in non-X enviroments like QT/e
>>=20
>> =46rom the original commit in OE .dev:
>>=20
>> commit 8e25448fb01b6fa6ea3a86f9327f080cd753dfbc
>> Author: John Lee <john_lee@openmoko.org>
>> Date:   Fri Sep 5 11:37:39 2008 +0000
>>=20
>>    dbus: enable x support and put dbus-launch into new package =
dbus-x11
>>    * Enable x support only add rdepends to dbus-launch.  Make it a
>>      seperate package so other packages like dbus does not rdepend on
>>      libx11.
>=20
> Which pieces of the system use dbus-launch and do we need to add
> dependencies to them after this change to pull in the dbus-x11 =
package?

=46rom OE .dev:

koen@dominion:/OE/angstrom-v2011/sources/openembedded$ git grep dbus-x11
recipes/angstrom/angstrom-x11-base-depends.bb:    dbus-x11 \
recipes/gnome/gconf_2.28.0.bb:RDEPENDS_${PN} +=3D "dbus-x11"
recipes/gnome/gdm_2.30.0.bb:RDEPENDS_${PN} +=3D "grep dbus-x11 shadow =
libpam-base-files"
recipes/shr/shr-settings_git.bb:RDEPENDS_${PN} =3D "python-elementary =
python-dbus python-codecs python-shell python-pyrtc python python-core =
python-edbus dbus-x11 frameworkd python-phoneuti
recipes/tasks/angstrom-task-gnome.bb:  dbus-x11 \
recipes/tasks/angstrom-task-lxde.bb:  dbus-x11 \
recipes/tasks/task-bug.bb:                  dbus-x11 \
recipes/tasks/task-shr-feed.bb:         dbus-x11 \
recipes/vagalume/vagalume_0.7.1.bb:RRECOMMENDS_${PN} =3D "dbus-x11"
recipes/vagalume/vagalume_0.8.3.bb:RRECOMMENDS_${PN} =3D "dbus-x11 =
hicolor-icon-theme"
recipes/xfce-base/xfce4-session_4.6.1.bb:RDEPENDS_${PN} =3D "iceauth =
xfce-utils xinit dbus-x11"
recipes/xfce-base/xfce4-session_4.6.2.bb:RDEPENDS_${PN} =3D "iceauth =
xfce-utils xinit dbus-x11"

The gconf in meta-oe has the dbus-x11 dep.

In OE-core:

koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep =
dbus-launch
meta/recipes-bsp/qemu-config/qemu-config/anjuta-remote-run:dbus-launch =
$@
meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession:if [ -x =
/usr/bin/dbus-launch ]; then
meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession:    eval =
`dbus-launch --sh-syntax --exit-with-session </dev/null`

So those would need changing. I'll send followup patches for qemu-config =
and x11-common.

regards,

Koen=


