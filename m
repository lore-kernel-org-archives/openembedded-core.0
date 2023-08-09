Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A089AC0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 15:01:27 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.90426.1691593278490147147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 08:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IHBuO8eW;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d62b8e2860dso181566276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691593277; x=1692198077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JUmYowxaVP4wvBZj4avT7co45TnTugxGWEiEprZT8Lw=;
        b=IHBuO8eW6rX8ReEQ6kf2jacvmv5a0DFZVWawBVqfE9DH2zxM7SEQi3U8IiyNUc7fi2
         C0ckWGyAxFCV6M+/89IKcjFIa/isiVf/N9zuTHYMrrsTX1sWcNdXcQE1hXyIDWjipb/d
         gA5k4A70WA/uHNXFcFl7LCBRpLa3twOKKr90MJzY5Dl7uj/305B/Q91N7VGyULWbqMEW
         WW4JgBFE96ycWbvV3XyXDhW8zBha/zMTWz/+X24hWgdd4zo9AuSphwAn53TOnUvQrdcx
         TYo+bPt22FjRJMzByuAcZk4J1k9Cp/BkZXBpVG4nxt7pHpU4dZLZuSJ+c6nthQ4GWpnj
         yqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691593277; x=1692198077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUmYowxaVP4wvBZj4avT7co45TnTugxGWEiEprZT8Lw=;
        b=FCVriLe/kCZ19gv7ukYggZswyMJNhhzzKrrIc7HcpVjMJ8/1pgnRjgvFaP+8TLOHKj
         AJMOrUrDQTr7nFPRTDD+jXyfVhhWpUMpRT4y2HghB+8lcc8025xmMrXE000yNy4ty0gS
         fA9Z+oLUuv5H6OJY29TiOmPMVMEHr+fHJYBUl3wL4Gu4yBG3pluA2iWcMhvbGxXoZAKq
         Klb7fUK1GlfaAnece1oDYRzzJDyElTjAps0qXT4HBtoyXZlA5uzhIePIYPv/Ul1pXJmN
         aCWgWsIzEZUYnbvLfzu0w0jOrc55qZTze/kN2rxhl922kXIM9sxZG27OS5JB+KaeY81P
         SoHg==
X-Gm-Message-State: AOJu0Yy5vbUfHaXz8mJVI6r5N/sMJPLTEjx7BU53sdgxXCAveEjG/3mW
	yu18LqnFqLDZiRMoSNMHE+KZFov3hSHfJbUJq0c=
X-Google-Smtp-Source: AGHT+IHLDPT8I+t+HMu2L6REWvwqfVB5uPo3S31C1NRxGzeY+7fyyqIbzMFVIA2UswIi6M3mzowLHMpubPDlfXUPquI=
X-Received: by 2002:a25:ba83:0:b0:d62:796e:22a2 with SMTP id
 s3-20020a25ba83000000b00d62796e22a2mr710024ybg.50.1691593277481; Wed, 09 Aug
 2023 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <202308061238184bdb334c@mail.local> <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local> <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
 <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
 <202308071440247bbfcdd8@mail.local> <202308072237172d39a14b@mail.local>
 <CAMw=ZnRZ-LNhpGvvDH+OBk7LuvdCyxTW5mZGB_f+D8wuB6weLA@mail.gmail.com>
 <CAMKF1srqMkp3LrS0wY=K=MbQLnVjbtvczGa9jC4YKcOs+Cpmew@mail.gmail.com>
 <202308080051444293001a@mail.local> <CANPvuR=KEGvHwA=20ha0eOKww4cS=Z9nTOZu4Xf=Oi5YEfT2Uw@mail.gmail.com>
In-Reply-To: <CANPvuR=KEGvHwA=20ha0eOKww4cS=Z9nTOZu4Xf=Oi5YEfT2Uw@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 9 Aug 2023 16:01:05 +0100
Message-ID: <CAMw=ZnSXGYeR5fLSruo2mM2J8ukJYr-TX=eC1ke2E905iZYUhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: alexandre.belloni@bootlin.com, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 15:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185711

On Tue, 8 Aug 2023 at 17:10, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
>
> With this adictional patch https://lists.openembedded.org/g/openembedded-core/message/185666
> the stub looks good again.

Yeah that sounds about right. That patch was also backported to the
newly minted 254.1.

