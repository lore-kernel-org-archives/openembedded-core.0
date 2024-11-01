Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25539D5CC99
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 09:19:04 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.33720.1730452737492947135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 02:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TT0IuUlb;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so18378331fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730452736; x=1731057536; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VPiq0NtOsMPMSQmOMMTT51PNsPY0m3vSiys6zG/Uf7s=;
        b=TT0IuUlbRdfyZiZDGRJ7QHnEerCVGLlRtpPCpOQ9Q3iE6tQNYixk86buEzTxs/xmsf
         GbEXyw96W/oFsM5aHjxuIGNRG3CseadB5sM32FN0NIiGZuJOd9eHpW587i0ipmpptSx7
         /ll0i+TI8Nj+UkroeUmM6iKhcjpl+sjLQ4SQGIk7nJIJsw0QmqUmNbe7gXLegsfhqE/J
         JX/lJMKWkQf2iwyYUfIWAiXbxwf1IgbRXy5kA77j7u8xPDqMnFfN5ddhE8Vj3IgHJX1W
         vr5a2t8qD6uwqNQAsQ81WdzIHRJE8ySNNmp0WI0TEnGCdLG0xP1EEvRd2Ldggpa1YBG4
         xK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452736; x=1731057536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPiq0NtOsMPMSQmOMMTT51PNsPY0m3vSiys6zG/Uf7s=;
        b=S0NEXDdtxT1wK//+nV3xPsGNZDU8q3kuRsZatGlKAP2jguWIPd39N8ndnwuO8t//6z
         Q+lYENg+o/KQ/hdBc5ge+mvCfRDiCMv6W+3HD5JnF/UO+7N0dCxsQ1zjV/CEEc9nO2d/
         t4ix0lbeg/WpitAIYv1SHaOfgfXw53AX+C6tar94alhl7TktJ8oa+qBUpV0GRT9o/B+q
         Uzc5GriHpHhjB2/OXPUU90l8+8yBbO/XCJLkz4niydCUeu3iwcgUonZtI0EK7xEgtFb2
         ddu3gFK4EeFsV1abXalCl8K6FbmMoXiJdQu91seMv59IzDR0hb9he3VuDn06Ya56CKCO
         oO3A==
X-Forwarded-Encrypted: i=1; AJvYcCXgYssPaPHNI9zFAGk+UEC3dWFK5pIzyDIhzaQwuileOiOVwWa+EKsw+GoJsnhpJO8woeKPvxA53JCbPu1tK8EHkw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBnFvawNs5ukGLgesVQcprWYBYMYsSmt8HbjuwbFH2lgZdThyi
	2+cY7VBlYhS0l9mw0a8OXZbDB0+FuHuA9uPbaCQ++Iig/Sc5/mk7HKmf9lry6gap7+nDPrIdmAy
	4bBZjhlb085NwxUOf6FrvSufas+z0+psG
X-Google-Smtp-Source: AGHT+IEoNdg2WrfSbWBKGsaaV/g1AGv1OyehdUVt0UfWxjMCl3VdLhMK0uSJjlxxvpqh7CN+7dNyRArLvISXZXnU1RM=
X-Received: by 2002:a05:651c:211a:b0:2fa:cc50:3f2 with SMTP id
 38308e7fff4ca-2fedb79674dmr16161941fa.5.1730452734374; Fri, 01 Nov 2024
 02:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <TY0PR06MB57070328EF6E490CA8B8C0A8E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CANNYZj99sKhO24ehF4ks8cWCJa_kg92vGVML8PqtiQFTwnNEaw@mail.gmail.com> <TY0PR06MB570773E5E2D81502B5B30AAAE2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
In-Reply-To: <TY0PR06MB570773E5E2D81502B5B30AAAE2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 10:18:42 +0100
Message-ID: <CANNYZj_yPXT4oyxj1_VWT0tCEw5mcjfZbb06YYguCoTUVnVmVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] wic support different sector size
To: Vince Chang <vince_chang@aspeedtech.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 09:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206613

On Fri, 1 Nov 2024 at 08:37, Vince Chang <vince_chang@aspeedtech.com> wrote:

> I didn't realize that stderr=subprocess.PIPE could be used. I've submitted a separate commit.
> https://lists.openembedded.org/g/openembedded-core/message/206602

I just added one more fix that makes runCmd actually print stderr when
it's split from stdout and an error occurs:
https://lists.openembedded.org/g/openembedded-core/message/206610
and with that and your two fixes everything should be working correctly.

Alex

