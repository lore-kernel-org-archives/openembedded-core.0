Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4ABC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:00:09 +0000 (UTC)
Received: from mail-ed2-f26.google.com (mail-ed2-f26.google.com [74.125.228.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.959.1790184622062971248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 10:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20251104 header.b=X4ntO1Ic;
 spf=pass (domain: googlemail.com, ip: 74.125.228.90, mailfrom: mrksvolk@googlemail.com)
Received: by mail-ed2-f26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo1855826a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790184620; x=1790789420; darn=lists.openembedded.org;
        h=content-type:mime-version:references:in-reply-to:message-id:cc:to
         :subject:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kFXEzWIhiuTEtCitZlxulz8huz7HvZv6Jmn/1EcNiU=;
        b=X4ntO1IcDtkGpvKfGKKrm2S5uMlmYDSqa9bjDPxhbyBr/RVXsFOOZ1WXg2wHsBXoQg
         oYgrYc/ffKwBGjiRPrj+l8DqtF758qzHgzFjx/nm7V/eIVN8buTUS1SQm4BZQSuPbH6Q
         0RVNf/+5ozs3q75K6VEjIcAkvszK7bj7PLKNGUbLMD84+0J5T147jc9vCGWy13QDu02Y
         yUgXUC3T/I2HdAxIvOM6DnE+8XmDFxYuDOWTnAtyx4pgzsMEnX+i9Q+dSoyY9KFlIsX2
         3gz8xN4jFE+OKV3ft/i+9FEM2FK3rzyHNuGTVU46YwdfpIGj744arsfh84E1TCmaDv9m
         pDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184620; x=1790789420;
        h=content-type:mime-version:references:in-reply-to:message-id:cc:to
         :subject:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kFXEzWIhiuTEtCitZlxulz8huz7HvZv6Jmn/1EcNiU=;
        b=xsZJBDdnf7HdRHFPHg9pZgzwRGQ8AHfCtp+eK+c1ScXLHlh29weiswECLK7KHitRDc
         Zhg+PKElgWKUZA4VWbXXj8LbsWTC0E7RqFkeCuO22Us5HNQt/JUf4McSqUjX8Q8aKv4b
         viebinl5tqngvhwiWX0pA68qVBnvEIsD0QqamqhEdrDADTY6Ux5heP3KyVDA8V1CtulX
         k+Ox9JqY5KCJP+nFzEeB9Yvxosqq+M1ZWsESS/jmk9BXIUGgr670wxXc84yMbQ1Tl7mf
         WpfTEizHcHBs3IZFe8vC+1E02Jc2hEulVd7fv1Rq/lrSmVT8F+7PGXZwf03fEWE2wfGd
         TLoA==
X-Gm-Message-State: AFuF++kQf2u87tz7eq8waU3hRcPyB6GEQ8TkihqIfgbFPOHlWWrV+utp
	b77wrzWn6KQ0QE6osf+DGrO8VR37MyFawiwPvVvuMD69c3W6tTWte+Pi/aUpA2hp
X-Gm-Gg: AYBFou2hU8OJjGAiiip2pK31LSL1+fteLVI5O33+rz+Am0PXiUhTGK+KZQFF18el++g
	01UoDgYAJkfApDmkwtOuxp5XjC8VAeihdMPmuvY2PcYEpBFB4V4/WysW6d7ApOxVUHoP82JxSca
	WglWLNV8Wc8mz2FX41jMNGOxew3FZTwUEahl7GtPH4JWwCp2AJJmJOL+akZ8uL5tu1HP976u0vP
	kvDRbLHdDsPgjeUFJT7eIL/0owbSaKGlaMdyTe07oC3UrSCCrm1dCLlKBs5YelaM4lJGnh0+OpN
	x53CzmhT6Xy+2qP8S/y136TPhb37Uw381zhbbBl9njFaj90ybwJQ+Kt0WmjqjTFvLht72OrWjmr
	J9jKmjfHBm5Ela2L/M+1tH18Jfexs7g9VbOwivl7Dpt8+hwq2jrvasQj6NX+jw59/haSjGZGbE9
	12zaCtvVK+MMTxhUCBiqKI0gy/cIy/E9RGOSUyj7h1zS9NUy3D95z8JgGrqfgYX4Xuo1Ps5eycq
	BU4l551tXmTpoCyx5p4FzAJOMz0nVU9rjWchg8=
X-Received: by 2002:a05:6000:24c4:b0:487:b2b:457b with SMTP id ffacd0b85a97d-488670891f3mr6057910f8f.15.1790184192522;
        Wed, 23 Sep 2026 10:23:12 -0700 (PDT)
Received: from [192.168.178.36] (p4fdbe71f.dip0.t-ipconnect.de. [79.219.231.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c48esm7803672f8f.20.2026.09.23.10.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:23:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:23:06 +0200
From: mrksvolk@googlemail.com
Subject: Re: [oe-core][PATCH 5/5] go-mod-update-modules: include the generated files from the class
To: antonin.godard@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <JYUTLT.IUWOIA0CTIB23@googlemail.com>
In-Reply-To: <DLLWONAJMUWW.JNH415ZXTGVI@bootlin.com>
References: <20260922092411.262885-1-f_l_k@t-online.de>
	<20260922092411.262885-5-f_l_k@t-online.de>
	<DLLWONAJMUWW.JNH415ZXTGVI@bootlin.com>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Jqa53YBK5SZMTTsjpqBL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246536

--=-Jqa53YBK5SZMTTsjpqBL
Content-Type: text/plain; charset=us-ascii; format=flowed

Sure. Just tell me, if and when you want the patch.

On Tue, Sep 22 2026 at 16:14:03 +02:00:00, Antonin Godard via 
lists.openembedded.org 
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
> Hi,
> 
> On Tue Sep 22, 2026 at 11:23 AM CEST, Markus Volk via 
> lists.openembedded.org wrote:
>>  A new recipe could not be parsed before its first update_modules run
>>  because it had to require the two generated files itself. Include 
>> them
>>  from the class instead, relative to the recipe, so a missing file is
>>  tolerated until the task has written it.
> 
> This has the following side-effect for recipes already including the 
> file(s):
> 
> stdio: WARNING: 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb: 
> Duplicate inclusion for 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc 
> in 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
> stdio: WARNING: 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb: 
> Duplicate inclusion for 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc 
> in 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
> stdio: WARNING: 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb: 
> Duplicate inclusion for 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc 
> in 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
> stdio: WARNING: 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: 
> Duplicate inclusion for 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible-go-mods.inc 
> in 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
> stdio: WARNING: 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: 
> Duplicate inclusion for 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible-licenses.inc 
> in 
> /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
> 
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4515>
> 
> If this is merged we'll need to adjust these recipes. Also if this is 
> merged
> please send an update to
> <https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-6.1.rst>
> on the documentation mailing list to let people know why this is 
> happening in
> their build.
> 
> Thanks,
> Antonin
> 
> 
> 


--=-Jqa53YBK5SZMTTsjpqBL
Content-Type: text/html; charset=us-ascii

<div id="convey-body" dir="auto"><div>Sure. Just tell me, if and when you want the patch.</div></div><div id="convey-quote" dir="auto"><br>On Tue, Sep 22 2026 at 16:14:03 +02:00:00, Antonin Godard via lists.openembedded.org &lt;antonin.godard=bootlin.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hi,

On Tue Sep 22, 2026 at 11:23 AM CEST, Markus Volk via lists.openembedded.org wrote:
<blockquote> A new recipe could not be parsed before its first update_modules run
 because it had to require the two generated files itself. Include them
 from the class instead, relative to the recipe, so a missing file is
 tolerated until the task has written it.
</blockquote>
This has the following side-effect for recipes already including the file(s):

stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale-go-mods.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale-licenses.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleiot/simpleiot-go-mods.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-extended/simpleiot/simpleiot_0.18.5.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible-go-mods.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb
stdio: WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb: Duplicate inclusion for /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible-licenses.inc in /srv/pokybuild/yocto-worker/meta-virt/build/meta-openembedded/meta-oe/recipes-support/crucible/crucible_2025.05.28.bb

<a href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4515">https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4515</a>

If this is merged we'll need to adjust these recipes. Also if this is merged
please send an update to
<a href="https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-6.1.rst">https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-6.1.rst</a>
on the documentation mailing list to let people know why this is happening in
their build.

Thanks,
Antonin
</div><div class="plaintext" style="white-space: break-spaces;">


</div></blockquote></div>

--=-Jqa53YBK5SZMTTsjpqBL--

