Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876ABC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 22:40:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3009.1738190398525127305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 14:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RMl1jPdU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e27c75f4so134083f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 14:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738190397; x=1738795197; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=alb0ltgwYsCyTgkFNoYLrWP1xoKXOfkmXGlEerPOJqg=;
        b=RMl1jPdUC9ArIvCnRfe3rquw2fHNrGuMIh+g7gus0zs+HnhzaZSwBYGSRlC3ieyjJR
         Z2QSaHYUO3mYEpeUxB087pmPN+e/lkoRKZcJe5fpJFIY47uvxnL9fn+Vsd7gpBldVjh6
         13K7OtsWR2265imo8Objdm7fseOL0YmR3nUvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190397; x=1738795197;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alb0ltgwYsCyTgkFNoYLrWP1xoKXOfkmXGlEerPOJqg=;
        b=C3fwwYwhRaoHTJZ3nLS0S3QKxtyALGbHNuarBxOjuVK3QQPtAWidysCcDj6GmrvDBp
         mz5kNgmeURgZAcKyIkWHZGtM24cnPysz3L4Wz9WjsmQyeUIRQvrNaRZDbVVJcY0XawC3
         NMIu5BZGpX14a5rgecoir0WktGe0G5ntRVTp3ArNO0qJRpC2UtRrdVLcuYEvDPY/16V4
         /j9O8dRoxvXV6h7smrdRGzKWKxFM1dIziru+jEs2jjmsOPc7KnlmRwMp+FNfkoceP564
         PZZC9p/2MP8mgCMuSykVmTjBxXR1B2Ueeb5SQ6/c8N/Ci5xoQ3enJORU0ApaAVoGVlHm
         p7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1t7GjX38UlbUfQIqK7coQGvITv7VL++wvfBA29+mhwbUuHMatlw4fOFX4GlcKlRJjjczClmENZizTOrjxZYJAow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmuBzSmTR1P0qqBg6mKJBDHsytaXGfJCmbEQ4xsk947+DXHWZW
	VxJOGVVnsxGBVKs+5ujvKoa5ohbXsUj4ZBSy4m/6Jx9qeHlC2e9ki2l+WmpyNPM=
X-Gm-Gg: ASbGncsH9WrsozDKwdE73nMsjo2chyqaWQ69ZaIVkpwLNXQGiI3lU6/CcvyLFyWbNJF
	+DFp0adsD04FINiTCZ2LldRpyMaC3YiD+Ha+682vQ08f6dpKj40kRiDPAAeT6SZqEvHir5oS8m3
	GmgleGK+qVD++wucxWHee6gsbzaRjjW9QAXhh8N0ec+mFQ3BOc/UtUq0hKFq/d9wHl+o1XsgJJl
	CX2qtd+/mKuInRp3eK2Eb4p5LGjR0olCy6cJu60bmU+moKkoQi7Z8o+KjtFgOyOzNPYndQBCTF/
	hPqqAEfcbnaapHNmu7c9Suj1y894jUc/Cnbz7dBWZgmJ5t6bP3Sajzh8Q35ltT+6sIgAdUwHs5D
	//1tV/HvGd6lCQQE=
X-Google-Smtp-Source: AGHT+IEsJGlexhh+mQm6VrSRqRHpU1iP3q9K96eFgrn7r5kUNcdVgRpq3yeucZkqtHxkoqPL45aUTQ==
X-Received: by 2002:a05:6000:1863:b0:386:857:cc54 with SMTP id ffacd0b85a97d-38c5194cfb5mr3819458f8f.9.1738190396880;
        Wed, 29 Jan 2025 14:39:56 -0800 (PST)
Received: from [192.168.22.38] (ftip006315900.acc1.colindale.21cn-nte.bt.net. [81.134.214.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102d2esm109875f8f.33.2025.01.29.14.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:39:55 -0800 (PST)
Message-ID: <43a26c5d6a85866fbf86dfacd5a034416abbd636.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] u-boot: Convert ${UBOOT_ENV}.cmd into
 ${UBOOT_ENV}.env
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, thomas.perrot@bootlin.com, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Wed, 29 Jan 2025 22:39:54 +0000
In-Reply-To: <93d70055fbc62dd0dc765f2d2bd471b73f35df9d.camel@gmail.com>
References: <20250128145736.2258098-1-thomas.perrot@bootlin.com>
	 <93d70055fbc62dd0dc765f2d2bd471b73f35df9d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 22:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210419

On Wed, 2025-01-29 at 23:11 +0100, Adrian Freihofer via lists.openembedded.=
org wrote:
> Hi Thomas
>=20
> On Tue, 2025-01-28 at 15:57 +0100, Thomas Perrot via
> lists.openembedded.org wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > It is U-Boot environment files that contain environment variables
> > in a binary format, that enables compact data storage and allows
> > for faster loading and processing by U-Boot.
>=20
> I'm honestly not able to understand the intent of this change from this
> commit message (I'm not a native speaker). But the u-boot and fitImage
> related code is already quite complicated because there are so many use
> cases that might be supported somehow. So it would be very helpful if
> changes were submitted with a clear description of the use case.

I'd add that for new branches in the code like this we really need new
test cases too.

Cheers,

Richard

