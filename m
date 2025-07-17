Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F36C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 10:07:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.45520.1752746837455671871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 03:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XxzGp3Bi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so972384f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 03:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752746836; x=1753351636; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FCxT2d4TCsxGYItBVxCG0YLM2JF1d7UsFWf+eHh7K6k=;
        b=XxzGp3Bir4HvgTFTJkYIBfSHuZHkGRQmaMIrISPW/JiT6FHRHlpGfyCsXSkVefhuNE
         OdSX9HjUrjYW73py22VZZT/u9tzTtvZ1p+mbOk/AfO5gMxt7XkpEfqwypHLai5yjwnjc
         do7a4nUY0VlziS/f5oP6gVgBFqEjbN/GyhCI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752746836; x=1753351636;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCxT2d4TCsxGYItBVxCG0YLM2JF1d7UsFWf+eHh7K6k=;
        b=VZrhOPWdVU6OdngCZ1EZ2yVVkblA7cFbVt7bU/gL1DsYnTjTzqcB+rUoJ7xVyMvFTe
         Ru6J9dQlNaxvdmjbDY1YUt58rb1T5WQzoFTfymYIpPm3loRhE0WI9kWihnQ/wFAkWVLW
         +9yV+a8vwiVs8tz1k+SKjwXceK9MFxn42/Sf5Hn0k0iEEvUU02/tlxL2VB6QWZ/VvWCR
         D5E7I6FLSHgAD7X6zm+UhGqyZfV6+5b15K1mSFZ/NB4UVTWDdzonu1TXBEmA+LRC1NBn
         Ww+Dk1tlpSKx2BuuYXB/AYFBiTYPRyGKwNnfQQijvESwOQ6Fs7l7DM3deNXtpHdDRCag
         Q6uA==
X-Gm-Message-State: AOJu0YyIfL+Bjr3Ocy0w+oMnM826hJiBHyRBeUFghE9woy255PDBpuCr
	fRK6Zh8grhY/4PkWwvyfKStSDMv1mo7DZdPPYBcs2feDjaDxjAkGh3bzU+o6o+t4uFo=
X-Gm-Gg: ASbGncvKwIglc0EaEp4lrDbS4tJMqSIfD/uDAfYoAhwDFrIv5oLS4gryCgeENfXn8gM
	OtrgYS5neiQ2/XqXvGMsOUd+8d8qiCs9csDztRGSl9BAD07kVz1aVNlq78DwqQz6a7wRFEYQR6Y
	Phlu3ZB0XiMNHzurOxzsTM8Ws1bY2PAua5WxJJkRSy9cIS/x+h089C7m5409qaSHvCAzz9u0ZJy
	gn6A2Y1IfMJeXls3xpgN+dqsC+n0Ry2W0tP2nWI4V30Nki1EyvyKNKPwAzhOycDKkw7V2Cu1Q4D
	qva9o8K2PnUmaPiCiG3y1P4srL1M+s3+kUSXTfv/Uog/SLKZBkIvpb4TefC1WNHiP9zNCpSI+wL
	rmKbNxqTpSSSZhpDp6/RD5e6cGO7C5F4UZnuyLd4knJzBtsOLEMZfCD+4NyPqu9pnaL6v7T7iFS
	33fTLK6TomQjMNlbTB3uW5Lg==
X-Google-Smtp-Source: AGHT+IFxBRYo/Kg6/ZwrXb8HyRjNaV18eUpX60LHFhKXMcVLw9XKmRuDlXfg888J2LW93wkod9YZ0g==
X-Received: by 2002:a05:6000:2383:b0:3a6:d95e:f37c with SMTP id ffacd0b85a97d-3b613aa23admr2351819f8f.2.1752746835706;
        Thu, 17 Jul 2025 03:07:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c05c:a45d:32ee:c317? ([2001:8b0:aba:5f3c:c05c:a45d:32ee:c317])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d785sm20680774f8f.59.2025.07.17.03.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:07:14 -0700 (PDT)
Message-ID: <59d1a220de6c0c8d8c5a5f364f5e248935d915e1.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: -dev and -stable updates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2025 11:07:14 +0100
In-Reply-To: <cover.1752673419.git.bruce.ashfield@gmail.com>
References: <cover.1752673419.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 10:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220530

On Wed, 2025-07-16 at 09:48 -0400, bruce.ashfield@gmail.com wrote:
> Here's the next set of kernel updates.
>=20
> Some things of note:
>=20
> =C2=A0 - 6.16 is my target refernce kernel for the upcoming release, and =
as it
> =C2=A0=C2=A0=C2=A0 turned out, it took a bit longer to do some porting of=
 features to the
> =C2=A0=C2=A0=C2=A0 new base, but everything looks now. Even the -rt branc=
hes are updated
> =C2=A0=C2=A0=C2=A0 with the latest. So some extra soak time on this -dev =
kernel is a good
> =C2=A0=C2=A0=C2=A0 thing

Sounds good to me.

>=20
> =C2=A0 - I've also updated my release process to update the CVE tracking =
for the
> =C2=A0=C2=A0=C2=A0 kernel, and you can see that commit here. If something=
 is wrong, let
> =C2=A0=C2=A0=C2=A0 me know and I'll fix how I'm doing it.

The name of the repo changed in the comment but I don't think it
matters and I'm happy to see the update, thanks!

I tested them on the autobuilder overnight and merged this morning.

Cheers,

Richard

