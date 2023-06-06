Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C50C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:05:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5906.1686049540760181415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fTCStJPn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso23296075e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686049539; x=1688641539;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20pPsmGXvZQGDuPRBZwyzBbFLOWossnhFi77l1UixSU=;
        b=fTCStJPnHU1Nb/Bv3PKTYdMrY1k8WXzblfRDodUdSx1O2wQoBoLZ7DKp9J9LH2pGKG
         5eMyy3o1n7yF0Q4JEzRjAouYmBwiaG5LA1O4ak43myzHMjGgaafjHLj10wLpbDuD2tI1
         mPukeiIKPLNVxjZ8YlzpRt3GcKuPqbhWt22Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049539; x=1688641539;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20pPsmGXvZQGDuPRBZwyzBbFLOWossnhFi77l1UixSU=;
        b=LOA9mNIrsTnOS179L3P0iL6J/KEjVWDBswRiiMNRWkN6bnqtbgsTIZ7tPjSd1TBaL3
         BcAL2b7lpxUuz08sukgAPdxpsb7/ttpdiRUnGkcwbredk6tA5A2p8Ad3+orYy9DhIJsS
         6cWn/lxdBzoaZg+bO/V8rLAABYHygxiX1uJAr2h9A3SetRXFiceTd2O04Qqn0/+whYwj
         HK/p3ibF+mJlTEI8LYEJ3e42+LCMpQI0ZE3pc3ZpC3TOn2r0UU+GbCVjggGARBMpTpLd
         9dVbIsJs16tVbT478gRYgUdGZays8ZFCTQxDPi7Sf6EMpZBgS7VN5WhIgOWt/cuRyY7C
         4ioQ==
X-Gm-Message-State: AC+VfDw0XUKilU5vWNnh1v6gO5Js/VMMaAvcnFCZ+bwcV+ewVlgcr80v
	y7gI+ICERF4KSZpaNR4mQ8IaUMpmNo5+h8QdkVw=
X-Google-Smtp-Source: ACHHUZ6Oh2nN0fmbc4D21HwZrbJ99dXjKm8hxHUOj+SjVAEopWsC9geaLph0FbXPDY72f7apeOBmmQ==
X-Received: by 2002:a05:600c:210:b0:3f7:2d7d:c673 with SMTP id 16-20020a05600c021000b003f72d7dc673mr2007134wmi.14.1686049539013;
        Tue, 06 Jun 2023 04:05:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f10:3282:4c2:7240? ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id m11-20020a7bce0b000000b003f1958eeadcsm17149161wmc.17.2023.06.06.04.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:05:38 -0700 (PDT)
Message-ID: <a29c16f23d36d0a4c5b714285329c74c03e89200.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: soumya.sambu@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 06 Jun 2023 12:05:37 +0100
In-Reply-To: <20230605174616.2559077-1-soumya.sambu@windriver.com>
References: <20230605174616.2559077-1-soumya.sambu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182422

On Mon, 2023-06-05 at 17:46 +0000, Soumya via lists.openembedded.org
wrote:
> CPAN.pm before 2.35 does not verify TLS certificates when downloading
> distributions over HTTPS.
>=20
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> ---
>  .../perl/files/CVE-2023-31484.patch           | 29 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.1.bb     |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch

Which release is this patch against?

Cheers,

Richard

