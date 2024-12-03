Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557A3E6C609
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 05:52:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.13007.1733205137984298051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 21:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k1CxpfEn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB13AE0004;
	Tue,  3 Dec 2024 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733205136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ognP2h7anjSw+mj03oJNHe7e5MVcgaNHSgxj4RnaXQ=;
	b=k1CxpfEnJaBYq3zigA+hrwsnc+Cmw5XqkYRqOhC0Cb5WQRAJZ0u44r9L/foOgFB3Tm15KT
	uVHDHHv1WwqYgkyqs+144ZQrdAWwcx2bDD4eJ8S9DKwivlas5Bu4H2nYJmDwftozLcmrlU
	viBU04rsbIfqFgUjYNIqycv4xod6QkzjEmmaowDEDEKKdGB0LDVH1S387lLRgI1++eOfoP
	gr+O/gm0d55J5rrqmFjXWu2CGKSV+9syIEjfZvU+5C93DtsjDHpcoTz1wro06TLfboQ/hk
	hOg65PhMWDiu8FHT2qQoyhOR+Gy2AFEnQxoCZhXvmF2KKrgpFzt26CUGXsMYow==
Date: Tue, 3 Dec 2024 06:52:14 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: mail2szahir@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master][PATCH V2] alsa-lib: enabling ptest for
 alsa-lib component
Message-ID: <Z06cjlMY0KmlWHJW@bootlin-mathieu>
Mail-Followup-To: mail2szahir@gmail.com,
	openembedded-core@lists.openembedded.org
References: <20241115124115.14318-1-mail2szahir@gmail.com>
 <2202.1733157394660911293@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2202.1733157394660911293@lists.openembedded.org>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208181

On Mon, Dec 02, 2024 at 08:36:34AM -0800, aszh07 via lists.openembedded.org wrote:
> Hi Team,
> 
> Could someone review the changes and integrate them into the master branch?
> 
> Please let me know if you need any clarification from our side.
> 
> Thanks!
> Zahir.

Hi Zahir,

Thanks for your patch, it looks like I missed it previously.

I tried to pick it in my branch, but the alsa-lib ptests are failing:

WARNING: core-image-ptest-alsa-lib-1.0-r0 do_testimage: There were failing ptests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
    self.fail(failmsg)
AssertionError: 
Failed ptests:
{'alsa-lib': 'START: ptest-runner\n'
...

https://valkyrie.yoctoproject.org/#/builders/73/builds/504/steps/12/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/61/builds/504/steps/12/logs/stdio

Details of failing tests can be found here:

https://valkyrie.yocto.io/pub/non-release/20241202-101/testresults/qemux86-64-ptest/core-image-ptest-alsa-lib/
https://valkyrie.yocto.io/pub/non-release/20241202-101/testresults/qemuarm64-ptest/core-image-ptest-alsa-lib/

Can you look at this issue, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

