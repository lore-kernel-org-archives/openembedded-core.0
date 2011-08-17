Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QtbNq-00026i-UP; Wed, 17 Aug 2011 10:21:55 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p7H8HKAk029226; 
	Wed, 17 Aug 2011 10:17:21 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 17 Aug 2011 10:17:16 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 17 Aug 2011 10:17:16 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE51D8@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Problems with generating and installing locale packages of
	eglibc/glibc
Thread-Index: AcxcthMDPa6h+glHQhC6TR7+CD2whw==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 17 Aug 2011 08:17:16.0856 (UTC)
	FILETIME=[138AAB80:01CC5CB6]
Subject: Problems with generating and installing locale packages of eglibc/glibc
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
X-List-Received-Date: Wed, 17 Aug 2011 08:21:55 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

we generated some locale packages of eglibc and wanted to install them
while offline image generation. The locale-base* packages are installed
properly, but the corresponding packages e.g. eglibc-binary-localedata-*
are not installed.(the same occurs with glibc).
we use following settings:

2011.03-mainenance branch

local.conf:
***
ENABLE_BINARY_LOCALE_GENERATION =3D "1"
LOCALE_GENERATION_WITH_CROSS-LOCALEDEF =3D "1"
GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "compile"
GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8
de_CH.UTF-8 es_ES.
UTF-8 fr_FR.UTF-8 fr_CH.UTF-8 it_IT.UTF-8 it_CH.UTF-8"
***

xx-image.bb:
***
IMAGE_LINGUAS =3D "en-us en-gb de-de de-ch es-es fr-fr fr-ch it-it =
it-ch"

ROOTFS_POSTPROCESS_COMMAND +=3D "install_linguas;"
***

The "locale-base-*" packages (e.g de-de) got following package
description:

****
dpkg-deb -I locale-base-de-de_2.12-r21.8+svnr12323.9_armv7a.ipk
 new debian package, version 2.0.
 size 906 bytes: control archive=3D 608 bytes.
     808 bytes,    14 lines      control             =20
 Package: locale-base-de-de
 Version: 2.12-r21.8+svnr12323.9
 Description: Embedded GNU C Library
 Section: libs
 Priority: required
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: LGPL
 Architecture: armv7a
 OE: eglibc
 Homepage: http://www.eglibc.org/home
 Build: <unknown>/9426
 Depends: eglibc-binary-localedata-de.de
 Provides: virtual-locale-de-de, virtual-locale-de,
eglibc-binary-localedata-de.de
 Source: svn://svn.eglibc.org/branches;module=3Deglibc-2_12;proto=3Dsvn
file://eglibc-svn-arm-lowlevellock-include-tls.patch
file://IO-acquire-lock-fix.patch file://shorten-build-commands.patch
file://sh4_set_fpscr_2.12.patch file://sh4_local-fpscr_values.patch
file://eglibc-dont-cache-slibdir.patch
file://armv4-eabi-compile-fix.patch file://etc/ld.so.conf
file://generate-supported.mk=20
***

this causes that the corresponding eglibc-binary-localedata-* packages
are not installed while offline image creation.

The problem is the wrong dependency entry (here: "Depends:
eglibc-binary-localedata-de.de" package name is
eglibc-binary-localedata-de-de) and the "self providing" entry (here:
"Provides: virtual-locale-de-de, virtual-locale-de,
eglibc-binary-localedata-de.de").

After examine the history of the locale generation, we found a change
from glibc-package.bbclass to libc-package.bbclass after the
release-2010.12. Hereby the function "output_locale_binary_rdepends" is
different.

Version release-2010.12
glibc-packages.bbclass

***
	def output_locale_binary_rdepends(name, pkgname, locale,
encoding):
		m =3D re.match("(.*)\.(.*)", name)
		if m:
			glibc_name =3D "%s.%s" % (m.group(1),
m.group(2).lower().replace("-",""))
		else:
			glibc_name =3D name
		bb.data.setVar('RDEPENDS_%s' % pkgname,
legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
***

Version 2011.03-maintenance:
libc-packages.bbclass

***
	def output_locale_binary_rdepends(name, pkgname, locale,
encoding):
		m =3D re.match("(.*)_(.*)", name)
		if m:
			libc_name =3D "%s.%s" % (m.group(1),
m.group(2).lower().replace("-",""))
		else:
			libc_name =3D name
		bb.data.setVar('RDEPENDS_%s' % pkgname,
legitimize_package_name('%s-binary-localedata-%s' \
			% (bpn, libc_name)), d)
		rprovides =3D (bb.data.getVar('RPROVIDES_%s' % pkgname, d,
True) or "").split()
=09
rprovides.append(legitimize_package_name('%s-binary-localedata-%s' %
(bpn, libc_name)))
		bb.data.setVar('RPROVIDES_%s' % pkgname, "
".join(rprovides), d)
***

If we use the old function, the locale packages are processed and
installed properly.

The "locale-base-*" package description now was:

***
dpkg-deb -I locale-base-de-de_2.12-r21.8+svnr12323.9_armv7a.ipk
 new debian package, version 2.0.
 size 902 bytes: control archive=3D 604 bytes.
     776 bytes,    14 lines      control             =20
 Package: locale-base-de-de
 Version: 2.12-r21.8+svnr12323.9
 Description: Embedded GNU C Library
 Section: libs
 Priority: required
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: LGPL
 Architecture: armv7a
 OE: eglibc
 Homepage: http://www.eglibc.org/home
 Build: <unknown>/9196
 Depends: eglibc-binary-localedata-de-de
 Provides: virtual-locale-de-de, virtual-locale-de
 Source: svn://svn.eglibc.org/branches;module=3Deglibc-2_12;proto=3Dsvn
file://eglibc-svn-arm-lowlevellock-include-tls.patch
file://IO-acquire-lock-fix.patch file://shorten-build-commands.patch
file://sh4_set_fpscr_2.12.patch file://sh4_local-fpscr_values.patch
file://eglibc-dont-cache-slibdir.patch
file://armv4-eabi-compile-fix.patch file://etc/ld.so.conf
file://generate-supported.mk
***

Our questions now:

What was the intention of the changes in the function
"output_locale_binary_rdepends"?
Is there a problem using the old function for our local installation ?
What language definition patterns (in GLIBC_GENERATE_LOCALES) should be
covered by the new function ?
Is this a bug ?

Regards
Wolfgang Hauser


