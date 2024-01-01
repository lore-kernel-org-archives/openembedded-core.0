Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1EBC4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:00:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4383.1704114034687673323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K6P42eHI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 323F91C0004;
	Mon,  1 Jan 2024 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704114032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XXzChPC24/x4BQ0z+q4YcPkDOPY0dJoaqG1PxVVdnM=;
	b=K6P42eHIDIlx3g5Zfv/4iapSx96K49FlimELFOjzNbUQKJwLRbl0uetAry+Q9VpLhQf4/t
	gxn1/EhiQQuyUbRPOx2xGM2RDwqq3DR58mDGdZrD0UPAgDR2ea1m6ARX0H8FPO5Y69t8Rb
	aIUlf1BNQc9FMpu+MnHIZ/Yl48KM54pRAParjwwgI1p6JjKna0DyZxMJdPhw8d/Q1NKBJd
	4BFsBK6hpdBwbE0lYPQf0VWdoMOsMR+fakQ32W3pgiBS2xheY9cQlxwPXi9BpFrlSukbwZ
	KYGn8h3U6M53+3UuOEypJHYYZV5oLp3GyljSayfj89B40j/7yH4XkBE5zbJbIQ==
Date: Mon, 1 Jan 2024 14:00:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/7] selftest/sstatetests: fix up printdiff
 test to match rework of printdiff logic
Message-ID: <20240101130031da8cf15c@mail.local>
References: <20231218084403.599015-1-alex@linutronix.de>
 <20231218084403.599015-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218084403.599015-2-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193095

Hello,

I've been carrying the series for a while without any issue but got this
yesterday:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6262/steps/14/logs/stdio


On 18/12/2023 09:43:58+0100, Alexander Kanavin wrote:
> Other than the formatting changes, there are two functional ones:
> 
> - use perlcross instead of quilt, as quilt is special in the sense
> of being excluded from task hash calculcations. perlcross is a full
> participant.
> 
> - run the full test (local + sstate) for gcc do_preconfiure change
> as the necessary fix has been implemented
> (sstatesig/find_siginfo: special-case gcc-source when looking in sstate caches)
> 
> Note that when several tasks are found to have changed (as is the case
> when base do_configure is adjusted), find_siginfo() runs
> glob.glob("*/*/*taskname*") against autobuilder sstate cache for each
> of those tasks (six or seven times). This is an expensive operation
> taking several minutes. I left it in for now, but if it's proven too slow
> the test would have to be reduced to checking a specific base recipe
> (e.g. zstd-native) rather than a distant image target.
> 
> [YOCTO #15289]
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../perlcross_%.bbappend}                     |  0
>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 22 +++++++++++--------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>  rename meta-selftest/recipes-test/{quilt-native/quilt-native_%.bbappend => perlcross/perlcross_%.bbappend} (100%)
> 
> diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend b/meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
> similarity index 100%
> rename from meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> rename to meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index f827615ba1b..6af3c8f2178 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -824,14 +824,16 @@ TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
>  
>  
>      # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
> -    def test_image_minimal_vs_quilt(self):
> -        expected_output = ("Task quilt-native:do_install couldn't be used from the cache because:",
> +    def test_image_minimal_vs_perlcross(self):
> +        expected_output = ("Task perlcross-native:do_install couldn't be used from the cache because:",
>  "We need hash",
>  "most recent matching task was")
> -        expected_sametmp_output = expected_output + ("Variable do_install value changed",'+    echo "this changes the task signature"')
> +        expected_sametmp_output = expected_output + (
> +"Variable do_install value changed",
> +'+    echo "this changes the task signature"')
>          expected_difftmp_output = expected_output
>  
> -        self.run_test_printdiff_changerecipe("core-image-minimal", "quilt-native", "-c do_install quilt-native",
> +        self.run_test_printdiff_changerecipe("core-image-minimal", "perlcross", "-c do_install perlcross-native",
>  """
>  do_install:append() {
>      echo "this changes the task signature"
> @@ -846,10 +848,10 @@ expected_sametmp_output, expected_difftmp_output)
>          expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
>  "We need hash",
>  "most recent matching task was")
> -        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
> -        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
> -        #expected_difftmp_output = expected_output
> -        expected_difftmp_output = ()
> +        expected_sametmp_output = expected_output + (
> +"Variable do_preconfigure value changed",
> +'+    print("this changes the task signature")')
> +        expected_difftmp_output = expected_output
>  
>          self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
>  """
> @@ -873,7 +875,9 @@ expected_sametmp_output, expected_difftmp_output)
>  "Task gnu-config-native:do_configure couldn't be used from the cache because:",
>  "We need hash",
>  "most recent matching task was")
> -        expected_sametmp_output = expected_output + ("Variable base_do_configure value changed",'+	echo "this changes base_do_configure() definiton "')
> +        expected_sametmp_output = expected_output + (
> +"Variable base_do_configure value changed",
> +'+	echo "this changes base_do_configure() definiton "')
>          expected_difftmp_output = expected_output
>  
>          self.run_test_printdiff_changeconfig("core-image-minimal",
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192613): https://lists.openembedded.org/g/openembedded-core/message/192613
> Mute This Topic: https://lists.openembedded.org/mt/103239347/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

