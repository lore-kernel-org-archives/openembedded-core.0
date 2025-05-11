Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CE4C3ABCB
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 18:44:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.34183.1746989039854070497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 11:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AwcW7Sxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso39946165e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746989038; x=1747593838; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgrO4ZV7Rev4YLdsW9+4JIVM43Bp/vl6pRCoxLHkhWE=;
        b=AwcW7SxvLIH1V7Vs+TbPW66NRcp6OD5cu2KvU9IWMCXNuNIyeFeuhpVwJUZXvcbBKw
         xVPo0G1A5uATBp8FNIa/mPpn75B4x2fmzXvCmm4iItdMaX6ovI4pxM9MuRr/PKR8lAt6
         Ok8nf24LyX8LfdxyDs+ZRbcwgIUlJX4MFkYjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746989038; x=1747593838;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgrO4ZV7Rev4YLdsW9+4JIVM43Bp/vl6pRCoxLHkhWE=;
        b=q9C9Mdy7HkSPwyG5WtVOU90tSGIBiBMOXDt+1M3nYzNgafsvy6xLZ3ykxjrvcKG2lY
         l0q+v7uDjRSL+UHZyb2f+rPGrwRMqxrYW7J26UWZ2M6wHUBNdDEK7QLBoQ7rK4u9whvQ
         ltxNDX1oDrPuiF3qpNjb46A57TMvHA4r8bzw+BKxZ2nxFvoCWQ3JBOqgU4FP+uveix7K
         KTH0U+qAuw5Ie2a7wRfBXoQuotBLRm8j5RrWQnrTFbnJCEKhzkZzFV9KfUhb9kJsu7Vh
         JTgr0HZLVXiaBwOu+hfapZZV6T3FeV/pwFH5SiR04A5z1yJp4ZzMHDZkV/6DSFLloOe/
         gXlA==
X-Forwarded-Encrypted: i=1; AJvYcCUjyL8P9ffKYCHVH0lc4CcIcZZjhlk+SnBNIsNNHI9wBOi4OFLyXJuKSSb5ld9WmcAtZLdKexUhcxM97ib064PH3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrN8BQgZzOijon+1MWcNRwZOF3TKR2VZHZvU4lDlPirgY9XDJ+
	579evubHE7Uqyc+bD5G7cAi9Ev176QrFchCiWcvBgwYQmiMfbqvbYtQtnTTmDkY=
X-Gm-Gg: ASbGncudgEB7ET5SBI3yMQ3L6df+hkmGYFInkoED77/QJrEMQpGewkk2FRW8f5CEHnu
	KpAdAOR1r1BcR7mQnw6MSkHkvGsZTBa8P2Sc1vUcJHKTF/xDFy7xyKHE25yOO69Y0VApzKJvPg9
	4rLJhdkVMrNB4Fmd3F4OkXaTVJspQKBrswaqYFqM+aOrWuSCAIBFokKHwjlANUYqlFWKKsq+Qu8
	sPctouolc7wX018WGwZjDiSQ+WhCgyp5DIWGkmZSh4NbXxAJAGMj8p8Hb++Cs8DprYlsLIsx+tU
	SRHSBtnPV7/s9rJsrDeeL76qxh5/3a47ZbQnOqQ5BonaJ7A8H7iUr+sVAjj5uHdYjSY6Nw6Jeqh
	ivfjDZuIUU9KFw8gOo199+VjBHWY41vExkyekEw==
X-Google-Smtp-Source: AGHT+IHIAzMHuGr7opve0aQyNQm6JimD2m1Z2ovTZjdwri1MuQhassXKUp4J/EsmCzseP7tudnhcAw==
X-Received: by 2002:a05:6000:1ac6:b0:39e:dbee:f644 with SMTP id ffacd0b85a97d-3a1f64b5a71mr8074316f8f.46.1746989037984;
        Sun, 11 May 2025 11:43:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d5d:7258:394:7374? ([2001:8b0:aba:5f3c:3d5d:7258:394:7374])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm10187303f8f.15.2025.05.11.11.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 11:43:57 -0700 (PDT)
Message-ID: <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for walnascar on Sun 11
 May 2025 01:49:49 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "steve@sakoman.com"
	 <steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Sun, 11 May 2025 19:43:56 +0100
In-Reply-To: <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511115243.D83E9100407@builder.sakoman.com>
	 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 18:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216291

On Sun, 2025-05-11 at 18:39 +0000, Marko, Peter wrote:
> Would be cool if also autobuilder/valkyrie metrics would include
> walnascar by now.

All the repos are public so anyone could send the appropriate
patches...

Cheers,

Richard

