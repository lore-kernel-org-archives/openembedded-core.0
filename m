Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE04C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 17:37:02 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.602.1714757816704662920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 10:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vp+c+RJp;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.172, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61e0f733e8aso24201037b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714757816; x=1715362616; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlEPfYPqp4c5VYcXfmjhpeTbkTSiPKyJ6kJk/ynfGj8=;
        b=vp+c+RJpB2vpvBPu5tEl7FTZCuQZdGx9Ty3bLvxMcNBKpI83j9Xftgh7QIwTD1MWAx
         wny+lSse+svx8VhVY1CDd/4Ezon38oz4nwzC10ouMXwHEN2ADszHHFaqjRJva+lpKRli
         oYwkjvOSUN4KEStimVCpPcnDhCi3jepQzRtxP2LJKtgrI/n8B1DshBUP2/6iqkYOljSs
         aZCjfTESYmwNc6MqDEzmC7pwBso7rnmhYMTYyll2vslPojoxkFleosM25gHPFiSe2mXO
         JvxMfYpJYGvcbKta/LF3PWYo/leMEHfYLJqx57ZHiU/3IlF4v4UF6kD/OweXJt7BCIfv
         0rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714757816; x=1715362616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlEPfYPqp4c5VYcXfmjhpeTbkTSiPKyJ6kJk/ynfGj8=;
        b=bca6nWksn40FO/a74Mzu/tp3rFF6taYi8ufqYOlwpTyiU/vk82ap4jfzMTttgTOrUS
         wQCKg6eGK3nRNqtR7F0ytwjR98DowiVf6dYTLoq4EaQnl9p0/89JdUCJqC/BBlzS2NrT
         VuR4Wt3UGE2L2UAC/e1ijj6bRKLRpO+SuQK7yUiW4N99Z+3MohX57qUMxNev5ezgdzU5
         5hJrgUrFUT9x9antY5His/eFDRMdg4h97iGievckdlps3KMbAz4DsM86Nd1Qrya8CKsI
         uGU/1RyoS7Q1s9lVAbEQHSN3//k8TFGCElIEU99IRnxhD8ZidH+7WkphzgfOHURxiE/L
         jdKA==
X-Forwarded-Encrypted: i=1; AJvYcCUHuO8fhQWkSIMTI4B9vQwGp97kUgqdcwaH4PX2Wly41pG55iVwn3m9FRha6/RazLq+H6hutX+7uXz+7LfGpf78QBrW6u+E6/N1V72xL8MCxj+lrJjHYbQ1
X-Gm-Message-State: AOJu0Yw3QYpX16IX2W+j+X2qp92HzVCN+vGR+4Cq593UBCp6N2qPEiPa
	4La0WkTyj+x4JlJdpMWyjWdvefS4Pp4qH+IEFqkZ/SSjHVn0vRkl1mTeyEk+Du9+QPqnPFHSKRE
	nE32j6IjL3UdS4JqQ0FLnIGgb+Wb1Cxoyxz4fsg==
X-Google-Smtp-Source: AGHT+IFExwONG66v3VdZ902A4frZq7TxRL258GjnEPyUQp02LbGdWaVnTQ0gw4pPMNLYkBu33wnyrdLiboOkGFQSGzo=
X-Received: by 2002:a0d:d68e:0:b0:61a:d4b6:6108 with SMTP id
 y136-20020a0dd68e000000b0061ad4b66108mr3393883ywd.30.1714757815793; Fri, 03
 May 2024 10:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151827.1387077-1-ralph.siemsen@linaro.org> <e7b395f6-b9f6-4566-9237-42d5b7f9c9ce@cherry.de>
In-Reply-To: <e7b395f6-b9f6-4566-9237-42d5b7f9c9ce@cherry.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 May 2024 10:36:44 -0700
Message-ID: <CAOSpxdZxkuaEwpPCWuvFjRm+qfbDxbW5Udk7-i95r89zEadGbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: fix loop in do_uboot_assemble_fitimage
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: ralph.siemsen@linaro.org, openembedded-core@lists.openembedded.org, 
	sean.anderson@seco.com, jamin_lin@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 17:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199008

On Fri, May 3, 2024 at 9:44=E2=80=AFAM Quentin Schulz <quentin.schulz@cherr=
y.de> wrote:
>
> Hi Ralph,
>
> On 5/3/24 5:18 PM, Ralph Siemsen via lists.openembedded.org wrote:
> > [You don't often get email from ralph.siemsen=3Dlinaro.org@lists.openem=
bedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderI=
dentification ]
> >
> > When using multiple u-boot configurations in UBOOT_CONFIG, the helper
> > function uboot_assemble_fitimage_helper() was not called with all
> > combinations of type & binary, due to a copy-n-paste indexing error.
> >
> > Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> This likely fulfills the conditions for backporting to older branches,
> so adding Steve in Cc.

Please submit a kirkstone patch once this hits the master branch.

Steve

