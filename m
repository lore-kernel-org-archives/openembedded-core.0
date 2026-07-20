Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6068DC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:15:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11390.1784560505118546429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vov0VV4/;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590ba856so12720545e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784560503; x=1785165303; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HnL9gbCQHaZOtvoJEqLZS9MXp3CrVFqj7d51zODL1tQ=;
        b=vov0VV4/ayu49lQzz8eSIiiNcqTy5eFJHuKFmeF1m4mYIwIWfcxTOJnat9wfjY6dFt
         nLEe+DpnyeieqdmmDvf1+fwGuaAiVczKS1PF7IP0OidkmAvv39tdnUunVeqOCgXdJVx0
         v4fxkZbIsTw+Ko+cUYusrwLiapNJH5f82GWZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560503; x=1785165303;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnL9gbCQHaZOtvoJEqLZS9MXp3CrVFqj7d51zODL1tQ=;
        b=aNfTcyvWX/9bgubQMulN+X9Pno4dTAkL22H8/noRMHBmNbi/X3hbNRw+kb/7FkEiLc
         HqxzMAmBOba5ITVO10w7feaZXUV5tiEZaEFd9SFU/VpABDumRF0djxdp/cPVkHpecjie
         vPI6PYE1TaH5eA0wpkP10wVZZIhX8NCwxLMwkidzGBl1jbgRasGFYKS4I5F17Cabwyk/
         PzREplmmt2w2wmOEPVGMTMry0r6rBqnsHc1UlBPUtfGVkSgKiV0kqhzj4sSeIpI4YK4y
         dUv0KvJL4pYL8h41o/5ho/v9KXC2Yms0lVKkT4uuFkHBnOwClz53MMY/AxJN5nfwhQfu
         V2Xw==
X-Forwarded-Encrypted: i=1; AHgh+RqL77KpfV6OO/YVyrTSmMwLCkSR5xycssoV1DH3BHyIRxMmYbANDqU3igmcaqFOLaiYTmOmFphLjoenXGEMo6FZJw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyMEbOE7y6P5lW9+AAdTDmlqKLLWG4llCDcqau8au3aPUSExjeK
	IDVcP27mUeyKU8HZq3jRzb8pUfOzJwGEWxWwY7f2K0wwsdmSXa0F1uIwfm8OXEPo1MI=
X-Gm-Gg: AfdE7cnIlonsJico/PT30MJ7B97wWX+qsm0ilwjxW5Dzu+UZrZsT1kLbyrOEf7eZoO1
	x4Ag3dq4y4HoXzOY8hF7yw2V4IQ+z6E3XknOr9rYWuaUWmTc0T69li0S9BdZTrbc7xiaCAkqx1H
	3/PszFNaT9V4fGE83E6vpZnCOudIO1cBxyd68LK8BCIsuijEgfdVzswiwpKWOpzgVvFosLU9DBE
	QcoH4vUGy3r4FfNFpKGtbB8Gkxr4MMVcJYw9p2rVQG39g5rkNRXLWgRHPMBYhnOYr0Hf/KyKFgt
	cFUU+8m+WwFE4yIGZtSEJYwsLJ2IdPhKx2ZBoet3EdK1jUbfk9NOZ86b+Z8Pl5dvCUPTVP6zdW3
	tIwkuhL1nmO3I/VlpQLKjXPjFCTYwkYS0HvLYq1psOykbu1vh7gbinpKCUJ7mAu5lB1HimV8Oy/
	qSJRHliy6zsihfWuyj37DjSQrCKsl3tHDgFu2xwTFHNxeWhxucsXjEyh8+aMB7QA==
X-Received: by 2002:a05:600c:580d:b0:495:4598:6e14 with SMTP id 5b1f17b1804b1-4954a4060demr122046385e9.24.1784560503022;
        Mon, 20 Jul 2026 08:15:03 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm337236205e9.11.2026.07.20.08.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:15:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 17:15:01 +0200
Message-Id: <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1784364567.git.yoann.congal@smile.fr>
 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr> <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
In-Reply-To: <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241409

On Mon Jul 20, 2026 at 9:39 AM CEST, Paul Barker wrote:
> On Sat, 2026-07-18 at 10:52 +0200, Yoann Congal wrote:
>> From: Ryan Eatmon <reatmon@ti.com>
>>=20
>> When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
>> exactly align the name with what will be in the fitImage file or you
>> will get a build error.  If you also turn on KERNEL_DTBVENDORED then you
>> must also specify the vendor directory as part of the dtb name that you
>> want for the default, but you must manually do the same mapping that the
>> kernel-fit-image class is doing when it generates the fit-image.its file=
.
>>=20
>> This patch just adds the same logic to figure out the value for the
>> requested default dtb and eliminate the need to understand the internal
>> mapping of the class.  It should make specifying the value more
>> intuitive.  The same value that you put in the KERNEL_DEVICETREE can be
>> used in the FIT_CONF_DEFAULT_DTB and the new code will correctly honor
>> the KERNEL_DTBVENDORED setting.
>>=20
>> Before:
>>=20
>>   KERNEL_DEVICETREE =3D "
>>     ti/k3-am62p5-sk.dtb \
>>     ... \
>>   "
>>   FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb"
>>=20
>> After:
>>=20
>>   KERNEL_DEVICETREE =3D "
>>     ti/k3-am62p5-sk.dtb \
>>     ... \
>>   "
>>   FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62p5-sk.dtb"
>>=20
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 3bceb2dabeee13c0a80ddd74ea7ae991606d6772)
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>
> Hi Yoann,
>
> This looks like an enhancement rather than a bug fix. If there is a
> strong reason to backport it though we could take it as it's small, self
> contained and not invasive.

I interpreted the mismatch between KERNEL_DEVICETREE and
FIT_CONF_DEFAULT_DTB as a bug to solve.
But one could argue that each variable has its syntax, a bit weird but
not worthy of a stable fix.

I still think this is worth fixing though.

>
> Does the previous syntax (FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb")
> still work after this patch?

As I read it, the patch only add a .replace('/', '_') (when
KERNEL_DTBVENDORED=3D"1") so the old syntax should be preserved.

> If we do take this, should we take the accompanying test case [1]?
>
> [1]: https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-r=
eatmon@ti.com/

Yes, Ryan suggested it but it was not yet merged when I reviewed it.

Now it has merged, I think I should hold the series:
* oe-selftest: fitimage: Do not expect kernel property in DTBO config subno=
des
* kernel-fit-image.bbclass: Do not include kernel property in DTBO config s=
ubnodes
* kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D "1"
* kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
... until next wrynose review cycle, and add
* de2e11e6362 - oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
from master to test it.

Thanks!
--=20
Yoann Congal
Smile ECS


