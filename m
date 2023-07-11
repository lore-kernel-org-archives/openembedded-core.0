Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7D8EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 10:57:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.4826.1689073051623449021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 03:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aemxttfq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A4171C0007;
	Tue, 11 Jul 2023 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689073049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQ1iJ7jpF81+GnPnsFGEStbxXrvH+cav1SRjHYwigkU=;
	b=aemxttfqxqzPREE71/Oximvrww0liQ8OuneMsx3Va9WL7tZZ+ZT3iV6IoBiEgQaT1dYK/8
	8w1aEDXy0sy5A4cyhQi2hzFTwstwWv+2Wm3g6W8RMOn1BZi+J3jXTyFWIlHZEHYzzEAEkm
	ab8GHfJY11hysCyU47sZ2peCGt0R4MNAdT45RyLLPSV8ZFE32+7atpgMrtFJb96g/FyDHz
	WgIcseBLzTIPrirPWUy+n5iNqujH7JOaLj6npSVMfMmapEbZY4e63c98jNAg0ogqJVBwLb
	jWEwJxMv3jtmBVcijPriJsDJb3OAMGAXs/B8cVKBDg+h0Y+Lk99mbv9v5IdRFg==
Date: Tue, 11 Jul 2023 12:57:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ovidiu.panait@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 5/5] mdadm: re-add mdadm-ptest to PTESTS_SLOW
Message-ID: <202307111057296bb6a610@mail.local>
References: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
 <20230704073919.1593400-5-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704073919.1593400-5-ovidiu.panait@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 10:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184126

Hello,

I opened https://bugzilla.yoctoproject.org/show_bug.cgi?id=15159 aswe
had an intermittent failure, can you have a look at what caused it?

On 04/07/2023 10:39:19+0300, Ovidiu Panait via lists.openembedded.org wrote:
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
> 
> The ptest problems reported in e21021dc00ec ("mdadm: drop from PTESTS_SLOW")
> should now be fixed, so mdadm can be added back to PTESTS_SLOW (a qemux86-64
> test run takes about ~12 minutes to execute with kvm).
> 
> root@qemux86-64:~# ptest-runner mdadm
> START: ptest-runner
> 2023-06-30T08:25
> BEGIN: /usr/lib/mdadm/ptest
> PASS: /usr/lib/mdadm/ptest/tests/00linear
> PASS: /usr/lib/mdadm/ptest/tests/00multipath
> ...
> PASS: /usr/lib/mdadm/ptest/tests/19repair-does-not-destroy
> PASS: /usr/lib/mdadm/ptest/tests/20raid5journal
> PASS: /usr/lib/mdadm/ptest/tests/21raid5cache
> DURATION: 723
> END: /usr/lib/mdadm/ptest
> 2023-06-30T09:16
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> 
> For the testcases to run correctly, there must be enough rootfs space to create
> 13 loop devices. Similar to strace and lttng-tools, add a new
> IMAGE_ROOTFS_EXTRA_SPACE entry for mdadm-ptest.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 3 +--
>  meta/recipes-core/images/core-image-ptest.bb    | 1 +
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index da9153b998..6250cf081e 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -99,6 +99,7 @@ PTESTS_SLOW = "\
>      libgcrypt \
>      libmodule-build-perl \
>      lttng-tools \
> +    mdadm \
>      openssh \
>      openssl \
>      parted \
> @@ -122,7 +123,6 @@ PTESTS_PROBLEMS:append:x86 = " valgrind"
>  #    rt-tests \ # Needs to be checked whether it runs at all
>  #    bash \ # Test outcomes are non-deterministic by design
>  #    ifupdown \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
> -#    mdadm \ # Tests rely on non-deterministic sleep() amounts
>  #    libinput \ # Tests need an unloaded system to be reliable
>  #    libpam \ # Needs pam DISTRO_FEATURE
>  #    numactl \ # qemu not (yet) configured for numa; all tests are skipped
> @@ -134,7 +134,6 @@ PTESTS_PROBLEMS = "\
>      rt-tests \
>      bash \
>      ifupdown \
> -    mdadm \
>      libinput \
>      libpam \
>      libseccomp \
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> index 90c26641ba..ddc56c8f9f 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -19,6 +19,7 @@ BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()]
>  # strace-ptest in particular needs more than 500MB
>  IMAGE_OVERHEAD_FACTOR = "1.0"
>  IMAGE_ROOTFS_EXTRA_SPACE = "324288"
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
>  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
>  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>  
> -- 
> 2.39.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183817): https://lists.openembedded.org/g/openembedded-core/message/183817
> Mute This Topic: https://lists.openembedded.org/mt/99942490/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

