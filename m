Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C129265CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 10:29:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 10 Nov 2015 02:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="597469302"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2015 02:28:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mariano.lopez@linux.intel.com
Date: Tue, 10 Nov 2015 10:28:57 +0000
Message-ID: <5525899.qQeO2PZXPI@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <94f00319ebc710b27356de8c8ce8b7f48f1ad2c8.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
	<94f00319ebc710b27356de8c8ce8b7f48f1ad2c8.1447077439.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 2/6] license.bbclass: Added get_boot_dependencies function
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
X-List-Received-Date: Tue, 10 Nov 2015 10:29:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mariano,

On Monday 09 November 2015 14:04:39 mariano.lopez@linux.intel.com wrote:
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
>  meta/classes/license.bbclass | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 98f1733..d1bfe61 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -49,6 +49,37 @@ python license_create_manifest() {
>      write_license_files(d, rootfs_license_manifest, pkg_dic)
>  }
> 
> +def get_boot_dependencies(d):
> +    """ Return the dependencies from boot tasks """
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
> +        pkgs_file = os.path.join(d.getVar('PKGDATA_DIR', True), dep)
> +        # If the package and dependency name is the same
> +        if os.path.exists(pkgs_file):
> +            depends = "%s %s" % (depends, dep)
> +        # We need to search for the provider of the dependency
> +        else:
> +            for taskdep in taskdepdata.itervalues():
> +                # The fifth field contains what the task provides
> +                if dep in taskdep[4]:
> +                    pkgs_file = os.path.join(d.getVar('PKGDATA_DIR', True),
> taskdep[0]) 
> +                    if os.path.isfile(pkgs_file):
> +                        depends = "%s %s" % (depends, taskdep[0])
> +                        break

Can you explain what you're getting out of looking into PKGDATA_DIR here? I'm 
not sure this is correct.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

