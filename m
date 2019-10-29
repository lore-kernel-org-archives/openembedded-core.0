Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A75447F879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 22:52:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 15:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; d="scan'208";a="205616632"
Received: from alexwenj-mobl.gar.corp.intel.com (HELO shodan.localnet)
	([10.255.162.206])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 15:52:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Wed, 30 Oct 2019 11:52:12 +1300
Message-ID: <2766841.sOFMSHKMPR@shodan>
Organization: Intel Corporation
In-Reply-To: <3400718.qmR8kntanE@localhost.localdomain>
References: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
	<3400718.qmR8kntanE@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH v4 0/3] Devtool: provide easy means of
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
X-List-Received-Date: Tue, 29 Oct 2019 22:52:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chandana

Having added quite a bit to devtool relating to the kernel, we really ought to extend our oe-selftest tests to cover the new functionality. Would you be able to take care of that?

Thanks
Paul

On Wednesday, 5 June 2019 5:07:55 PM NZDT Paul Eggleton wrote:
> Hi Chandana
> 
> My apologies for the delay in reviewing this - other work got in the way of OE-Core contributions but that should be dealt with now.
> 
> On Thursday, 18 April 2019 10:42:56 AM NZST Sai Hari Chandana Kalluri wrote:
> > This patch series provides support for the user to run menuconfig command in the
> > devtool flow. This would allow the user to modify the current configurations and
> > generate a config fragment to update the recipe using devtool finish. Devtool
> > menuconfig command will work on all packages that contain menuconfig as a task.
> > 
> > 1. The implementation checks if devtool menuconfig command is called for a valid
> > package.
> > 2. It checks for oe-local-files dir within source and creates one if
> > needed, this directory is needed to store the final generated config fragment so
> > that devtool finish can update the recipe.
> > 3. Menuconfig command is called for users to make necessary changes. After
> > saving the changes, diffconfig command is run to generate the fragment.
> > 
> > Currently, when the user runs devtool modify command, it checks out the entire
> > source tree which is a bit of an over head in time and space. This patch series
> > also provides a way to create a copy(hard links) of the kernel source, if
> > present, from work-shared to workspace to be more efficient .
> > 
> > Also, if the kernel source is not present in the staging kernel dir and the user
> > fetches the source tree in workspace using devtool modify, then this patch
> > series creates a copy of source from workspace to work-shared. This is
> > necessary for packages that may use the kernel source.
> 
> Looking over the patches again, we're close but the following need to be corrected:
> 
> 1) The devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_files test in oe-selftest fails:
> 
> ---------------- snip ----------------
> INFO: Adding local source files to srctree...
> Traceback (most recent call last):
>   File "/data/poky/scripts/devtool", line 334, in <module>
>     ret = main()
>   File "/data/poky/scripts/devtool", line 321, in main
>     ret = args.func(args, config, basepath, workspace)
>   File "/data/poky/scripts/lib/devtool/standard.py", line 845, in modify
>     initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
>   File "/data/poky/scripts/lib/devtool/standard.py", line 657, in _extract_source
>     symblink_oelocal_files_srctree(d,srctree)
>   File "/data/poky/scripts/lib/devtool/standard.py", line 485, in symblink_oelocal_files_srctree
>     oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
> NameError: name 'oe' is not defined
> ---------------- snip ----------------
> 
> Probably just a missing import.
> 
> 2) Please change "symblink" to "symlink"
> 
> 3) Indentation is very inconsistent in the added code. Please use four spaces everywhere.
> 
> I would also like to see oe-selftest tests covering this functionality, but I won't require them to ack these patches (especially given the delays on my part).
> 
> Thanks
> Paul
> 
> 


-- 

Paul Eggleton
Intel System Software Products



