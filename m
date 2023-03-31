Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C173C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:05:49 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.55650.1680271543561251334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 07:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P5NJNtij;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id o20so20207013ljp.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680271542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eO0yx2Yj9At3Np9+b+O//nugNRik3i8+2Ivr9larFcs=;
        b=P5NJNtijMUlaFtJmxcysql/fGLQba6ysvYjkwPCagq73dryqkSu7iaVCDj4fcz1Cqk
         OyHCP8nBCOf3MYTI3CFMAEOzHTkXKzz6Se9xSmQ5BOgU1wEAY7WtHsv7J/4RWbZZDlPP
         /pCHaxJx6tZ06x9O+vANKRSKRcCj4unx7olVjutxvHTr5//LE4qJdpvjVbC4F/C74M0r
         w+zvUqWCasxrjk4AFv4MaTg1gynq7MLOQ5cI/u88DvhU5wFcuuSCyElNP6MIs8lUm3NX
         HpiZGl1HefUO8rtCCJoRD2gPyitPz6gDwkN6LZosn6ZGBEbAZaQk7aTqPMnsbujt79t4
         cUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eO0yx2Yj9At3Np9+b+O//nugNRik3i8+2Ivr9larFcs=;
        b=K3dYdwpjD2/WXXgvfi2LdbOhGUg6pixkzhCvGvs89YNRpcIkZW91e5TJfWeyTv6/8r
         4Sea9Acm7pClkGaJ8O11pXa5ylwrT4eWvsJguY8DpTt4WIgwrBoMptNmom4cyIJptWPc
         94/Cnt9plxx207JsaOgBaFEjBaZwYjPFePziXwPFrVleZKmPdyjsBfOXSJk9ECQKzuSt
         xSjMKm4sWFDFA1JhuGiR3K3ZEKzQTaSG9mrACKg1yhGz44x4/X06Qqyy0/3ccmpTJJ9S
         qYGuS9A/HRph4TiadYChsfHyh4Vf5VEeFlK8wa90bgnSEmH1RR7sXOUkrvHyYz+ZmuuO
         1oVA==
X-Gm-Message-State: AAQBX9ejZlJ8XmLTv7Kw1D3oznyy19YaLZfv3k2JJfnyx2QAuKp8wjH0
	Muarqzf+NRFx0unNJqQBNkJ9naYNxV11opkOCPY=
X-Google-Smtp-Source: AKy350Z1s8aZPkTC10GyuPVxRda8xwPXQrzojkoC0KGXIyYBbljEr8oAK+x8Jfb2M0xccFOAmcRHSyiVuPGxcbsjePA=
X-Received: by 2002:a2e:9e42:0:b0:299:c1c7:693c with SMTP id
 g2-20020a2e9e42000000b00299c1c7693cmr8502085ljk.7.1680271541624; Fri, 31 Mar
 2023 07:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de> <20230331104025.1478393-5-ejo@pengutronix.de>
In-Reply-To: <20230331104025.1478393-5-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Mar 2023 16:05:30 +0200
Message-ID: <CANNYZj8Z1kSGOpZ7jj5bRT++ugPNTrbzyuFdF6y7TYc98bqqtg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] oeqa/utils/qemurunner: support ignoring vt100
 escape sequences
To: Enrico Jorns <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 14:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179447

On Fri, 31 Mar 2023 at 12:40, Enrico Jorns <ejo@pengutronix.de> wrote:
> +re_vt100 = re.compile(r'(\x1b\[|\x9b)[^@-_a-z]*[@-_a-z]|\x1b[@-_a-z]')

This piece of 'magic' needs to be explained :) What does it define?

Alex

