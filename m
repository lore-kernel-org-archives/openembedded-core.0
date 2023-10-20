Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A944DC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 22:59:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.68034.1697842736122138067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 15:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=naqRQA1O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD5A40005;
	Fri, 20 Oct 2023 22:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697842734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uwwb5M3b6I98tNyQkWcKOoWQjl2CLsUgIdZsbtKqJVo=;
	b=naqRQA1ONYAiTfMdlcV/jslBju041R2quVJ05N2Qwnpz04QewtLfsQyw8SP9c/nfFiVKdy
	SfNv9iXr2a8KUKrcLp38sL3BmFW9IGcJrBCzagbGiBhUVYY1O10b8iJNMH9m9f1JFam7nY
	VZ1hOk7AljxUbMc1bg0LfomtyUwI8CsOmmPStacLC1ZGzrOZySLNMCzobAPaIMK1OHmlMb
	2JYjQMEtWuyllk1rAB9cAiNIKISi8IAp+69wqhCuQAaevwGkgEXme8vN1OrbrkWos0PKPV
	lKJ/ChM0CW1yhiOLePzk4lzG8nic64C9eBv05VTCdtael1SYNZw+fF1YgefOUw==
Date: Sat, 21 Oct 2023 00:58:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] selftest/sstatetests: add a test for CDN
 sstate cache
Message-ID: <20231020225853ada76b3a@mail.local>
References: <20231020171232.3072396-1-alex@linutronix.de>
 <20231020171232.3072396-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020171232.3072396-2-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 22:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189581

Hello Alex,

This doesn't apply cleanly, it seems the context is from another series.

On 20/10/2023 19:12:32+0200, Alexander Kanavin wrote:
> Specifically, the test checks that everything needed for building
> standard oe-core images for x86_64 and arm64 is available from
> the cache (with minor exceptions). Going forward, a complete
> world check could be enabled and additional configurations,
> but that requires improvements to performance of hash equivalence
> server in particular.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/selftest/cases/sstatetests.py | 47 +++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index 6ef339897bf..e392d6a1a63 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -14,6 +14,7 @@ import re
>  
>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
>  from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.core.decorator import OETestTag
>  
>  import oe
>  import bb.siggen
> @@ -879,3 +880,49 @@ expected_sametmp_output, expected_difftmp_output)
>  INHERIT += "base-do-configure-modified"
>  """,
>  expected_sametmp_output, expected_difftmp_output)
> +
> +@OETestTag("yocto-mirrors")
> +class SStateMirrors(SStateBase):
> +    def check_bb_output(self, output, exceptions):
> +        in_tasks = False
> +        missing_objects = []
> +        for l in output.splitlines():
> +            if "The differences between the current build and any cached tasks start at the following tasks" in l:
> +                in_tasks = True
> +                continue
> +            if "Writing task signature files" in l:
> +                in_tasks = False
> +                continue
> +            if in_tasks:
> +                recipe_task = l.split("/")[-1]
> +                recipe, task = recipe_task.split(":")
> +                for e in exceptions:
> +                    if e[0] in recipe and task == e[1]:
> +                        break
> +                else:
> +                    missing_objects.append(recipe_task)
> +        self.assertTrue(len(missing_objects) == 0, "Missing objects in the cache:\n{}".format("\n".join(missing_objects)))
> +
> +
> +    def run_test_cdn_mirror(self, machine, targets, exceptions):
> +        exceptions = exceptions + [[t, "do_deploy_source_date_epoch"] for t in targets.split()]
> +        exceptions = exceptions + [[t, "do_image_qa"] for t in targets.split()]
> +        self.config_sstate(True)
> +        self.append_config("""
> +MACHINE = "{}"
> +BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
> +SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
> +""".format(machine))
> +        result = bitbake("-S printdiff {}".format(targets))
> +        self.check_bb_output(result.output, exceptions)
> +
> +    def test_cdn_mirror_qemux86_64(self):
> +        # Example:
> +        # exceptions = [ ["packagegroup-core-sdk","do_package"] ]
> +        exceptions = []
> +        self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-weston core-image-sato-sdk", exceptions)
> +
> +    def test_cdn_mirror_qemuarm64(self):
> +        exceptions = []
> +        # core-image-weston isn't produced for arm64 currently
> +        self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189575): https://lists.openembedded.org/g/openembedded-core/message/189575
> Mute This Topic: https://lists.openembedded.org/mt/102085736/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

