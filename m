Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60FEC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 20:35:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.818.1716323713198168841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 13:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipC6/ZPS;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f45104ef0so5594589e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716323711; x=1716928511; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0u/avsci+nQZPtzeHbTTZKEyQjW8+xpMNVnq4zpZPk=;
        b=ipC6/ZPS9h1zfOVw1mV2yuxhp8AQzaVHqSXCKP80CbNnOZQ8hXa2YwayXoI3CVOYS6
         BqP8APcJctaAVGrxQnLroz+vuw86ms7tbx+sPPMk+FXaKoP8vIzDajmv7I20kI61VRV9
         9dwA0/+3HnNaVPW41GjynefWB5aUfrekZHeJ96CCKKr2i5kZJJE2eMPJrPeSXcASGcNC
         mHKaJYFZg9p4E0rw3YGPS5XrfWQNIQpGeay4aREmdmsPesLFbfy/FXu+NvjBMLeFAeBJ
         Wbo/o07SzhmkBfa6WFJALsiUBpvOzoCc1XAqrUkbmNTsFtuL/4oaj4sqDLL7APmQgCDT
         HG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716323711; x=1716928511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0u/avsci+nQZPtzeHbTTZKEyQjW8+xpMNVnq4zpZPk=;
        b=CZCpMMsz77BEIhBHrfmRJG4gVy+mq99O0XiswDMT6pq55nWWFEkgj8znBgw89JSKq8
         0CL8xXsC1MlvU+0951dwY7PrueHSga2YW+4sa/muFCxMpJvfcsaM5ntzjhwrnAQHJADa
         j87Ll8LbjMzQWHkt8npsGoLbpSEJZEo/IUmgnO5/x/q5WhrZ4NbN68WoUZ+B3r5Pi0Gg
         xjzVmYHp0eiB2y4ke8dcHZ7HZ6R+LeTYXH0wkgr65h3tANL+bnDoYys9BXnnSa1Dwaih
         r0IP+07stF8scncSZ9mDJX4JifBBI0lxnlOVs9ORNPEWFWxQ9OMO3Ii70kPvlLHY2A9t
         OM1g==
X-Gm-Message-State: AOJu0YyQR3oSLuw7qG9bhOwApemCHU0nKTGtpDAkvQuy/nWM2DIbOjWX
	ueLeGNampN7cHHVtLGMbzZz/AkkPW2obyoGlH+8weIkLckSxjEStHlWBxL8yZJQ9nGxz4AwehRv
	kF5ZZ7EsOcGbfdMQsWpS/8bTY3ZM=
X-Google-Smtp-Source: AGHT+IGIKwKGzdg2ctdKZ7VqWvpkA1ZopHc0/jSLqSbsGy59h4FFul+CTTCsxAeYxoSe5yPdtmBKtoir4n7vj8M0QpM=
X-Received: by 2002:a05:6512:3441:b0:51e:150e:2c45 with SMTP id
 2adb3069b0e04-5220ff738acmr17217831e87.63.1716323711058; Tue, 21 May 2024
 13:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240518212954.788524-1-peter.marko@siemens.com>
 <CANNYZj9H16P4fPcphNiXV_8Wx3eapUeCQu+f5uL+4HGKRGrzBw@mail.gmail.com>
 <AS1PR10MB5697E1CD2E2A7DD06150D96BFDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-OYGdScmGziYkH=QrCu0sCVkE4K1dv6fQy-mgPpuLk6g@mail.gmail.com> <AS1PR10MB569740EE17E630660EB69AF1FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569740EE17E630660EB69AF1FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 22:34:59 +0200
Message-ID: <CANNYZj-4bF0LvF6+xQYZSx8+9+sd=YRMaF8AU-z-75J2BMeNRg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] ncurses: switch to new mirror
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 20:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199675

On Tue, 21 May 2024 at 22:27, Marko, Peter <Peter.Marko@siemens.com> wrote:
> I have to correct myself. I'm not so familiar with how github presents things; the two mirrors are managed by different accounts.
>
> However I finally found reference that this is the right mirror.
> https://invisible-island.net/#ftp (Archives) lists https://github.com/ThomasDickey (on github) as official place for snapshot mirrors for invisible-island archives.

Thanks, then there is no issue.

Alex

