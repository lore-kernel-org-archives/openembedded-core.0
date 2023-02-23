Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3DDC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:48:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.10725.1677160113015903261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bjzqnuhz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id bt28so4071906wrb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7doaeKjgpBm20NcZefsP5yWqniM138zhKC0cRg9S+wQ=;
        b=BjzqnuhzuLnJKQvrRv/n6W11dRiQz/Jc6c4a3D0nfpOCP9XGMbrhB+nGNXk4dOiKXV
         jNADHiyBy1/H8v9pBnWPurCNdVLMrcpRdOEkGmGpaR8K8hrBhsbv1garX4+czwiKawEq
         briqVMEuqTgeIrjJlRIphhOqiyBllnIfeQQq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7doaeKjgpBm20NcZefsP5yWqniM138zhKC0cRg9S+wQ=;
        b=eJ1tOHM1518Eb2f49MFo5Y+BuoJvM9otImulkraocz7Be+RtaOvpZr2Ll3/9iM099W
         wAQrY6dkGkqWlIXPag1iHJgcwj4qK2B94BTfztiDUrWy5y0B1PZeyvtRScz6t+CHDVe7
         1bDuzl1dc1KH/uyODJ3Keosk7SDZoXUYb4BNKZgPifVA+rOl8HkWxjZc6KmRgcTuct/I
         tSu0pFA6KP36WTaT3Eo4h6tdj2MEPWqFrsq0k4WCzjcEr0qcWJA56LA49AqynQv0d/0k
         7B9gfLXEFsyPfiWhQmNu5XGbYkUpV77QOOjqtiyimTrw44NXWt1kkg4ow8T4F4ctKg9Y
         QESA==
X-Gm-Message-State: AO0yUKU/vJeEhkdffSWsEkSG2wJy3qWL5cMa1gxPAz0VYW4WNjsVr/O+
	EuXSjLtng1nN2Zn2LAh0uF1Hyg==
X-Google-Smtp-Source: AK7set/xH3XtTtxbi/Ui00S+xw7kd+NlpUkN3iQ4+zoeaohCXsS0IayUUmB7A2YdtDzxoMqht4FGfA==
X-Received: by 2002:a5d:6150:0:b0:2c5:63df:1171 with SMTP id y16-20020a5d6150000000b002c563df1171mr11540045wrt.19.1677160111458;
        Thu, 23 Feb 2023 05:48:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b127:77d0:f034:5d8a? ([2001:8b0:aba:5f3c:b127:77d0:f034:5d8a])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b003dc3f3d77e3sm11192194wmi.7.2023.02.23.05.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:48:31 -0800 (PST)
Message-ID: <0383bf0d23cb729d492771f658b31c6ae6584c60.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] checklayer: check for patch file upstream
 status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Lee Chee Yang
	 <chee.yang.lee@intel.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2023 13:48:30 +0000
In-Reply-To: <CADkTA4MV5JMfhG6hSCHqRO2RSguE9k-DCYHX6h8R9_xRD_0TOQ@mail.gmail.com>
References: <20230223062754.3162249-1-chee.yang.lee@intel.com>
	 <CADkTA4MV5JMfhG6hSCHqRO2RSguE9k-DCYHX6h8R9_xRD_0TOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177607

On Thu, 2023-02-23 at 08:33 -0500, Bruce Ashfield wrote:
> I don't recall the upstream-status being added as a yocto
> compatibility requirement. Can someone point me to a discussion that I
> missed ?

It isn't a requirement at this time and there isn't any recent
discussion you've missed.=C2=A0

The topic has come up now and again at various points, including with
the YP TSC and I suspect that was why we have
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14642 from back in
2021. I think the view of the YP TSC was that we probably should warn
about things like this from yocto-check-layer perspective as it is a
best practise we want to raise the profile of.

> As everyone can recall, I wasn't on board with this being a default QA
> check and error, and I'm also not on board with it being a yocto
> compliance error.
>=20
> I realize it isn't being made an error in this patch, but I wanted to
> raise my concerns now, before someone throws that switch.

Your concerns are definitely known! As I said at the time in the
discussion, the TSC does intend to add some extra checks around QA
issues to YP Compatible but no decision on which ones has been made
yet, I think that action rests with me to make a proposal. My view is
this one can remain a warning, I can't speak for the rest of the TSC. I
do think having yocto-check-layer show more warnings about best
practises if the direction things will move though even if it doesn't
change the resulting compatibility status.

There is an intent to improve "quality" over time so I can't promise
this will never become an error but I don't have any plans to push this
beyond a warning. As above, I can't speak for all TSC members though.

Cheers,

Richard





