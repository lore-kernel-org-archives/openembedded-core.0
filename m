Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2E6EE4993
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 16:24:22 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.12643.1692462254109538497
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Aug 2023 09:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Zp2dnUei;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-56c711a889dso1258574eaf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Aug 2023 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692462253; x=1693067053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv4N/+UZnIOCeLuuqJytt5oobFyEd1XCIgh7J0yjEy8=;
        b=Zp2dnUeiLdZ0QhB5QGdCNGxUNllAoxoTU6Ed5Pe0OlDWQqEQk9l2XgrQNOah5v3+cQ
         8gevn/Cxbahd83JeM89IdJJedf2OpKpW0lEeU50m1VrCdoGAhJY2rEUVdbZf8S78B26c
         NmIPD99XfX5GCP/b4Cu+sKUv5nmvY1ekBZyy/xyz+kKkm9QO5yimTU8s2RRo356tvXOb
         httHpO7N7zRyIoH1TCHGOIlfeBQ8wjY3ByMbGcndml5c/qVL7HqMJ0EFcLryvOAqOiMc
         U0G5KNCRe1fkQN5FmfBp4PnKVsMQrmKqxIWJSBTw0M/ji/1ajhji9lFya8MpTARfJ+Hg
         KIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692462253; x=1693067053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv4N/+UZnIOCeLuuqJytt5oobFyEd1XCIgh7J0yjEy8=;
        b=Hbg9soYeC/1n1X6PotUKhnj0xlsxEsBkAzTz1j+oRthbI0MUYNoCwV33IdXLU2HXgb
         9rbpumyonUPDTEuGi6zX74s1fg458SPfGAufKSV8Lg6IECmVUz7mKDTmZqh7RyMyDdov
         pdIu+yyXVGAuirOHSvv2tSGeYiYvYU3jBTODJL01Ts/5HrreJFUJqN0QYWfq5RC4H2/P
         yq7wZM35+OAs09y2nTzPV3sUlUlfxpgnAfczlGWA/Vt81hf2gPVibOMUjx9so26SHjAn
         gf+4mfeX9gUTukyWyj0ixGelwmrzhU/hazoF+NMKjsF4795dm6ie2FUdAV3nLkokbG/7
         MwHQ==
X-Gm-Message-State: AOJu0YxfHCSfDtyehP1nXdwSuAP6Xmo9veR3UIQ0p0PgK6S0ShpNM46T
	Cv6PNZA+R86dV6yYdXp5Oa3SFyOG47kaf388Gok=
X-Google-Smtp-Source: AGHT+IG/LGZLDG6Ct16gasnPqTk0hvEfbr8xNyV3hix0hdbc1Rq33+hGSSHd10eh7cQ97yHIszuE0g3oCdqwQf4hZFc=
X-Received: by 2002:a05:6871:5c6:b0:1bf:2e81:e1e1 with SMTP id
 v6-20020a05687105c600b001bf2e81e1e1mr3702089oan.33.1692462253306; Sat, 19 Aug
 2023 09:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230815145218.1561896-1-f_l_k@t-online.de> <CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
 <IHIJZR.16XNVQ6SKCIP1@t-online.de> <CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
 <G7LLZR.6FLOA2CLJNX21@t-online.de>
In-Reply-To: <G7LLZR.6FLOA2CLJNX21@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2023 09:23:47 -0700
Message-ID: <CAMKF1spUD6Lh-GoshPq9g9r4Y7LkHDUczJycP38hg4MABMwTFQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Aug 2023 16:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186400

This is also reported upstream see

https://gitlab.gnome.org/GNOME/gtk/-/issues/6033

I have proposed a workaround in meta-clang for now
https://github.com/kraj/meta-clang/pull/843

Thanks
-Khem

On Fri, Aug 18, 2023 at 10:43=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> Perhaps need libgcc dev package on build host
>
>
> Unfortunately that didn't help

