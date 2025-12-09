Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A622D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:44:40 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4010.1765273472998788476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f7ix3G5P;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso430074585a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 01:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765273472; x=1765878272; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ET82EuvVz51ykHPiEHg8KiRSsYGfuVuMOIMUcbv+mRA=;
        b=f7ix3G5P9q9omi3wIX7wjeS12exwvLEfVC3DtoAJMRLq9wTgR8g+1i1+yCq6hICe7p
         rUD+qaXVUx4rfbmmCL2YfR1ZQn9T6yvOPdw7+8q1LuieJdDo1ofxls30mrRjUntS1eIC
         BRPjnkDeqZV8cAI+c31rGBhP6nFS1V8mc4UBdVHY5R7yCVfl62e6Vwj708tAKhSXJyMu
         77gYq7Mn680eIeOfg3cdibId+uLYRMBlHkuVSE4WyihVDSMprVARt5mjLICUcIeUvLBj
         Aru90YOFNbYjeKAPiE8sAYIomeUjQInNbI76WLoqxw7cDLZPxqikm5fr4U4WorYdUmCW
         Uwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765273472; x=1765878272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET82EuvVz51ykHPiEHg8KiRSsYGfuVuMOIMUcbv+mRA=;
        b=RoDW5V3NQExge97mn7w+Tx++tuoMvtLucS2Y2bRUCYzlptEiwvyRetv5HhPlWBRZyh
         eQtG2TKeAPAWXZTyPGwPpdpXuq7F9IST3tZHzDHM0MMSlZR5+d8KKoK9I3UVMhEM6jo8
         4te0qz4P3bwE/dJIuzlWb7bMQcpB/v8majT7zaai43SoutwXCDMY/AIRJtP2fed3ojFo
         /arQpU5bug9P9YGAXOdXn96K+xGsfwC90zqFQq+TpMehjcbczS4pGIgmPefZDOZ5PAWe
         g4QD7dVTJ0gyLhefAgP4/15VkrQr8VCXAir6hM9szZnkLogklKK1LJsTb1xxrCSA150O
         nslg==
X-Forwarded-Encrypted: i=1; AJvYcCWnYriYLWL3iuqQh223+9XWCwUy4/b1CF6O1N8Z3Z5aIXJDaihxKmQG7S/RXdnsJ1bD6edXWxze7sAiho/au9fchA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcpWS2NGtLYWZzPWKXoFX790KoAZj0PWCKAd9BgtUXR8n3N1Ta
	ODMh+8FvnhKpY2IPbwECE81qJpGQkK7BnQcwH2lNvFt8p01YD3Xe8vLn7i3REJUTJ+w79CQWu0M
	xMzQA6+GbAAPSQluVhHyeOPcCYP1ORwk=
X-Gm-Gg: ASbGncskBkqIMs136Sa9QGtqcgWH6J5qEWneLITrHrwSDzcAFM711zhFK1DV3rJ/vTT
	ZeFmC/bFC7KSiem+C3Rgjn0uiCQnlPkWobzZjNA6OQBGCLoLVzghUklaY+oemyofp27yMa7nU5D
	AxR7HV6IsfapgXpjGPPN+qWE4CmmWZVTymdR53qWEo9xktajU3isIe6muoFHtcQfpk1afbqA8Ke
	qxh+yoGEY5yiF6T9sim7lZwkS9KznqYPFSaRNeBn7zRUXDtEzqJ5X8VcyF97aQ0q1M4DlKCG8ZW
	ZpmU7afrZfLUsSjpk9NjF8Q4F9qvdg==
X-Google-Smtp-Source: AGHT+IFrOd5l7DCeiCJMCGdj3HHMjbDRA8mU9w3lunMLLf13i2GxCh3KWHXe0FCbNMPsFKl8cEgaDmN71in06SXbfJM=
X-Received: by 2002:a05:620a:1a07:b0:891:7008:f2e0 with SMTP id
 af79cd13be357-8b9ccd0906bmr78808185a.8.1765273472027; Tue, 09 Dec 2025
 01:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com> <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com> <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com> <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
 <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com> <aTGthgduOuJaLV-2@anonymous>
 <CANNYZj_kvZxiuoYu5+Uo1Zs3k36--dexc5FOuaC7mrWA9t0X-w@mail.gmail.com> <98414d4d-260a-4fac-b8b9-9e8e47ffbabc@oss.qualcomm.com>
In-Reply-To: <98414d4d-260a-4fac-b8b9-9e8e47ffbabc@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Dec 2025 10:44:20 +0100
X-Gm-Features: AQt7F2rfSbnkzyddQXQZses2s0ZdlvDnKWEF209Ig72BdhVfNfzkLk1B2yC3e10
Message-ID: <CANNYZj_LtOQ0m7=5cp+Y9kkNM_+rwDuTTveDZu8=66czYXXL1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged defconfig
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: Jouni Malinen <jouni.malinen@oss.qualcomm.com>, 
	openembedded-core@lists.openembedded.org, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 09:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227418

On Tue, 9 Dec 2025 at 08:37, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> wrote:

> Kind reminder, final option?

There are two patches that should be submitted upstream, please do so
(the parts of 3/4 and 4/4 in the set that adjust defconfig). Don't
wait for someone to say something.

Alex

