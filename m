Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27E7ECE57B
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:51:12 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.48520.1725871871539659732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kgvYixsg;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f762de00fbso12338811fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871869; x=1726476669; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9cTBPQ6N7l/95NaAG7eou37LDDO+G+xyTaSHF0X+cI=;
        b=kgvYixsgDzpjHIZeXZLnQmgAho/Ma9+uCEYdxLseURXAht2GcHXSWR2C9F3aBnMwGu
         F+kt67MiaDsH+M04rSMC5ufumBITqeVDvedAMOQM35eW55KB3Sn7kbWhISvpVj8EfGe7
         KG/cc9ydnwIOoul8bklZsi5UZ/slbzKYstVqd0w7BKwIW1AYHOaDCNOijSz6Gq7jaHzL
         u46ug3ICEZQ/nqLFfOwEygFhOuf1XAuqqzjA4skpdHFqOZma+egRltLZGuaTE6GotT5M
         9yRJbAHy2Pn9gp57Ei+bioyrCJGUan2ufLLj0X7K+oWzOLWFT78sgGXOqPyCcEcCldf9
         fZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871869; x=1726476669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9cTBPQ6N7l/95NaAG7eou37LDDO+G+xyTaSHF0X+cI=;
        b=eRmkO1uySvX93OkHDvj0KWXZHh2UJWeYTCDnrbmxquunWgdhkY9Larx5goGFOOq+7d
         LO0trNyefgvTXZoB/kG/JX2lleTKhvf94VN2AbXCWyBVzGH/g8lZTZHV2C8VRrys36ai
         9Y0ETY3Gvpa4Kqjj9avuO1x3RKn4e/nOUpNoGakP5Hj9Wttlquo1KW0s9Q3U+5SyLIQS
         KwPj80QWesDAbAxk12jfjmYckY3esn/5OIfgeHb2SoMQLllCNBQUoBplitgzHQGj1WNc
         aijUuO1/LQ7ydi4qbvfGgxessiSujk4pDCncKFIgBIA1Zlao/O7UbcBlCe4JkNF0/tI0
         drMg==
X-Forwarded-Encrypted: i=1; AJvYcCVlfDSF/TpUiPMWw3yvxDKgse/M2drfOWq6NG7tUJl9QpH+4H61OBdCRvm880a0NeKhz8xfjh7yR8Bs2tWcf91b6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywy9JHA/f96qQ4b7fz5Hwz1m5A/MfW9Zc22/43a0erkC0d6Jcdr
	40uy/AHJUSz9enQVAOLCJHpZ+Eaf4UdNZWM2e9EMYtMAY10Yelan8C+GFu1BO5gLvRGvOQMyDHs
	omGkwZ9xCnWJnpayIabQyZrsL5nI=
X-Google-Smtp-Source: AGHT+IGP/DuYLzSYAArkVWQW5vrcipXi3/cdid/B4+ZwS3wH6w1xmK8wFK1joj77XjMK3pfWyfScRqhyOlevbhIkPe4=
X-Received: by 2002:a05:651c:506:b0:2f5:15f7:7165 with SMTP id
 38308e7fff4ca-2f751f6810cmr76111321fa.33.1725871868733; Mon, 09 Sep 2024
 01:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240906165842.2327272-1-richard.purdie@linuxfoundation.org> <CANNYZj-niyPeX1k0QutWpgUrjD21ATRV-ChJSSJhNM86Dq7L=Q@mail.gmail.com>
In-Reply-To: <CANNYZj-niyPeX1k0QutWpgUrjD21ATRV-ChJSSJhNM86Dq7L=Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 9 Sep 2024 10:50:56 +0200
Message-ID: <CA+chaQd9OxHqF-A=N6OmFxjnLHJsQ8kSOfhx_tgyqyOMdLH30w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "python3-setuptools: upgrade 72.1.0 -> 72.2.0"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204320

On Mon, Sep 9, 2024 at 10:40=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> It would help to include specific steps to reproduce the problem in
> the commit message here, otherwise there's going to be unneeded
> friction when someone submits an update again without being aware of
> the issue.

Inherit ccache, build anything which uses python3-setuptools (e.g. python3-=
icu).

