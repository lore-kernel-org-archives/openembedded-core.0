Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D67C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:13:49 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.50886.1742213627739409944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RXZy/nPK;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso36788956d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742213627; x=1742818427; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uvS495LBsOWg8VarE7cRFFIjD+eigucKBHesE6IUmhw=;
        b=RXZy/nPKgchu96ZQP8j9HKcCXYaCqSGIAUfF3fuf/4BHKlQrBt048sh1XSUEaUqIG1
         Hweh7HuNdOHh5G2lQHvOwRnLN9mmi0M6kLu7Id0sJ/qt7Q/YxiQOUeTEbo5a56IafKOW
         SmOF4VDe1UkUrs4SPh8G/YxjA4qLETDnZJSClyVyEcMYzbIsbDyV+RzqBMQBnw9rxHy+
         85wkD8ODIIbgPUpsZGC9PnMhq0MVTOUP7qXXMag/vUwpTYiePaBFGBhakaRToHRo9wHp
         PC7wQuBUmvyIitZWCyNA75k5QqYm1S9qSIBiZ2my5h5xx6hY01BjXRc4SNNfqxakM1E0
         tVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213627; x=1742818427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvS495LBsOWg8VarE7cRFFIjD+eigucKBHesE6IUmhw=;
        b=if//LUqi+q8wR/YbNpBfmqJzCZHPORsJQHieTO235MsrRphGDhQAJCQiStgduAKwbx
         6ieZXtZvYy0ZwYlApsH9ckAVaAVVax54qMA3gtD+AsScipZEtzDt3tZJJQsqWowaYtj/
         LKu/lRGKmme1ACTzl0mJ/c8xwmuuDp7mAM58Xj66K4BWAfyS93mZYERNf2yBKBSHrHkf
         R94YvTubYqARCi4+AJhWO6rVwzVCyMVX/QeIOgBVR42Mzu5ScULR7OfNIDtfdUeiY4EI
         q/uqjiSTCUqWbT5e6wNiB4FQuh11SZj6eRb2koJJ883UTM9GM4Sfjh5xNjOOOE2rea07
         bCOw==
X-Gm-Message-State: AOJu0Yw29ENTWQyzxtc9+GfPZD4WPRQPskR7bk6zLwjzvvXfe2bDPZiZ
	ikLeeOcuClTL3rD33y7BWFsfq9Ps21YNGZKP1+C/UWZfwMrUMm/Eb7oyKT3afP2xbR1mT1XP+Gj
	J3f5ZqHWWgdgg8FNtg3Q95X/79Xs=
X-Gm-Gg: ASbGncsAcV1k49EHXIJ913Bw1CWLdgagTHyReXUq6K1JES9LCBqxxSb7gGTBSezj9Wc
	pafGEwzIC4ocr6SLkHOJCQD98u8qA0stakMxgmmUn0J56AH9D1ZxSogvhpPpvEHkshdg+JQdZdZ
	ciLTFviomLDEKrPUvhUIr3ftV7Fk+wlxMSzcz9iZZG0BkPQHuIH7v5YVm0T9k2
X-Google-Smtp-Source: AGHT+IFSGgXomUcRTaekYylAuFXMIiI5p8y27AMnfsQogrKK+wJqgFQ4v6jS9fuS5O5SPaZE0pnw2d8mLiSNY7Re4f8=
X-Received: by 2002:a05:6214:2483:b0:6e8:eabf:fd55 with SMTP id
 6a1803df08f44-6eaeaae0998mr179835636d6.39.1742213626765; Mon, 17 Mar 2025
 05:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250316204625.1588247-1-raj.khem@gmail.com>
In-Reply-To: <20250316204625.1588247-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Mar 2025 13:13:34 +0100
X-Gm-Features: AQ5f1JpfpKwCAcxtzEBRfL9znOJkht9lZi5jXRTVu9KtELFd8uOrJLsyguVcy3U
Message-ID: <CANNYZj85=i=2dj1z+3zymex308j+ku2h5EBCB=4rOp31L0_zQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: upgrade 19.1.7 -> 20.1.0
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213081

On Sun, 16 Mar 2025 at 21:46, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:

> +
> +PV = "20.1.0"

This is unnecessary, how did it appear in a recipe?

Alex

