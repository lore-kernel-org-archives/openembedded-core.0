Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680BEC001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 11:44:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77993.1697888646707295168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 04:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ltdjGWSE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 072171C0002;
	Sat, 21 Oct 2023 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697888644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xEWil854QeFi1bs8YNsdVh3bG2T3h95n87f9njkqXT0=;
	b=ltdjGWSEbABtmAyytSeWwY0OBdBrpsdBJqm+nVk5Vyhjm7c3K4tLVntzw49xlMrZqzfOb5
	T55kZJSACtNxI00k7qCAgDuaI15CKDvksfLMUxcP6Rv7u8Uafl9yQfuRAKFkbIJVi7nL0q
	udbmqVosna6JfzhPkGuowxJI1slwo3agOwk+ZVuGUPOd+fsuwQq7RdhQuG2DV1f5z+QVbF
	Q/db8rBFnLsmFv3dp+w/kq1ImfOi2g8CoKGZL2VTOAKXShsExzRFQNT5NW35LkKWcOHJEA
	MSMTCEsMrDM92P+k3XtpWo1/MHL9PZEsuWBPUmc8drDSMvrlwVyoj/HhqHIE1g==
Date: Sat, 21 Oct 2023 13:44:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] lib/oe/sstatesig.py: dump locked.sigs.inc
 only when explicitly asked via -S lockedsigs
Message-ID: <202310211144038fb903e3@mail.local>
References: <20231020171232.3072396-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020171232.3072396-1-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 11:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189582

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/7980/steps/24/logs/stdio

On 20/10/2023 19:12:31+0200, Alexander Kanavin wrote:
> This was writing out locked-sigs.inc into cwd with every
> 'bitbake -S' invocation. When the intent is only to to get task
> stamps (-S none), or print the difference between them (-S printdiff),
> the file is unnecessary clutter.
> 
> A couple of selftests/scripts were however relying on this, so they're
> adjusted to explicitly request the file.
> 
> eSDK code calls dump_lockedsigs() separately via
> oe.copy_buildsystem.generate_locked_sigs() and so isn't affected.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oe/sstatesig.py                 | 7 ++++---
>  meta/lib/oeqa/selftest/cases/archiver.py | 2 +-
>  meta/lib/oeqa/selftest/cases/signing.py  | 2 +-
>  scripts/lib/checklayer/__init__.py       | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 42e13a8c800..e250f51c124 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -142,9 +142,10 @@ class SignatureGeneratorOEBasicHashMixIn(object):
>          super().set_taskdata(data[3:])
>  
>      def dump_sigs(self, dataCache, options):
> -        sigfile = os.getcwd() + "/locked-sigs.inc"
> -        bb.plain("Writing locked sigs to %s" % sigfile)
> -        self.dump_lockedsigs(sigfile)
> +        if 'lockedsigs' in options:
> +            sigfile = os.getcwd() + "/locked-sigs.inc"
> +            bb.plain("Writing locked sigs to %s" % sigfile)
> +            self.dump_lockedsigs(sigfile)
>          return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
>  
>  
> diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
> index 3fa59fff510..3cb888c5067 100644
> --- a/meta/lib/oeqa/selftest/cases/archiver.py
> +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> @@ -141,7 +141,7 @@ class Archiver(OESelftestTestCase):
>          pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
>  
>          # Generate the tasks signatures
> -        bitbake('mc:mc1:%s mc:mc2:%s -c %s -S none' % (pn, pn, task))
> +        bitbake('mc:mc1:%s mc:mc2:%s -c %s -S lockedsigs' % (pn, pn, task))
>  
>          # Check the tasks signatures
>          # To be machine agnostic the tasks needs to generate the same signature for each machine
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
> index 322e753ed3b..18cce0ba258 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -191,7 +191,7 @@ class LockedSignatures(OESelftestTestCase):
>  
>          bitbake(test_recipe)
>          # Generate locked sigs include file
> -        bitbake('-S none %s' % test_recipe)
> +        bitbake('-S lockedsigs %s' % test_recipe)
>  
>          feature = 'require %s\n' % locked_sigs_file
>          feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
> diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
> index 0a0db2f02ac..8271ed7fe3b 100644
> --- a/scripts/lib/checklayer/__init__.py
> +++ b/scripts/lib/checklayer/__init__.py
> @@ -307,7 +307,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
>      cmd += 'bitbake '
>      if failsafe:
>          cmd += '-k '
> -    cmd += '-S none world'
> +    cmd += '-S lockedsigs world'
>      sigs_file = os.path.join(builddir, 'locked-sigs.inc')
>      if os.path.exists(sigs_file):
>          os.unlink(sigs_file)
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189574): https://lists.openembedded.org/g/openembedded-core/message/189574
> Mute This Topic: https://lists.openembedded.org/mt/102085735/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

