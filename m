Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C35BD232EF
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:28:46 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6161.1767947315811233633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 00:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@g0hl1n.net header.s=key1 header.b=a15g/Xdf;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.189, mailfrom: dev@g0hl1n.net)
Date: Fri, 9 Jan 2026 09:28:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1767947312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTtoBs3lW9Yr66gGKOH7nbi6k7FfdJ6Aac4YWK8AH4Q=;
	b=a15g/XdfQdepBe/nMFxW+P0MSJDPyvAb0vDheSIi4vcvDdIUSj0DqlNtzSIrMVkBh3YjvI
	9drOnrjRP+tS4LMcNDObQL3mMEp/hhTBPqc6WmIjnVr2yKPb6g5m9GMC9gzS+IlobELGAZ
	a2YwXKA2rZBFQyIg+PlLnq4qd/oEQaw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] fitimage: introduce FIT_CONF_STRIP_EXT
Message-ID: <54crojqnzdjngx4djsg2wext6emx7pu2ocfyf6aqxbz4osiocx@fde6yndeqdvo>
References: <20260107092600.73848-1-dev@g0hl1n.net>
 <DFJWLQHKFVV3.3NP73J5UXWC0V@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFJWLQHKFVV3.3NP73J5UXWC0V@bootlin.com>
X-Migadu-Flow: FLOW_OUT
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 08:28:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229095

Hi Mathieu,

thanks for your reply!

On Fri, Jan 09, 2026 at 09:09:04AM +0100, Mathieu Dubois-Briand wrote:
> On Wed Jan 7, 2026 at 10:26 AM CET, Richard Leitner via lists.openembedded.org wrote:
> > Introduce a configuration variable named FIT_CONF_STRIP_EXT which
> > removes the file-type extension from the configuration node name.
> >
> > This feature enables us to give configuration nodes arbritary names
> > (based on the dtb file names). This is in my case needed to ensure
> > consistent configuration names which where previously (walnascar)
> > generated using a fitimage_emit_section_config:append() function.
> >
> > Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> > ---
> 
> Hi Richard,
> 
> Thanks for your patch.
> 
> It looks like this is making some selftest fail:
> 
> 2026-01-08 18:18:47,312 - oe-selftest - INFO - fitimage.FitImagePyTests.test_fitimage_py_conf_extra_mappings_unused_error (subunit.RemotedTestCase)
> 2026-01-08 18:18:47,313 - oe-selftest - INFO -  ... ERROR
> ...
> 2026-01-08 18:18:47,313 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1257, in test_fitimage_py_conf_extra_mappings_unused_error
>     self._test_fitimage_py(bb_vars_overrides)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1203, in _test_fitimage_py
>     root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'], bb_vars.get('FIT_CONF_MAPPINGS'))
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oe/fitimage.py", line 498, in fitimage_emit_section_config
>     default_conf = self.configurations.sub_nodes[0].name
>                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^
> IndexError: list index out of range
> 
> ...
> 2026-01-08 18:18:47,317 - oe-selftest - INFO - fitimage.FitImagePyTests.test_fitimage_py_conf_mappings (subunit.RemotedTestCase)
> 2026-01-08 18:18:47,317 - oe-selftest - INFO -  ... ERROR
> ...
> 2026-01-08 18:18:47,322 - oe-selftest - INFO - fitimage.FitImagePyTests.test_fitimage_py_conf_mappings_unused_error (subunit.RemotedTestCase)
> 2026-01-08 18:18:47,322 - oe-selftest - INFO -  ... ERROR
> ...
> 2026-01-08 18:18:47,327 - oe-selftest - INFO - fitimage.FitImagePyTests.test_fitimage_py_conf_mappings_with_alias (subunit.RemotedTestCase)
> 2026-01-08 18:18:47,327 - oe-selftest - INFO -  ... ERROR
> ...
> 2026-01-08 18:18:47,338 - oe-selftest - INFO - fitimage.FitImagePyTests.test_fitimage_py_default_dtb (subunit.RemotedTestCase)
> 2026-01-08 18:18:47,339 - oe-selftest - INFO -  ... ERROR
> 
> I did not copy all the errors, as they are all similar to the first one.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2989
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2880
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3127
> 
> Can you have a look at these issues?

Oh. Sorry. Sure I will have a look at those and send an updated v2.

> 
> Note, I had merge conflicts on your patch, so maybe my resolution was
> incorrect. If that's the case, can you rebase on master before sending
> the new version?

Sure. I will rebase on master for v2.

Thanks again for your feedback!

regards;rl

> 
> Thanks,
> Mathieu
> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

