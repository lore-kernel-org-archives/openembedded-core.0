Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1StCep-0002K6-E5
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:02:20 +0200
X-IronPort-AV: E=Sophos;i="4.77,637,1336341600"; d="scan'208";a="13378284"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 23 Jul 2012 08:50:55 +0200
x-mimeole: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 23 Jul 2012 08:50:52 +0200
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD03A17E72@FRSNPREXC1.usr.ingenico.loc>
In-Reply-To: <1342796791.21788.30.camel@ted>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] Broken gettext/gdbm
Thread-Index: Ac1miUjhYXXZkDrYS96CCIud8DZOvACC0sag
References: <D9D7124626ED1E43963D86B2657D5CCD03A17BC8@FRSNPREXC1.usr.ingenico.loc>
	<1342796791.21788.30.camel@ted>
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken gettext/gdbm
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
X-List-Received-Date: Mon, 23 Jul 2012 07:02:21 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

$ bitbake gdbm -e | grep ^DEPENDS
DEPENDS_GETTEXT=3D"virtual/gettext gettext-native"
DEPENDS=3D"autoconf-native automake-native libtool-native libtool-cross =
gnu-config-native virtual/gettext gettext-native  =
virtual/arm-ingenico-linux-gnueabi-gcc =
virtual/arm-ingenico-linux-gnueabi-compilerlibs virtual/libc"

$ bitbake gettext -e | grep ^DEPENDS
DEPENDS_virtclass-native=3D"libxml2-native gettext-minimal-native"
DEPENDS=3D"autoconf-native automake-native libtool-native libtool-cross =
gnu-config-native  virtual/arm-ingenico-linux-gnueabi-gcc =
virtual/arm-ingenico-linux-gnueabi-compilerlibs virtual/libc  =
libxml2-native gettext-native virtual/libiconv ncurses expat"

Note: We are using our own external toolchain.

I wasn't clear enough in my previous post. It appear to be a circular =
dependency.

Since my update I have this log:
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/gettext =
(proxy-libintl, gettext)
NOTE: consider defining a PREFERRED_PROVIDER entry to match =
virtual/gettext

When I just try to build gettext, It wants to build gdbm.. which depends =
of gettext too.

gettext-minimal-native doesn't have config.rpath, gettext-native has it.

But config.rpath is taken from ${STAGING_DATADIR}/gettext/config.rpath" =
and not ${STAGING_DATADIR_NATIVE}/gettext/config.rpath".
Patching "meta/classes/autotools.bbclass" would be a proper fix ?

Cheers,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] De la part de =
Richard Purdie
Envoy=E9=A0: vendredi 20 juillet 2012 17:07
=C0=A0: Patches and discussions about the oe-core layer
Objet=A0: Re: [OE-core] Broken gettext/gdbm

On Fri, 2012-07-20 at 15:10 +0200, Matthieu CRAPET wrote:
> Greetings,
>=20
> I updated my OE-core and bitbake today (2012.07.20). Build from=20
> scratch
> fails:
>=20
> <code>
> NOTE: package gdbm-1.10-r3: task do_configure: Started
> ERROR: Function failed: do_configure (see=20
> /home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3
> /t
> emp/log.do_configure.31222 for further information)
> ERROR: Logfile of failure stored in:
> /home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3
> /t
> emp/log.do_configure.31222
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',=20
> 'common']
> | DEBUG: Executing shell function do_configure automake (GNU automake) =

> | 1.12.1 Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot stat
> `/home/.../build/tmp-eglibc/sysroots/rp02/usr/share/gettext/config.rpa
> th
> ': No such file or directory
> | ERROR: Function failed: do_configure (see
> /home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3
> /t
> emp/log.do_configure.31222 for further information)
> NOTE: package gdbm-1.10-r3: task do_configure: Failed </code>
>=20
> gdbm needs gettext to have config.rpath. But gettext is not built, but =

> gettext-native & gettext-minimal-native are built.
>=20
> Issue comes from  "meta/classes/autotools.bbclass":
>=20
> <code>
>         else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC
> >/dev/null; then
>                             # We'd call gettextize here if it wasn't=20
> so broken...
>           cp ${STAGING_DATADIR}/gettext/config.rpath
> ${AUTOTOOLS_AUXDIR}/
> </code>
>=20
> What would be the best workaround to take config.rpath from=20
> gettext-native?

This is odd since gdbm inherits gettext and therefore should have a =
DEPENDS on virtual/gettext. gettext should therefore have been built.

Any idea why gettext wasn't built?

bitbake gdbm -e | grep ^DEPENDS

shows virtual/gettext here...

Cheers,

Richard


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


