Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D79AC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 13:48:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.9551.1634824084125985319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 06:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 19309C0015;
	Thu, 21 Oct 2021 13:48:00 +0000 (UTC)
Date: Thu, 21 Oct 2021 15:48:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] strace: handle loaded test systems
Message-ID: <YXFvkNkKhWFhFzTz@piout.net>
References: <20211019192614.153903-1-ross.burton@arm.com>
 <20211019192614.153903-2-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019192614.153903-2-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 13:48:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157281

Hi Ross,

On 19/10/2021 20:26:13+0100, Ross Burton wrote:
> If the host is loaded when running the tests there is a good chance
> that strace-T.test will fail, as it does a sleep(1) and checks that
> the nanosleep() call lasted for 0.9-1.1 seconds.
> 
> Relax the test so that the test passes if the call takes less than two
> seconds.
> 
> [ YOCTO #14596 ]
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/strace/strace/ptest-sleep.patch | 7 +++++++
>  meta/recipes-devtools/strace/strace_5.14.bb           | 1 +
>  2 files changed, 8 insertions(+)
>  create mode 100644 meta/recipes-devtools/strace/strace/ptest-sleep.patch
> 
> diff --git a/meta/recipes-devtools/strace/strace/ptest-sleep.patch b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
> new file mode 100644
> index 0000000000..5629dec319
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
> @@ -0,0 +1,7 @@
> +diff --git a/tests/strace-T.expected b/tests/strace-T.expected
> +index 1ea020465..f78d3e2c8 100644
> +--- a/tests/strace-T.expected
> ++++ b/tests/strace-T.expected
> +@@ -1 +1 @@
> +-nanosleep\(\{tv_sec=1, tv_nsec=0\}, NULL\) = 0 <(1\.[01]|0\.9)[[:digit:]]{5}>
> ++nanosleep\(\{tv_sec=1, tv_nsec=0\}, NULL\) = 0 <(1\.|0\.9)[[:digit:]]{5}>

Those two builds have the patch and reliably failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2425/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2428/steps/12/logs/stdio

> diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-devtools/strace/strace_5.14.bb
> index a81bda04ba..9ae1367337 100644
> --- a/meta/recipes-devtools/strace/strace_5.14.bb
> +++ b/meta/recipes-devtools/strace/strace_5.14.bb
> @@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
>             file://ptest-spacesave.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
> +           file://ptest-sleep.patch \
>             "
>  SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157202): https://lists.openembedded.org/g/openembedded-core/message/157202
> Mute This Topic: https://lists.openembedded.org/mt/86448553/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

