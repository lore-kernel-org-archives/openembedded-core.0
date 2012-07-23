Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StFkg-00088e-Ge for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:20:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6NA97Jt003028
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:09:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01847-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:09:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6NA8vOJ003022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:08:59 +0100
Message-ID: <1343038142.21788.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 11:09:02 +0100
In-Reply-To: <9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>
References: <cover.1342939738.git.jackie.huang@windriver.com>
	<9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Mon, 23 Jul 2012 10:20:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-22 at 14:53 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> A race condition can occur when adding users and groups to the
> passwd and group files, in [YOCTO #1794], 10 times retry added
> but it is not fixed completely.
> 
> This fix re-writes the useradd_preinst and useradd_sysroot with
> python and use locking of bb.utils to lock the passwd and group
> files before executing useradd/groupadd commands to avoid the
> lock race themselves.
> 
> [YOCTO #2779]
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/classes/useradd.bbclass |  284 ++++++++++++++++++------------------------
>  1 files changed, 124 insertions(+), 160 deletions(-)
> 
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index bb8f42b..ed5ed69 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -14,126 +14,90 @@ USERADDDEPENDS_virtclass-nativesdk = ""
>  # c) As the preinst script in the target package at do_rootfs time
>  # d) As the preinst script in the target package on device as a package upgrade
>  #
> -useradd_preinst () {
> -OPT=""
> -SYSROOT=""
> -
> -if test "x$D" != "x"; then

[...]

> -	done
> -fi
> +def useradd_preinst(d):
> +	import re
> +

[...]


> -    # Add the user/group preinstall scripts and RDEPENDS requirements
> -    # to packages specified by USERADD_PACKAGES
> -    if not bb.data.inherits_class('nativesdk', d):
> -        useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
> -        for pkg in useradd_packages.split():
> -            update_useradd_package(pkg)
> +	def update_useradd_package(pkg):
> +		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
> +
> +		"""
> +		useradd preinst is appended here because pkg_preinst may be
> +		required to execute on the target. Not doing so may cause
> +		useradd preinst to be invoked twice, causing unwanted warnings.
> +		"""
> +		preinst = d.getVar('pkg_preinst_%s' % pkg, True) or d.getVar('pkg_preinst', True)
> +		if not preinst:
> +			preinst = '#!/bin/sh\n'
> +		preinst += d.getVar('useradd_preinst', True)


This looks like we're adding the contents of the useradd_preinst
function (changed from shell to python) to a script headed with
"#!/bin/sh"? Python script with a /bin/sh header isn't a good idea.

We can't really depend on python being on the target device to add users
in the postinstall script either.

So in summary, this patch needs a lot more thought and hasn't been well
tested.

python functions should also be 4 space indented.

Cheers,

Richard





