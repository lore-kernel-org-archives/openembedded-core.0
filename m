Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8DDC001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 08:29:49 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.6704.1690360182855914862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 01:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VKMO6wrb;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso10269853e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 01:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690360180; x=1690964980;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xzK5Q5vAj48e+FD4mYz0hk2i2ckPBP4RzRdKDpt+L6Y=;
        b=VKMO6wrbx/b0Ups9rOewXNX4uAiT8lgxFLY/RlkWMkVWrxNO04CPmCHZGVdaDMXfs9
         hUchxNdq6RGsabnwR/nPH49PAZ1ScrAmrmK8RTd51x1iyRzu+YxR2kN9HGPxBBUIZZir
         slbWmgjCLxqMKf/0Tky9B6Z4uJNrWwJFsEKMSIk3nskrrtgTu1+eqj1IYV6Y/avUUAa/
         qB5qLbAy6EmcOFVPwnOrC1aQdKPTq9QS6QR18D5QRBWVUw18hH9SuWFPlARiO1fK+XhC
         b1lV2XEFEGaNGVoHr39FH/JPYIK0gs+eO2zHfZXfKzfkXm/PrbH3GzPWxYXEe4rtpr8m
         Xj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690360180; x=1690964980;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzK5Q5vAj48e+FD4mYz0hk2i2ckPBP4RzRdKDpt+L6Y=;
        b=LC0dRl8paFju4A4ruTKpMFe6irRat9Xc+tucJAiKmJhiLQPa8x0SDliWeqB8fO1ySG
         2xF04n0+mE0ZKgr6zFlUbW/XsiOxpI3NmFDS3NgKyjc4KGXZEcTjh5YK9CMbutadzxPx
         UyA0gFEarZandpPMMMVnr9k0+Xcs1I0fdqlFd0tMuGUCG6eUHbSH8wTq+7Evh417g6c6
         ovlB15fUGKkIRa91TGMGKheqks8gQ3tNeAOHpyr06h7NQFK34JqNPj3JHdSL4bJKfycq
         nwZ9p413tsb6uAFKJdSqJXG+aynF1/7OSD5z0GQMB3jvC4jpFjwaUKgdXSHJBQzTnLTf
         cT5A==
X-Gm-Message-State: ABy/qLYxs1HdDeq7LpAQOS4WqqCU03h3Yw1+QHiTlepncp06lTc9BWmQ
	Y2+84VTrQedbMhC3/e/w+0s=
X-Google-Smtp-Source: APBJJlHh3rRcMwH7kbOcZLjK9yLkcu5EKrvKzrcySA2YIkVTajnlMQ5nTHgRDscooWXBBHYzZ/Ywew==
X-Received: by 2002:ac2:5f48:0:b0:4fb:893e:8ffc with SMTP id 8-20020ac25f48000000b004fb893e8ffcmr929803lfz.17.1690360180149;
        Wed, 26 Jul 2023 01:29:40 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id t2-20020adfeb82000000b0031759e6b43fsm11127369wrn.39.2023.07.26.01.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:29:39 -0700 (PDT)
Message-ID: <b39b4683d2048f09c29e7147c42a4f94c176bd64.camel@gmail.com>
Subject: [kirkstone] cherry-pick kernel: add missing path to search for
 debug files
From: adrian.freihofer@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2023 10:29:38 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 08:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184868

Hello Steve

I would like to ask you to cherry-picking commit
8252367023b31d923c6031280843cdd35050df56 to kirckstone.

We are using it successfully and it's a trivial fix. The original
discussion is here:
https://lists.openembedded.org/g/openembedded-core/topic/88532225#160734

Thank you and best regards,
Adrian

