Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D93EB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 21:04:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.305.1689023082340184647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 14:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QigRALF9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 687F260005;
	Mon, 10 Jul 2023 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689023080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSCGD7WcVZrR76j5M2s+HHSJpLo46wGRa/8G4c6I0NI=;
	b=QigRALF90MELgJdeanL8Z+V52wu2q9pFqpMGhMRjZ9CYgMtGGYfbLWAgBjXP+JszQQFTY7
	p/lWyTDs5cJ2qF8R0aiyCZId68IrtjclUIZPNUou/kQK4G+CrddjQAOwdO1OHZbAbBGemD
	FEdoVbUYGsziAKy+pfj0b+x/sFj5+ikMBT4gljP+pfOj3+CThC9wuc240RyEUYjb276L7z
	nKlIoipNZNnbcJlQNH01rEqbC8m2BIvLdCD8CeXKZwb4MwTwqbHTuVYK+r0kduaOMBovvR
	Ai9a7jQ6BspFgU/rIMKpqmrEa/5S4qf2zVrOXndr/pF76tcDqcX0vz3/HhbdFw==
Date: Mon, 10 Jul 2023 23:04:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yang.xu@mediatek.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [OE-core] [PATCH v3] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Message-ID: <20230710210438bbc26b11@mail.local>
References: <20230707065239.28468-1-yang.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707065239.28468-1-yang.xu@mediatek.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 21:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184098

Hello,

This caused the following failure on the AB:


2023-07-10 07:09:07,937 - oe-selftest - INFO - 5: 28/28 427/530 (396.69s) (0 failed) (sstatetests.SStateFindSiginfo.test_sstate_compare_sigfiles_and_find_siginfo)
2023-07-10 07:09:07,937 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 746, in test_sstate_compare_sigfiles_and_find_siginfo
    bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/bitbake/lib/bb/siggen.py", line 1038, in compare_sigfiles
    recout = recursecb(dep, a[dep], b[dep])
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 740, in recursecb
    bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/bitbake/lib/bb/siggen.py", line 1038, in compare_sigfiles
    recout = recursecb(dep, a[dep], b[dep])
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 740, in recursecb
    bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/bitbake/lib/bb/siggen.py", line 1038, in compare_sigfiles
    recout = recursecb(dep, a[dep], b[dep])
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 740, in recursecb
    bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/bitbake/lib/bb/siggen.py", line 1038, in compare_sigfiles
    recout = recursecb(dep, a[dep], b[dep])
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 739, in recursecb
    self.assertCountEqual(hashes, hashfiles)
  File "/usr/lib/python3.11/unittest/case.py", line 1233, in assertCountEqual
    self.fail(msg)
  File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '6e2cd26afc5890b8d2ad5eee2cd54e5659ea47de2afd6670b42c25c2d6471045'
First has 1, Second has 0:  '00877293baa6eba15266664c8a78508fac9114d64a99221176349cad0312f517'


https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5401/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1727/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5443/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5476/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5450/steps/15/logs/stdio

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

