Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26F2C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 16:17:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154960.1783354650395444605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OEcamhdP;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c83474ddso29492365e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783354648; x=1783959448; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etWbKbbX/jhOXt5UsORdmQSE+LjNqde3OnWTW3Yzs78=;
        b=OEcamhdPUGzu5BAA1n5OKa9eP0odyjAR4u/2X8tW2tW0uO3JUpFxkM4t6wDkByM0/S
         4zVrY638eOKXH2dNxIYguyKShQ3W6cQioext0XZ1H0+oUw7NdF2NzOQkkdpIcg2kIOKN
         LeDmqfGqkU5I5laTsXsU0cTfHw0B7tvIt93Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354648; x=1783959448;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etWbKbbX/jhOXt5UsORdmQSE+LjNqde3OnWTW3Yzs78=;
        b=dFlc8xBazSbY9nh1/FiNnuhmbY/FI5zw4K/Ycu4OPflI60+EnSN5z3cmpoJq9HmbRt
         kjnpwOoIgy7VDzoSo2DgTjxOFZxRCDIlyVpjBoJwzN3ypYBSWfcXw7+z0nFr4kxRuBak
         lAYfqeQooPaYMI9TonySC8pP2JA0zYBZO3Re5f2mZ4QXrzuv4h+gMpqrtCAXQggqgchE
         CqBOK+ZumRNHMnLtgSe9tlGBODdsuzwwTXtN1EH5kEnOEoxtCAKgLdNl4vEFJYPgeBrG
         Fuh4s3anNS+qq6VerryBU4gVaYg97BIE5OAYvQjmgPrgyjMHXH6M+ttyCL92CwzrFGCL
         XSIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM+a0uV1z+cJhAf8s+crGbpVQIJQJYiImAEz60mQ0Zlpo+OjRr9GmDGTP+f0VNDiqclrjFgNT2n9Sx3voKs2MfyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRfpH6O9HiBco/3uwKCwQ842xpqNlNSWIAHyCi8jFRG5jT5z8N
	seXC6pyJcH2uTCQnPFFRiyRCgQ/32wx6rTEp28GtalwwjvOnKf9vzSH/rq1WLue8Psg=
X-Gm-Gg: AfdE7cnMHcVBj28nUL0UbcZfPy6HzK6Z42LA270LXsQUibe8f+GoEN58nt2et7ULsDU
	Nmwn2sZSESO3VdvU6OsT51qpQomXn1t9I1nHvlBgcyKiwoldUKxY9zF3KLI6eE/AqtbosCH1p2j
	BnrHneVW0lrNfLg899gjXkEkcfVl2Mui2am4oAX0D4gQ4K2NsJqDvtODZBPFywI0JtncPNzmC1i
	YYrKe9/HQ3td4diwizxVHvXuLDDUC43YXz+TalcDIefYdRO8t4frbyqKNI3817+1srXUbAZXC4D
	n6UWIAAqlwdEz8GMwy/iStZ4N6BatY2yhcMrIVh/YwSdB/kDo+Le/Aq6CZx9Hsl6D+tJ1FMDdj4
	cu/cnp3C36/gEmbbjT7fzZnqNOzDXrZ2fhhdvd2cTjKz+lfid/LvefNAheTdZbu5ua+soB5aFGi
	Qvt6yS/bxWnJc=
X-Received: by 2002:a05:600d:6413:10b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-493df0b6a9amr11634525e9.5.1783354648537;
        Mon, 06 Jul 2026 09:17:28 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm338958185e9.3.2026.07.06.09.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:17:28 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 18:17:26 +0200
Message-Id: <DJRMGMKZZY9C.9P908NUEEHAU@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: Fix CVEs
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jeremy.rosen@smile.fr>, <jackson.james9803@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260529042811.2210385-1-jacksonj2@kpit.com>
 <DJ3Q5V7ZPES9.12KY12E2IQQ53@smile.fr>
In-Reply-To: <DJ3Q5V7ZPES9.12KY12E2IQQ53@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 16:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240279

On Mon Jun 8, 2026 at 4:07 PM CEST, J?r?my Rosen via lists.openembedded.org=
 wrote:
> Hello Jackson
>
> from what I see all the CVE are not applied to the upper branches of
> yocto
>
> CVE-2026-5450 is applied to master but not wrynose
> CVE-2026-5928 is not applied, neither to master nor wrynose.
>
> The other three CVE seem to be backported correctly
>
> please submit for master/wrynose and the resubmit for scarthgap

Hello Jackson,

Gentle ping for this patch needing patches for more recent branches.
Also:
* Please put the CVE id in the patch titles "Fix CVEs" is a bit too
  vague.
* glibc CVEs are usualy handled via upgrades along the stable branch
  instead of backporting individual patches.
* Nitpick: the CVE patches are usualy simply named "CVE-XXX-YYYY.patch"

Regards,
>
> Thx a lot
> Jeremy
>
>
> On Fri May 29, 2026 at 6:28 AM CEST, Jackson James via lists.openembedded=
.org wrote:
>> Fix the following CVEs-
>> CVE-2026-4046 CVE-2026-4437 CVE-2026-4438 CVE-2026-5450,
>> CVE-2026-5928
>>
>> Signed-off-by: Jackson James <jacksonj2@kpit.com>
>> ---
>>  ...ount-records-correctly-CVE-2026-4437.patch | 248 +++++++++++++
>>  ...eck-hostname-for-validity-CVE-2026-4.patch | 328 +++++++++++++++++
>>  ...x-buffer-overflow-in-scanf-mc-BZ-340.patch | 138 +++++++
>>  ...x-ungetwc-operating-on-byte-stream-B.patch | 117 ++++++
>>  ...e-pending-character-state-in-IBM1390.patch | 336 ++++++++++++++++++
>>  meta/recipes-core/glibc/glibc_2.39.bb         |   5 +
>>  6 files changed, 1172 insertions(+)
>>  create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Cou=
nt-records-correctly-CVE-2026-4437.patch
>>  create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Che=
ck-hostname-for-validity-CVE-2026-4.patch
>>  create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix=
-buffer-overflow-in-scanf-mc-BZ-340.patch
>>  create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix=
-ungetwc-operating-on-byte-stream-B.patch
>>  create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use=
-pending-character-state-in-IBM1390.patch

