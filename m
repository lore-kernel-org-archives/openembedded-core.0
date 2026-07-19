Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873C8C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 09:26:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2610.1784453165314011173
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 02:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MTjYA/kf;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954aff6088so12255995e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784453163; x=1785057963; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ult/QzOGtWy4Tw1HRfQ2l5q+SoG6lWQsy2tITxRZ7D4=;
        b=MTjYA/kf4dFSuvW2P+eJ5hf+025Zg+MVPC3/2t6OWu4KIAp4uITENHSAbUi0XKq6rX
         Tn7DPkAMapSMLOBlBDHc7FseO/4NSwTSyEw6hcEQDfgn10YO4bLioTAcCIzADQfPeugl
         YU9QG1ED4JkT1pNw6A5JDQFRV43z1ghdWoOo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784453163; x=1785057963;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ult/QzOGtWy4Tw1HRfQ2l5q+SoG6lWQsy2tITxRZ7D4=;
        b=NePrhjZERwimN0hrpJQ/3YqRtYG8SH8N/TrDx/Ndrqg14YPKBYhenpB4OsBLsq7/f6
         4XN3EGJgvn/JlHQqkAHimYwNPcoEzHLTbarwmAeGh7Z1MVJbsVhzDxFZn6gLHYGylArx
         t5G4P3irwHmVl5GYtDlIfg0I6vWked32G1h1lMAqsKOnMTxNAnYbHV4ooD21smAqEjPQ
         JN6Oqf/VdoXn9sGNo9x01ZPxdw2hvwHUpDnz1PcUPU7cWE7yumytLbPa425w0odRtqBY
         BquKlm8s3b/MgfS+VELwlLyy7pjc8XzO0U2CnCkVd1sZ7PpGi6o/fZeu0LQ3QqLwWoIJ
         TsiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIJxU9aLstkdM4pKwHUpHN6NxEllr5qUmJWR7WqdsHxNFgkazPMwkKTEpwuKaWDXdkTB6YTI/D4VBc2xk7Ke6DjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzLb5pnWjTMeqvaPnzOOT5OWjqb/WBBlbdgBW3FhPNr46w80O9
	sfLnTuegi0+I7OWLrhmS1SmV/VNQq2WkLQPI+lb80IZDF1miEsqLRv/Wj2l0sm3h67o=
X-Gm-Gg: AfdE7cmKxe6RwPx2D+WErOeiUSgfEqv+bL2dNWBvdmL+zjNDYciJMxDiMkekS6z4/en
	MzMwNwoh2qaiszHyCsxvhZ6pckg06h6cfkec07UPM32+H51HQJzR93DvaeWpphvqAq2Xh0in2KF
	LSCYOt2RMIrG9CObu7HFVcKilfLXAkaFBjcklXYGyHKjlG++ZF5DB1HKHp7CGIq3abcG5wfaRs5
	0F5OjcmCX5vPn2WdivEfEN9vn5IPvqDZEA1n6hOFlQPnT/KSoRBXeBfvLcid2JN1K836JLDbNiK
	YqRtinaQMvSfUcjMfXkRW5zaeolet+JzAdcXzLLsLr5Nv5qyStMCGbgQW2egJ9h14vK+4MTvB7W
	maCBaSBRby1mnLEiSWRi+2YYCEOCtzJ+ucSjQzjawUJixuaqqW02J7oddM1jCWaYRE2X0oYcFBY
	k+Dnfzeud9o9w2IGghE1o3En34QX9BtD9kJoM2TDlDtiBkkpDUUClsEuyh1ZNOVsJTT76FW15li
	5SNDA==
X-Received: by 2002:a7b:cc1a:0:b0:492:4911:8a with SMTP id 5b1f17b1804b1-4954a3dc620mr73786375e9.12.1784453163563;
        Sun, 19 Jul 2026 02:26:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm224823355e9.11.2026.07.19.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 02:26:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 11:26:02 +0200
Message-Id: <DK2FUQ2JUE5N.1CFTLSDZJJ0UT@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: Fix CVEs
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <jeremy.rosen@smile.fr>,
 <jackson.james9803@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260529042811.2210385-1-jacksonj2@kpit.com>
 <DJ3Q5V7ZPES9.12KY12E2IQQ53@smile.fr> <DJRMGMKZZY9C.9P908NUEEHAU@smile.fr>
In-Reply-To: <DJRMGMKZZY9C.9P908NUEEHAU@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 09:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241282

On Mon Jul 6, 2026 at 6:17 PM CEST, Yoann Congal wrote:
> On Mon Jun 8, 2026 at 4:07 PM CEST, J?r?my Rosen via lists.openembedded.o=
rg wrote:
>> Hello Jackson
>>
>> from what I see all the CVE are not applied to the upper branches of
>> yocto
>>
>> CVE-2026-5450 is applied to master but not wrynose
>> CVE-2026-5928 is not applied, neither to master nor wrynose.
>>
>> The other three CVE seem to be backported correctly
>>
>> please submit for master/wrynose and the resubmit for scarthgap
>
> Hello Jackson,
>
> Gentle ping for this patch needing patches for more recent branches.
> Also:
> * Please put the CVE id in the patch titles "Fix CVEs" is a bit too
>   vague.
> * glibc CVEs are usualy handled via upgrades along the stable branch
>   instead of backporting individual patches.
> * Nitpick: the CVE patches are usualy simply named "CVE-XXX-YYYY.patch"

I will now drop this patch in favor of the glibc upgrade patch received
in the meantime.

Thanks!
--=20
Yoann Congal
Smile ECS


