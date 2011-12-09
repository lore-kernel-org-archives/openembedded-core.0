Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZ0dc-0001Jt-AN for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 14:37:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9DUPIR000685;
	Fri, 9 Dec 2011 13:30:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32751-08; Fri,  9 Dec 2011 13:30:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9DUHwf000679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Dec 2011 13:30:18 GMT
Message-ID: <1323437428.5309.154.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 13:30:28 +0000
In-Reply-To: <b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
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
X-List-Received-Date: Fri, 09 Dec 2011 13:37:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 11:34 -0800, Beth Flanagan wrote:
> +
> +license_create_manifest() {
> +    mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
> +    # Get list of installed packages
> +    list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
> +    INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
> +    # list of installed packages is broken for deb
> +    if [ ${IMAGE_PKGTYPE} != "deb" ]; then
> +
> +        for pkg in ${INSTALLED_PKGS}; do
> +            # not the best way to do this but licenses are not arch dependant iirc
> +            files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
> +            for filename in $files; do
> +                pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
> +                pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
> +                # check to see if the package name exists in the manifest. if so, bail.
> +                if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
> +                    # exclude local recipes
> +                    if [ ! ${pkged_pn} == "*locale*" ]; then

The above line is a bashism and is breaking builds with dash
as /bin/sh :(

Cheers,

Richard



