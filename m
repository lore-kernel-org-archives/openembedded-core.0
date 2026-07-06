Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5770C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 19:11:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157780.1783365069701309707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 12:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GFnPtqZv;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso32795255e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783365068; x=1783969868; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjS3IHY1VozfMcGCAd6SQAvOBOnB8gevlmQTrALxR14=;
        b=GFnPtqZva66nhyR6h5oBYQ+c9iIpDSVLEbm/GEIaapsnB31SxWRQOow3B/y1WqQ+yb
         sFx3HJXdtYVwZeGiyMyeD5ISLKiXO19aToKHGHtwP26dc09kLp1ma8ZRPlYaqYzoEY7g
         6+H83KrXlQknUaqpzY39y98c/Iv5EOAewfTd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783365068; x=1783969868;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjS3IHY1VozfMcGCAd6SQAvOBOnB8gevlmQTrALxR14=;
        b=smxZ6Ra5LvFuh+OFfivsdt8wC6ZgcaokJpMxKiGp/HV9Irv/7iaTA87u5Xi7Nl6MJI
         KfSdS15JRDbv2tywDb/qBdZ4szgXiZUh96Cwox7z5NV0xRN6Ut6zdnfuV+79CkDSD8qQ
         XPQ2H4ADMhODbMZy/Mpv+cBkPMhCdoKjJ0mIU3Nb+E3CxI9XqGZJEH+3ld8Hz+/ocFBi
         0Nu4pXy/hOFM17qSYlcCX2me12hEcmGMJgLPcyC6+phAwjaI5fDnn8S4hpWpTC5Ed9OT
         O7uZwcUyMKNeOXBvoWufASnyDSP0fZ3KLh3agdSsA5YXoE0FVRd4ZoEGAE0cYkEenE/N
         XANg==
X-Forwarded-Encrypted: i=1; AHgh+RppWNvwKi93+QXMQZqe2VIKb6UMVg8Au0Hec25dPbScCGmYsxzylWKlYXbPLnVeziXbaEqO8XdF0UnpLWeRbo7NWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw571vRibuvelpbJBd36VHlh4y5mxTEE0SyFA2q2BsC3DI7rYK2
	FKRa0bBvPj3WxXtvcNqtMQ8eWvNNtBeWczZJnpiw73E3KpEyRqr5W5qZ2iHC7pd7e+c=
X-Gm-Gg: AfdE7ckqq8t5YeOV+cSthBBnHhwON65qtTNVGkw1+YBkrdrHs464wBJjFiwWgSi0+DL
	VQf6WjUevehgW6uTzKnqWdmW/FPQ5vC1kp5IP2xNnY+frttciIuuxGqBOX0Wsv8CZ9B20NtTFXd
	zjcdxpE4p5Am8jqLLZ5RQAmZ4s/L19W2v7SZkw5KVgdAO408kQnysf+s0AwxLYt2kafYVvvnBK9
	b+7tPbRgh610ZO6ROX4kHtEchMhcpo19h4GDnGtnmLnDab2B5d9bQPS1P1LPcS0UdzTvTBIli76
	ffBK+Uc21TfhVe35U1bGyezg8GrA+lNaEmpJbWNMjZ4o+JoPw0dqMJW9OD+P1QUmWIVrvRinNqC
	lKHLOSmu5Q35BkL5umqG53ecGqLTSdn5lFcyB26fMv/xqO2AmPKAM0xxytQy9dsDVMmPBSa4BtH
	sB3UZskkupJp8=
X-Received: by 2002:a05:600c:2244:b0:493:c378:18b3 with SMTP id 5b1f17b1804b1-493df0aef42mr15054365e9.32.1783365068012;
        Mon, 06 Jul 2026 12:11:08 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e006b6b1sm7301445e9.3.2026.07.06.12.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:11:07 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:11:06 +0200
Message-Id: <DJRQ5LCFHTZH.1TS5PO223RSZF@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] perl: fix for CVE-2026-42496
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260623060344.339663-1-hprajapati@mvista.com>
 <DJG8MI4MVEDF.33LV9PHJO05IJ@smile.fr>
In-Reply-To: <DJG8MI4MVEDF.33LV9PHJO05IJ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 19:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240340

On Tue Jun 23, 2026 at 9:07 AM CEST, Yoann Congal wrote:
> On Tue Jun 23, 2026 at 8:03 AM CEST, Hitendra Prajapati via lists.openemb=
edded.org wrote:
>> Pick patch from [1] also mentioned at NVD report in [2]
>>
>> [1] https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c=
1485e0b2cccd5a9158
>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-42496
>> [3] https://security-tracker.debian.org/tracker/CVE-2026-42496
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> ---
>
> Hello,
>
> Is that needed for wrynose and master? Since this is vendored in perl,
> this is not trivial to check.

Hello,

Gentle ping, is this patch needed on wrynose and/or master?

Regards

--=20
Yoann Congal

