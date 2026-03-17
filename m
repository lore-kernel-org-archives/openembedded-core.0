Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FF4FD7077
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:37:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73015.1773743861998536886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 03:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aKnFSRd4;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so65158855e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 03:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773743860; x=1774348660; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Yyfbzdc9f3oAymmhdbC1vxD3zS2AF9UE5kLCvsa1Kc=;
        b=aKnFSRd4FNOGp6q9jPdpjy25knvhNBLrgSs7C1jod6Uc1aT2JSqRAD3Dq0vtIgYg5W
         HqtF1Y+36qjM29KWm8S0akSaywPAY7eqpG43qtNk9D+wh80KRprrM92BuEdnAMK0zMCI
         igNd5i4uOSfWOFCBdxyVk3nbfxyZLRw6KdpDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773743860; x=1774348660;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Yyfbzdc9f3oAymmhdbC1vxD3zS2AF9UE5kLCvsa1Kc=;
        b=DPI9zA2vCsntrVLTa/YJj3uuLtpnJxFN1HWh9pQOeCS0kfO9ZJcTcOPQ/pbz/lyQkk
         IgJMPsL2Hoqlv3eZRvv4M/nWlYE/gepszcQHcvqGC01OyQawuULuYRmlwLQI9c6DLTeq
         hVxz7VQXj/rA8GciSq0tHa9bO45OFAzCH9T9c4Pqv64wuEbvcshfrwkuwla30eFyw+l2
         qU30wMy+x0aAxLOMCYO4rUIqtkJebllswRKkM/sgf4p4D4jCL+C1Yn74XtdaktSb2Ju/
         K7AGXM6M0EE9iIiwiJ++nz6sLgNmt4afC6rB9PnBovr30SkyNdmod4lKxPQj+a0oHs+m
         /NHA==
X-Forwarded-Encrypted: i=1; AJvYcCXq5/Kv22yJrO7fgST9c6+J3MqknRgrJSaFV4OoIcp7y3lm7ql+p5oU82a7nNKWR9fAUCjy8huG5xtJOKK7+OfjBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyqh/dEVnmIHDunJBdWfrZu0CQhfCrySHIhl4JTj/hJd4kdQviJ
	5543NfHPWfzVZ5Q0YjIANRbLHCSqH+9P3Om+ZVOQ+PBwagsSJCcLg3urA23HKreQYyXyc2oEHh7
	8MYQk
X-Gm-Gg: ATEYQzySNwmWTPA+zw3vLr6gh3rqdDrUPraufYyavynIxDFZQ5tnzyjcmYkfSBBgNKc
	ZmACB+cTKFOqMUeeCfVL6waJYFj8qOgH7mNdffe3BQoLwAVksuwLLISBhR3L+W/R9sh8p8AFxnA
	Gv1j7Y0S9/KtxggjZ4PGRLA3sFaFxqgDXMgl+4WoBLKKVFd7sqIERsnZX+Njbhr9aCCLb/h46/x
	0dItXOBZOT52Q3D29G+gpkVsy+hp9SO9Lg/DsmKQH0ktSxUCBhn65vV4b3OEoTBPHiXhz6IrDJV
	DM6u77DEWjTVdSJ9e9nmZJoQmMrG7tJf3afA3trbVb+T5u+mQUlndBzBHbRufNySJhYNbVlcFMv
	BXHYiXlkVV5Ejse6diAge1OHNUFu238PAzelbTikJNLTJbf7keflk30MrLU7pGMjqdCEn8cfWsI
	5mPDLoWeWHOMQbPPTQGrJX8dnVWsr+CBjROhPydrySX2erSUJyHT0pO5JpVKDMnrQYh2xyWlye3
	JY14AuuaOE=
X-Received: by 2002:a05:600c:a46:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-485566d6ff2mr283436455e9.11.1773743860156;
        Tue, 17 Mar 2026 03:37:40 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm56049308f8f.27.2026.03.17.03.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 03:37:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 11:37:39 +0100
Message-Id: <DH4ZQ006HVA6.1FE6V4SKSXXAT@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH] grub: fix CVE-2025-54770
X-Mailer: aerc 0.20.0
References: <20260305121517.15675-1-hprajapati@mvista.com>
 <DH2N7SRYPRQ3.39K4ACZDXQF9@smile.fr>
 <411950.1773728651584044067@lists.openembedded.org>
In-Reply-To: <411950.1773728651584044067@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 10:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233313

On Tue Mar 17, 2026 at 7:24 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Hi ,
> Yes before this patches , code is vulnerable. see [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2025-54770

What makes you say that from that URL? I don't see it.

> I just back port the solution from commit from Debian link given in [1].
>
> please check it.

The way I see it, the CVE states:
> This flaw is a Use-after-Free issue, caused because the net_set_vlan
> command is not properly unregistered when the network module is unloaded
> from memory.

But, the net_set_vlan command does not exist in our original code (at
least it looks like it because you add it in your
CVE-2025-54770-01.patch aptly titled "net/net: Add net_set_vlan
command")

I still believe our original code is not vulnerable to CVE-2025-54770
and that CVE should only be CVE_CHECK_IGNORE'd.

Did I miss something?

Regards,
--=20
Yoann Congal
Smile ECS


