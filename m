Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206F1D3C55E
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:37:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.17293.1729237052332961437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 00:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lzIQ+mq4;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2017698e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729237050; x=1729841850; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WFn89eYgAFVI3mbg2z4c1b9YkdoWNl7uYL63jdwFc8=;
        b=lzIQ+mq4fKoVgjxPxMI3MeYOkxYU1/kmRi/KuU4c31FldqKEgeYwDpMRcuS6QO1IZW
         Qtjpexu09D13KEefpYUL/RGghZvnpb9Bn2IHBlMJl6qmgdnmoWW02WRyJWxDqBETGRT9
         rY9ypywZgYXjEOQPYktExzkEDs8CwXCEIfdRN+tOf2pF7AbacPzvj6XmusEjsSsCUWbA
         3YHuj6QwH5t7WuQ/Q6n+rMPeAFMkt1yKyojvnHYCvNI8y+gOfe7j9jrMZWO5eTGqc8li
         B0zTThcbimLhH4sURxy+wrECQ0pS1Un2IRiCmZdp0yiBe4w/lViLLPFXqwpgUbskwsVY
         4FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729237050; x=1729841850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WFn89eYgAFVI3mbg2z4c1b9YkdoWNl7uYL63jdwFc8=;
        b=k0K6PKsI+DwluzN6EzABuyGYDUoJvk8OWVBrwBXrsdezb4HlLGjJ6MmdT0kB9p6QCW
         d3ir2Be77FKOuxOnN6sk7EPTsEBzB6f6MwaNDNuRWwA+lsFc0ifKcduPYmrKnv3WjxZX
         3g4+BaFhzD36yAWmMYm7FwCUbZz6BiuXkzcveLtO85/ZYGhP2J7cIdCl+Y4WakjHW1Ls
         VpBvFgplTvBt8DkHMQR1tNDHF34F5MAX2UppuAT898LH3iByNNNWuKC56b8ttfGI9Ch0
         MF+CE/ACcP5bxlb7GM3+EbFnJAtKmMZg5pDdD0ej3wPZv7Vv7Zk+bOZnJs4iuc+A3sU1
         4pfg==
X-Gm-Message-State: AOJu0Yxx6tTvGk2EdP4XXieGfIEPBoDMrUA7gpLmFRJVjT9ZQGa1I4zY
	bHPR+wYEfC3tiuwFSGoUQGUdSP9OOmlWnQL/Selmq9bo/5mNs6Z8uSJ8UvcdhnuOu9mnm56vmK8
	tF+jYP+x2JVQZtzxRdmLTjCibVNk=
X-Google-Smtp-Source: AGHT+IFmUo5lhRnv8Mr3pMhkPiNzifGs95RtgMqZjXyGArYnGMSsHvR//ZfEO+r9BnoitR/sR0DrPCy0L2iHrEN7+Gs=
X-Received: by 2002:a05:6512:3a8d:b0:539:f1e3:ca5e with SMTP id
 2adb3069b0e04-53a154fa75fmr806701e87.44.1729237050094; Fri, 18 Oct 2024
 00:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <SA3PR02MB101158D739751F29809CDC851C1402@SA3PR02MB10115.namprd02.prod.outlook.com>
In-Reply-To: <SA3PR02MB101158D739751F29809CDC851C1402@SA3PR02MB10115.namprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Oct 2024 09:37:18 +0200
Message-ID: <CANNYZj_QMbz99Y28L_Er2jK3xow+0Qsy7aDkMEhQfVk+m6EqbQ@mail.gmail.com>
Subject: Re: [OE-core] systemctl native script does not support WantedBy=%i.target
To: quic_ericsmit@quicinc.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 07:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206037

On Fri, 18 Oct 2024 at 03:50, Eric Smith (QUIC) via
lists.openembedded.org
<quic_ericsmit=3Dquicinc.com@lists.openembedded.org> wrote:

> It seems like faulty behavior from my perspective. Systemd.unit man page =
does not mention any restriction about having =E2=80=9C%i=E2=80=9D be the f=
irst pattern after WantedBy=3D, and systemd=E2=80=99s systemctl program cur=
rently allows WantedBy=3D%i.target.

Can you propose a patch?

Alex

