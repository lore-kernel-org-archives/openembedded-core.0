Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNmP9-0005R2-I4 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:11:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8E5jD9032443
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:05:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31928-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 14:05:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8E5bLJ032437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:05:38 GMT
Message-ID: <1320761139.10843.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 14:05:39 +0000
In-Reply-To: <bf140b91851fdaf45e2069923bad02f92ac3f2e7.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
	<bf140b91851fdaf45e2069923bad02f92ac3f2e7.1320709417.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 06/12] classes/[gnome|gnomebase|mime]: merge meta-oe's enhance gnome related classes
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
X-List-Received-Date: Tue, 08 Nov 2011 14:11:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 16:10 -0800, Joshua Lock wrote:
> This patch pulls in the gnome related classes from meta-openembedded which
> adds extra packaging rules and functionality whilst modularising things
> so that one can get a subset of the gnome classes functionality without adding
> all of the extra dependencies.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/classes/gnome-base.bbclass |   15 ++++++++++
>  meta/classes/gnome.bbclass      |   19 ++-----------
>  meta/classes/gnomebase.bbclass  |   32 ++++++++++++++++++++++
>  meta/classes/mime.bbclass       |   56 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 106 insertions(+), 16 deletions(-)
>  create mode 100644 meta/classes/gnome-base.bbclass
>  create mode 100644 meta/classes/gnomebase.bbclass

Couldn't we have better names for these? What is the difference betweem
gnome base and gnomebase?

>  create mode 100644 meta/classes/mime.bbclass
> 
> diff --git a/meta/classes/gnome-base.bbclass b/meta/classes/gnome-base.bbclass
> new file mode 100644
> index 0000000..378731d
> --- /dev/null
> +++ b/meta/classes/gnome-base.bbclass
> @@ -0,0 +1,15 @@
> +def gnome_verdir(v):
> +	import re
> +	m = re.match("^([0-9]+)\.([0-9]+)", v)
> +	return "%s.%s" % (m.group(1), m.group(2))
> +
> +SECTION ?= "x11/gnome"
> +SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
> +
> +DEPENDS += "gnome-common"
> +
> +FILES_${PN} += "${datadir}/application-registry \
> +    ${datadir}/mime-info \
> +    ${datadir}/gnome-2.0"
> +
> +inherit autotools pkgconfig
> \ No newline at end of file
> diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
> index 3d68b12..0a32a77 100644
> --- a/meta/classes/gnome.bbclass
> +++ b/meta/classes/gnome.bbclass
> @@ -1,17 +1,4 @@
> -def gnome_verdir(v):
> -	import re
> -	m = re.match("^([0-9]+)\.([0-9]+)", v)
> -	return "%s.%s" % (m.group(1), m.group(2))
> +inherit gnomebase gtk-icon-cache gconf mime
>  
> -SECTION ?= "x11/gnome"
> -SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
> -
> -DEPENDS += "gnome-common"
> -
> -FILES_${PN} += "${datadir}/application-registry \
> -    ${datadir}/mime-info \
> -    ${datadir}/gnome-2.0"
> -
> -inherit autotools pkgconfig gconf
> -
> -EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
> +EXTRA_OECONF += "--enable-introspection=no"
> +BBCLASSEXTEND += "native"

Do we really need to BBCLASSEXTEND every gnome recipe?

> diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
> new file mode 100644
> index 0000000..5a332a0
> --- /dev/null
> +++ b/meta/classes/gnomebase.bbclass
> @@ -0,0 +1,32 @@
> +def gnome_verdir(v):
> +	import re
> +	m = re.match("^([0-9]+)\.([0-9]+)", v)
> +	return "%s.%s" % (m.group(1), m.group(2))
> +
> +SECTION ?= "x11/gnome"
> +SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
> +
> +DEPENDS += "gnome-common"
> +
> +FILES_${PN} += "${datadir}/application-registry  \
> +	${datadir}/mime-info \
> +	${datadir}/mime/packages \	
> +	${datadir}/mime/application \
> +	${datadir}/gnome-2.0 \
> +	${datadir}/polkit* \
> +	${datadir}/GConf \
> +	${datadir}/glib-2.0/schemas \
> +"
> +
> +FILES_${PN}-doc += "${datadir}/devhelp"
> +
> +inherit autotools pkgconfig
> +
> +AUTOTOOLS_STAGE_PKGCONFIG = "1"

That variable is long dead, please don't bring it back :)

> +
> +do_install_append() {
> +	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
> +	rm -rf ${D}${localstatedir}/scrollkeeper/*
> +	rm -f ${D}${datadir}/applications/*.cache
> +}
> +
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> new file mode 100644
> index 0000000..b9cdd7b
> --- /dev/null
> +++ b/meta/classes/mime.bbclass
> @@ -0,0 +1,56 @@
> +DEPENDS += "shared-mime-info-native shared-mime-info"
> +
> +mime_postinst() {
> +if [ "$1" = configure ]; then
> +	if [ -x ${bindir}/update-mime-database ] ; then

This is wrong, it will use update-mime-database from the build system.
We should really use which to see if its available from the environment
and use PATH to resolve it.

> +		echo "Updating MIME database... this may take a while."
> +		update-mime-database $D${datadir}/mime

This however is using $D correctly making the above error all the more
bizarre! 

> +	else
> +		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
> +		exit 1
> +	fi
> +fi
> +}
> +
> +mime_postrm() {
> +if [ "$1" = remove ] || [ "$1" = upgrade ]; then
> +	if [ -x ${bindir}/update-mime-database ] ; then

ditto.

> +		echo "Updating MIME database... this may take a while."
> +		update-mime-database $D${datadir}/mime
> +	else
> +		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
> +		exit 1
> +	fi
> +fi
> +}
> +
> +python ppopulate_packages_append () {
> +	import os.path, re
> +	packages = bb.data.getVar('PACKAGES', d, 1).split()
> +	pkgdest =  bb.data.getVar('PKGDEST', d, 1)
> +	
> +	for pkg in packages:
> +		mime_dir = '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
> +		mimes = []
> +		mime_re = re.compile(".*\.xml$")
> +		if os.path.exists(mime_dir):
> +			for f in os.listdir(mime_dir):
> +				if mime_re.match(f):
> +					mimes.append(f)
> +		if mimes != []:
> +			bb.note("adding mime postinst and postrm scripts to %s" % pkg)
> +			postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.getVar('pkg_postinst', d, 1)
> +			if not postinst:
> +				postinst = '#!/bin/sh\n'
> +			postinst += bb.data.getVar('mime_postinst', d, 1)
> +			bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
> +			postrm = bb.data.getVar('pkg_postrm_%s' % pkg, d, 1) or bb.data.getVar('pkg_postrm', d, 1)
> +			if not postrm:
> +				postrm = '#!/bin/sh\n'
> +			postrm += bb.data.getVar('mime_postrm', d, 1)
> +			bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
> +			bb.note("adding freedesktop-mime-info dependency to %s" % pkg)
> +			rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
> +			rdepends.append("freedesktop-mime-info")
> +			bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
> +}

We don't have freedesktop-mime-info do we? Shouldn't this also check
DEPENDS and error out if it wasn't in DEPENDS else rootfs construction
will fail.

Cheers,

Richard



