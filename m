Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F9EC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:47:52 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.16898.1678376862374529930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hNZy8QBW;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id d36so2850309lfv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678376860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xlv1XZR3TpgPe/mp2DztgfZQsCxlxYmR0KPboxDoTNk=;
        b=hNZy8QBWvVhjm3/Nyv5YB5+R2gnMHv1vC85T4Y51cfjadHiEbJ8AbRsro8oJjg8fLa
         dcicKPERrtpcAESzQ0x7NflOrOoinX96J1pT0+HhQIIhRq1PZhNbXV7a3g7eLy1e+Hvk
         SYyX+VwG9w8OwNE4NDALf2z0OJ4V1bqQ/dC9NWSvyT0c579pVYR6QIvNGFacxO9CbAU4
         rzgcBfX0Ut8nCYaXfAKzuHdYuspGISlVu2a7OgBiDc10nFwtBoSfZY4ujiyhcU6h0Kt6
         a9HM+ut+wDyP9SiunbvVxiD/16wpT0qXEksRHqfPTvWRitRabE9LBgRvzd5Yt7wnHFsQ
         EfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678376860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xlv1XZR3TpgPe/mp2DztgfZQsCxlxYmR0KPboxDoTNk=;
        b=AKRFRqzPFJDBwTvBjPD3X7aEUXVph9oNXu9S9yBjbC62EQJOJy1xg3lTluiKV+y8v8
         bsgGClKmYi54WrQNJAcLedjLpumb9EABs+7EbS1v1+dUAISym3w3adLraIkCa/OnnliV
         uXW7dvFpcy2c7iJChzLfW5nYl/X3C374CMwxcr4O5nhV+edyV+ma8WX8cZEuxqwP0fQD
         DMAlibYaQQNs0ZGsBCW1q+V+eaTZ7WBA1Kqiop9TFvqTXoUkNBusCIHWi/qxhJ6gOmjg
         k4sV3KKS+8GbG/BwLKT4LHIm1+PeSchIeBXXjhx5+kuwk4lxx2o/H1aZG3uTFRAcH+aS
         R4Zg==
X-Gm-Message-State: AO0yUKVP5IA3ky27j9u0i25LC8tbY3rXi0IXZN8dXZnOEf2g8AkUB6ZC
	LPuJ6Gu/SjsDg0IKDLjWZoXHYVSAPHiFtiy3KrE=
X-Google-Smtp-Source: AK7set8vRar9s9gRtQWjY+lFFHMuRi+XRXEVjzNeotzn8OT5GKecvyjwAGA+nn4xFh6qW2vq3yMnMeCZMYdC1USWNvs=
X-Received: by 2002:a19:740e:0:b0:4db:345d:4f8a with SMTP id
 v14-20020a19740e000000b004db345d4f8amr7015890lfe.11.1678376860530; Thu, 09
 Mar 2023 07:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20230309151958.3619193-1-alex@linutronix.de> <20230309151958.3619193-13-alex@linutronix.de>
 <6967bdef-9c3f-eb4b-2e14-a29ed4367c18@gmail.com>
In-Reply-To: <6967bdef-9c3f-eb4b-2e14-a29ed4367c18@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Mar 2023 16:47:29 +0100
Message-ID: <CANNYZj-UMkSf1H2B0Sw4K=Ok1mrw3JBxemXWcjJKOOgd09k2cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/26] ffmpeg: update 5.1.2 -> 6.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178257

On Thu, 9 Mar 2023 at 16:42, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
>
> 2023. 03. 09. 16:19 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > Add a patch to gstreamer1.0-libav to address an API compatibility fail.
>
> Please make sure this doesn't break opencv in meta-oe.

Right, this one can probably be dropped. I can run meta-oe build
against my branch to see the fallout. (a-full does not include that)

Alex

