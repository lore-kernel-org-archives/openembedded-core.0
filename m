Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B576C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:18:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6523.1785313067734176227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GT99s5x5;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1178921f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785313066; x=1785917866; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7aLRzPIuKcxW+cYO7zflIzN/m8PZpx3PUcBY52Pm1r0=;
        b=GT99s5x5Hrxg34pHBnlK/8uzTpqRDrIciGgyiAnW7p0OE3PlIEZ0M7otLVHBF3oTSD
         f6RtiWszsNgSJGETkDPPwBfmaVByrIakTYel636U4EkAsNUeOOO5rcqNa9k7Du9Vlo25
         EFVEj4EqaN/z/+T0KGj7T4ozeRiWGuhvZjTeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785313066; x=1785917866;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aLRzPIuKcxW+cYO7zflIzN/m8PZpx3PUcBY52Pm1r0=;
        b=FhbRAsVYjNKO5VS8x/a51kwwygvQsSiayH95pKSkCwdUzn51xfM9Gaa/heoAb5KnUx
         TubC5VoB/U/4efAFXHDzwzqPUD6SEt1kOYildhBvueBtmVPqvpvlm+YmEBbb4gFnvT7z
         Yz9G05otRGuYlaJnyubzEvgL0Jvt/9XVyeS0BxRSGJVbsSwq/AM+R+5kC+rD6hYwl30m
         3oaNm/eoHK8LAYqsh9z9LcJS1kpbLtlj5s+hrkweULf31qJAEZ8oSsAgR5j2lRiJIuaR
         OuvSwEVY7+hGecbmwNxIod7OIVeZzEpRQ97J0zuq5pWZTWjPyJ7GXkfoObbdq50An/Kz
         3kEg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+6uhJLsKegWPUewjpuY+OKlVcLkXRfr1x/9a+XawgBZGOvtBqv/USbRzmBx7KKvYrvGb6AeOMza0N6yfK3C63dg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwruC+h1BejGvswpCwITAOtH5tFdBwvF35hdXGB8CJTom5jodCa
	PfOnA9olxebIygKfd8I4hZXkjahbjK5crME1P529eQKfZbWc7gjCB8/cUomrkKzqw28=
X-Gm-Gg: AR+sD118mCAr5OS8tIFFDVOAFO5c85QeuzPeS2+rEnlvc92MG7y0csqPh5OTQbe+YYB
	oyackXyGg39udn7kHHSXBDXx/5+WT9E6YvmvRB+t2fSaKqAmlYkmw09RT/sp/ldWU5EhgPorcrI
	8gWJo+oca5IARAYJSsqVLFRCpXmWmqlrwAIPnyRqLkjsgIMrA9q6+XARaeQfy3bHqDjseaGm0A/
	joi9LdIANTEcjleF+bLggTvR4bOgQi+75S6m4IBMDIgFGH2DCyCkI9fWf9wnZ1XAJpDlKGTJlm1
	j9+6MQ+SY2FuqBZka8Smsf545Ym3LSDRpZkD1TeEuPUsUiOrsNybp7xpddZXqR57F9uhtvwYZC6
	Jm+u5kw2/irZ35h+orafB/qTHiUWm/bJJrrEei5V4CBGXa+juqmNPPoSvZioy3H39pbCg/IIOZO
	xcgS3mrvOXIvpmjbtOi+GZS8gg79iUDn4lob4407K2w8W3W0fbBHqyYg4OQfsEVcUUWU7k+XCBi
	g04qi39IEKWRX3scWhe99gTQIogJID6VsQFcG3s3tUzShm7SuH7
X-Received: by 2002:a05:600c:138b:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-497fd2f9db9mr11775315e9.5.1785313065660;
        Wed, 29 Jul 2026 01:17:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b19155sm5349576f8f.29.2026.07.29.01.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 01:17:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 10:17:44 +0200
Message-Id: <DKAWNVBUB6U5.2B5F1A0ECCCNL@smile.fr>
Subject: Re: [OE-core] [wrynose] wpa-supplicant: add PACKAGECONFIG controls
 for suiteb, wnm, and mbo
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <miaoqing.pan@oss.qualcomm.com>, <gaole.zhang@oss.qualcomm.com>
To: "Hangtian Zhu" <hangtian.zhu@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260728090159.3864155-1-hangtian.zhu@oss.qualcomm.com>
 <DKA6WJ3DRSM1.15EVL7LBX6ZC0@smile.fr>
 <2ea06f45-ba2e-4745-bc49-7a6799531b0f@oss.qualcomm.com>
In-Reply-To: <2ea06f45-ba2e-4745-bc49-7a6799531b0f@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242258

On Wed Jul 29, 2026 at 3:02 AM CEST, Hangtian Zhu wrote:
>
>
> On 7/28/2026 20:06, Yoann Congal wrote:
>> On Tue Jul 28, 2026 at 11:01 AM CEST, Hangtian Zhu via lists.openembedde=
d.org wrote:
>>> Add optional PACKAGECONFIG entries for suiteb, wnm, and mbo and map
>>> these to the corresponding upstream build flags:
>>>
>>> - suiteb: enable CONFIG_SUITEB and CONFIG_SUITEB192 for
>>>    WPA-EAP-SUITE-B/WPA-EAP-SUITE-B-192 enterprise modes
>>> - wnm: enable CONFIG_WNM for IEEE 802.11v Wireless Network Management
>>> - mbo: enable CONFIG_MBO for Multi Band Operation extensions used with
>>>    BSS Transition Management
>>>
>>> Upstream hostap configuration keeps these as optional capabilities.
>>> Exposing them as PACKAGECONFIG options lets distros opt in for
>>> enterprise and roaming use cases without changing the default oe-core
>>> feature set.
>>>
>>> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
>>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit 38860938302e6167b1c890b75e808f3a4ff08805)
>>> ---
>>>   .../wpa-supplicant/wpa-supplicant_2.11.bb        | 16 +++++++++++++++=
+
>>>   1 file changed, 16 insertions(+)
>> Hello,
>>
>> I'm sorry but PACKAGECONFIG adding new features are not acceptable per
>> stable policy. I recommend doing this in downstream layers.
> it's a cherry-pick commit from master branch, by adding PACKAGECONFIG,=20
> distros can opt in to enabling these features.

Again, I'm sorry but, while this is required, this is not a sufficient
reason for stable branches. Other conditions apply:
See the "Stable/LTS Patch Acceptance Policies":
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_=
Acceptance_Policies
> Unacceptable:
>  * New features

And this is a new feature. So I can't accept this patch.

Regards,
--=20
Yoann Congal
Smile ECS


