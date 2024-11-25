Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A84D3B7D1
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:54:46 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.26685.1732560878566654081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 10:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pqq9/LfR;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46679337c24so24723891cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732560877; x=1733165677; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8huParjeQ6DI+7wGnY7RznocA9IVf62CIb6C4Bp+VE=;
        b=Pqq9/LfRU7NlhvKllTmh8e7fQ0k+hh2nLBaGtCsjWgqeC71dqjsso1sJ35XB/if/1c
         lObwd/CD8kdaaUP4vxP6zQYQekJcBF1zoKQdyz5Ah2T09Qlc99rTgLp6EiunZnBDO+im
         mlu0hFnYLyycSARILn2zP29997FlVnrHws0q+dECAAcnRu/qIZBmDkogAAViqfBqrdS1
         Qz51Rq1RPPKBABTtd+grOwSku4YIvfX/okfMn7NNugbXa/LaZ1MB947nJAtG6aOk5F8e
         RQNZvmBPvfiT5m9zkHfKHwM2V7/Qsfk8SbwSISUFOOz/3HcM6k2RRXadhXRrObO6l701
         Z5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560877; x=1733165677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8huParjeQ6DI+7wGnY7RznocA9IVf62CIb6C4Bp+VE=;
        b=f4+Th1UrCXCsn5fokkoY+Tcrl7omVyI5E/DF+zN/fGuKBFX0WcPgDpxjbXc+DwKeGK
         KPlpvX0ViX6hR9brAvbgucIVwqPoUlCaKPFoIdVGSPZLCHwABcWdZqwRb6FtZSLFPvCa
         TjDDTy34/WvgEPWUXi3N8NQVtZrNG664j+brZ0RMijIWkfRoPoXZCTV1ZCm+liIWy5Kk
         N0zq02e1QA6YwkUnaDwCWy2B3tZnHuRjcFr+oFfoEHC7tGobLY6LK/LWeWHXf+7o8SVV
         pBxNC8eDr51POgtFcPdfIKw+Tywpx9hYzBMQ/+RkJnmvmp88GTGo4WtOp4KQuZmhatVg
         FwCw==
X-Gm-Message-State: AOJu0Yxyic1aH2w9TEZ+7vnmrqE2F1svakGpGZFACxoRGGacyWvYYT96
	xXRcqf/m2ZDRfpbv9pVVGAbXgvCfEgOHipIG5kDpNr4TC7/Zy1js3+74X1XH+ijLM06znA+EM9t
	xcGgudffgO8dR2t467RiSbHUHd2o=
X-Gm-Gg: ASbGncui0iqoOk3AW/N2B1kJpT5H/iW3WO1FwOAU6gB5rLuESAREmE6BncX8RIH4lRp
	HSFHszs/yTdUE+B5EIO4G9kfCpMO17xHmFSAOWgUfXOrHwYJekr9YX9z9oh3fkhQS5Q==
X-Google-Smtp-Source: AGHT+IGDy/WK39IBZ6Sfv5+uP74jGsgzfTDLMdFJNRrPntuWmz/36GWPhlfgGVZeRHTzK+P7tsFZVLKQb6VOtrj3i3M=
X-Received: by 2002:a05:6214:226e:b0:6d4:257a:91 with SMTP id
 6a1803df08f44-6d450e6ae4amr213363176d6.1.1732560877581; Mon, 25 Nov 2024
 10:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
 <20241125120127.2205232-8-alex.kanavin@gmail.com> <CAMKF1so3Azx6swzqwshQ4W5SRGo0H28hCboqN1mpovEcPrkFpA@mail.gmail.com>
In-Reply-To: <CAMKF1so3Azx6swzqwshQ4W5SRGo0H28hCboqN1mpovEcPrkFpA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 19:54:26 +0100
Message-ID: <CANNYZj-8Qhbqfy1dC7oWH+TagfQ33h6Fp=ZSkrxrSeLHuN_VYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/35] gawk: upgrade 5.3.0 -> 5.3.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 18:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207798

On Mon, 25 Nov 2024 at 19:36, Khem Raj <raj.khem@gmail.com> wrote:
> Does this work if you pass is via EXTRA_OECONF

No. I tried.

Alex

