Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32BDC55164
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 07:36:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6397.1785397000892942412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 00:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YetREN3i;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so17350075e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 00:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785396999; x=1786001799; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jWbQOgF8HiVmWx24+Sds42LjGtJnUYfrQAyPrroEIVA=;
        b=YetREN3iHohbTPj1j+QGgW1DNWT4F8oxfZiBBnFKZfoGEorMgG3thhBuwjmQdUv4oK
         LVvSH/+1eyVUCX8eWiKhWWS6mG5mX8MaKfJ446Vz7M9RNJL2ZpIvJ2nVAL9oycOGE9j+
         hY9VSFM71x1sIGSGoWbJ1irIpJ//VQNpOtWUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785396999; x=1786001799;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWbQOgF8HiVmWx24+Sds42LjGtJnUYfrQAyPrroEIVA=;
        b=HS7JZ0fputY3I6XvoNJAzTQBshoPje8ijJpzMsoFTkKTkOC3lx5+cMDM7Mq8lje87O
         xxtRb/wz3i7uujSaqSFqzl3QbCLSbF98icVvVPES7ZcVMkvlwzHiuyZgrsnx7F6a0h8w
         AEYUv2guBO5efMxgvlX9tPLgdLXRR5P32IsZaOPe+H6Dp7iIdax/9M9KxuQcyrdgZORG
         iQZ73D+BL0wSG7yGHyJWldelfJQozSATAsP7wZSZxTEdyNuJ+rNNX+mmzqdeh/G7pt3P
         gERxxdOsgLzsQmwTAWG1f1p/9zbhiFNo098FgbttcgTAlPuGPB+b7w9CMtCRAxqelRiv
         ElDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZuruEOP8XXGLBzlII2VuuVFRS4FPCrnx4goUyt44EBYk4JLTYflYPLpUFbN6FIDTkvj3ktk322vzX/lupzG80+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/35r/0uFQBiyMwA4zvfduZs2MgRmx5YeDjii1KHbz6TofR7eN
	2Iv44cHst3eRwghUftmk617311OjxwiGGlnVALBzw/rbllhuZyUMdHvJ3bA6QbeVMhhC7/7R2CO
	taPgiZtw=
X-Gm-Gg: AR+sD12a4ixLl256niO+Q03DbuSbdI3FcwNQMlgkt1CMInKYde38ZG4Kc0Fb9JQ/hZ5
	k9pJm4VED1NYtNWo9e23BYDo246DH/H1dDLCIDb75Uyh542FZvNg9xpTp4T8gZh7CswJ+vcfO27
	Ls/UhRVxM6WSRjGriF19A90Jsrno43G4yunYJnehESqOphNXpXtIKdHdAAYyO3UrmAqr7CBtLsV
	7jWKJRkkr46YeETMDpKSvxBLDs7/bRwOEMLsWAhx3jpf79WIMcZISnbmaA2YAIphjii+AN26XY1
	W8EdV00yLgUdPVFfCSiMlV7jjrgwpsLHwTjNh/HQu1WqO+nBqwkAbzjZ+MgpMoUAEvvnq3Y3OvO
	Sy40lKOQNMsOnHIet7KRl28VvMi6CnLoqgJzhgzWRnyWvE+J47zIwPsprA4R4Sp39qa1x/1S+zC
	pXYpigxN2xnBEjYf3W60iw+nDtcOnbQ0C+fJaS3F0cLu/ACC2f8qh+uTvy3Nq/BZhEYsUOt7UHx
	mkYRQc1/FU4cmHiWwcYryPRxN7EeWMBHbqylr5NeKYihnkPfptz
X-Received: by 2002:a05:600c:154b:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-49800eb73bamr17690715e9.32.1785396998726;
        Thu, 30 Jul 2026 00:36:38 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d944cfsm73323295e9.4.2026.07.30.00.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:36:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 09:36:37 +0200
Message-Id: <DKBQEXTZ79PI.3DFEPYRHXLBNB@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>, <adrian.freihofer@gmail.com>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
 <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
 <868f8648-d45f-4ba5-a6e5-7eb5fadb2516@mailbox.org>
 <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
In-Reply-To: <a84070f4-290c-4ada-86ce-7f601bb8870b@mailbox.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 07:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242325

qn Thu Jul 30, 2026 at 12:31 AM CEST, Marek Vasut wrote:
> On 7/20/26 5:31 PM, Marek Vasut wrote:
>
> Hello Yoann,
>
>>>>> [1] https://patchwork.yoctoproject.org/project/oe-core/
>>>>> patch/20260704214812.365483-1-marek.vasut@mailbox.org/
>>>>> [2] https://patchwork.yoctoproject.org/project/oe-core/
>>>>> patch/20260630074356.10265-1-marek.vasut@mailbox.org/
>>>>> [3] https://patchwork.yoctoproject.org/project/oe-core/
>>>>> patch/20260630074423.10306-1-marek.vasut@mailbox.org/
>>>>
>>>> Do you think those three backports can be picked up for OE wrynose ?
>>>>
>>>> Thank you for your help !
>>>
>>> Sure! They even are in the branch I sent for review:
>>> https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/
>>=20
>> Oh, that's nice.
>>=20
>>> Following Paul's review, I will most likely hold it for one cycle in=20
>>> order to merge
>>> the test at the same time.
>>> See: https://lore.kernel.org/all/=20
>>> c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev/
>
> Are there any news on getting the fitImage fixes into the wrynose=20
> branch, is this still on your radar ?
>
> Thank you, and I'm sorry for the push.

Hello,

I don't mind the push, it's fair :)

This series is still on my radar but blocked on a wrynose test patch:
Basically this:
https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-reatmon@=
ti.com/
... but backported to wrynose.
Ryan was working on it but did not sent the patch, I don't know what
happened.

Regards,
--=20
Yoann Congal
Smile ECS


