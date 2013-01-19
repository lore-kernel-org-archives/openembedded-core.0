Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwQo9-0007vo-7I
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 06:17:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 21:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,497,1355126400"; d="scan'208";a="245870610"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 21:02:06 -0800
Message-ID: <50FA28CD.3090300@linux.intel.com>
Date: Fri, 18 Jan 2013 21:02:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
	<5cb12f38b2ac74ea118b58888a0c37f63917fbfa.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <5cb12f38b2ac74ea118b58888a0c37f63917fbfa.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] base.bbclass: improve the incompatible license logic a bit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 05:17:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2013 12:22 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> Handle the potential case where the recipe level LICENSE contains an
> incompatible license, but all of its emitted packages are in fact compatible.
> Without this adjustment, it would skip such a recipe.
>

This changed seems to have caused a failure in the non-gplv3 build for 
util-linux, which is the only package I know that sets a package LICENSE 
field:
> NOTE: recipe e2fsprogs-1.42.1-r4: task do_compile: Started
> WARNING: util-linux-lscpu has an incompatible license. Excluding from packaging.
> ERROR: Error executing a python function in /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/util-linux/util-linux_2.22.1.bb:
> AttributeError: 'str' object has no attribute 'remove'
>
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "populate_packages", line 227, in <module>
> ERROR:
> ERROR:   File "populate_packages", line 71, in populate_packages
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0223:                bb.note("%s contains dangling symlink to %s" % (pkg, l))
> ERROR:      0224:        d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
> ERROR:      0225:
> ERROR:      0226:
> ERROR:  *** 0227:populate_packages(d)
> ERROR:      0228:
> ERROR: [From file: 'populate_packages', lineno: 227, function: <module>]
> ERROR:      0067:
> ERROR:      0068:    for pkg in packages.split():
> ERROR:      0069:        if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
> ERROR:      0070:            bb.warn("%s has an incompatible license. Excluding from packaging." % pkg)
> ERROR:  *** 0071:            packages.remove(pkg)
> ERROR:      0072:        else:
> ERROR:      0073:            if pkg in package_list:
> ERROR:      0074:                bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
> ERROR:      0075:            else:
> ERROR: [From file: 'populate_packages', lineno: 71, function: populate_packages]
> ERROR: Function failed: populate_packages
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/util-linux/2.22.1-r3/temp/log.do_package.28036
> NOTE: recipe util-linux-2.22.1-r3: task do_package: Failed


Can you please review this as we are closing m3 on Sunday Midnight.

Thanks
	Sau!


> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/classes/base.bbclass | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 627b943..b427a5e 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -552,9 +552,8 @@ python () {
>                           skipped_pkgs.append(pkg)
>                       else:
>                           unskipped_pkgs.append(pkg)
> -                some_skipped = skipped_pkgs and unskipped_pkgs
>                   all_skipped = skipped_pkgs and not unskipped_pkgs
> -                if some_skipped:
> +                if unskipped_pkgs:
>                       for pkg in skipped_pkgs:
>                           bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
>                           d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
>


