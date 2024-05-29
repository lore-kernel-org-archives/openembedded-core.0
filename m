Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA9DC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 10:22:59 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.10470.1716978177047608880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 03:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hq+DUYSr;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e8a8ff4083so6220811fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716978175; x=1717582975; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/WnKw7OvZMGSFVGFYDq0/zGfJOhRzaspK3B/SA5Y1xg=;
        b=hq+DUYSrGkBlGb4MmIuzj/0Rnlby6VyNeLwS2pzHv/HYxvRMr92QKEoEIPQFLM5e6L
         YzPe2Ug66VaSmpOAadeEN+t7HQUxIhAmCD7rCzYYHo//05wHu5CFn+yX6iI0z8gY5RM9
         sOqa3/e3WuJmpQnwFyA14O/t0fAFenWUzBfGp6QkW/FokuuEjtTq4JVxsLR+5QQZu687
         qUMk8tiS3uWKnqzv2vrydh/lcluCtXxmQ0GJCFQEQfycuSuLq/iOz045ao2hm76O7b6W
         HgRZSz/IT2fYsnmkaa0Kkxzkn1e6sZ3fwjftVYVR2ujhQUQg1cdbWRfSNCTKSBDdTQoI
         CaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716978175; x=1717582975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WnKw7OvZMGSFVGFYDq0/zGfJOhRzaspK3B/SA5Y1xg=;
        b=ovGhSepNuBVEjvTweFbNNgpCw1Yv/LFN4TiGqjKr/aiAlRqNx2/VR9pd4w6wLKRRaJ
         9/0TvqE3h3tCeZLuhcNfLKwB0iXveBD+Nue9FbjJVAScacumPsZ/6Mt2eYb8twmECBfH
         wUhtnythuqXsGxw90FR8i1tnDt54ycFCCv0YDiXSVefWZ4Y3AvslB+DnslYIJ16nkI4R
         8sle2MeMInEckmThDNJyVDGhZLfKgvWODMP4UNZ/Umo4Wv0TVOHbeSuEKntKFUIWca1A
         fahB/dolfJbxnaykXA7GFj9v17faOgMbcQPXKKO6Sf8ZlEhkfsznwvGZRzW+H9JmxutN
         r5+g==
X-Gm-Message-State: AOJu0Yz4QsNy6nRpwlCrswySz6f9fwEuTeBXMsaX9okP42CUy1GA1Yzt
	Q+QX89aRodPkSRspnB/aLdD5MaeL+7N8UVTYMBXJfziwARFbKUxErmN86EWN7Xyoh7pDYBlg7eX
	OIzOKn6UdBM9tsHe58JM2aV3OOrs=
X-Google-Smtp-Source: AGHT+IFDk2lKOLDeXTW4GLSfCVRSms7tSzl9GqrODn8+BdD9tiiRssYoBa18Y2RbYjexoAALvCL0jCSMpk61mJPwGIo=
X-Received: by 2002:a2e:8089:0:b0:2df:8e58:d05c with SMTP id
 38308e7fff4ca-2ea4c864c5amr4982351fa.15.1716978175010; Wed, 29 May 2024
 03:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-LvZ6akEmDgfGGLCf6xdy_0k1rb=Z428gJVr35Xg6u+w@mail.gmail.com>
 <26273.1716973300075372023@lists.openembedded.org>
In-Reply-To: <26273.1716973300075372023@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 May 2024 12:22:43 +0200
Message-ID: <CANNYZj92hE=tRTpYX9LB2FnbOZsJ6gSmtdJE3zqtop-Nhzzfrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 10:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200000

On Wed, 29 May 2024 at 11:01, pmi183 via lists.openembedded.org
<pmi183=gmail.com@lists.openembedded.org> wrote:
> As requested, i created a set of small patches with the changes and unit tests to support these changes.
> Also i tested against the unit tests mentioned to be sure that everything keeps running fine. I decided not to copy paste
> the content of the patches here otherwise the message would get huge since we already discussed before the content.

Hello,

please resend the patches as direct mailing list messages; it's hard
to comment on attachments.


Alex

