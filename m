Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0AECED63B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:32:30 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11353.1763469145593398493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPV3EPng;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4eda26a04bfso61590961cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 04:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763469144; x=1764073944; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hSHRxK8TXV5eUpVPtVYcuNcxBHKIZ670qctkIvALks4=;
        b=mPV3EPng4TgUg0kLpHvokxabvGhf3V3BZxjG7Z/zk0BA2FIlV0UkYWVumasxN0frTu
         8S7XHFcJVvu8PgtoyGuNDVe+IZ/BSzoxrPc1v4BmttR/GdlURV297SDgIuxllX+3ZwWh
         0dm+tOG2RQiLLCXvN/dx1IzHJFla3bYVhiSHL1QqfrkFn6Xg0G8K/ngwz/p9xJQqr7v1
         8usF7c48ykhnyNqBG1w+uD4qDfkrZP3C2qBsUAor05L6iDPiYKnlIY7XS90O5zle0+xh
         09m+J7uHzRr3PksLbUan1ZhDSq7gLf+xd0ulvYkRampCVDvHOOw1Bo6CoorbQRnEZZZ9
         58YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469144; x=1764073944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSHRxK8TXV5eUpVPtVYcuNcxBHKIZ670qctkIvALks4=;
        b=QRJgeNyjvphOaKEqeusyq41od+zrrGo3Af7keSsWeCirNMPV7A4jzX0ACbH0gzTIeF
         QmKB1i0XhyIFJY5njhJhpPljSu2+OUzvlK+X2p3rmLfmsYzMszMy+K5Zhlhn5FnKItup
         pOFL+infi6FUsQeafAEhFSfN9sgkiu54U/rzC1THsiUFzwoF1Gsby4sAa74RAH26OkVs
         ouQkCBUr0/F+cfSMXshJiq5sph8cYX/nr5dieUTSw9tokSS3wABaG3r2fDCkmjBUWVgK
         EP5MEWv8QSbSAULf5qkjTcw01Ryfk32/gXG9SacNYCt6kyKodJYaJWx8BsTbAQ1qvsiS
         TDDQ==
X-Gm-Message-State: AOJu0YzDtxnECgzfcCi7uZL5n1XXpywfDOGkzRORE6GtWAeeiUV6tFDG
	juAugp6TrMuOYMibX1iIXaNLLMyZ5ge07/0qKlIkUhIdMQlCuH/cuZHPzMUBO9CUCb+TLkK8+MO
	cUS0A4J0TZUF8YjCTN5YhBUiu3ndOPjpB+Q==
X-Gm-Gg: ASbGnct4KUCY4Xo55qMm42hiNhTHNtwO8FyF4Dyi/zAU138Mdt0k4e/UHfsRCpr4twi
	B9FgkwbrrMAyO7LCLBi1Su8M6exrtVcVeS4b/1zMj7dum4y5VjklyuH2ITP40KaOmfm8Knf6BYQ
	T6hLbhylHgXkmbGFAk7OZiro9strIDtEmTEh8cgshGR9/8cAUUPiStsZHwpInrqla09akuMY0r5
	XV6vAPVTTfDNuf+TOuqjsGSCdPRFprRwgX3shZYQkea3HOxY7gMyBPH05iZKgIe1MMbZg==
X-Google-Smtp-Source: AGHT+IEUOWpobJJpsTO8tBIlvR5uMyMj8oso35l7adSE58J1PRDe9geUH7IxxPGGwPie5M3ueRZR00TbHGtQxEC86V8=
X-Received: by 2002:a05:622a:1a01:b0:4eb:9ea0:cc3b with SMTP id
 d75a77b69052e-4edf2063a44mr235842391cf.11.1763469144343; Tue, 18 Nov 2025
 04:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com> <4mtzjkjozhpfksscbfjlq3jpuoftbtrerxxphplqb6q25hw7j2@coifj3stwtyu>
In-Reply-To: <4mtzjkjozhpfksscbfjlq3jpuoftbtrerxxphplqb6q25hw7j2@coifj3stwtyu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Nov 2025 13:32:13 +0100
X-Gm-Features: AWmQ_bnnjVEvFwQ1f5eU5z70eW29w6uX_NR4SqFGMY9Oc8YalSabpZlNsdn2qaY
Message-ID: <CANNYZj-XiX5zQVq0UjHVAZCuAOAuO3Efzh2gCQ5eoJC+5c5mvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] libconfig: import recipe from meta-oe
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226525

On Tue, 18 Nov 2025 at 13:21, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> I see that these patches were a part of master-next and then were
> silently dropped. Could you please comment, why? Were there any
> remaining issues with them?

We're deep into feature freeze, we're late, and struggling to get the
release out. At this point new features like this really don't belong
in master-next, but the patches are still in Mathieu's staging branch.

If you want them to land in master sooner, help with resolving the
remaining release blockers would be appreciated. See the weekly status
report later today, and join the tech call in 3.5 hours.

Alex

