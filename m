Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3B7C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 14:00:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.30384.1743343252884535882
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 07:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BZ72LWHu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso34035925e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743343251; x=1743948051; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNd5jjOPuOXzANipn4EFI+VVgK2PLeJWzwKQS+BxaNA=;
        b=BZ72LWHuqEhImVykLcdIDnB9P+kUz1t/WDicbBxk+MaXv2rtu/lXPAj7cRBWVfOddR
         K/1avLcPBnAq/o0VMvxZ85b00xRFOecgEWZGBkZYBqZkvNfr3pJiU2sppOE3DdxoH5X0
         1gbToRVH/UPZNqwR6a9utvON65Jf4HKqCJW24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743343251; x=1743948051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNd5jjOPuOXzANipn4EFI+VVgK2PLeJWzwKQS+BxaNA=;
        b=G+MzqJTAH03ARAk2MoCSH4xImSwp8ZhD6HTsOcpb6UBUpDQuB3pxNsXws2LcVWzG3z
         mTn16zxQHnMsOXl96VAzaqwLjQ7kcI5iwYuCHgZ5qQRfcSn/GcdIIhwQnywIj3Jb/v5K
         SCP9rYzi/RRh/XOawuNd1YbZzgU8/N9G++OsCqc1t3lCm2Er/FlkKH+RVAlPH+YiT58U
         Ml4QdPshuZeGc2kTwBsIBKkw3aMaRgUw1YW91iQrgvvtX2eK935mokVT8YhjPLpR8Bdh
         0cYuLlNNpLtcqxh5JNVGtCcMGXofkxCr2fIuqdAKMl+wv+U6KwTk7yzoz8naCUY2eEsH
         4+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtpXkTvvdfGC7yha667ipBldbTWdS9q7BiZuDrw+F8xDLR27lN+wlas8mgvxtC+Qdi0rjjQGAC9B7wgt1e7kCLfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoJVg6NcaDcIi3s57ObyWPhxzfopqIp0RjFeEOq8MHO9PgmMmU
	ZmiR52cxdW+skTyU31XaCahBR1t5Bjsk9/y5Q4EqTqNNU9wr+YfwFaCNEzFPjH8=
X-Gm-Gg: ASbGncvEywZztcnd8dR0QhYJKMuZZvfU5JLaaAS7nVy8r7KkWGLRz3/6PA3WLsGpCt+
	0U9wWd1jGoHaU5yG7aMcvvCt9xgQJp7Cz5IX9X0tlC32gXWtLyHCyRjfSd2qMidIgXeU1HC1r7y
	u24/YZd3fnvxftiGFQqBXcrBcMVuNxScLU7HpRk0OVaatSNnRFPMe4kc1zhVtU4o4r/xsZ03eMt
	gArrHlYFVxLT57NbrIoOt1ss4KXti4K/MRe3Xtj5lFT3KaPnsyiXNTkKNyem3Qs8UJNqQR+bwWA
	JSDbFlG/FaumCXwyQ7RXWmEXokWQZ5+EctTqxkkZnq5bGUcidbEpzRXZQ1ttrHpFIxlxGQr6bCA
	VeESIg1svgWetAn8tffhue1Xo8LBQmz8=
X-Google-Smtp-Source: AGHT+IFIHV3/SGK7px9Y7JF06HKFUpN27YVsRy5aYcMm7guCgHWLMguOb5yn8D7aBkHsq8pizcQeXA==
X-Received: by 2002:a05:600c:1382:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43db61dc79bmr47244155e9.3.1743343251215;
        Sun, 30 Mar 2025 07:00:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7ae:7c46:3aa2:eb70? ([2001:8b0:aba:5f3c:7ae:7c46:3aa2:eb70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d914ec99fsm71611115e9.1.2025.03.30.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 07:00:50 -0700 (PDT)
Message-ID: <dbaeb44938c460c2a14c388ac9807476684e140c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-breathe: new recipe version 4.36.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jan.vermaete@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 30 Mar 2025 15:00:49 +0100
In-Reply-To: <20250330101938.2634400-1-jan.vermaete@gmail.com>
References: <20250330101938.2634400-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 14:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213918

On Sun, 2025-03-30 at 12:19 +0200, Jan Vermaete via lists.openembedded.org =
wrote:
> Breathe is a Sphinx plugin providing beautifully integrated Doxygen outpu=
t in your user-facing documentation
>=20
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
> =C2=A0.../distro/include/ptest-packagelists.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0.../python/python3-breathe/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0.../python/python3-breathe_4.36.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +++++++++++++++++++
> =C2=A03 files changed, 26 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-breathe/run=
-ptest
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-breathe_4.3=
6.0.bb

A key question is whether this is needed in OE-Core? Are there recipes
in core that are going to need to depend upon this soon? Or is there
some other reason we need it here rather than in some other layer?

Cheers,

Richard


