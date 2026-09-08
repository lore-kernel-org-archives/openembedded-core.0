Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD4BC79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:26:11 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3252.1788859563769973988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FoLbA0A/;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so3274695f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788859562; x=1789464362; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FzLECjdJY13O7Twf2diQendBHii+QBAtJDkpQ9abIs4=;
        b=FoLbA0A/Y3S1+gKKUFNvRDCnFt/t7dkzOQUGKM+SZf9J4tD5TiMbwWtyAHAxumjcpI
         x+gf9TOYqmmyqsDaXptfdhdSKMdF/lFAvlvuiraAWmO2atFpyAGvJMC4MsEcL0U6tsZT
         RJHGBNl3W01aAbg1/TuUOsVMmTZFXaad4M3pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859562; x=1789464362;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzLECjdJY13O7Twf2diQendBHii+QBAtJDkpQ9abIs4=;
        b=sWFKeCxhHH9d4Pkc57on00PeFekxcVIXJyhIvbrtGf5GV6La+5B7AQaDyeIl9PvQss
         qJbAkyY/0CcZWGB5zbQbVUhwOjEkV2I2htPgeK5OO/koPMdaszAgCdjBb+lKC16DuA3M
         dW4xh5KMzUO5Vms1mjeGy0I6uSETXj/R611LWn00vr1aBCX0e7kmgZ1yYwLzG9D53KD3
         Hc65+SS8ah7nHrTu+fIjMVJwr6Z+DbwUOQNe2hmlqxsBpHHd4SvtnJtKqYbWriVGgBT+
         T8grmfkkQrh6CU4BzhsM7Eku0jcDUDpxd77wTVsrsn/cfwnKZGrBUzIuGBD1k5YNAsUy
         Nwzw==
X-Gm-Message-State: AFuF++l9L5hsw/3+DH/HiaLEWgFzLIpOKxWPKy0rV9RLCee3j4liZ11o
	ck6O9NDq18o+EoPtJSGVOlCTG9zBgn+gbiL/DeCxhjVu4kT4TuK6YZtRrfY2RTm4sWY=
X-Gm-Gg: AYBFou0TahPNUpQnnLktb1Dzc97otMzQtCe1x9bQyq7heM+0M+HtBxuFSQdd4uQdVgq
	3w7xrzdfbViF/mW3QcrlWNNavTKmY/fJldDygENO8cyGC8BCkQEBSB4WEnIPFsRPqddB0Timsvc
	kZ4EI67DOKgWb+l9jCjXJ11xSgez0udOzxqETNctUOKYf1mafWmvva2hfkrsM/DxAENNyvw+0fj
	mhc1/ZwjrETIg5YstgYzJLJIoL+CcR0gqBIhH8UthZbH1Zk9dNYXkTyCvUSJRfD4R+lDzhSMiXV
	aoiouqE0pNcuvXXviW5wlinV3L2TB5omJiNMmUA54+yP5U4VrE0o4PepgkXjvZ8vV0oiyFe2fmV
	3gdAnjpVfej8kfiyE/wYbdASrGdxvFRmUK4B1Clyr8Qe83Z+KdqsL/jyPjYlQZN0CWZqXPHT1CG
	3rKtcR0l6UMe8Jk9kTeMU2aMaQZ5U4jBwmyA2pyH1qxu1rK7pq0CZgFrtQ6nxSP5tYdgsJ6qsLb
	oo0bLNLn0Mvr78qGbGA7ljghAWG0v8S2/qNJiNp8hAKQQ8j
X-Received: by 2002:a5d:6f11:0:b0:485:8c17:976d with SMTP id ffacd0b85a97d-4858c179a24mr26174368f8f.47.1788859561705;
        Tue, 08 Sep 2026 02:26:01 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm34670909f8f.14.2026.09.08.02.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:26:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 11:26:00 +0200
Message-Id: <DL9TSH9C0F4T.4GBXSMFY7MTZ@smile.fr>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: -stable updates
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Yoann Congal" <yoann.congal@smile.fr>, <bruce.ashfield@gmail.com>,
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
 <DL9SAQQDYUWN.DHAPJINZ988O@smile.fr>
In-Reply-To: <DL9SAQQDYUWN.DHAPJINZ988O@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245338

On Tue Sep 8, 2026 at 10:15 AM CEST, Yoann Congal wrote:
> On Tue Sep 8, 2026 at 3:17 AM CEST, Bruce Ashfield via lists.openembedded=
.org wrote:
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Hi all,
>>
>> Since we are working through 7.2 integration, I wanted to get these
>> stable updates out while the older (6.18 and less) are still under
>> test (those -stable updates will follow).
>>
>> I did sneak a 6.18-rt update in, but it was trivial and tested
>> independently.
>>
>> (yes, the yocto-bsps update is in this series, even though it
>> is for the yocto-bsp repo)
>>
>> Cheers,
>>
>> Bruce
>>
>>
>> openembedded-core (4):
>>   linux-yocto/7.2: menuconfig,mconf-cfg: Fix broken menuconfig
>>   linux-yocto/7.2: rt: update to v7.2-rt5
>>   linux-yocto/6.18: rt: update to v6.18.37-rt6
>>   linux-yocto/7.2: update to v7.2.4
>>
>> meta-yocto (1):
>>   yocto-bsps: update to v7.2.4
>>
>>  openembedded-core:
>>  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  4 ++--
>>  meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  4 ++--
>>  meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 20 ++++++++++-----=
-----
>>  meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 ++++++++++++---=
---------
>>  6 files changed, 32 insertions(+), 32 deletions(-)
>>
>>  meta-yocto:
>>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Hello,
>
> Is there a chance that a fix for #16414 "AB-INT: testsdk:
> kernel-module-hello-world build fail"[0] hides somewhere in this
> upgrade?
>
> [0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16414
>
> Thanks!

Answering myself:
Richard just updated the bug, the fix is: "kernel-module-split: Remove get_=
ext_mod"
https://git.openembedded.org/openembedded-core/commit/?id=3D02890c1eff104de=
94ad22023232fd36baaf228dc

Thanks!
--=20
Yoann Congal
Smile ECS


