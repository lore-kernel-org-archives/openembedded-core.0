Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A8CC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 10:00:15 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.7723.1743156013145389901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 03:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IGoxUhRk;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso31368676d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743156012; x=1743760812; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EOxN6kJL1S7QvzV7qZc07Op8LfzWxyqLvSyBu2VmPLk=;
        b=IGoxUhRkuz8sQSwfj+VZv20tVJ0yJPHRphe/bEfijSF3VuuqQMa/rUEle/ep3fBCcv
         7q83WGq6bRNy+RodUVk/zyvoIKPqi40JsX1CvGK32r9P+FubskHhFdpI7LdcHx/w+aUf
         bmQcMjDbbypkeG+Ub0vcgDKcjJxp2JaOie7gH5URr27uqhDjfBsbiSp5SJwJkdRg3yyw
         4PVSJ8nTEpKUa7yQzqJBIxVLZuY5Vf3PmotnH0Pm9TCC996OQV/uncxXd40FG0NFECUT
         yobyDodu/XGsYr7eN0TqtbsSKZc836dmD3hiKb3uEoKeLu6L1+aRKy0huNAA8Q7d9fHh
         2khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156012; x=1743760812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOxN6kJL1S7QvzV7qZc07Op8LfzWxyqLvSyBu2VmPLk=;
        b=erBxUy4X/Kauxp/klv4Ed4Vr/PUt4roTxQcYgSdoEqetfp2v1+/BvtkynF0UCc/swd
         uuRP5WO8aGvA9BO8vFq+7saRiGsECc0XKj/wUu5FqE3l3fgbSyArSg7/GA4nn3XneX5L
         WMOFLHXNMC1oevIQK011GYBXbXLWbySMXUHiFaq8gl4TF8q6lGZ+riMal/rxxVeMLUuq
         jSagWJvu+IVuvP34tBkOu/Y9d4jMzXSBFHSagQxoqwYiLaeq1hQ3G3Ce3BtW379WmbpV
         lrcJcIGrbCIF9MGlAC4vRF3u0CwCUJFQTF+X359M5hYyvg6O308gVnO+lpTbkGDAibdJ
         1ZkQ==
X-Gm-Message-State: AOJu0YzbJov7r/Nbwf7E9QpKsKXBOLhoafZptTlN3/0sRs9RTjaB8oPS
	8kDYZzSPshTgakuPPmcBBPHTQzE5EI73WVt/Vnbd1SQc5DVg3AWEXb6FlaNaZqFndQy66WIkLzN
	a5H9pCdLa25Xxx7s28p3+0Rqt1ZU=
X-Gm-Gg: ASbGncuafqt9bUSuswWgqn5IF3Q+9Jicnp7lBINdBG+O15HzJCjQCPsUcJ9HuQLN81o
	1CmAPpR+1p4h0/PnlhDBUXkdRABD1qiNOyhPkKCePCS8bjOBWd97jdn/VRO+hKYLrlfTrjuWBUz
	/hxxY+JPf21UA9192tyOClKTXL+Qk0ZB5ugJRtYdz/FFGAWeBaW5BDE3tKuDE7B8kqZcYymAk=
X-Google-Smtp-Source: AGHT+IGspNbXGnHpLLVDuihray1gCEz+NJ4pAsmfehVrCrXcLM3BP0Y826j6jXGJIZWNz6ZIry+UTnFAmZUdmNWGwKI=
X-Received: by 2002:ad4:5bae:0:b0:6e8:fa72:be4c with SMTP id
 6a1803df08f44-6ed2383d77bmr74978576d6.1.1743156007481; Fri, 28 Mar 2025
 03:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com> <20250327221807.2551544-8-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327221807.2551544-8-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 10:59:56 +0100
X-Gm-Features: AQ5f1JqsZVpqj0uxFbKf7jPLPCqippuyfePOpqO6kASPv6MMqLGPj1FGy8axJ6Y
Message-ID: <CANNYZj-HEWdFQO+jVTUD7OdvQST=ekma+CvyW2Wz256ts_=cqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213822

On Thu, 27 Mar 2025 at 23:18, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Subject: [PATCH] rusticl: provide cross-compilation arguments to LLVM bindgen
> + invocation
> +
> +Correctly generating LLVM bindings requires several croos-compilation
> +arguments. Provide them to rust.bindgen().
> +
> +Upstream-Status: Inappropriate [OE-Specific]

This patch does look like it should be submitted upstream.

Alex

