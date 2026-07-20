Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCEEC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:31:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.196.1784561460393776723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MOKPmgdy;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so4896215f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784561459; x=1785166259; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7oHTvYd5JkJ87msGpxMnQQ+PFTBu1JU5mTcJxFabZ8Q=;
        b=MOKPmgdy/hyGHFru+5rgoyWclyYpATv2jOSSp3LlW59kQ4mpcxGnsM8eZlLJQmRVuo
         NlcmjHLOOklzLmod29Fku55DPsT9QScgjofGBHu0KDXTNW9KXuAjoZiJAp/rSTtj57ck
         J0V0wRLXXS2ob3U61XPWAW8AMJCOiqUENyey0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561459; x=1785166259;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oHTvYd5JkJ87msGpxMnQQ+PFTBu1JU5mTcJxFabZ8Q=;
        b=S2oY0u95zy6Tlns74Pw6aWX0VQT1uaH4r1O5Iht1C8R5xowVet0WkczuC2srBqKdwh
         w98Nw0ANn42cXgAdwV7EfFir6bn05xhQ0LigT3mjJOHOar4pqryIAuIUmoz2e1WUsgNQ
         D9pzbnLklV2Ithrokff9S3Ygbz/Dms8Vs7qWmLbjIJRfpJLl1LIVuE7vKiza60fGtLVr
         /9t9msbI1ncDkKVeXY5B5yc3/XXjnR0lJeu5DVdA8VRtFLGjFg+nedupp2jR0cXF/Jcl
         yVjRI5M3XakruFeGLv4gR+GC+wNG8qhBb+2663zX8cB89PDS7iycY3Kg7SFOElbVSMzj
         f61w==
X-Forwarded-Encrypted: i=1; AHgh+RpoD+9c+FKybGOdlYhTtAzmiB/QYHS0XlYs8eXwlUBTA8HnLoyGnrNfFLtHZ9SSdR0ei70a6TBux1+MDcARm0UTJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJBdYugOe3C1SraVEy+p9zgBpyer7vXS0//3P73HSJAkzx6FUL
	Nbb+99Q+LPPXvmXLXiCPg4yXosUPwKHKFPVCJvvyDYAVziNNnMwc509lPzsuP8YPnH0=
X-Gm-Gg: AR+sD13Y+lYlQYT0A9Iy/uNtxUx4QD6mUbm4Hvuy0bq9azwspnQkELRDkH4koSF2g7+
	0hZKHqxp0Sbyg6YY8BjyFkW6Jfmdrg1OYLy/sdK+Ylf5u03y4kRsEyVPJelVpYr4JHn3TVv5Yr1
	ry0/VAuQrjFGJmnCYBvPM7S+c2AGX1OiMCi4NkgIfO0Kqz0gknwfHiL9s8jzK82tdB8BNwUxaw3
	I1vvz69i9/s1Ev8KXSjZPkbrX6wN2s4HBOCM4oBR7XlzGkjqwD7YaKKR7ZJq6HWPub7667HR6Ot
	F6vQwFYSWQ8qaiRgkh6DsNUsOl5G76JOKLNvbgY/Qyb3eNsjmEFZeeVNlVlckLp519CZ6LLJ0CT
	90b4NDIGujRK0xXpEixmE23uJlWNWZksrX5111Pu2XNxgOklUtnHPJrNY1kbQFgj8caAk5fBKKC
	S9tPBz2/jR3Skpj7Ksjlh/r98qcn2vCJ/7L6JewhD8Ciz2JaNBul+4yWkbKd1U+A==
X-Received: by 2002:a05:6000:4386:b0:47f:703b:1851 with SMTP id ffacd0b85a97d-47f703b18afmr9703216f8f.59.1784561458549;
        Mon, 20 Jul 2026 08:30:58 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm31778473f8f.24.2026.07.20.08.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:30:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 17:30:57 +0200
Message-Id: <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Paul Barker"
 <paul@pbarker.dev>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
X-Mailer: aerc 0.20.0
References: <cover.1784364567.git.yoann.congal@smile.fr>
 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr> <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev> <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr>
In-Reply-To: <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241413

On Mon Jul 20, 2026 at 5:15 PM CEST, Yoann Congal wrote:
> On Mon Jul 20, 2026 at 9:39 AM CEST, Paul Barker wrote:
>> On Sat, 2026-07-18 at 10:52 +0200, Yoann Congal wrote:
>>> From: Ryan Eatmon <reatmon@ti.com>
>>>=20
>>> When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
>>> exactly align the name with what will be in the fitImage file or you
>>> will get a build error.  If you also turn on KERNEL_DTBVENDORED then yo=
u
>>> must also specify the vendor directory as part of the dtb name that you
>>> want for the default, but you must manually do the same mapping that th=
e
>>> kernel-fit-image class is doing when it generates the fit-image.its fil=
e.
>>>=20
>>> This patch just adds the same logic to figure out the value for the
>>> requested default dtb and eliminate the need to understand the internal
>>> mapping of the class.  It should make specifying the value more
>>> intuitive.  The same value that you put in the KERNEL_DEVICETREE can be
>>> used in the FIT_CONF_DEFAULT_DTB and the new code will correctly honor
>>> the KERNEL_DTBVENDORED setting.
>>>=20
>>> Before:
>>>=20
>>>   KERNEL_DEVICETREE =3D "
>>>     ti/k3-am62p5-sk.dtb \
>>>     ... \
>>>   "
>>>   FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb"
>>>=20
>>> After:
>>>=20
>>>   KERNEL_DEVICETREE =3D "
>>>     ti/k3-am62p5-sk.dtb \
>>>     ... \
>>>   "
>>>   FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62p5-sk.dtb"
>>>=20
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit 3bceb2dabeee13c0a80ddd74ea7ae991606d6772)
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>
>> Hi Yoann,
>>
>> This looks like an enhancement rather than a bug fix. If there is a
>> strong reason to backport it though we could take it as it's small, self
>> contained and not invasive.
>
> I interpreted the mismatch between KERNEL_DEVICETREE and
> FIT_CONF_DEFAULT_DTB as a bug to solve.
> But one could argue that each variable has its syntax, a bit weird but
> not worthy of a stable fix.
>
> I still think this is worth fixing though.
>
>>
>> Does the previous syntax (FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb"=
)
>> still work after this patch?
>
> As I read it, the patch only add a .replace('/', '_') (when
> KERNEL_DTBVENDORED=3D"1") so the old syntax should be preserved.
>
>> If we do take this, should we take the accompanying test case [1]?
>>
>> [1]: https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-=
reatmon@ti.com/
>
> Yes, Ryan suggested it but it was not yet merged when I reviewed it.
>
> Now it has merged, I think I should hold the series:
> * oe-selftest: fitimage: Do not expect kernel property in DTBO config sub=
nodes
> * kernel-fit-image.bbclass: Do not include kernel property in DTBO config=
 subnodes
> * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D "1"
> * kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_D=
TB
> ... until next wrynose review cycle, and add
> * de2e11e6362 - oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
> from master to test it.

To clarify, I expect a backport patch of "oe-selftest: fitimage: Add
tests for KERNEL_DTBVENDORED" for wrynose from Ryan. The cherry-pick is not
trivial.

--=20
Yoann Congal
Smile ECS


