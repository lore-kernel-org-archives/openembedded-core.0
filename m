Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B1BE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 17:11:12 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.25793.1736356267502053831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 09:11:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bShQKISH;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467bc28277eso140985831cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 09:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736356266; x=1736961066; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eJXy/1jR/6Eltl6iwUp7L1w3ZjwTXYi8qpEbzfQxNMw=;
        b=bShQKISH8/kv13kEBK7IQoj6KB7lGwvP3qIkoAvWUVzkZkeA5S5DHSeQQjrLtpHFz+
         mW90W7S0f0nCNoNYye/lwdZPe1w9AOXY2px8GD9QxXqjUop5ye/UiLOcWT/YgHXzTUmY
         P2shNw+Oeh8NJu25DrznwruZQ9/CyhIrVoK28WXdwDA67a9Yr9NJAtE4Jk/aoDf2BSdh
         R5VeETlobProP9imu2CurHcO55tdSMKAnYy6KsUHmVXCeu786FiwhZAE6YZ5HuAzxRcf
         qej4MfvPmqu4atshB1PxvIZj9XnmQlflEx6wEJ4pPn3rqGVySu91buBVCjgsnCX+CQ01
         GoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356266; x=1736961066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJXy/1jR/6Eltl6iwUp7L1w3ZjwTXYi8qpEbzfQxNMw=;
        b=iR55DOIXvLVWxx5AMXxlSdI91VG+kSbv0gpG4IN4JB4q1/iiq8E14r7fV+q/PnYsCI
         jZK4aNOuVzZB4AwImDhx3L2V07iBVG46vhlkqaxX/R0AJcc6HYT+wK+iUpaqGRmtlVHA
         hshRy3a1vtmaKP36ByiT++lgLG06iLZwcWRRo0ilhbbY4aL2IT/rY+SqHo19FUN+aA6y
         ItqOxOkp5L0Q9SQ6y7SgVqzkSWDbn622OejBxf6amUYyuruyrYO7a/BNkytKdjYBvf2U
         TcWKfR1S/3noLh+Q9VZzdM2V1dH60jZBtSkG2EkrlOTB/6gIGeo6IjcbuP4KJ0Om91FR
         +5UQ==
X-Gm-Message-State: AOJu0YxbZsluV9vxtu9OZHViaWckzZliyI/ipsjHaYvUIklpk62C0fp4
	rCQG6QIP8TZmUocCkagAzwhdfqIxeoZHAPOW7AacCq+Kn3N/I2evYl8dwvVx6IpEdWHvCTdKqQA
	MIcO/Ui35HNgSDWYzHX+yJCBbm38=
X-Gm-Gg: ASbGncvmMTFbJqCQRz0aDO05CI9eCtzc8eONEgKg3g2QvGpIyWmBiaQcS3JTy0oZmNR
	pgDKSbyIKhfxAspTpmXoR610t3P9Eus7nO9Gf9dS8JwNa5yepXpiivzlT8uuvPqRubYYROPHb
X-Google-Smtp-Source: AGHT+IH6Dh+bSWN/QpIvpaDA/1Cs3nUqrW1T7Usrqg/wWLE1PSAhjkWdg+I0LGMUS8pHsvXp2daTEqDCA37wYbMyaws=
X-Received: by 2002:a05:6214:27cc:b0:6d8:9f61:de8c with SMTP id
 6a1803df08f44-6df9b24eaeemr59168926d6.27.1736356266500; Wed, 08 Jan 2025
 09:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
 <20250108084226.117178-2-alex.kanavin@gmail.com> <008f6d87-3cea-49bd-b3a3-99a33666e09e@gmail.com>
In-Reply-To: <008f6d87-3cea-49bd-b3a3-99a33666e09e@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jan 2025 18:10:55 +0100
X-Gm-Features: AbW1kvYv-adOxBVoaYiE3Jn4DgLDXV_E01UNHcZxulkz8lo6w5Ia7vlKPe27jCE
Message-ID: <CANNYZj8rWNynVz6JePDcbSX0iZ7UVfSOENrzxVhFh-+mgY1rFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/20] dbus: update 1.14.10 -> 1.16.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 17:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209586

On Wed, 8 Jan 2025 at 17:48, Khem Raj <raj.khem@gmail.com> wrote:
> > -EXTRA_OECONF = "--disable-xml-docs \
> > -                --disable-doxygen-docs \
> > -                --enable-largefile \
>
> there is no replacement for --enable-largefile but it might be addressed
> differently, is that the case ?

Yes. Meson always sets -D_FILE_OFFSET_BITS=64 on all targets.

Alex

