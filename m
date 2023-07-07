Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FFAEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 12:36:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.11170.1688733398428289364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 05:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JxSEeUTv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688733396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m3QgR9ZMTyWRfVRzUMrpKFLqOHo5RXDNBbIhtUIlYLA=;
	b=JxSEeUTvQXJzOQjESQ3EiZA6jLnCH2T7XHc0e+gUE4bb8CVlN31EOfVp7VW3lNG9I2Rh88
	1NGvS2XMZ8V+TtZK7eY6ICMmZcU9bOQs6gJNBS2mnMlr/LGclrMdhCZIDOLO61jnoYmh+E
	msCAUqLEqlkvAXyAhlXGbnX+mvr93KgHtZ33pTcNxZC5T9ZpexO1OoyFKZWYs8VP4OgxzP
	zjdmklorKu+nsZDKJlnkAJlneqq9Y/mZ2HmYQbKfF9prmhlcAnQCRXXsTFgvQmrmub3oZL
	n2YqMivHHFpLHLKHl6MstfxfpraBqh7sFcbh6VzdMhMvjRTyOE9rVPbosyTrpg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2060240005;
	Fri,  7 Jul 2023 12:36:35 +0000 (UTC)
Date: Fri, 7 Jul 2023 14:36:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yang.xu@mediatek.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [OE-core] [PATCH v3] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Message-ID: <202307071236355ddab32a@mail.local>
References: <20230707065239.28468-1-yang.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707065239.28468-1-yang.xu@mediatek.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 12:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184010

Hello,

On 07/07/2023 06:52:39+0000, Yang Xu via lists.openembedded.org wrote:
> From: Yang Xu <yang.xu@mediatek.com>
> 
> The `bb.siggen.compare_sigfiles` method transforms the key format from
> `[mc:<mc_name>:][virtual:][native:]<recipe path>:<taskname>` to
> `<recipe dir>/<recipe name>:<taskname>[:virtual][:native][:mc:<mc_name>]`
> by `clean_basepaths`. However, `find_siginfo` uses the original format
> to get the package name (pn) and task name.
> 
> This commit corrects the method for deriving the pn and task name in
> `find_siginfo` and adds handling for multilib name.
> And add test for compare_sigfiles and find_siginfo working together.
> 
> Signed-off-by: Yang Xu <yang.xu@mediatek.com>
> ---

Please always include a changelog in this location, else we can't know
easily what changed since v2.

>  .../recipes-test/binutils/binutils_%.bbappend |  2 +
>  meta/lib/oe/sstatesig.py                      | 17 ++++--
>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 53 +++++++++++++++++++
>  3 files changed, 67 insertions(+), 5 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/binutils/binutils_%.bbappend
> 
> diff --git a/meta-selftest/recipes-test/binutils/binutils_%.bbappend b/meta-selftest/recipes-test/binutils/binutils_%.bbappend
> new file mode 100644
> index 0000000000..205720982c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/binutils/binutils_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
> +include test_recipe.inc
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index f943df181e..f041a0c430 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -321,11 +321,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>      if not taskname:
>          # We have to derive pn and taskname
>          key = pn
> -        splitit = key.split('.bb:')
> -        taskname = splitit[1]
> -        pn = os.path.basename(splitit[0]).split('_')[0]
> -        if key.startswith('virtual:native:'):
> -            pn = pn + '-native'
> +        if key.count(':') >= 2:
> +            splitit, taskname, affix = key.split(':', 2)
> +        else:
> +            splitit, taskname = key.split(':', 1)
> +            affix = ''
> +        pn = os.path.splitext(os.path.basename(splitit))[0].split('_')[0]
> +        affixitems = affix.split(':')
> +        if affixitems[0] == 'virtual':
> +            if affixitems[1] == 'native':
> +                pn = pn + '-native'
> +            if affixitems[1] == 'multilib':
> +                pn = affixitems[2] + '-' + pn
>  
>      hashfiles = {}
>      filedates = {}
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index febafdb2f7..818d8b623d 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -691,3 +691,56 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
>          self.maxDiff = None
>          self.assertCountEqual(files1, files2)
>  
> +class SStateFindSiginfo(SStateBase):
> +    def test_sstate_compare_sigfiles_and_find_siginfo(self):
> +        """
> +        Test the functionality of the find_siginfo: basic function and callback in compare_sigfiles
> +        """
> +        self.write_config("""
> +TMPDIR = \"${TOPDIR}/tmp-sstates-findsiginfo\"
> +TCLIBCAPPEND = \"\"
> +MACHINE = \"qemux86\"
> +require conf/multilib.conf
> +MULTILIBS = "multilib:lib32"
> +DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
> +BB_SIGNATURE_HANDLER = "OEBasicHash"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstates-findsiginfo")
> +
> +        pns = ["binutils", "binutils-native", "lib32-binutils"]
> +
> +        #forcing generate different stamps for binutils every time
> +        self.write_recipeinc("binutils", 'do_fetch[nostamp] = "1"')
> +        for pn in pns*2:
> +            bitbake("%s -S none" % pn)
> +        self.delete_recipeinc("binutils")
> +
> +        with bb.tinfoil.Tinfoil() as tinfoil:
> +            tinfoil.prepare(config_only=True)
> +
> +            def find_siginfo(pn, taskname, sigs=None):
> +                result = None
> +                tinfoil.set_event_mask(["bb.event.FindSigInfoResult",
> +                                "bb.command.CommandCompleted"])
> +                ret = tinfoil.run_command("findSigInfo", pn, taskname, sigs)
> +                if ret:
> +                    while True:
> +                        event = tinfoil.wait_event(1)
> +                        if event:
> +                            if isinstance(event, bb.command.CommandCompleted):
> +                                break
> +                            elif isinstance(event, bb.event.FindSigInfoResult):
> +                                result = event.result
> +                return result
> +
> +            def recursecb(key, hash1, hash2):
> +                hashes = [hash1, hash2]
> +                hashfiles = find_siginfo(key, None, hashes)
> +                self.assertCountEqual(hashes, hashfiles)
> +                bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
> +
> +            for pn in pns:
> +                filedates = find_siginfo(pn, "do_compile")
> +                self.assertGreaterEqual(len(filedates), 2)
> +                latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
> +                bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184001): https://lists.openembedded.org/g/openembedded-core/message/184001
> Mute This Topic: https://lists.openembedded.org/mt/100001305/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

