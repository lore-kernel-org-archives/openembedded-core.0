Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EA8C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 12:21:00 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.29830.1655468449198871784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 05:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hQI86OZE;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0856424000D;
	Fri, 17 Jun 2022 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655468447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jnlnZsIj8GVfbJKKMz0qlf3tm+hLRrjs/vVejeeek6k=;
	b=hQI86OZE/C77Y9oX+hiqk3mOJ8bZ5k1Oz1IKZoRXNc2tStEjM4jnfBzt40AY7vnVhJh+Kw
	+FHv/uCfxj1vUHvA8m7futgYEC29yl0duu5E2n74Gx6Rjd9iqmCzdt/GahE96uXUcunogg
	28CKT/TjB04m80Ti+PNgjf8zTY0de9UQRbL32ZCacAPKrTYsqrPnanrT0NKA5uYux/iNNG
	j3XU+ewDqHWFe50SrdOn8vim0WwxbjH73pakcNzgKKRXjdg+ZUL5al85JU/NpvP37BZ95O
	c9KvbZz7kk5+asQAqCBYayRoDqk0H80PJg+gFBcc8jhPeUuPKjOTM0NA+u13Ew==
Date: Fri, 17 Jun 2022 14:20:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-exceptiongroup : add recipe
Message-ID: <YqxxnlmLQlSutCFJ@mail.local>
References: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
 <1655447108-20329-2-git-send-email-wangmy@fujitsu.com>
 <16F967959065881B.10812@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16F967959065881B.10812@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 12:21:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167022

On 17/06/2022 14:17:06+0200, Alexandre Belloni via lists.openembedded.org wrote:
> Hello,
> 
> This causes the following error:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3713/steps/15/logs/stdio
> 
> 2022-06-17 08:06:44,127 - oe-selftest - INFO - distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> 2022-06-17 08:06:44,128 - oe-selftest - INFO -  ... FAIL
> 2022-06-17 08:06:44,128 - oe-selftest - INFO - 5: 5/11 58/492 (131.79s) (distrodata.Distrodata.test_maintainers)
> 2022-06-17 08:06:44,128 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/distrodata.py", line 141, in test_maintainers
>     """ + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
>   File "/usr/lib64/python3.6/unittest/case.py", line 687, in fail
>     raise self.failureException(msg)
> AssertionError: 
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> python3-exceptiongroup (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb)
> 

And also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4708/steps/12/logs/stdio

WARNING: Nothing RPROVIDES 'nativesdk-python3-exceptiongroup' (but virtual:nativesdk:/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-python3-exceptiongroup' is unbuildable, removing...

> 
> On 17/06/2022 14:25:08+0800, wangmy wrote:
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../python/python3-exceptiongroup_1.0.0rc8.bb         | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb
> > 
> > diff --git a/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb b/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb
> > new file mode 100644
> > index 0000000000..adf530a6e5
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb
> > @@ -0,0 +1,11 @@
> > +DESCRIPTION = "This is a backport of the BaseExceptionGroup and ExceptionGroup classes from Python 3.11."
> > +HOMEPAGE = "https://pypi.org/project/exceptiongroup"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=d5caa317463c433575efff1d2fe206d7"
> > +
> > +SRC_URI[sha256sum] = "6990c24f06b8d33c8065cfe43e5e8a4bfa384e0358be036af9cc60b6321bd11a"
> > +
> > +#RDEPENDS:${PN} += "python3-profile python3-logging"
> > +
> > +inherit pypi python_setuptools_build_meta
> > -- 
> > 2.25.1
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167021): https://lists.openembedded.org/g/openembedded-core/message/167021
> Mute This Topic: https://lists.openembedded.org/mt/91816507/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

