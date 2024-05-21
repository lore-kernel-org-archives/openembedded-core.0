Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F88C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 12:52:45 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.18837.1716295963682890444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 05:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WiFKJGfU;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5206a5854adso4429518e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716295962; x=1716900762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jeswpdmTTHq7bg6a2Eh+jffETNXWStLDnsVViCZmr6Q=;
        b=WiFKJGfUlpoE22Hb0FMCwmVjksAXZbcLDKK1ZeMdDw4uotJNGJ+IXGnKepEo2PNzY/
         X1HCU/QxlMRITqtg3w8D1POlxdbDHZajk9y2Y3KZmFvpubHVumoJhYq5etk6kQEtfAHs
         f5ZAx558yi0a+1ZE4+uGq4gL5MMFJwyfmqeNGg039OEQLSYlqGm3l3CnoifB6cOAqfiT
         xuCbi8Pof9JgFxA6+u4Bf7a3XoLAPYDBAFJEvrL4bST3gMFX2HVpt3j5C5ra/df5xYyv
         iMUda51zHJVHv2K5lMev176m7Rp1t7ZPlmon4pfiho8tdcfKUL5PGE7mOZSc/QXFL8HA
         VCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716295962; x=1716900762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeswpdmTTHq7bg6a2Eh+jffETNXWStLDnsVViCZmr6Q=;
        b=u4TjOMp79/tSTtNA/QDK4LQxpMbITU0Pqj3h4we1Amg/IcKxjQKG7EojV9Eyr42D8t
         /2bFVDU5/+7/P+1fCErhjXF5s39NIA4Mrm4nf/4WOnaaWUzfcDSFipKR42wvnzi1EGob
         XY6gn1hgMiOWscSKO9XX47Ej72OoJqTFoeU0C+lUio3snyL5FisCGrPjBKm2ys7i7LRS
         MfewZGTY57yn6cCuKfXK8xtqZaNAzpQbdDFiMygcQrwc0ti67wInNrOKvERa2zE9yhzW
         Nlnof264HKz/dreRWmTphz+jW4cR25r1d65d1FqA8t5sXDgWddoBppVoVAINwyS7YhpT
         ToSA==
X-Forwarded-Encrypted: i=1; AJvYcCVCc4buNV30TAjCfrxNIBAAvEA6D54Fq0DnyKHZcROGD1SK9ZShNpZb+oWe0i9tLKfCpMJ+iWpdP7eky2PL+MPgKmS0Fq9fZ63bCuxfKk8unklu7m1w92bS
X-Gm-Message-State: AOJu0Yz1w28dvMF0gj2+6LVHZGhHlL6YyWADag95eeuGqC3vpACrKKnu
	wSng11Do5GeZ45mIKw80Rp/9ta5b7cH5BhkjU6pnJV401CchoxXRRHixuiiiNTmmRUixX9thJA3
	yrXaTZoeDVzqn/vFnYW/4UAvpxXVKiw==
X-Google-Smtp-Source: AGHT+IH6e4ZeLk28tvUPOsjrooIjG4PYs1DyRLG9kpNwnEZYZNrQ6yNkUNXEsq9tgGODGtBJWaF1So7cDy9EYedHA5A=
X-Received: by 2002:a05:6512:1056:b0:523:aeaa:7df1 with SMTP id
 2adb3069b0e04-523aeaa7f0cmr13232951e87.34.1716295961803; Tue, 21 May 2024
 05:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org> <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com> <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
 <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com> <17CFF314D55865EC.16299@lists.openembedded.org>
 <CANNYZj-SeRHU-JWCQ8wrVt2LCObB4aDmmz4icxSoYrBv=3KyVg@mail.gmail.com>
 <1714f7c2-b7b0-4fe4-8232-247f1df55a8f@windriver.com> <17D181FFD1A7EBE8.4453@lists.openembedded.org>
In-Reply-To: <17D181FFD1A7EBE8.4453@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 14:52:30 +0200
Message-ID: <CANNYZj8JVUS8w9FEMqxW8LunWWXGOwm5=-eXCZu37Dbm0HAO6w@mail.gmail.com>
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: alex.kanavin@gmail.com
Cc: Yash Shinde <Yash.Shinde@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, 
	randy.macleod@windriver.com, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, Steve Sakoman <steve@sakoman.com>, 
	alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199638

On Tue, 21 May 2024 at 14:51, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> That one is caused by running the test with host python; this isn't correct and
> native python should be used, just as in rust recipe. I have a patch
> for this, selftest
> still passes,

... still doesnt't pass. Wrote this backwards.

Alex

