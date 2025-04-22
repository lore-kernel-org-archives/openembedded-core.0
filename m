Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCD0C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:24:57 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.42931.1745335494321643792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+5NNHVj;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf0e07954so76625716d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335493; x=1745940293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yONGq2kdnMVuPlDr4fpuR2WIoj7FkKwWde0L4DViaCA=;
        b=W+5NNHVjoHRbHZruy/W0lqH4yyy3RTVRTwUwpNAsFuB6hay55ary96T+wj1qtO44CL
         sjBgQJpev/qfK/wT+dKl1NvSDLJImLPr6JhmlJ+QLS872gOQ/iWeS77M/f28Xz30siGj
         scvKjRAXFThNYhM2zSDayObxdh5sr4h9ukxhdE+x33cXmiHoreJtFrV/FaOcyuiDGzpp
         ttmC6jI2fW/8QB8Qon7g0fkQtRjnRqWtLPbQucXS9tyUypBEq76NV+9C9n6zj/xlCr6G
         l5+9nI7j7NFTrIC+Fx/nXEeNoN6zq2P78clDy0vysxcj/pV2zc62gxxAWJRQCQevrqnM
         nkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335493; x=1745940293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yONGq2kdnMVuPlDr4fpuR2WIoj7FkKwWde0L4DViaCA=;
        b=bEPCs5AvQLWloGuHaVcFLXI0WKAuRyRosyNJBUJLZK8xkTfcOyHKk7+hT25uVYaBtW
         TbhWgeWi6A+SZOnvxqVr0f4AqOJamI+JvMtrXw5XFDj1KP1hquM5uNbpVHW7XfRFi8i0
         jM+T3Xm6iGJhfsW/45mcKx6Ss01AG75EHtstHyp21tJ5hehsaJgkTfxpCrvArkIRt5Gj
         K/kzjXAnOn0eO5+2lflxmQw2Wrf4jIoVElthe2Cbi+BVu3HDXiNpBaObSNud1Uz7Nfto
         R19mb26G+bwnbkIEZHp1N7a2OISy9tRWrMAceuU3H/bGC86fuy+b8feM+1xnfULvaLqp
         ilNw==
X-Forwarded-Encrypted: i=1; AJvYcCXEkh4q1DpU80y2pXQrBaG66Rpcd+paUvaF69t95c1tGusQ9ayUL7U4lWKYOUAf/eQmyyCBoNK9YjB15zbmXTqgTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7z40kBwDyyB3H4HVz4hKl7ITlxM2HWW7K+jpmJXi/iAxm6MUr
	zZUIU7d/wTwJE+U/1afYszZSUy9Zx+eAWboM6NAKMToMKYPZ+UjsPgYb75kryJw4cv7+IB1+fRy
	qDGpGHOunJNTLb+fYoTbEA1EcJhM=
X-Gm-Gg: ASbGncsSFHcn4l5yA2n/2Iupk9mgj7WO8JU+c+13pQ7fgvijgdG8DoW2ulTujBLaI40
	aXre4owIPYk9dCuZX/+A2JPb/DFcfIYQyfcc+3lVarPRgeCkKXIVDPDqAeo1bu2Ca6W8l0UjNik
	RNO5coNhTzUzPubVwdb6oG+QHSmG7AMmUTq/dDgPyuiQ0zcwgbh3NwaNHS
X-Google-Smtp-Source: AGHT+IF3OLOcppOXDnCuhjC4kMQtltyS+yWqg6K/Pha1mw32R2uAdpqXgNJjuG77vcTGO/0W0d5cyN7FUQCTePhoG5E=
X-Received: by 2002:a05:6214:5185:b0:6d4:1ea3:981d with SMTP id
 6a1803df08f44-6f2c4678a3amr244832476d6.43.1745335493378; Tue, 22 Apr 2025
 08:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250417102130.800-1-leimaohui@fujitsu.com>
In-Reply-To: <20250417102130.800-1-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 17:24:42 +0200
X-Gm-Features: ATxdqUFmllVT-PYniAPHXl56ZGin643KI9lQPcfXP-0LE_aTG_A67ZbQ-mL7Hg4
Message-ID: <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
To: leimaohui@fujitsu.com
Cc: Denys Dmytriyenko <denis@denix.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215232

On Thu, 17 Apr 2025 at 12:21, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] tests/reference: fix invalid option of od issue
> +
> +ptest issue:
> +| od: invalid option -- 'A'
> +| BusyBox v1.37.0 () multi-call binary.

Instead of working around busybox od limitations with a patch, ptest
package should rdepend on coreutils to pull in the real original od.

Alex

