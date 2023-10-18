Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC41CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 18:41:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1146.1697654490997209464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 11:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nsBgo15r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59CFA1C0003;
	Wed, 18 Oct 2023 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697654489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdsohTvZV0XufJuezdXTtwUIL/fnhnB0I3tVc2TrYnU=;
	b=nsBgo15rc3xZ2sTARY/fYEi7HF0tr4fMj4RjlF2Ns4HCVkTSvGRfu/aU9y0d6ByOiBek7x
	eHhsHYcO0+JePGwX8ngNq/R/gt6xQaGrMz14hHIQTambBneTmnm22cF8fcbHOssPYdVTXM
	c3Be4xC7nThjgu2ReVFWcmDXSeUA2PdLsvojDWtyqjuMyNdj5XiTL/xaHVW58ox7VvIfUz
	z2uQUWUrjjC2sNZMezgatfpekuT8+jDBdEFFiMp0VUDcVcWxncH5yHMyAni/a6zxFm5UHo
	JirtRUOc3q6k/86RIsUFK5hiC6E0UkHJIKVrWEtME8OOkt/wxaqBsiCEI6Mrfg==
Date: Wed, 18 Oct 2023 20:41:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: chris.laplante@agilent.com
Cc: openembedded-core@lists.openembedded.org, jon.richardson@generac.com,
	bruce.ashfield@gmail.com
Subject: Re: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Message-ID: <202310181841287c53633a@mail.local>
References: <20231012202535.2902235-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012202535.2902235-1-chris.laplante@agilent.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 18:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189418

Hello,

The series causes:

2023-10-17 23:07:15,509 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.test_devtool_modify_kernel_overrides (subunit.RemotedTestCase)
2023-10-17 23:07:15,675 - oe-selftest - INFO -  ... FAIL
Stderr:
2023-10-17 22:28:35,773 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2667546/conf/local.conf
2023-10-17 22:28:35,773 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-10-17 23:07:15,680 - oe-selftest - INFO - 7: 10/32 116/544 (1008.52s) (0 failed) (devtool.DevtoolUpgradeTests.test_devtool_modify_kernel_overrides)
2023-10-17 23:07:15,681 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/devtool.py", line 2236, in test_devtool_modify_kernel_overrides
    self.assertSetEqual(set(tags), {"devtool-base", "devtool-patched"})
  File "/usr/lib64/python3.9/unittest/case.py", line 1097, in assertSetEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
    raise self.failureException(msg)
AssertionError: Items in the second set but not the first:
'devtool-base'

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5927/steps/14/logs/stdio

On 12/10/2023 16:25:33-0400, Chris Laplante via lists.openembedded.org wrote:
> From: Chris Laplante <chris.laplante@agilent.com>
> 
> Fixes a couple of different issues that all conspired to break 'devtool
> modify' for many use cases with kernel-yocto recipes.
> 
> To explain, we need to consider the basic flow of how 'devtool modify'
> works for a recipe using kernel-yocto.bbclass:
> 
>      ┌──────────────────┐
>      │do_kernel_checkout│
>      ├──────────────────┘
>      │ Sets up ${S}
>      │ devtool_post_unpack: sets up 'devtool' branch
>      ▼
>      ┌────────────────────┐
>      │do_validate_branches│
>      ├────────────────────┘
>      │ Checks out the machine branch (derived from ${KBRANCH}) and performs validation
>      ▼
>      ┌──────────────────┐
>      │do_kernel_metadata│
>      ├──────────────────┘
>      │ Generates the config and patch series.
>      │
>      ▼
>      ┌────────┐
>      │do_patch│
>      └────────┘
>        Applies patches from patch series.
> 
> The first issue becomes clear when visualizing the flow above. The
> 'devtool' branch is checked out during 'do_kernel_checkout', but then
> 'do_validate_branches' stomps on it by checking out its machine branch.
> So fix (1) is to add a postfunc to 'do_validate_branches' to checkout
> the 'devtool' branch again.
> 
> Next, we need to look at the flow and consider how things work when
> SRC_URI override branches are involved.
> 
> Consider:
> 
>     SRC_URI:append:fake-machine = " file://0001-my-patch.patch"
>     SRC_URI:append:fake-machine-2 = " file://0001-my-patch.patch"
> 
> Assuming neither overrides are active, we'd expect a 'devtool' branch
> that just points to the initial rev, then
> 'devtool-override-fake-machine' and 'devtool-override-fake-machine-2'
> branches that each point to the same commit for 0001-my-patch.
> 
> Setting aside the matter of how the override branch set is determined,
> the flow looks like this:
> 
>      ┌──────────────────┐
>      │do_kernel_checkout│
>      ├──────────────────┘
>      │ Sets up ${S}
>      │ devtool_post_unpack: sets up 'devtool' branch
>      ▼
>      ┌────────────────────┐
>      │do_validate_branches│
>      ├────────────────────┘
>      │ Checks out the machine branch (derived from ${KBRANCH} and performs validation
>      ▼
>      ┌──────────────────┐
>      │do_kernel_metadata│
>      ├──────────────────┘
>      │ Generates the config and patch series.
>      │
>      ▼
>      ┌────────┐
>      │do_patch│
>      └────────┘
>        Applies patches from patch series.
>        devtool_post_patch:
>                       ┌─► for each extra override... ──┐
>                       │                                ▼
>                       │                   create devtool-override- branch
>                       │                                │
>                       │                                ▼
>                       │                   set OVERRIDES/FILESOVERRIDES
>                       │                                │
>                       │                            ┌───▼────┐
>                       │                            │do_patch│
>                       │                            └───┬────┘
>                       │                                │
>                       └────────────────────────────────┘
> 
> In the loop, we set OVERRIDES & FILESOVERRIDES such that
> SRC_URI contains the correct patches for each override. But
> when we call 'do_patch', it is still using the patch series file that
> was generated during the call to 'do_kernel_metadata'. So the correct
> patches are not applied.
> 
> The solution to this issue is to insert a call to 'do_kernel_metadata'
> in between setting OVERRIDES & FILESOVERRIDES and the call to
> 'do_patch'. We do need to slightly tweak 'do_kernel_metadata' to be able
> to clear out the previous 'fence post' files, otherwise in the example
> above, the 0001-my-patch.patch would only be applied to the first
> override branch that is processed.
> 
> [YOCTO #14723]
> 
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass |  4 ++++
>  meta/classes/devtool-source.bbclass      | 22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
> index 4ac977b122..a5fb6e42f3 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -332,6 +332,10 @@ do_patch() {
>  		if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
>  		    kgit_extra_args="--commit-sha author"
>  		fi
> +		if [ "${_DEVTOOL_RUNNING_DO_KERNEL_METADATA}" = "1" ]; then
> +		    # see devtool-source.bbclass for explanation
> +		    kgit-s2q --clean
> +		fi
>  		kgit-s2q --gen -v $kgit_extra_args --patches .kernel-meta/
>  		if [ $? -ne 0 ]; then
>  			bberror "Could not apply patches for ${KMACHINE}."
> diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
> index a02b1e9b0e..b037c5612b 100644
> --- a/meta/classes/devtool-source.bbclass
> +++ b/meta/classes/devtool-source.bbclass
> @@ -57,6 +57,7 @@ python() {
>      if is_kernel_yocto:
>          unpacktask = 'do_kernel_checkout'
>          d.appendVarFlag('do_configure', 'postfuncs', ' devtool_post_configure')
> +        d.appendVarFlag('do_validate_branches', 'postfuncs', ' devtool_post_validate_branches')
>      else:
>          unpacktask = 'do_unpack'
>      d.appendVarFlag(unpacktask, 'postfuncs', ' devtool_post_unpack')
> @@ -187,6 +188,16 @@ python devtool_post_patch() {
>          except bb.process.ExecutionError:
>              pass
>  
> +    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
> +    def kernel_pre_patch(localdata):
> +        if is_kernel_yocto:
> +            # Need to run do_kernel_metadata first, since it is what generates the patch series that is applied
> +            # by the do_patch task. Also, we set a variable to tell do_kernel_metadata that it needs to cleanup
> +            # the kgit-s2q.last fence post files first. Otherwise if you have two override branches that apply the
> +            # same patch, it will only get applied for the first branch.
> +            localdata.setVar('_DEVTOOL_RUNNING_DO_KERNEL_METADATA', '1')
> +            bb.build.exec_func('do_kernel_metadata', localdata)
> +
>      extra_overrides = d.getVar('DEVTOOL_EXTRA_OVERRIDES')
>      if extra_overrides:
>          extra_overrides = set(extra_overrides.split(':'))
> @@ -206,6 +217,7 @@ python devtool_post_patch() {
>              localdata = bb.data.createCopy(d)
>              localdata.setVar('OVERRIDES', ':'.join(no_overrides))
>              localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides))
> +            kernel_pre_patch(localdata)
>              bb.build.exec_func('do_patch', localdata)
>              rm_patches()
>              # Now we need to reconcile the dev branch with the no-overrides one
> @@ -225,6 +237,7 @@ python devtool_post_patch() {
>                  # Run do_patch function with the override applied
>                  localdata.setVar('OVERRIDES', ':'.join(no_overrides + [override]))
>                  localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides + [override]))
> +                kernel_pre_patch(localdata)
>                  bb.build.exec_func('do_patch', localdata)
>                  rm_patches()
>                  # Now we need to reconcile the new branch with the no-overrides one
> @@ -239,3 +252,12 @@ python devtool_post_configure() {
>      tempdir = d.getVar('DEVTOOL_TEMPDIR')
>      shutil.copy2(os.path.join(d.getVar('B'), '.config'), tempdir)
>  }
> +
> +python devtool_post_validate_branches() {
> +    # do_validate_branches took us off of the 'devtool' branch, so re-checkout the branch
> +    devbranch = d.getVar('DEVTOOL_DEVBRANCH')
> +    tempdir = d.getVar('DEVTOOL_TEMPDIR')
> +    with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
> +        srcsubdir = f.read()
> +    bb.process.run(f'git checkout {devbranch}', cwd=srcsubdir)
> +}
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189023): https://lists.openembedded.org/g/openembedded-core/message/189023
> Mute This Topic: https://lists.openembedded.org/mt/101926734/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

