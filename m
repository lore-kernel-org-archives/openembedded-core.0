Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E39DC982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 09:56:26 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45631.1789984581765483318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 02:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Nqrf/g/m;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso15327745e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789984580; x=1790589380; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCODK0QKiZQ1KON+G/fEM+OEvIuSdec4K10ze0cLgNM=;
        b=Nqrf/g/mHbpo1DFifIYxCqqCZ6d2vlMfo2ExpWIwEpMz9M/HL5/xjXm3ytAnpeD66z
         npVTBbQMe8C25h6h/8Dq7EWnVPhm/hRktZxfvNjOlSCjjGOy8CBsWEWkwSJ+LgeLOE4c
         pvVlzwLOUerhXDuf1y867MhSnUGmoME3mnR+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984580; x=1790589380;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCODK0QKiZQ1KON+G/fEM+OEvIuSdec4K10ze0cLgNM=;
        b=hgDqDK1hlwFjGYgsE4lnQX2kDfIG1wTYF9Knu1sdrg9Wr9QZZWE8ZQV9JciJ8KNGXz
         lEcVE+24PL4wKgc8Pe6iNWzncDg1Ya+W+1e1spO2aJ2SDryg0j2yntErJ7MwzabXmzrY
         94Eki9vXeOGApXKzDDGgEg2Dkw5ykjt54oTzFPfGgfsNOwwFW1cEVr+z8P4AkOV5K4Ut
         mlBrEdD8E+/cIj7/hRCS+olUaq6py3BpIDBlhLlILpY0m+TjuvrJsSST9iBTIO9tOml/
         upAPXd6J6qxeNF18ZafWxk7KfVv+zTY8VFR9++9M9rrUP1lGHs/x0aXtF3PnhKMnj+b6
         zp1w==
X-Forwarded-Encrypted: i=1; AKwUvBzV+bOG8lWMrJHbRJYl1pySso5h3xX7QwVJD90HOxn3GQC+6uKmNRoOKGxC9OEMMNjVdS5SM6Fo/opuwpvT8r1SmQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++n+8eV3Jh0cEq/ylT0pytR3G72QRABZLx1w3HHiFyPS6MplvHow
	fTQG59CvfiVA3PzUm5nQe8oOGuwtT6x5Xmlrx+XJU/YxpVx/Cx4ZzZIqGr/N9APxG6Q=
X-Gm-Gg: AYBFou1RjvHVkZIOrb0WtBJLP2El2cNDOdBeIxKgEyX0VrEOsQ4p2CK4qEiDUXu0unz
	U/YbR8DNmAD94gAGxTJjoQWQ01BuhxPcsj+nmcR8fceOJR8H+DOKtQZOOtvU/JN9eezrSN84UZj
	49gPjRMMirAKOKPPbdYI+WwQb46dETW7AnKeJRLVBQ8wdmrxT4k3ZUspdUcteARouUZ3BjhB6v7
	aDMTlfMgjY0j/BYnMqdfF3euiCgTjb/E6GETFid67l0CYjArPY/Vy2VzueYua5KFYqd5olqVmEi
	oX2ZVGtl4mZ5QCCgqLtjEx5v3rdBvQOkqvqsIAf52TAPTr5JKY2YVN4Yzclbo101zZBnN+Qq3Bf
	O7GgMaiXksgi/vFpUGCaEDrH6Kgvu8UiDubY4E4c+ZWRtH8JXkIKpO4i5SWoxhjgMSGJrUAmu55
	B/d129hkp7K4yN9ql8VTZQc2aHwqEu9JcHawa0fjowDvoX2TZ7N40VbPzUYcqmZh1F4Xq2TTOne
	pWRuwvb7W022DOxTfADL3uNhIDh8/S7gqozeKPVb4VfdvuHHmJBJNrNIEo=
X-Received: by 2002:a05:600c:a14:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49fc574be1dmr139165805e9.27.1789984579762;
        Mon, 21 Sep 2026 02:56:19 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm21122457f8f.11.2026.09.21.02.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:56:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 11:56:19 +0200
Message-Id: <DLKWKRL5UB9I.DUNGYTI0Z9Y4@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] python3-click: fix CVE-2026-7246
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260821163206.882233-1-dkelaiya@cisco.com>
 <DL7RKML5YEK6.3MVF0E1O685WB@smile.fr>
 <199240.1788773192713715859@lists.openembedded.org>
In-Reply-To: <199240.1788773192713715859@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 09:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246312

On Mon Sep 7, 2026 at 11:26 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> On Sun, Sep 6, 2026 at 04:46 AM, Yoann Congal wrote:
>
>>=20
>> On Fri Aug 21, 2026 at 6:32 PM CEST, Darsh Kelaiya -X (dkelaiya - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>=20
>>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>>=20
>>> This patch applies the upstream fix for CVE-2026-7246 as referenced
>>> in [2], using the upstream commit identified in [1].
>>>=20
>>> The backport also adapts editor regression tests from the upstream
>>> test and documentation follow-up identified in [3]. This follow-up
>>> does not contain an additional production security fix.
>>>=20
>>> [1] https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db49=
4ebee4aef8f42
>>>=20
>>> [2] https://github.com/tsigouris007/security-advisories/security/adviso=
ries/GHSA-47fr-3ffg-hgmw
>>>=20
>>> [3] https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657=
edb8faefa4976
>>>=20
>>>=20
>>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>>> ---
>>> .../python/python3-click/CVE-2026-7246.patch | 245 ++++++++++++++++++
>>> .../python/python3-click_8.1.7.bb | 5 +-
>>> 2 files changed, 249 insertions(+), 1 deletion(-)
>>> create mode 100644
>>> meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>>=20
>>> diff --git
>>> a/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>> b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>> new file mode 100644
>>> index 0000000000..47ee1a551f
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>> @@ -0,0 +1,245 @@
>>> +From cb30f575b1a251e8698909bca2a443d41dad1824 Mon Sep 17 00:00:00 2001
>>> +From: Kevin Deldycke <kevin@deldycke.com>
>>> +Date: Wed, 4 Mar 2026 14:51:58 +0400
>>> +Subject: [PATCH] Document and fix command string sanitizing with
>>> `shlex.split`
>>> +
>>> +Removes last use of `shell=3DTrue` use for command invokation for
>>> defense-in-depth.
>>> +Refs: #1026, #1477 and #2775
>>> +
>>> +CVE: CVE-2026-7246
>>> +Upstream-Status: Backport [ https://github.com/pallets/click/commit/b9=
6c2601af4e01341b4d2c0db494ebee4aef8f42
>>> ]
>>> +
>>> +Backport Changes:
>>> +- Click 8.1.7 uses Editor.edit_file(filename), not the newer
>>> + Editor.edit_files(filenames) API. Apply the argv-list change
>>> + to one filename without adding the multi-file API.
>>> +- Adapt editor tests from b96c2601 and follow-up b5529479 to
>>=20
>> Hello,
>>=20
>> This commit has both b96c2601 and b5529479 squashed. Please keep
>> upstream backport patches split.
>>=20
>> Can you send a v2 with as the CVE fix (b96c2601) and its followup
>> (b5529479)?
>>=20
>> Thanks!
>>=20
>> --
>> Yoann Congal
>> Smile ECS
>
> Hi Yoann,
>
> While preparing v2, I noticed that NVD now marks CVE-2026-7246 as dispute=
d and states that the Pallets Click project does not consider it a valid vu=
lnerability:
>
> https://nvd.nist.gov/vuln/detail/CVE-2026-7246
>
> However, the published advisory identifies upstream commit b96c2601 as th=
e fix:
>
> https://github.com/tsigouris007/security-advisories/security/advisories/G=
HSA-47fr-3ffg-hgmw
>
> Upstream describes the removal of shell=3DTrue as defense-in-depth, so I =
wanted to confirm the preferred handling. Should I replace the backport pat=
ches with a status entry such as:
>
> CVE_STATUS[CVE-2026-7246] =3D "disputed: Pallets Click does not consider =
this a valid vulnerability"
>
> Or should I continue with the split v2 backport patches as hardening?

Hello,

It depends on the patch complexity: If it is small and easely
understandable let's backport it. If not, we can ignore it but I'd like
to see the Pallets Click project reasonning for disputing it please.

Thanks!
--=20
Yoann Congal
Smile ECS


