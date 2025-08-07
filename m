Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FAEC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 10:01:29 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.47631.1754560888531143112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 03:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIlvRXNn;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-704c5464aecso9086696d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754560887; x=1755165687; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8RE+7+LGOcthELTqPbl/LECl3D3XTxMSztJ1Myo5Q4=;
        b=eIlvRXNnjsw3ByPuerO3P7cG9QbO5nYwe6GzQjZdxH/ra+W2b5wNVIg7CekLpQ/7uY
         Yqk6NEQMGi2ZZrNNiQtr4xkdCkkdKP00swC7vUTYpreoNTqGJoXWxX5aYqC5oqj4OdZQ
         +qSkXmPB8PmQiWPtgEAw50r7SFHPtXbLvvgvURbsKc1TEZQp8dBZoBadNBz0ifxCQgVK
         5ItoVlLMdysUitRNPGi/IF7+EcZ7+RqrRD8O97cJ8hHIPSWaZBGUd/PdHI63npS4vro9
         LFL7XLKWHHFBN5DATbpFLnZLvvZlpyx3+7ZEn/lH5pSU95hhF5XvMQfGIeQccueHv+gR
         KSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754560887; x=1755165687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8RE+7+LGOcthELTqPbl/LECl3D3XTxMSztJ1Myo5Q4=;
        b=JRghwmXW9tKbEKrhQrT2u8araZnBJmVnf6OuRo+u2xwXjSY7ZVEMe2gQcrlO4PQ+Wi
         9edF/wn+Sl3aEhfRQywjWAXnL/0KI21yhsBp4dA3LB3ebZy+GJ1Y4/mu0QBoRtWEiho5
         iWBbAVASCkgtt+MhVi1ttAvclHt/LvjNuCLEuEuV0ANwkPGhH943md8hNs+k5zkC2DOD
         dIdjiIItUqkX3qO5RGt9bmvniUBpDKmLAq6fCAsS+4001eLhxxaVOXpScReHGWIAkhCk
         8y2zfMKZZDOLgDxfLQ2rTxq49Oi5ZD1iooNim9IUGpGxZsmYVD3nsYsNwwM0P6rOqhz+
         sMQQ==
X-Gm-Message-State: AOJu0Yw0liDVet7ZyLndMc7yiMqssPgslVWVzSF82+9HGiXHV6HTeooh
	MZIIj/EV2G/dhbruR3r+0HX0sOcAplRoUrm1IHXCOE/5BnES+F65wiZHoRGa0oGSxIqChThzsWc
	XNjtvceL4ZEPFtQ5gRr6qIZgh1yUpzOiINQ==
X-Gm-Gg: ASbGncuJzi1cIJVAIv13lkJdQaAA1PfpqMEWbR3FsexHNOgv/ymJmhVaYrlnve+v+Ca
	h1dcF8ihDc9WuxJ2m71WtNxzH08cBPrPG//BF1xvwCKnCwXB6G5f7dqM9oYMgB7vWLNnp+jSBsh
	3S1JY+QwEAAueaX9YUMve78nqIbS+WG41GStU+r8hlQOM1JqCTu9WBZJ1jL8hKU4awhh4c8rP5S
	vBlsWIsyu6eypkzmztA4Jhm2mWugG/tvbOYTapHbA==
X-Google-Smtp-Source: AGHT+IGWSlT1PkiI1ptwQ6UxsYmYJjWuWi3ZuxTfEffkdhkLtm72rkq4gDVFWNhS7AgP7xKHkptjVtYNBRVamEnUf8w=
X-Received: by 2002:a05:6214:5294:b0:707:55b2:2376 with SMTP id
 6a1803df08f44-709795218bbmr87787396d6.15.1754560887473; Thu, 07 Aug 2025
 03:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Aug 2025 12:01:16 +0200
X-Gm-Features: Ac12FXzE6_QXiu5iBsp_K58QMgTlL47Z9QnBEXz5i95aoFvAAUgU_k3oUYEdJgw
Message-ID: <CANNYZj-x-gHZcKa7cpTx_SNydaU9HKAGeD8SSmNwx2-2WArE9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ovmf: Don't define bool type if building in C23 mode
To: mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 10:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221561

On Fri, 1 Aug 2025 at 12:29, Yu, Mingli via lists.openembedded.org
<mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/772fa11ac82579a8f6fa171e6b835f68af3f64be]
> +           file://0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch \
>  PV = "edk2-stable202502"

There's already a newer 202505 version (and 202508 will come out
soon). Can you work on the version update please? Yocto master can
take backports up to a point, but not for much longer.

Alex

