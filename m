Return-Path: <paul.eggleton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 72BED6080F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:22:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 11 Jan 2016 02:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,552,1444719600"; d="scan'208";a="631560489"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2016 02:22:54 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Jan 2016 23:22:51 +1300
Message-ID: <2774306.O6kas5tnnr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1452277522.7598.140.camel@linuxfoundation.org>
References: <1452277522.7598.140.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] populate_sdk_ext: Change to include siginfo and non sstate task sigs
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
X-List-Received-Date: Mon, 11 Jan 2016 10:22:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 08 Jan 2016 18:25:22 Richard Purdie wrote:
> Right now, the locked task hashes list for the extensible SDK locks
> down only the sstate tasks.
> 
> Whilst aesthetically pleasing, this gives two problems:
> 
> * Half the task are left floating meaning checksum mismatches
>   are a pain to debug
> * The later code which copies relavent data files out the sstate
>   cache can't use any of this data.
> 
> This patch modifies things so all the checksums are listed in the locked
> file. An exclusion of tasks probably makes more sense for the library
> function rather than an allowed list.
> 
> The only sstate task being deliberately excluded here was do_package
> so add in a function to explictly exclude those sstate object files.
> 
> The net result of this that siginfo files for all tasks are included in
> the SDK, which means commands like "bitbake -S printdiff" now function.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass
> b/meta/classes/populate_sdk_ext.bbclass index 317043d..3a65c07 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -171,10 +171,9 @@ python copy_buildsystem () {
>      oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
> 
>      # Filter the locked signatures file to just the sstate tasks we are
> interested in -    allowed_tasks = ['do_populate_lic',
> 'do_populate_sysroot', 'do_packagedata', 'do_package_write_ipk',
> 'do_package_write_rpm', 'do_package_write_deb', 'do_package_qa',
> 'do_deploy'] excluded_targets = d.getVar('SDK_TARGETS', True)
>      lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
> -    oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
> +    oe.copy_buildsystem.prune_lockedsigs([],
>                                           excluded_targets,
>                                           sigfile,
>                                           lockedsigs_pruned)
> @@ -187,6 +186,12 @@ python copy_buildsystem () {
>                                                     d.getVar('SSTATE_DIR',
> True), sstate_out, d, fixedlsbstring) +    # We don't need sstate
> do_package files
> +    for root, dirs, files in os.walk(sstate_out):
> +        for name in files:
> +            if name.endswith("_package.tgz"):
> +                f = os.path.join(root, name)
> +                os.remove(f)
>  }
> 
>  def extsdk_get_buildtools_filename(d):
> diff --git a/meta/lib/oe/copy_buildsystem.py
> b/meta/lib/oe/copy_buildsystem.py index 15af4eb..a5ca3df 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -75,7 +75,7 @@ def generate_locked_sigs(sigfile, d):
>      tasks = ['%s.%s' % (v[2], v[1]) for v in depd.itervalues()]
>      bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
> 
> -def prune_lockedsigs(allowed_tasks, excluded_targets, lockedsigs,
> pruned_output): +def prune_lockedsigs(excluded_tasks, excluded_targets,
> lockedsigs, pruned_output): with open(lockedsigs, 'r') as infile:
>          bb.utils.mkdirhier(os.path.dirname(pruned_output))
>          with open(pruned_output, 'w') as f:
> @@ -84,7 +84,7 @@ def prune_lockedsigs(allowed_tasks, excluded_targets,
> lockedsigs, pruned_output) if invalue:
>                      if line.endswith('\\\n'):
>                          splitval = line.strip().split(':')
> -                        if splitval[1] in allowed_tasks and not splitval[0]
> in excluded_targets: +                        if not splitval[1] in
> excluded_tasks and not splitval[0] in excluded_targets: f.write(line)
>                      else:
>                          f.write(line)

This looks good to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre

