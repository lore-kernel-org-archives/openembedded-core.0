Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE02C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 13:26:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21966.1787664391874828206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 06:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qZxDiRpP;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso315954f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787664390; x=1788269190; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtcrVloNcEf9MhwZHMxAGp8vITgIROzHkIRsdZfrfjQ=;
        b=qZxDiRpPfKBDZbg5SU5ccdjlJ+e+XS9kD/w8tGrfFoTd88sNo6GEdCFKk5GJAMfvg8
         GcPYj3f8/+NMk69B81TTUkWaA22gFreNnA2rxEyksoKGv/kLinQsexcsErq3/uGzvPGC
         uvRFoQrg3qybukhdfTByBXcsRkqJ2pgD53CwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664390; x=1788269190;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtcrVloNcEf9MhwZHMxAGp8vITgIROzHkIRsdZfrfjQ=;
        b=UwZ4fesEzkvDw74XxDj3upQXlXeRTIzauV+eqEY2OxTS+GecxYrvLvx28TgwE7cQ1E
         K9rRlAqk74C0U6+OIsJcueBp1+9erhPpHTHhaQTGdRvfi0Jv+0oQhseNi0uBeOQZPm+s
         RshlhBR2Qe7xWEvN6SbfdkUz+t6bqBayGwtUlU/NC9RRRPqxG6mnTtzH1b4EIabEmizv
         wdAGPtoG/9F5QVv6G4oOeo5ez54Bcz1ZRvH0LLgEJVvsBewtH+FEWuW41rA9VoOIJjoh
         Bl8Tqmybbcm45kZp0dgIEOKykd3DzEBAfU1AnrSq3RhKE6Q5SI06R/854crvtHQzqPQO
         ivfQ==
X-Forwarded-Encrypted: i=1; AHgh+RorRB6RGXgLjXR4Go1DGdj/a/Err9uL0U46HkT0NP7T27o+y9K8f6yeNpBypqnEstjQCGVns4jAW16GzXpuaSI63w==@lists.openembedded.org
X-Gm-Message-State: AFuF++meGcEhfNebOo7PT9FHNfTtC4CT9F/mpDBiCnpjZAwGoxTOwhPP
	h7tfme1yCTdDRx5c2XSNefekGS0t493TbxlzS7kmgN9M4GvrT4PuttF33X4GPRsEe7s=
X-Gm-Gg: AR+sD11+/2KjU5xTRDd39FB0klMgKWMWA+jDrh8OkrMh391G8p+vBddw0+wvij91I3O
	AejgV68Skfmux+iGFMJNCQjCUOO3OcgwY3eeniEFNuWLeC8yGNiyo2WBvLTUmCFLuTvgzKBnVyN
	Kk2tJFI1Wf773QRf40WXFgRQnTkWs1oOoOUKz+rhIg4LReMVXTQpNyfma9NHiHJ+Mne0dAGNV5d
	oPVksPkAaqa4xjMlzQZ1mCxrnnkS8I4KuRemuOrB7I2KlI+zllueqdsctkyPqLMJA4p0pJgko1g
	ag0wat1O8zc2YYhmx6BZEksOKuZs81Oom11ko91bFMiadXf+XS3VuS/H8m3+VwC/XMAyxDUcOzr
	dhNa+BoMNsV1EsQod9c53KiPyT/68lGUNoaP+PjBwiZj+zKAvuijlwAq5WT4skayaPevGAK/7HR
	rY88IQIphoQfdNN6gYrrUVRyh3t+rD6Or67C4MZ50OD7kbJEY3RSCzo6eREzTpLj0+hmrVEftZ6
	B35hxiTDs934PXiPYin/k+GDOUwwwTwx8F5QCweQX+A+6eP
X-Received: by 2002:a05:6000:2383:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-482c81c0377mr29516890f8f.16.1787664390001;
        Tue, 25 Aug 2026 06:26:30 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0acaesm11702672f8f.29.2026.08.25.06.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:26:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 15:26:29 +0200
Message-Id: <DKY24Z052ZHW.1DIVWIX99A1N5@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722101230.34771-1-hthakar@cisco.com>
 <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr>
 <18C4DECEC4DDFC1A.1355869@lists.openembedded.org>
 <PH7PR11MB85986421972394BF2C2D53E8ADA42@PH7PR11MB8598.namprd11.prod.outlook.com> <CAMSfU+6-0HABPr=nm0kjkj=ByF1_PbU+O-ZrGyQ4zVp-OGgCqA@mail.gmail.com> <2716314.1787663222100636520@lists.openembedded.org>
In-Reply-To: <2716314.1787663222100636520@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244240

On Tue Aug 25, 2026 at 3:07 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> On Tue, Aug 25, 2026 at 05:01 PM, Yoann Congal wrote:
>>=20
>> Le=C2=A0jeu. 20 ao=C3=BBt 2026 =C3=A0=C2=A011:11, Hetvi Thakar -X (hthak=
ar - E INFOCHIPS
>> PRIVATE LIMITED at Cisco) < hthakar@cisco.com > a =C3=A9crit=C2=A0:
>>=20
>>> Hi Yoann,
>>> I hope you're doing well.
>>> I wanted to follow up on the patch below. It appears it may have been
>>> missed during the review process. Could you please take a look when you
>>> have a chance and share your feedback?
>>> Thank you for your time.
>>>=20
>> It was not missed. I've answered that it lacked a master equivalent befo=
re
>> I can consider it for wrynose.
>> Has this changed? In that case, can you provide a link to the master
>> commit equivalent to this patch?
>
> Hi,

Hello,

> This was a series of four CVE fixes. The patches for the following
> three CVEs have already been merged into master:
>
> CVE-2026-58469:
> https://git.openembedded.org/openembedded-core/commit/?id=3Df55c2f60daa1a=
125fd36aa254abb16d431b55042
>
> CVE-2026-58471:
> https://git.openembedded.org/openembedded-core/commit/?id=3Df910a8beb7bb8=
fb3b41a240dfdad36f76d6b482e
>
> CVE-2026-58472:
> https://git.openembedded.org/openembedded-core/commit/?id=3D8a77e738458a7=
5186c3bff6c4a97cd87d3aee632

I can consider those 3 (hoping for not conflict).

> The remaining patch for CVE-2026-58470 has also been proposed for
> master:
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260722081735.1=
4807-1-amaury.couderc@est.tech/
>
> May you please review the remaining patch?

This patch is in the "Superseeded" state and is from a month ago. You
can answer on it asking for its status.

> Once it is reviewed, could you also proceed with the review of the
> corresponding wrynose and Scarthgap patches?

I regularly re-evaluate the "Awaiting Upstream" patches but you can
expedite this process by pinging here when you see the patch landing on
master.
In this case, we wait for "wget: fix CVE-2026-58470" landing on master.

Regards,
--=20
Yoann Congal
Smile ECS


