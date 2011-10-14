Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REhxq-0004fz-6S
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 15:38:18 +0200
Received: by eyd9 with SMTP id 9so1164861eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 06:32:32 -0700 (PDT)
Received: by 10.223.62.19 with SMTP id v19mr4000985fah.27.1318599152059;
	Fri, 14 Oct 2011 06:32:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c1sm3741803fab.15.2011.10.14.06.32.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 06:32:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111014111926.GF3542@jama.jama.net>
Date: Fri, 14 Oct 2011 15:32:29 +0200
Message-Id: <31C6262B-E2E3-4C58-AFD9-BC8D2366C566@dominion.thruhere.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
	<1318590739.23801.253.camel@ted>
	<20111014111926.GF3542@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [oe-core 11/20] mesa: package gl/egl/osmesa to separate packages
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
X-List-Received-Date: Fri, 14 Oct 2011 13:38:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2011, om 13:19 heeft Martin Jansa het volgende geschreven:

> On Fri, Oct 14, 2011 at 12:12:11PM +0100, Richard Purdie wrote:
>> On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
>>> * also install internal GL headers to libgl-dev
>>>=20
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>> meta/recipes-graphics/mesa/mesa-common.inc |   18 ++++++++++++++++--
>>> 1 files changed, 16 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc =
b/meta/recipes-graphics/mesa/mesa-common.inc
>>> index 89ef0cf..62d9b24 100644
>>> --- a/meta/recipes-graphics/mesa/mesa-common.inc
>>> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
>>> @@ -40,7 +40,21 @@ require glx-use-tls.inc
>>> # Multiple virtual/gl providers being built breaks staging
>>> EXCLUDE_FROM_WORLD =3D "1"
>>>=20
>>> -PACKAGES =3D+ "libglu libglu-dev"
>>> -
>>> +PACKAGES =3D+ "libegl libegl-dev libegl-dbg libglu libglu-dev =
libosmesa libosmesa-dev libgl libgl-dev"
>>> +FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
>>> +FILES_libgl =3D "${libdir}/libGL.so.*"
>>> FILES_libglu =3D "${libdir}/libGLU.so.*"
>>> +FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
>>> +
>>> +FILES_libegl-dev =3D "${libdir}/libEGL.* ${includedir}/EGL"
>>> +FILES_libgl-dev =3D "${libdir}/libGL.* ${includedir}/GL"
>>> FILES_libglu-dev =3D "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
>>> +FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* =
${includedir}/osmesa.h"
>>> +
>>> +FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/*"
>>> +FILES_libegl-dbg +=3D "${libdir}/egl/.debug/*"
>>> +
>>> +do_install_append () {
>>> +    install -d ${D}/${includedir}/GL
>>> +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
>>> +}
>>=20
>> This last do_install_append is wrong. Things should only be using
>> installed header files, not internal uninstalled ones. If the need
>> anything else there is a bug. I know the intel video driver had =
issues
>> in this area but those were fixed in the driver.
>=20
> checking from where we got this in meta-oe I've found really old =
commit
> =
http://git.openembedded.org/openembedded/commit/packages/mesa/mesa-common.=
inc?id=3D523eeb1062797a8562446fbefe9413a59540816b
> so you're right, I'll try to rebuild without this and drop this part
> from patchset.
>=20
>> What other issues are people seeing without this piece?
>=20
> Unless someone else knows about still broken driver :).


| glxdriswrast.c:39:39: fatal error: GL/internal/dri_interface.h: No =
such file or directory
| compilation terminated.
| glxdricommon.c:36:39: fatal error: GL/internal/dri_interface.h: No =
such file or directory
| compilation terminated.
| make[1]: *** [glxdricommon.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [glxdriswrast.lo] Error 1
| make[1]: Leaving directory =
`/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-=
gnueabi/xserver-xorg-2_1.11.1-r1/xorg-server-1.11.1/glx'

Xorg requires 'mesa-dri', which doesn't build anymore due to the =
COMPATIBLE_HOST :(



