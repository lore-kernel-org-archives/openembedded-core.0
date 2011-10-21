Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RH9GI-0000Tr-7X
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 09:11:26 +0200
Received: by eyd9 with SMTP id 9so3729949eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 00:05:33 -0700 (PDT)
Received: by 10.14.5.212 with SMTP id 60mr1658008eel.184.1319180733266;
	Fri, 21 Oct 2011 00:05:33 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm32247726eec.1.2011.10.21.00.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 00:05:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319180084.3244.2.camel@lenovo.internal.reciva.com>
Date: Fri, 21 Oct 2011 09:05:25 +0200
Message-Id: <BC7562A7-EF47-47CE-8A4C-F024A9F01919@dominion.thruhere.net>
References: <cover.1319167843.git.otavio@ossystems.com.br>
	<67ee6e07c8d57d45682fb8962df79fb8d154c400.1319167843.git.otavio@ossystems.com.br>
	<1319180084.3244.2.camel@lenovo.internal.reciva.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/4] dbus: use useradd class to allow use in read-only filesystems
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
X-List-Received-Date: Fri, 21 Oct 2011 07:11:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 08:54 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-10-21 at 03:31 +0000, Otavio Salvador wrote:
>> +USERADD_PACKAGES =3D "${PN}"
>> +GROUPADD_PARAM_${PN} =3D "-r netdev"
>> +USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/lib/dbus \
>> +                       --no-create-home --user-group messagebus"
>=20
> Why does dbus need "netdev"?


A little digging on the internet shows that some applications using dbus =
use netdev and as a result dbus will complain about a missing netdev =
group. Dbus itself doesn't seem to need it. A handfull of searchresults =
imply that not dbus but e.g. networkmanager and wpa-supplicant should =
create the group, but:

root@beagleboard:/etc/dbus-1/system.d# ls
ConsoleKit.conf           org.freedesktop.PolicyKit1.conf
NetworkManager.conf       org.freedesktop.UDisks.conf
avahi-dbus.conf           org.freedesktop.UPower.conf
bluetooth.conf            org.freedesktop.hostname1.conf
dbus-wpa_supplicant.conf  org.freedesktop.locale1.conf
gdm.conf                  org.freedesktop.login1.conf
nm-avahi-autoipd.conf     org.freedesktop.systemd1.conf
nm-dhcp-client.conf       org.freedesktop.timedate1.conf
nm-dispatcher.conf        org.gnome.GConf.Defaults.conf

root@beagleboard:/etc/dbus-1/system.d# grep netdev *
root@beagleboard:/etc/dbus-1/system.d#=20

So it seems (but I am not certain!) that netdev is a relic of the past =
and can go away. What I would propose:

1) convert the existing *inst to useradd.bbclass
2) bump PR, remove netdev

That should give us a nice bisectable stack of commits.

regards,

Koen=


