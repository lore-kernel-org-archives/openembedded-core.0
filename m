Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84894C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:22:59 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.7531.1721125377527438824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 03:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpmDGJvi;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea929ea56so9979050e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721125375; x=1721730175; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4nRSRL57L/KrsqYod8BikFbdvLKKH/YroG8txXgvaJw=;
        b=DpmDGJviyUCK39VpQhPMlo/7XkuBv0a5vPR6r0sxXWqP2PpelQdB/hnQIqsILsR3GX
         9c7v5aPNBuGzYcWjcaLoSJ9BeY+BwPkVgwAMHFEqrSPNX868ComgOMQ7mT8Bs90xKzBK
         VRegaKNCe8n1dYB5izYilX8qfM02vJER/ws5wHYtWGBqgX/QOLAnNuoBN2nRgszm2hQF
         rIH6wtlncct9pZymIaqmLzx7gyWcavVzl1TxBUg2mwXOSM/YLh9IdZpOoaQEOmV88eHB
         Ce65DKM56/Frsy0yuByulwbap8JmNQ3z9pAy78lV2VoH3eAZgMMhbatMEsWDIJ1Xpo5e
         BTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125375; x=1721730175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nRSRL57L/KrsqYod8BikFbdvLKKH/YroG8txXgvaJw=;
        b=MQdnc3rd+0EFuDKnXzL2tyf+94eFz0TDQu0Ysizo5wGcj9lNT3F8pLkk1yfZppjE/h
         F64j0QvVt44icCFTj7fZq11AHOv4GyALboJ+6tgp8e/C+1RIoBHS1GoJtotcx0VBOeDP
         fuKQbKVakbnFcBqVR4RUisKTYdxHA+BFnRploOSpeUyYzpBR0OiqKCzXYTOEg3LBH2Jb
         G0ZY06Ecaxdu2DR9bmwTrc4DOCprtpUpzTWrHUHKkc2hGPooH9mBIdpbIWv8pE8hhfoK
         XcK34HyCeSa45NT2JmMo4+x++EFy/3YCoGxGPSeLv0S1t84PPYzvPOmfROBcvQU79yYF
         NtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaiaLWV0gP7kANaPI2AsrMA9Z+f7IqNE+aTcR2Ebg4qLuj0D7tgtkGiQNTPs7Bn/XdRlwB6/Pk738ZZHokhRq8U1zeni/vxykLVufGVMqHhIiKNZw4mn3O
X-Gm-Message-State: AOJu0YxD0Zes3/KfiC4IL93YW2hb3PLU1AXzEEj6sR86ZdbU4atuiXGf
	9xdnbTERatbzgMK6iSYEcQiycr79s+FCkU6PEeTtZiqihrDW7in64LSx0NkyrrTUCcngmm41GJi
	xBWh3Q4d3jvvzWyHHsQaPp20ZY2g=
X-Google-Smtp-Source: AGHT+IEGG22hTkWfAcu2DMrZcVTNB2cC4UTGhQCThVDtRIj8NcNG09fpPMJxHML7RBOVpwt29mVuKQi0e0Aj70K8eeg=
X-Received: by 2002:a05:6512:ea8:b0:52c:ddef:4eb7 with SMTP id
 2adb3069b0e04-52edef1ecf1mr1303182e87.20.1721125375250; Tue, 16 Jul 2024
 03:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240715180205.2493035-2-jose.quaresma@foundries.io>
 <CANNYZj_UaF5VkQB2DaxB_2nDeO4aEckvd92PZpGQo1AdJj+=-Q@mail.gmail.com>
 <e8520d5c4575c030098a7171cc5b0afb0d161954.camel@linuxfoundation.org> <CANPvuRn5+fXpQW3Fg7-U55zo-+VBNeTHbLCc9r6WHTGnpVB3eg@mail.gmail.com>
In-Reply-To: <CANPvuRn5+fXpQW3Fg7-U55zo-+VBNeTHbLCc9r6WHTGnpVB3eg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jul 2024 12:22:43 +0200
Message-ID: <CANNYZj-ZSD=_yDF1=N=vq8-dtLBLqu2PEPDJGoL9qRr4ohkhLw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] openssh: upgrade 9.7p1 -> 9.8p1
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 10:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202102

On Tue, 16 Jul 2024 at 11:29, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>> I agree we need to cut down on the number of pending patches, so asking
>> people if they're able to submit is fair enough. Requiring it may be
>> something we can't afford to do though.
>
>
> But I also understand your position and I think this may demotivate some users/devs.
> It is important to note that when a patch enters the layer it will stay here forever
> if no one tries to submit it upstream.

Moreover, adding patches actually raises the bar for future upgrade
contributions, since such contributors will need to rebase those
patches (written by someone else who may or may not be around then)
and maybe belatedly submit them upstream. At which point people are
likely to get frustrated at their inability to rebase invasive
changes, inability to fully understand what the patch does (in order
to explain it to upstream if they have questions), or simply the
amount of work required. And they will give up and do something else.
Meanwhile there's a critical CVE in the weekly report, important fixes
for latest gcc version or some other urgent problem that would be
fixed by the upgrade. And it can't just fall to me when that happens.
So we should at least require an explanation for Pending, if not the
actual submission.

I agree that I should've used more polite, less tersely-giving-orders
language, but I'm confident Jose wouldn't get offended :)

Alex

