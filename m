Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A033BC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 19:53:36 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.7059.1679687615819150017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 12:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W9HhvB5l;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id h9so2886647ljq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679687614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eEId5bIEPrCemxTXYhoFG+Bn/X1MA+1fL6tilyrp0ig=;
        b=W9HhvB5loffrxeF/fcG/7oYkKSrpsN2KKsn3KpTnASlbty3XPcn8S0o+l7IwBIqGFj
         FtEIVppXMCqu0kmP5wWMeSpq2ml30ZxOtYQbjS/HXpz8RkTV68elV7kMhC1Eu+2HKvDy
         qmDfH8RJFrmMA+sg8y5/pnkA4kzxHvZ6vrYI7M+n1TqCXNaQ61K6YvgO+pyM09YnIck9
         c1EpQNr29eJSYUJiHKhjY4TeiMgcdyYEStRLH3QDzxFtAFQFRs+fjjh/bWE9hLyM6Pyw
         QdHSN29Zf0wq4ftKeBGcK3I+iwVDt5R/o0BmNqArmv06yLlOxF+RgPwYrIILed4aQCqJ
         wZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679687614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEId5bIEPrCemxTXYhoFG+Bn/X1MA+1fL6tilyrp0ig=;
        b=bfSEdAy/NK1FucN5LMnhvk0xOQoQ4PUWXXRwSXI/mioNuTZ+HbqiSRSMFZFAy6dyF7
         i5+mPceqcg165NG9M2HtEPUHwKgPuNrHMNUunzSVgggOHkBw0aVpcNlqtSoEI29BEI4G
         0e/YfB67ggz7J1B4Ds63Se84G0OXOdqsXULdBJS1g80dxwHJn7apSO43wuWykUQYZz0H
         8HFUUCghqN86ZHia4dIVj2828lAjmucoKVkZNyzYUW+aDpEj3j+YsNywRXFQOkJgazj+
         5C1XFuJ11LG8baPWgJfILgwD6o7Rzx1kG9hfHA2WD/g7cokWP5PS0HQSdlobYCyMc3cX
         dOEg==
X-Gm-Message-State: AO0yUKWZgSDRD94SphHTTTOUnwpEKpM0bDaUUSMIugy6LQbBI5d/6ydf
	EI4aZalnWu70KeE55TCDZEnaHz7LWuCmCP5FQ30=
X-Google-Smtp-Source: AK7set98fEg/niF5dBXTspWC7NBl4YGiSG9hDofryECQrtz1xkA+U1DZzfpMZajd4DxQ0wN+T/spmKJhp/eLLrbvgEY=
X-Received: by 2002:a2e:2a84:0:b0:293:4ba5:f626 with SMTP id
 q126-20020a2e2a84000000b002934ba5f626mr4969401ljq.2.1679687613922; Fri, 24
 Mar 2023 12:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060202.385862-1-f_l_k@t-online.de> <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
 <9FONRR.ZLSABXKTP67E@t-online.de> <a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
 <B0EORR.JWJ884MGYK8G2@t-online.de> <CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
 <CHRXRR.A1NILQGNBS7P1@t-online.de> <CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
 <1TC1SR.M6OX77V0K20W3@t-online.de>
In-Reply-To: <1TC1SR.M6OX77V0K20W3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Mar 2023 20:53:22 +0100
Message-ID: <CANNYZj8eyCvwacnVoQui+ghL=cN=D8yDaBWAV1eBtvcz9qPOGA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 19:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179077

On Fri, 24 Mar 2023 at 18:34, Markus Volk <f_l_k@t-online.de> wrote:
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: FAILED (8407.07s)

This test is executed only if the image includes ptest-runner package,
and requires special setup. Do you have something in your local setup
that pulls it in? core-image-sato-sdk does not by default add it.

Alex

