Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E55497F32F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 10:20:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2019 03:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; d="scan'208";a="211648109"
Received: from apalani1-mobl1.amr.corp.intel.com (HELO linux.fritz.box)
	([10.249.71.180])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2019 03:20:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 02 Sep 2019 22:20:19 +1200
Message-ID: <2938371.f3R3kiVdeO@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <20190829204302.28348-1-pkj@axis.com>
References: <20190829204302.28348-1-pkj@axis.com>
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH] devtool: Avoid failure for recipes with S == WORKDIR and no local files
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
X-List-Received-Date: Mon, 02 Sep 2019 10:20:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 30 August 2019 8:43:02 AM NZST Peter Kjellerstedt wrote:
> When extracting the sources for a recipe that has S == WORKDIR and no
> local files in the SRC_URI (which, e.g., can happen for a recipe with
> a URI that has the unpack=false attribute), the extraction fails with
> the following backtrace:
> 
>   Traceback (most recent call last):
>     File ".../scripts/devtool", line 344, in <module>
>       ret = main()
>     File ".../scripts/devtool", line 331, in main
>       ret = args.func(args, config, basepath, workspace)
>     File ".../poky/scripts/lib/devtool/standard.py", line 762, in
>     modify
>       initial_rev, _ = _extract_source(srctree, args.keep_temp,
>       args.branch, False, config, basepath, workspace,
>       args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
>     File ".../poky/scripts/lib/devtool/standard.py", line 647, in
>     _extract_source
>       bb.process.run('git %s commit -a -m "Committing local file
>       symlinks\n\n%s"' % (' '.join(useroptions),
>       oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
>     File ".../poky/bitbake/lib/bb/process.py", line 178, in run
>       raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
>   bb.process.ExecutionError: Execution of 'git commit -a -m
>   "Committing local file symlinks
> 
>   %% ignore"' failed with exit code 1:
>   On branch devtool
>   nothing to commit, working tree clean
> 
> This is because no files were found in the oe-local-files directory
> and consequently no symbolic links were added using `git add`, but the
> `git commit` command was still executed.

Looks good to me - all oe-selftest tests pass as well. (Looks like maybe we 
are missing a test though, since this code has been in place for a while.)

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>


-- 

Paul Eggleton
Intel Open Source Technology Centre



