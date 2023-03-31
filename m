Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C6BC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 13:21:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.54360.1680268911125473724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 06:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=csmJc3Tt;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id c9so18422823lfb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680268909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1XLmkvLfL4mzNwZ6BL0lOCgppXVFiiYnvtb57Qnq8w=;
        b=csmJc3Ttm8+dq0FuKoGtJis8eZKPvMmvUWwphDVg4NPAHnqR4fGx7MNbd8fy0wRSI4
         0rIl/B4Eo82F/PQEUg9QFvMmndm+CWV/AIZyFI7aSq3CkU+J+OdaQXa4h3Bx9A0pe/q0
         zUyu9MFsZqw88kLA9nwIN4AY1N7IH3I8+KJkRr9r32nLWYyKBgJCzxStneH4MqIzAyYn
         jm5rJFrpeZC25NY9bBCiemL3o9PxAtSoD8Bcslkb8bNXcIB9uBr/Ca/qOYfXJkSuWfi4
         9iHw/wgvxgharda2rhkqzt5z8l/Fcdy5pYAKHJ7FZFFuZU32nq/2lHqQ1H/Lqg30j7Pd
         DglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680268909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1XLmkvLfL4mzNwZ6BL0lOCgppXVFiiYnvtb57Qnq8w=;
        b=tb6vC4S3DGBmPh9lIp7or+YgnANjAq4qwtQzaWWn4442H/cypkSmffyqwT3pSQewHi
         5wPB6GeKp5aL+sOCGZ9BXO4qgWeJxR3N9BOKRNFLThyso11+vC346ni0O2gJDxjt5fJI
         gbGdmZA8gt0PBKm2tg8TLFtcUOnpRcVLEnXZ1C+DYs3e5+/zBZX7pHxFfdZ4OxWSMWAJ
         RfayI5zFCAshYPgCgvtiW8RMM+tLl8RyjRcwEGtjl4M3p5SouEUKQlufwIOJGhaHPUeA
         Hu74wx16XvWhJ15m8+CP5CGUjzYfdW6VML6jmALBv2t/hGh+/CDV0R0vl4Lk8NDhnc0i
         SgLw==
X-Gm-Message-State: AAQBX9cNFxEe28hRUdm7/lnGH+KZhvRLQ+EIRLfUU6XlmH56TqEfsGm4
	LYR650HRyxq01FM3mdGAtdAMy6+UulA32V3aq/I=
X-Google-Smtp-Source: AKy350YwtPZhVEk+3aMsVVIEk3tjzmF9K9zuVfMOkL6JMkYgTPs9zYB7AHcULYyH4XJs2srGIAH1HSyYmK0BYgreqsk=
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr7725705lfn.11.1680268909058; Fri, 31 Mar
 2023 06:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
In-Reply-To: <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Mar 2023 15:21:37 +0200
Message-ID: <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for zvariant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org, 
	alex.kiernan@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 13:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179442

On Fri, 31 Mar 2023 at 14:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> We do have other reproducibility issues in rust and had to exclude some
> packages from the test because of this. We do want to resolve those
> issues though.

But aren't recipes in meta-selftest exempted from reproducibility requirement?

Alex

