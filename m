Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EEEC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:02:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20902.1787662936944904209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 06:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Egu0x1Jl;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so4292125e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787662935; x=1788267735; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtS6IQ2EmutUXJ/m3lmjAden5oYw7/q3Wij5b+T5u1w=;
        b=Egu0x1JlTrVz9ZU369KG2/6evMF4RIk3sSp42qHA4Ozu//AvBiFTjYgje6TKnv4NLx
         7zflN6Cvt9F5sf6EmDoTuxYtTUkiPVRSRyuiJq5I43VFwHUFRdgMLKLJi/sPdktqyCLX
         OjMzdfrbNKlMjoURJvnsMk5LQ4VHOm0DZrlq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662935; x=1788267735;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtS6IQ2EmutUXJ/m3lmjAden5oYw7/q3Wij5b+T5u1w=;
        b=Jy5Ojx8kdSGQDvxi5VLnKemPHIDMllOm1GNeqWJcNCLsxmX4llo97p4eV9O8wIiK/B
         X5/ykoF1JtFDzyzXis84qL2XaBgJ47kNq6ZqE+H6Vz1Hod2WeCCZq72eXlvXikjsQ73W
         Gg8nf9lgu48ZrcKmZRiDDdAKZ6Vwvd0P9L4ogSj/Tuq0GevkfUj2jdyioJWpBG1papV8
         EIL/EcYsQTuKm6B9Tt3YL9vk24qc8i8GHVysRavfMdTIAlTtckuoigCkgoyVj+rYPMzx
         Yr9dgTAosXO3EdaIuxkHr/0Z7QQmYcR6TpeH3063k/bCV89qNhBKwAFkGBhLm2UmrYX2
         WPOA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv4sALLjAH3FWuALq0bsdmLlNnnK/fTWKBd1I9u+kEQ15w1knJGRifspeR5nl+mUOE2i/0EUO3yPpy+Teryw9Ycw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lfnNWSlwLJ5rU6CqpoQ/lXTvSF6LSTFA/ggS5AU3fD91BClQf4
	sPKSgZVXynNuzdHEQAhDmxmvrsLEtLBZ8EGDGyq9ufaaL3S7VbnVVEeH3m8GQE9TExA=
X-Gm-Gg: AR+sD120rjVvykntaS88yAzB9AltlEofnYCP0sDdQsAm0KcPL+Sc2HLfyejn540Z5pX
	f2dHe3tTKbze6LipY2M1JB7/O+NuYwuwtAmE7z40xYuYsk85X9eJR6Rw6N2jTn1eNXFpaEzBtaD
	LfMSiQ4mjtVU9Aq91bxinxPMjrbiKK1ozd8Hbiia6k3NlVlS9Im8jYlvkXRjZsF09Skbp4KDO3k
	ByMRLr4dwAJLaDlaA08IGoigCpofibwkVX1V8NFH3iH/LeDKfixLJOCG61Fz7jSvqrGm2U7lqM3
	V4r5ZR21E1h7qfkyUjoH603A0EjZWsla+jMHKB62CCDzA64u4U/qC0rXXT1q2hjk6US2Iu/yGQ0
	vE9X5ycsx0mjaM2e6TCOWJxwJFRI4Yph8Wi40dcAEJWQusASRGZ31J/cbNXFnWP7yDarYPjWxkT
	OuW364Z78v1y8DQ7sQG+Va+CiGOQ1gg9CMwEJYBZcvrCOhCaKx7v75CBfrE0GtvKreMSkOYEgml
	JXvJPwRQZTDxnhjpthmkdi0hfjIv11uxqKHGK0BtgfIiAB9
X-Received: by 2002:a05:600d:8446:20b0:499:d818:aaea with SMTP id 5b1f17b1804b1-499d818ac72mr30223145e9.4.1787662935079;
        Tue, 25 Aug 2026 06:02:15 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d6364720sm29788455e9.12.2026.08.25.06.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:02:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 15:02:14 +0200
Message-Id: <DKY1MEN2FORH.2Y3M2K5JWUO13@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] python3-pyasn1: Fix for
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260715055355.20351-1-hprajapati@mvista.com>
 <DK187LU4ZQWP.1A0SLMXGHL48Y@smile.fr> <DKXWAWIH0YAV.28SIM2DAOM5WR@smile.fr>
In-Reply-To: <DKXWAWIH0YAV.28SIM2DAOM5WR@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244236

On Tue Aug 25, 2026 at 10:52 AM CEST, Yoann Congal wrote:
> On Sat Jul 18, 2026 at 1:14 AM CEST, Yoann Congal wrote:
>> On Wed Jul 15, 2026 at 7:53 AM CEST, Hitendra Prajapati via lists.openem=
bedded.org wrote:
>>> Pick patch from [1] also mentioned at Debian report in [2]
>>>
>>> [1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc=
2e5b3eff30ef0
>>> [2] https://security-tracker.debian.org/tracker/CVE-2026-30922
>>>
>>> References:
>>> https://nvd.nist.gov/vuln/detail/CVE-2026-30922
>>>
>>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>>
>> Hello,
>>
>> This patch is included in pyasn1 0.6.3 that look applicable on stable.
>> Can you double check and tell me if I can cherry-pick
>> https://git.openembedded.org/openembedded-core/commit/?id=3Da82592f0a7d
>> instead?
>>
>> Thanks!
>
> Hello,
>
> Gentle ping for the above
>
> Regards,

As you privately told me, I can consider cherry-picking the upgrade.
> No major feature changes are in upgrade version. They can go with 0.6.3 v=
ersion
> https://pyasn1.readthedocs.io/en/v0.6.3/changelog.html
So, I will drop this patch.

For future reference, I prefer public answers to patch/mails, those are
displayed in patchwork/lore and way easier to track.

Thanks!
--=20
Yoann Congal
Smile ECS


