Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73DBC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:15:08 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.85577.1738581304437149867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2HWzrZk;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd049b5428so32221706d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738581303; x=1739186103; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wuXEDF33kGy85Ozk3PzZ6OapdFUG4FVAQ142EuTLwsc=;
        b=a2HWzrZkbl1qM0RtXdPuQu9QNbsrUFaWZZfmISySguk4c+HBxwGq38DXVOV8zMhat8
         kxO9q44vlW0pVyoMyBHj81EdRjGtUoQXxrd/m37ep1NyHTAJ8AGdeOGK2IbPAKQHQO1D
         U9ppVloVnUayL32LAZpnunR+ZLS7RBPljefw23OvLE3HUKapnw9xWmqBXBnQP8w74ORs
         zZN1vB5RvWZFezK+OLCMdj1GDOb7FC02RnnYIissBck15uVVKXTHbvrN2tK+gYomKlty
         78hev2UhObe1ishhJ2Fp7eGWtRU3Avk9IDzqAWi2M33P3S25KB55+5dcKuPs3yZVWH2v
         qViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581303; x=1739186103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuXEDF33kGy85Ozk3PzZ6OapdFUG4FVAQ142EuTLwsc=;
        b=BRGRxH0aaJWPNCdvG6hyampdmZ5SIUUGjAPWXoxLMO/dJmUIBe3ID368oVS19lbeWa
         QKz9uD3jDB+YVAufw3Tm8urOvoQvnkTPfx+eHcoEIXjpNlJtDXSSrRI9jHQcr/NF0Eow
         M/4zzyrglGpDenuLofWDDzXMFqpR2z1G5hHJ2A5VVHkuEAq6HcgJU5nX0k0Sm2n4BTl9
         nHdDBM4wJfEPYe3371mAJhnMyAR98K94NXRNbleLEjwV4tK9fozP5AIfSNrALOmnduD5
         La9g2dGS5HO4/2LYUtblQzQYmzl5l1Mc8BA+ItWwhVJ8wI8QDG7cJCeLiPbOPQ00b9Oa
         p06Q==
X-Forwarded-Encrypted: i=1; AJvYcCUW9QNVMm+NBJn/7Gya3GgTc7+cUEbCtf5H1iN8dCEeT5fmdaMK/wqRs4AjTnz506/OEPb9kjy7iRL+0zHNfk5UZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyz5wZDBxBARmG7PurQxWwWV+h03MKGDobfHRW4wgi2GtsA8lJD
	Opq9WwF6aYOaM7MH4+tI4ezXf91tv8Vu/BIxXC1IK73pkSvaWJqcmUaOg5YxELvKYzSThIkyWmM
	iOkFdXRZVnWUJz8YHxUDeoDVtGYb9qg==
X-Gm-Gg: ASbGncuxs4OIMckCyDPahRM9ZqkyMGvuMSRIaV+a3Pr+JUnSgf/6NjmoPnehKRCIFX2
	HBozFKNuuTtyvwRAMsY4MHZ/fNsK12wd6GibsDr3Eyc8GZHnhtTU5hR9zNUTMu7P62WwU2WKmk6
	+LnOywt7EjjEhgFKasUEBw1DvfI4oc480=
X-Google-Smtp-Source: AGHT+IFRcIVtnj+ARpqg7UgDkEe1MHLCPMAaD2pyLO9ZGhWGv9WWNmoo2Kgdia3UrRW4D+BOYAO5Q+/ZYkrlRK9DTWE=
X-Received: by 2002:a05:6214:3115:b0:6e1:afcf:8748 with SMTP id
 6a1803df08f44-6e243c35440mr366123156d6.19.1738581303342; Mon, 03 Feb 2025
 03:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
 <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com> <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
In-Reply-To: <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:14:52 +0100
X-Gm-Features: AWEUYZlWVX5eV_nkqynMirwr8SEhgEBJpZb9qmyqP3F3gGV8FMT11a8TxotEo9g
Message-ID: <CANNYZj-iMjQnJ6OZDDGJ6ofeNEQVmvby9cSzOrQh8GBcVVXtmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210640

On Sat, 1 Feb 2025 at 12:37, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > How was this tested? For me it fails immediately with the same error
> > as the previous update attempts:
>
> Yes, I forgot about the Intel world, I was testing on ARM & ARM64.

Please remember to try at least the basic poky config (which is qemux86-64).

> > Basically, mesa updates are blocked until clang lands in core. If you
> > want new mesa, please do help out.
>
> Is there any work in progress? The latest attempt I see was made in
> November.

RP has recently reviewed the patches, so you need to find the review.

Alex

