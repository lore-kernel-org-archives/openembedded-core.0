Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 71E1E6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 16:49:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2015 09:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="729253320"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2015 09:49:50 -0700
Message-ID: <5554D22E.8080900@linux.intel.com>
Date: Thu, 14 May 2015 09:49:50 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1431569867.git.Qi.Chen@windriver.com>
	<630a1e0551f0431f8d513f979198ee752653a5e3.1431569867.git.Qi.Chen@windriver.com>
In-Reply-To: <630a1e0551f0431f8d513f979198ee752653a5e3.1431569867.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH V2 1/1] populate_sdk_ext: set noexec flag for some tasks
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
X-List-Received-Date: Thu, 14 May 2015 16:49:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2015 07:19 PM, Chen Qi wrote:
> For the SDK, what we are interested in is the sysroot part. So the
> only useful task is do_populate_sysroot. Other tasks like do_package
> don't need to run. So mark them as 'noexec' for SDK.
>
> This would result in two benefits:
> 1) The size of extensible SDK is larged reduced. For example, extensible
>     SDK for core-image-minimal is reduced from 1.8G to 793M.
> 2) The installation time is reduced as a lot of tasks are not run.
>
> [YOCTO #7590]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index dc2c58e..6c265b8 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -141,8 +141,18 @@ python copy_buildsystem () {
>       sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
>       oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
>
> +    # Mark tasks to be 'noexec' for the SDK as we only need the sysroot part
> +    base_class_path = os.path.join(baseoutpath, core_meta_subdir, 'classes', 'base.bbclass')

Qi, I don't like the idea of modifying the source that is copied into the sdk. 
Also, this will continue to persist if the user ever wants to start generating 
images.

Ideally, we would only modify the behavior while setting up the sdk. And then 
the behavior afterward would remain as when using a regular bitbake workspace.

> +    if os.path.exists(base_class_path):
> +        with open(base_class_path, 'a') as f:
> +            noexec_tasks = ['do_package', 'do_packagedata', 'do_package_qa', 'do_package_write_rpm',
> +                            'do_package_write_ipk', 'do_package_write_deb', 'do_deploy', 'do_populate_lic',
> +                            'do_rootfs']
> +            for t in noexec_tasks:
> +                f.write('%s[noexec] = "1"\n' % t)
> +
>       # Filter the locked signatures file to just the sstate tasks we are interested in
> -    allowed_tasks = ['do_populate_lic', 'do_populate_sysroot', 'do_packagedata', 'do_package_write_ipk', 'do_package_write_rpm', 'do_package_write_deb', 'do_package_qa', 'do_deploy']
> +    allowed_tasks = ['do_populate_sysroot']
>       excluded_targets = d.getVar('SDK_TARGETS', True)
>       lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
>       oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
>


