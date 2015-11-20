Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A18B36010D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:33:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 19 Nov 2015 18:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,320,1444719600"; d="scan'208";a="824654182"
Received: from ywong15-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.114])
	by orsmga001.jf.intel.com with ESMTP; 19 Nov 2015 18:33:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Fri, 20 Nov 2015 15:33:48 +1300
Message-ID: <5425651.UQKFrONjKU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.12-101.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <dd8ab12d6d53a748e6fdb28a374018c70ed9a605.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
	<dd8ab12d6d53a748e6fdb28a374018c70ed9a605.1447942163.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 3/6] license.bbclass: Added get_boot_dependencies function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2015 02:33:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 November 2015 14:25:16 mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This function gets the dependencies from the classes that
> create a boot image, this is required because sometimes
> the bootloader dependecy is in these classes. The current
> classes covered are bootimg and bootdirectdisk because
> these are the only clases that add dependencies.
> 
> [YOCTO #6772]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 62222f2..afcc708 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -141,6 +141,42 @@ def write_license_files(d, license_manifest, pkg_dic):
>                          os.link(pkg_license, pkg_rootfs_license)
> 
> 
> +def get_boot_dependencies(d):
> +    """
> +    Return the dependencies from boot tasks
> +    """
> +
> +    depends = ""
> +    boot_depends_string = ""
> +    taskdepdata = d.getVar("BB_TASKDEPDATA", True)
> +    # Only bootimg and bootdirectdisk include the depends flag
> +    boot_tasks = ["do_bootimg", "do_bootdirectdisk",]
> +
> +    for task in boot_tasks:
> +        boot_depends_string = "%s %s" % (boot_depends_string,
> +                d.getVarFlag(task, "depends", True) or "")
> +    boot_depends = [dep.split(":")[0] for dep
> +                in boot_depends_string.split()
> +                if not dep.split(":")[0].endswith("-native")]
> +    for dep in boot_depends:
> +        info_file = os.path.join(d.getVar("LICENSE_DIRECTORY", True),
> +                dep, "recipeinfo")
> +        # If the recipe and dependency name is the same
> +        if os.path.exists(info_file):
> +            depends = "%s %s" % (depends, dep)
> +        # We need to search for the provider of the dependency
> +        else:
> +            for taskdep in taskdepdata.itervalues():
> +                # The fifth field contains what the task provides
> +                if dep in taskdep[4]:
> +                    info_file = os.path.join(
> +                            d.getVar("LICENSE_DIRECTORY", True),
> +                            taskdep[0], "recipeinfo")
> +                    if os.path.exists(info_file):
> +                        depends = "%s %s" % (depends, taskdep[0])
> +                        break
> +    return depends

Where a function returns a list of items it should return an actual list 
rather than a space-separated string; this gives the caller a little more 
flexibility on how it processes the returned list. (Obviously here the list is 
going to be written out immediately as a space-separated string, but that's as 
easy as ' '.join(listname) in the calling function.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

