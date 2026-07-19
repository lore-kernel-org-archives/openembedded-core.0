Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D0DC44521
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 14:07:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5811.1784470056030086796
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 07:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LyTdQE8b;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso3789325e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784470054; x=1785074854; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wh3fHZD2jMmW/G9z+a0oKmTlWi48wYIFJNjtPhtlnJ4=;
        b=LyTdQE8b6/3EqfmRT13+d3bZawF8+ZpoiysdpNltO6MQ+90KawDO5OlOs5O0NtX67E
         dwQmJZqvv7Mm7jVTYmCoPKZnpvsPNwTr23liUYJA/t5ISSTqBfakp8pbWanRYK7h5yiN
         yCJ1zmtOTbZNxM4p2o7It9D2BuchPXRcwbThM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470054; x=1785074854;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh3fHZD2jMmW/G9z+a0oKmTlWi48wYIFJNjtPhtlnJ4=;
        b=I8x/ULwP0Rde7l4hMHz1Aw8SQvb//ajBoj7NYGEMBgnpYW2L6c2+zWY4pIMUQdNbGT
         7JKXymXHf93NP6Gt+MiVPANiW6eFzPo6o45CgpNrXChIgTz4RfO+I3iJCRLjjkAEsVNA
         q3K/RDYE8wMNndBAJMRAGuRy1G93b+Idh+Z/YgTKmcjIGyt68c2od94ALOIBQwn0oV6O
         zQyQcCaTncLZrvpsJ8a3NELAgpOjA0KiizZajSLwgwu7xKAXbLDh3ItY52jDLzpjLM7D
         ZonhnWhdVSV3lkzBK7rZRSFmAz5JFxrtTA1t6SLuboK6t+sXGayOiDX4xiB/wM7Swmzl
         u54g==
X-Forwarded-Encrypted: i=1; AHgh+RqLIUyTRbQv8qcMzV6ARHzsD3Ip38XM3uB5xpIpixHhnwcE8vGT1MQcYThCjkaOw0TklaHATloY0wm868ho+2j39g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxn2k4yBpUM3aw0FkBSbFrygxM6nlBDEWr7IjXNfNAqFhlbuReB
	J2kipymtCPUendoXqV7HaRNo7XJgvVsJXw1OrApV2jKRHeA6rnaQrMTGbR6mJIFhORc=
X-Gm-Gg: AfdE7cnQIy+zipHrZCvV8mEdKWqksC+f3O62Oh6yOF6RLDUSd0PZBwTD5D1/Imcy8vP
	AlrCwhVOFwDGdR3VAg0aZHD2JMlyBQ5DE+Q2bZudC5qPRhV8n/IXMDJWR0x+IyKPAnUdtY6yx/7
	YnqdhKZP4Uo2+TRDr3y9dZ5+MYKD8Mnf/PnE1gwQKR2PVe3bnwjdDE9eXPz9nerkRjfRvopWcMJ
	y1in83DATJsVXdywEeh09uAYmm+3bpjaSx8wFxzLBSFc1E6y/cdqrFqTOYL7+gfdueFuhz3vK2d
	SAWokvHm2GWQIGih4NS8fjqudL9L6IrQO4a9dTNZDxpgzvlRtXDKoVfC9IQTqwRCxBMmK7DlkdD
	6xMIG8o5zWWEXCdz2koRTUdk9ZD8GFiNjEW1PJs2QCSKvVj/fO9VuHhPig61Q79EKxrfKhi6L5r
	qfYN3wNf6yP9CrDUsP0NELSFnInVLqNEBNRSEhHLGDMTV6CMAF/JR6UNXiUaz/mHLQ51I=
X-Received: by 2002:a05:600c:b99:b0:495:4cba:e288 with SMTP id 5b1f17b1804b1-4954cbae4cdmr98055825e9.15.1784470054214;
        Sun, 19 Jul 2026 07:07:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm243799285e9.11.2026.07.19.07.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:07:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 16:07:33 +0200
Message-Id: <DK2LU9CNKQC5.2LCBVE0IV9971@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <deeratho@cisco.com>, "jeremy.rosen@smile.fr" <jeremy.rosen@smile.fr>,
 "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <adongare@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260601134257.47867-1-adongare@cisco.com>
 <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr> <DJRN1II8LYOQ.1UZ61N9NS4OI8@smile.fr>
 <DM4PR11MB6189FF1EEAD34B988F834A8DC4FF2@DM4PR11MB6189.namprd11.prod.outlook.com> <DM4PR11MB61891DE87D41D71FEDE29E81C4FE2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB61891DE87D41D71FEDE29E81C4FE2@DM4PR11MB6189.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 14:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241285

On Thu Jul 9, 2026 at 7:10 AM CEST, Deepak Rathore -X (deeratho - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> I have sent the wrynose patch for this CVE: openembedded-core@lists.opene=
mbedded.org | [wrynose][PATCH] libcap: Fix CVE-2026-4878<https://lists.open=
embedded.org/g/openembedded-core/topic/120185745>

Thanks for the wrynose pathc. Now that I can look at CVE-2026-4878 for
scarthgap, I noticed that we received an earlier fix here:
https://lore.kernel.org/all/20260520091430.3075624-1-hsimeliere.opensource@=
witekio.com/
The patches are identical, I'll use Hugo's since it came first.

Thanks!

>
> Regards,
> Deepak
> ________________________________
> From: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <deeratho@cisco.com>
> Sent: Wednesday, July 8, 2026 11:50 PM
> To: Yoann Congal <yoann.congal@smile.fr>; jeremy.rosen@smile.fr <jeremy.r=
osen@smile.fr>; Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at =
Cisco) <adongare@cisco.com>; openembedded-core@lists.openembedded.org <open=
embedded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
>
> Hi Yoann,
>
> Anil is on medical leave. I am working on this and will submit the patch =
for wrynose by tomorrow 9th July.
>
> Thanks & Regards,
> Deepak
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Monday, July 6, 2026 10:14 PM
> To: jeremy.rosen@smile.fr <jeremy.rosen@smile.fr>; Anil Dongare -X (adong=
are - E INFOCHIPS PRIVATE LIMITED at Cisco) <adongare@cisco.com>; openembed=
ded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@=
cisco.com <to@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
>
> On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my Rosen via lists.openembedded.o=
rg wrote:
>> Hello Anil
>>
>> from what I can tell, this CVE was fixed in master but not in wrynose
>> please submit a patch for wrynose then ping this thread so we can apply
>> to scarthgap
>
> Hello Anil,
>
> Gentle ping for this patch, do you plan to send the needed patch for
> wrynose?
>
> Thanks!
>>
>>
>> thanks a lot
>> Jeremy
>>
>>
>> On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>> From: Anil Dongare <adongare@cisco.com>
>>>
>>> Pick the upstream patch [1] as mentioned in [2].
>>>
>>> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D2=
86ace1259992bd0c5d9016715833f2e148ac596
>>> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>>>
>>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>>> ---
>>>  .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
>>>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>>>  2 files changed, 163 insertions(+)
>>>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.pat=
ch
>
> --
> Yoann Congal


--=20
Yoann Congal
Smile ECS


