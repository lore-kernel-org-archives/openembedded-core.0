Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C20AC531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 10:01:58 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19932.1784800915432500859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 03:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ieqZvCf+;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4720f3bf164so187163f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784800913; x=1785405713; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4y/HLEaj3+uAjgOmAnGmU3U3jA5UAID3Nxie/nSOCs=;
        b=ieqZvCf+CZHL1ec0VKkb59122y+PViwckOUqnIzxO6N8c1DBlWgH/0QJxtdLP/yUBd
         s22aip/htbBLcZf59DVf/S285ThS39oz8tE9GztFHbwTOb6AtFSXlpV1XztcOZePfSlY
         FnoqWOee733Nfr4qS7ERTVfERjRAhC3LAFDhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800913; x=1785405713;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4y/HLEaj3+uAjgOmAnGmU3U3jA5UAID3Nxie/nSOCs=;
        b=Hge0ceUtkNEI01c837Fx3xOrlXa9Aq6wmc+pAPEUg4ufSDBCjHChzDJa5u6dPZzUAt
         zjMla0L8sMQkO4tZeD8sjKph/MeWk3ezsgbL7nM/ukYw+f87JSGVRM7AxhixcPX/iyIw
         dTa9zzZtS074Hnch+XVX1zIWWPZEJuP1ia589OqDX4ZaZ2p549Z/CAA2InXgYE4v4Vvl
         yBeV1gMCuJxmUSjA+/P3wAVzvs24clg0voc5uf+rBr+rqFyTRDwG+xycUP/VccQrsFKz
         gx6Lvctp17XXI8VGD5SGu47AckHALEYfe9SEFI5ov4SxqvXGiA+/UOV2YrZpg41Lp3sy
         7cuw==
X-Forwarded-Encrypted: i=1; AHgh+RowT0ny3rrBF74PjQ5qkJcTlL/polb0mV2Y7/edy9VzyjXqaWaYoTQTYSF1DOyAMUE6bN5wn7aryrppmAd1foo6Pg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcmAOEtPy1M5JvrfgL+aDEAb9QQybgJuFwNtRNjEwZV1Wkc4zI
	gBFh13urPgCkcbgbeHzS5Wm5aqRXrUhxgfzwn9TntfalmZn/D1DLcsWc7615wxlWCsI=
X-Gm-Gg: AR+sD12VbYp+SB/DL2jyD1fPvOYRVQ1+96OKznUhGhjD4bKBKeZ0bombfC0jzZH2Hoi
	fe+dt8fZek+LySYYsrO3kdEItWkCbv0tWtMsUJW05YU85L4xp9GxUuPeD93snK7wx5RpaYDR8Ce
	QyA5qH2BsCX3p6P89ia8kF8Uxl7CgNLDVhfFGq1N65Sz+Z88OXQl4MtKGL0wGuKkw9DF0Xnm7pO
	Bu7pyqP0pAd45swE8N7JGSrlkezaIyazmOLVKKz5/G5zc6QsFlEoEqh0GsK//qTuP0CKvBecZLP
	Em/SX/gAODoeTwteZ1n1NiqbWtFmz7ELtmmyxdVMabNWde4nb5/OyqSayT8UzP4a3F6wadZebwu
	/CH/b+8luSEvYz7NYODrjLTw/ORjY/ix/0U6PJ4tSiEKHHCS2UQe0+ptLG9yq6Z8WYiBy0tMMjQ
	EB8d18YVxriBMsegEPwlrqaWUdW/AlO36cTof8FT06GjIpb9d2mwk=
X-Received: by 2002:a05:600c:310d:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4957450418dmr21609885e9.0.1784800913446;
        Thu, 23 Jul 2026 03:01:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956536870esm214915615e9.3.2026.07.23.03.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:01:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 12:01:52 +0200
Message-Id: <DK5V4C4OR0LU.3TX4H3M608KI4@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260625125532.185380-1-hprajapati@mvista.com>
 <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr> <DK2N6F9IW3ZG.1J43QNDS99AWQ@smile.fr>
 <DK389JR4BTT8.24WAJUMLMD609@smile.fr>
In-Reply-To: <DK389JR4BTT8.24WAJUMLMD609@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 10:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241819

On Mon Jul 20, 2026 at 9:41 AM CEST, Yoann Congal wrote:
> On Sun Jul 19, 2026 at 5:10 PM CEST, Yoann Congal wrote:
>> On Mon Jun 29, 2026 at 12:27 AM CEST, Yoann Congal wrote:
>>> On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.opene=
mbedded.org wrote:
>>>> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>>>>
>>>> [1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb5=
6f20d442df192b83
>>>> [2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d=
22ccce4f5ce05c84
>>>> [3] https://security-tracker.debian.org/tracker/CVE-2026-42011
>>>> [4] https://gitlab.com/gnutls/gnutls/-/work_items/1824
>>>>
>>>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>>>> ---
>>>
>>> As far as I know, this fix is also needed on wrynose:
>>> CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wryno=
se has 3.8.12.
>>>
>>> Can you send a fix for wrynose so I can take this one for scarthgap?
>>>
>>> Thanks!
>>
>
> Hello,
>
>> Here the current state of this series: Hold pending an equivalent merge =
on wrynose.
>> v1 series received here:
>> [OE-core] [wrynose] [PATCH 1/6] curl: ignore CVE-2026-4873
>> https://lore.kernel.org/all/20260629131453.1077612-1-adongare@cisco.com/
>> but had reviews and no v2.
> Self-replying: ^ this is wrong. this gnutls scarthgap patch does not
> depend on a wrynose curl patch but on this one (received in the
> meantime):
> https://lore.kernel.org/all/20260720065644.24395-1-hprajapati@mvista.com/

As a status update: this scarthgap series is blocked on a v2 sent for
the wrynose series.

My plan is to drop this series in a few week if the above situation does
not change.

Regards,
--=20
Yoann Congal
Smile ECS


