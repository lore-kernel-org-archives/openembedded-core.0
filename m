Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC39C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 09:38:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5363.1665740310705335127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 02:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q1aV8qFV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FE0D1BF20C;
	Fri, 14 Oct 2022 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665740308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JmIaaF+uT32MwaeaB9rlHTiOFbi9fr2AOWX6cSU/njw=;
	b=Q1aV8qFVn0Asehahf47H2OKAqS+pTc7+6dU5m80/8y8RnlE/dM9cwl5GCyUnVVH6vsXdJI
	RgJe76w7DR15p9AgBgxBOyGlSTtdkxVg5jwMNNPA78deM1ZZB5uI8DR59vZXvkoR7xF310
	jhDuImySQ3UDJuvaXjuTHb1A09sHv9JMzu+gbgd3w5bEwp8OWezK/pFptfooRuib4d0wii
	7+s4XukkqjlE1OdiL4qsKnV2Bnxc63D6qcJsuFOAHTno5hdZuzQZtInz+fqojr4kTgyU94
	2JwCmMCkqN0Wk7pG4Uo7eFr8Ta0ROxvoYyETwzVTndbzdpYZKpUkMIgLoj4aDA==
Date: Fri, 14 Oct 2022 11:38:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [OE-core][PATCH 1/2] oeqa/selftest/archiver: Add multiconfig
 test for shared recipes
Message-ID: <Y0kuE1hXPCNkz58P@mail.local>
References: <20221013192530.1761915-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013192530.1761915-1-jose.quaresma@foundries.io>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 09:38:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171730

Hello Jose,

This fails on the AB:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4236/steps/15/logs/stdio

2022-10-13 21:04:28,387 - oe-selftest - INFO - archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch (subunit.RemotedTestCase)
2022-10-13 21:04:28,388 - oe-selftest - INFO -  ... FAIL
2022-10-13 21:04:28,388 - oe-selftest - INFO - 0: 15/57 149/504 (49.12s) (archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch)
2022-10-13 21:04:28,388 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/archiver.py", line 151, in test_archiver_multiconfig_shared_unpack_and_patch
    self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the recipe "%s" has diferent signatures for each machine in multiconfig' % (task, pn))
  File "/usr/lib64/python3.6/unittest/case.py", line 693, in assertFalse
    raise self.failureException(msg)
AssertionError: -1 is not false : The task "do_unpack_and_patch" of the recipe "gcc-source-12.2.0" has diferent signatures for each machine in multiconfig

On 13/10/2022 19:25:29+0000, Jose Quaresma wrote:
> Test that the shared recipes in original mode with diff enabled works in multiconfig,
> otherwise it will not build when using the same TMP dir.
> 
> The test can be run with:
> 
> oe-selftest -r archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch
> 
> | oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_patch (archiver.Archiver)
> | oe-selftest - INFO -  ... ok
> | oe-selftest - INFO - ----------------------------------------------------------------------
> | oe-selftest - INFO - Ran 1 test in 199.710s
> | oe-selftest - INFO - OK
> | oe-selftest - INFO - RESULTS:
> | oe-selftest - INFO - RESULTS - archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch: PASSED (192.24s)
> | oe-selftest - INFO - SUMMARY:
> | oe-selftest - INFO - oe-selftest () - Ran 1 test in 199.711s
> | oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/lib/oeqa/selftest/cases/archiver.py | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
> index ffdea832be..1d4985dacf 100644
> --- a/meta/lib/oeqa/selftest/cases/archiver.py
> +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> @@ -6,6 +6,7 @@
>  
>  import os
>  import glob
> +import re
>  from oeqa.utils.commands import bitbake, get_bb_vars
>  from oeqa.selftest.case import OESelftestTestCase
>  
> @@ -119,7 +120,35 @@ class Archiver(OESelftestTestCase):
>          excluded_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[1]))
>          self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
>  
> +    def test_archiver_multiconfig_shared_unpack_and_patch(self):
> +        """
> +        Test that shared recipes in original mode with diff enabled works in multiconfig,
> +        otherwise it will not build when using the same TMP dir.
> +        """
> +
> +        features = 'BBMULTICONFIG = "mc1 mc2"\n'
> +        features += 'INHERIT += "archiver"\n'
> +        features += 'ARCHIVER_MODE[src] = "original"\n'
> +        features += 'ARCHIVER_MODE[diff] = "1"\n'
> +        self.write_config(features)
> +
> +        # We can use any machine in multiconfig as long as they are different
> +        self.write_config('MACHINE = "qemuarm"\n', 'mc1')
> +        self.write_config('MACHINE = "qemux86"\n', 'mc2')
> +
> +        task = 'do_unpack_and_patch'
> +        # Use gcc-source as it is a shared recipe (appends the pv to the pn)
> +        pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
> +
> +        # Generate the tasks signatures
> +        bitbake('mc:mc1:%s mc:mc2:%s --runonly=%s --dump-signatures=none' % (pn, pn, task))
>  
> +        # Check the tasks signatures
> +        # To be machine agnostic the tasks needs to generate the same signature for each machine
> +        locked_sigs = open("%s/locked-sigs.inc" % self.builddir).read()
> +        task_sigs = re.findall(r"%s:%s:.*" % (pn, task), locked_sigs)
> +        uniq_sigs = set(task_sigs)
> +        self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the recipe "%s" has diferent signatures for each machine in multiconfig' % (task, pn))
>  
>      def test_archiver_srpm_mode(self):
>          """
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171719): https://lists.openembedded.org/g/openembedded-core/message/171719
> Mute This Topic: https://lists.openembedded.org/mt/94312275/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

