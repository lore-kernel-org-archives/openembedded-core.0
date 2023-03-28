Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C046C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 13:45:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.66895.1680011126552393968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 06:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R4ZuT4LC;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id h11so8925699lfu.8
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680011125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcAHweZFp+fkyNIZWkPQvRY9N5PlCrLSOH3RWoWcS3k=;
        b=R4ZuT4LCk2IKJAsOFUfOa1MMivBz57lY2Q3nQm3xDWPeqHvVZegkOl5G0dutBR871j
         0eUegILaCPYYzdJY585EjE7UCAX593lKgp3gUr5d1LsNouRjQU/+izGiSNm0nhE7/XM5
         GRdktzfBtKEDpkIJ3QoXcxLbfz5e9FSK+8jiBbQ6q3yHVkQasZYkBVVwGsvBtgykx6hP
         VIV9nLhtE1MvtjzMUac4Cu0KQnEVDwDDTynbtZMIkJWvmtKBArLdhGO/OD0b906UF2S/
         dIg/2PsS/N9jJ3wuhxwayufOkc5ZrJ02cWDJSIJaY7lLnVLIKSWTeaVOh2WMJCINgOFQ
         zQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680011125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcAHweZFp+fkyNIZWkPQvRY9N5PlCrLSOH3RWoWcS3k=;
        b=Tyr/D0T/mYCbnieRw5GmCfLILhz99GQUfTpY+Iev0NtutVJ75YdX+l/xR1unmpT90/
         ixqx6ub5L9o9IXgXXunA9cML8JKLYmlbqSrMhFr/MFt/FnfOgRxvR+qqP7mxj3sko7Y/
         W8WMN0eBhSIDNJusGdXAa9I+Z+YYv3dYUHO5ILNpSj5W+CZakazMcsIfX910RU9UAOwh
         GkqEqXlylmP4tbfrkAZV6wMQDgX6x5VvVs75Wd7X2hbIicqw6JSMaLHO4OPC59/X1cij
         uc4VGvUK/mF7Q9udFDc6+V+cC1XNrpV1DWfx22TNZyyoOHHESrsuQPnPG9XktzXGqBZs
         xewQ==
X-Gm-Message-State: AAQBX9dTSMxMlUd7YbK6jq5K8R+cSZp2pL6/vMwiwJT4Ke0hnwjrM2l6
	W6TGzDKmS/WAFOttZ+LIZhkYeN57Wv/aXqw2J6E=
X-Google-Smtp-Source: AKy350aUk+eCJeBDBxBGQvJop7yohk8zVWa2NG7vrAtAhwk1M8ffBC1aK9F/EcR3m/dq8/oJ/AhRZ0PwwnbfQWACXmQ=
X-Received: by 2002:ac2:5ddb:0:b0:4e8:c8f1:a010 with SMTP id
 x27-20020ac25ddb000000b004e8c8f1a010mr4497768lfq.11.1680011124693; Tue, 28
 Mar 2023 06:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230325004818.2784943-1-f_l_k@t-online.de> <20230325004818.2784943-6-f_l_k@t-online.de>
 <2023032714382786bc343b@mail.local> <dd874e52-dc20-813c-3211-62b70c1d210c@t-online.de>
 <CANNYZj_x0esv-NGjaP4+7q=hjKy9sW8cQZA6BOSg87Vdmt_-oQ@mail.gmail.com> <CAMKF1sq2Zc0jCbaA1_R6WX_-N_LP0EOC0ZOVbB7zP5jcnMbscg@mail.gmail.com>
In-Reply-To: <CAMKF1sq2Zc0jCbaA1_R6WX_-N_LP0EOC0ZOVbB7zP5jcnMbscg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 15:45:13 +0200
Message-ID: <CANNYZj94hRKR9bR9i28ihCbe26SXjuJK4x5EfWFKYJZyVvzCzg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 6/7] epiphany: update 43.1 -> 44.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179236

On Tue, 28 Mar 2023 at 15:33, Khem Raj <raj.khem@gmail.com> wrote:
> There is mini-browser option in WebKit who I might be interesting though I have never used it myself there is also surf recipe in meta-gnome which could be a good replacement

Both are significantly worse options.

Alex

