Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrjr-00058C-Sy
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 20:32:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2012 11:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="144321626"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2012 11:20:06 -0700
Message-ID: <5050D255.9030401@linux.intel.com>
Date: Wed, 12 Sep 2012 11:20:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1347457260-25574-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1347457260-25574-1-git-send-email-mark.asselstine@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: remove unused 'etc' directory
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
X-List-Received-Date: Wed, 12 Sep 2012 18:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I assume this patch is for Denzil?  It seems that the current OE-Core 
master has etc in that list.

Please confirm

Sau!

On 09/12/2012 06:41 AM, Mark Asselstine wrote:
> Along with checks to remove empty modprobe.d and modules-load.d
> directories we can add a similar check and removal of the etc
> directory. This will avoid warnings by the sanity checker.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> There is some concern that removing this directory could cause issues
> if folks are adding to etc in a bbappend and not checking for and
> creating this directory. I don't believe this is an issue as if you
> want to add something to etc it should be done as part of a
> populate_packages_prepend or earlier since there are sanity checks run
> as part of populate_packages, so the removal here is being done at the
> latest possible point in the process (populate_packages_prepend in a
> bbappend will run before the populate_packages_prepend in
> kernel.bbclass).
>
>   meta/classes/kernel.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5e04fda..decf6f5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -468,7 +468,7 @@ python populate_packages_prepend () {
>       # avoid warnings. removedirs only raises an OSError if an empty
>       # directory cannot be removed.
>       dvar = d.getVar('PKGD', True)
> -    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
> +    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc/" % (dvar)]:
>           if len(os.listdir(dir)) == 0:
>               os.rmdir(dir)
>
>


