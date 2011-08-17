Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QtchY-00048p-LZ
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 11:46:20 +0200
Received: by wyf19 with SMTP id 19so595377wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 02:41:42 -0700 (PDT)
Received: by 10.227.130.104 with SMTP id r40mr642293wbs.73.1313574102262;
	Wed, 17 Aug 2011 02:41:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eq21sm751589wbb.52.2011.08.17.02.41.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 02:41:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE51D8@GSX300A.mxchg.m.corp>
Date: Wed, 17 Aug 2011 11:41:39 +0200
Message-Id: <F5106DA0-C6FF-46B2-8940-C47C6073F0E3@dominion.thruhere.net>
References: <0C757E680E33864AB113392C7E83F910BE51D8@GSX300A.mxchg.m.corp>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Problems with generating and installing locale packages of eglibc/glibc
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
X-List-Received-Date: Wed, 17 Aug 2011 09:46:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 aug. 2011, om 10:17 heeft Hauser, Wolfgang (external) het volgende =
geschreven:

> Hello,
>=20
> we generated some locale packages of eglibc and wanted to install them
> while offline image generation. The locale-base* packages are =
installed
> properly, but the corresponding packages e.g. =
eglibc-binary-localedata-*
> are not installed.(the same occurs with glibc).
> we use following settings:
>=20
> 2011.03-mainenance branch
>=20
> local.conf:
> ***
> ENABLE_BINARY_LOCALE_GENERATION =3D "1"
> LOCALE_GENERATION_WITH_CROSS-LOCALEDEF =3D "1"
> GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "compile"
> GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8
> de_CH.UTF-8 es_ES.
> UTF-8 fr_FR.UTF-8 fr_CH.UTF-8 it_IT.UTF-8 it_CH.UTF-8"
> ***
>=20
> xx-image.bb:
> ***
> IMAGE_LINGUAS =3D "en-us en-gb de-de de-ch es-es fr-fr fr-ch it-it =
it-ch"
>=20
> ROOTFS_POSTPROCESS_COMMAND +=3D "install_linguas;"
> ***
>=20
> The "locale-base-*" packages (e.g de-de) got following package
> description:
>=20
> ****
> dpkg-deb -I locale-base-de-de_2.12-r21.8+svnr12323.9_armv7a.ipk
> new debian package, version 2.0.
> size 906 bytes: control archive=3D 608 bytes.
>     808 bytes,    14 lines      control             =20
> Package: locale-base-de-de
> Version: 2.12-r21.8+svnr12323.9
> Description: Embedded GNU C Library
> Section: libs
> Priority: required
> Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
> License: LGPL
> Architecture: armv7a
> OE: eglibc
> Homepage: http://www.eglibc.org/home
> Build: <unknown>/9426
> Depends: eglibc-binary-localedata-de.de
> Provides: virtual-locale-de-de, virtual-locale-de,
> eglibc-binary-localedata-de.de
> Source: svn://svn.eglibc.org/branches;module=3Deglibc-2_12;proto=3Dsvn
> file://eglibc-svn-arm-lowlevellock-include-tls.patch
> file://IO-acquire-lock-fix.patch file://shorten-build-commands.patch
> file://sh4_set_fpscr_2.12.patch file://sh4_local-fpscr_values.patch
> file://eglibc-dont-cache-slibdir.patch
> file://armv4-eabi-compile-fix.patch file://etc/ld.so.conf
> file://generate-supported.mk=20
> ***
>=20
> this causes that the corresponding eglibc-binary-localedata-* packages
> are not installed while offline image creation.
>=20
> The problem is the wrong dependency entry (here: "Depends:
> eglibc-binary-localedata-de.de" package name is
> eglibc-binary-localedata-de-de) and the "self providing" entry (here:
> "Provides: virtual-locale-de-de, virtual-locale-de,
> eglibc-binary-localedata-de.de").
>=20
> After examine the history of the locale generation, we found a change
> from glibc-package.bbclass to libc-package.bbclass after the
> release-2010.12. Hereby the function "output_locale_binary_rdepends" =
is
> different.
>=20
> Version release-2010.12
> glibc-packages.bbclass
>=20
> ***
> 	def output_locale_binary_rdepends(name, pkgname, locale,
> encoding):
> 		m =3D re.match("(.*)\.(.*)", name)
> 		if m:
> 			glibc_name =3D "%s.%s" % (m.group(1),
> m.group(2).lower().replace("-",""))
> 		else:
> 			glibc_name =3D name
> 		bb.data.setVar('RDEPENDS_%s' % pkgname,
> legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
> ***
>=20
> Version 2011.03-maintenance:
> libc-packages.bbclass
>=20
> ***
> 	def output_locale_binary_rdepends(name, pkgname, locale,
> encoding):
> 		m =3D re.match("(.*)_(.*)", name)
> 		if m:
> 			libc_name =3D "%s.%s" % (m.group(1),
> m.group(2).lower().replace("-",""))
> 		else:
> 			libc_name =3D name
> 		bb.data.setVar('RDEPENDS_%s' % pkgname,
> legitimize_package_name('%s-binary-localedata-%s' \
> 			% (bpn, libc_name)), d)
> 		rprovides =3D (bb.data.getVar('RPROVIDES_%s' % pkgname, =
d,
> True) or "").split()
> =09
> rprovides.append(legitimize_package_name('%s-binary-localedata-%s' %
> (bpn, libc_name)))
> 		bb.data.setVar('RPROVIDES_%s' % pkgname, "
> ".join(rprovides), d)
> ***
>=20
> If we use the old function, the locale packages are processed and
> installed properly.
>=20
> The "locale-base-*" package description now was:
>=20
> ***
> dpkg-deb -I locale-base-de-de_2.12-r21.8+svnr12323.9_armv7a.ipk
> new debian package, version 2.0.
> size 902 bytes: control archive=3D 604 bytes.
>     776 bytes,    14 lines      control             =20
> Package: locale-base-de-de
> Version: 2.12-r21.8+svnr12323.9
> Description: Embedded GNU C Library
> Section: libs
> Priority: required
> Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
> License: LGPL
> Architecture: armv7a
> OE: eglibc
> Homepage: http://www.eglibc.org/home
> Build: <unknown>/9196
> Depends: eglibc-binary-localedata-de-de
> Provides: virtual-locale-de-de, virtual-locale-de
> Source: svn://svn.eglibc.org/branches;module=3Deglibc-2_12;proto=3Dsvn
> file://eglibc-svn-arm-lowlevellock-include-tls.patch
> file://IO-acquire-lock-fix.patch file://shorten-build-commands.patch
> file://sh4_set_fpscr_2.12.patch file://sh4_local-fpscr_values.patch
> file://eglibc-dont-cache-slibdir.patch
> file://armv4-eabi-compile-fix.patch file://etc/ld.so.conf
> file://generate-supported.mk
> ***
>=20
> Our questions now:
>=20
> What was the intention of the changes in the function
> "output_locale_binary_rdepends"?
> Is there a problem using the old function for our local installation ?
> What language definition patterns (in GLIBC_GENERATE_LOCALES) should =
be
> covered by the new function ?
> Is this a bug ?

That looks like the same bug as described in =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007407.=
html

Nitin said he'd look into it after getting back from vacation:

=
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/008181.=
html=


