Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6F0-0000qq-UC
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:49:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2012 08:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="143376128"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Sep 2012 08:37:07 -0700
Message-ID: <504E0922.9040900@linux.intel.com>
Date: Mon, 10 Sep 2012 08:37:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1346781919-20817-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1346781919-20817-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-(base|core-basic): add RREPLACES/RCONFLICTS
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
X-List-Received-Date: Mon, 10 Sep 2012 15:49:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 11:05 AM, Paul Eggleton wrote:
> These are needed to support upgrading from task-* to packagegroup-*
> within existing target images at runtime.
>
> Note: these settings will very likely be moved to a separate inc file
> at some point in the future.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   .../packagegroups/packagegroup-base.bb             |   10 ++++------
>   .../packagegroups/packagegroup-core-basic.bb       |    4 +++-
>   2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 2178308..347a7e1 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
>   LICENSE = "MIT"
> -PR = "r75"
> +PR = "r76"
>
>   inherit packagegroup
>
> @@ -117,12 +117,10 @@ python __anonymous () {
>
>       # For backwards compatibility after rename
>       packages = d.getVar("PACKAGES", True).split()
> -    packages.remove("packagegroup-distro-base")
> -    packages.remove("packagegroup-machine-base")
>       for pkg in packages:
> -        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-base", "task-base"))
> -    d.appendVar("RPROVIDES_packagegroup-distro-base", "task-distro-base")
> -    d.appendVar("RPROVIDES_packagegroup-machine-base", "task-machine-base")
> +        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-", "task-"))
> +        d.appendVar("RREPLACES_%s" % pkg, pkg.replace("packagegroup-", "task-"))
> +        d.appendVar("RCONFLICTS_%s" % pkg, pkg.replace("packagegroup-", "task-"))
>   }
>
>   #
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
> index 30b66c5..d3eeeed 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
> @@ -3,7 +3,7 @@
>   #
>
>   DESCRIPTION = "Create Basic Image Tasks"
> -PR = "r4"
> +PR = "r5"
>   LICENSE = "MIT"
>
>   inherit packagegroup
> @@ -24,6 +24,8 @@ python __anonymous () {
>       packages = d.getVar("PACKAGES", True).split()
>       for pkg in packages:
>           d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
> +        d.appendVar("RREPLACES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
> +        d.appendVar("RCONFLICTS_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
>   }
>
>
>

Merged into OE-Core

Thanks
	Sau!



