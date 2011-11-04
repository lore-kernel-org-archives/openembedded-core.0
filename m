Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RMFjh-0004Ld-CU
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 10:06:53 +0100
Received: by wwf27 with SMTP id 27so1741752wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 02:00:41 -0700 (PDT)
Received: by 10.216.220.196 with SMTP id o46mr4145406wep.46.1320397240908;
	Fri, 04 Nov 2011 02:00:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y38sm14863254wbm.2.2011.11.04.02.00.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 02:00:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 4 Nov 2011 10:00:36 +0100
In-Reply-To: <4EB301E5.9050809@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320325020-19012-1-git-send-email-koen@dominion.thruhere.net>
	<86762F88-8EB9-47D0-B1F7-A867ADCCFB1C@dominion.thruhere.net>
	<1320331161.20107.56.camel@ted> <4EB301E5.9050809@intel.com>
Message-Id: <8D498C9A-8B44-4A72-9859-22B0A316F8ED@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] avahi: fix useradd race condition
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
X-List-Received-Date: Fri, 04 Nov 2011 09:06:53 -0000
X-Groupsio-MsgNum: 11889
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5F71C78C-8252-4BBE-B709-2AB4F3CF9A15";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5F71C78C-8252-4BBE-B709-2AB4F3CF9A15
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 22:04 heeft Scott Garman het volgende geschreven:

> On 11/03/2011 07:39 AM, Richard Purdie wrote:
>> On Thu, 2011-11-03 at 14:04 +0100, Koen Kooi wrote:
>>> Op 3 nov. 2011, om 13:57 heeft Koen Kooi het volgende geschreven:
>>>=20
>>>> Avahi doesn't work at boot because of:
>>>>=20
>>>> + sh /OE/../rootfs/var/lib/opkg/info/avahi-daemon.preinst
>>>> Running useradd commands...
>>>> grep: /OE/../rootfs/etc/passwd: No such file or directory
>>>>=20
>>>> That is due to:
>>>>=20
>>>> Package: avahi-daemon
>>>> Version: 0.6.30-r9.0
>>>> [..]
>>>> Depends: libavahi-core7 (>=3D 0.6.30), libdaemon0 (>=3D 0.14), =
libcap2 (>=3D 2.22), libavahi-common3 (>=3D 0.6.30), libdbus-1-3 (>=3D =
1.4.12), sysvinit-pidof, libc6 (>=3D 2.12), libexpat1 (>=3D 2.0.1)
>>>>=20
>>>> After this patch:
>>>>=20
>>>> Package: avahi-daemon
>>>> Version: 0.6.30-r10.0
>>>> [..]
>>>> Depends: libavahi-core7 (>=3D 0.6.30), libdaemon0 (>=3D 0.14), =
libcap2 (>=3D 2.22), libavahi-common3 (>=3D 0.6.30), libdbus-1-3 (>=3D =
1.4.12), sysvinit-pidof, libc6 (>=3D 2.12), shadow, libexpat1 (>=3D =
2.0.1), base-passwd
>>>>=20
>>>> This also changes ${PN}-daemon to avahi-daemon to be consistent =
with the PACKAGES/FILES lines below
>>>>=20
>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>> ---
>>>> meta/recipes-connectivity/avahi/avahi.inc |    7 ++++---
>>>> 1 files changed, 4 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
>>>> index 79cfd73..728c38f 100644
>>>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>>>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>>>> @@ -14,7 +14,7 @@ SECTION =3D "network"
>>>> # python scripts are under GPLv2+
>>>> LICENSE =3D "GPLv2+&  LGPLv2.1+"
>>>>=20
>>>> -INC_PR =3D "r9"
>>>> +INC_PR =3D "r10"
>>>>=20
>>>> DEPENDS =3D "expat libcap libdaemon dbus glib-2.0"
>>>>=20
>>>> @@ -23,8 +23,9 @@ SRC_URI =3D =
"http://avahi.org/download/avahi-${PV}.tar.gz \
>>>>           file://99avahi-autoipd \
>>>>           file://initscript.patch"
>>>>=20
>>>> -USERADD_PACKAGES =3D "${PN}-daemon"
>>>> -USERADD_PARAM_${PN}-daemon =3D "--system --home =
/var/run/avahi-daemon \
>>>> +USERADDPN =3D "avahi-daemon"
>>>=20
>>> My gut feeling is that useradd.bbclass should add the RDEPENDS in =
its
>>> pythoncode instead of relying on people to set both USERADD_PACKAGES
>>> and USERADDPN to the same value.
>>=20
>> Agreed, looking at the code I think we can make this easier on the =
user.
>> I'll take the fix to solve the short term issues but we could do with
>> improving this.
>=20
> I've filed a bug and will work on a fix for this:
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1727
>=20
> Thank you for uncovering the source of the problem.

Some more digging reveals a second bug:

+ for i in =
'/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-li=
nux-gnueabi/cloud9-image-1.0-r0/rootfs/var/lib/opkg/info/*.preinst'

That will go alphabetically, with 'avahi-daemon' going before =
'base-passwd' :(

I'm going to test this patch:

diff --git a/meta/classes/rootfs_ipk.bbclass =
b/meta/classes/rootfs_ipk.bbclass
index e02b816..9a8edb1 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -77,6 +77,15 @@ fakeroot rootfs_ipk_do_rootfs () {
        ${ROOTFS_POSTINSTALL_COMMAND}
       =20
        runtime_script_required=3D0
+
+       # Base-passwd needs to run first to install /etc/passwd and =
friends
+       if [ -e ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst ] =
; then
+               if ! sh $i; then
+                       runtime_script_required=3D1
+                       opkg-cl ${IPKG_ARGS} flag unpacked base-passwd
+               fi
+       fi
+


regards,

Koen=

--Apple-Mail=_5F71C78C-8252-4BBE-B709-2AB4F3CF9A15
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6zqbUACgkQMkyGM64RGpENSACgjvbaTGyXnpHkEgfD1Edb0P2a
yrAAn1qfOzqPNZAZDgP8+VhoFAPslMud
=cBqD
-----END PGP SIGNATURE-----

--Apple-Mail=_5F71C78C-8252-4BBE-B709-2AB4F3CF9A15--
