Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF74D3B98A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 12:21:22 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.44918.1732623681218692114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 04:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kGx4ka/V;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4668f208f10so18424011cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 04:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732623680; x=1733228480; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTtctPKhAHSu20e/2ink2bOaZawm9hQJxnwGTb51PGQ=;
        b=kGx4ka/Vd1CHl0h+mH9AwC2InaPC/3tgQ5ygpMM+0OkiOwIJOiW9wPJfw6BmvvT5K3
         pk/iMXOs1LdCpS7HuW4ib8FPuwDx6vg/+NSv7eLmH8Z+SUSWGifK8MLMNNCzXk2rQGuH
         /mEkLFL4AmIESSBM25zXK41/v7ohkPI8I7XXGt7ePw7OORYFJ8OFRjGpQr/O251LvxKT
         Ew3m9UCVPTr7jpFjCLrO6ZAkhLIZIhZ7QK1+3wGQVcCGE6kUtK+UDZOFYUA5/6CNW5Wo
         XTyeFbYYnxZFifnf+6oLBLrd73zgo4JI9fFDFBfiBV8ne4woNIZK+TjNE9sB2+P9Kbv9
         F0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732623680; x=1733228480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTtctPKhAHSu20e/2ink2bOaZawm9hQJxnwGTb51PGQ=;
        b=WAnJ0BkJpiezpQllujuP0j7Ww8RHNhoZ7UH/FcYp7on1jppIQNwR94vJIA5dkCDPkc
         YcFU8/jbJ7WZsygXkzCilZbtEGsO7rIj4RL5ViUMBXj0yYX+qsVlq6Gkq1ltaZ3jDPZY
         /cTDvv1d++2DLoY9VcIjJhNAi8yuuHhRCONqwyj2ON11WNWetw1kpbIEeF9cmSw0E1VB
         2EU+61p3kAXLd3ns5mXOHk3x55nU5ZeisbPRt1Mr9DEJ1c6MSRAeUl/e4ImMdzx+ghTY
         1XEw69LfdvEay1xHqREer4eBMkx9+uK3X9vmr72ZQHxZbTKOQ2OgFR7QnmYtnw0X439i
         wp0A==
X-Forwarded-Encrypted: i=1; AJvYcCWSHg3fzD1C8Yvt8o942D3TRBWtTecF0P6SyeL6O1R5IDjbVPE7hwm3dj1+d9JEoMmTmuMD5u1sG6S78np1M1nLqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw40fI1HC56VQe1LFuC4eXuA+tQUGM5O5MOqLlp3p2wIdKLZMDZ
	u4lAcJIDH3x23abEh0P3mAWpYY98FYct4YE8Ko1cIbi75EUttyD/lGcmEqJhKPfJXTGUtURXSIb
	9Aj2d4P/bxf+lyOMBQ/oq77fV0wg=
X-Gm-Gg: ASbGncuiTqyn+qZXbppV5UFHo/vlqer4xtYxIbQnAzS4o2ERA+clJNsE/4s9FF7jIhF
	+oJlF1D4ix78polYXwTryhrA0PU+DzH1z53H72Bxr8Dzn7IZxL7mfrzNFWGETDq/KNg==
X-Google-Smtp-Source: AGHT+IHiyYK3UVGp2/wWUoUacJ7UDFRHuqR1ddfyevu7I1MwsLGpSkM20xlE68GmzTdkwMTwNeDhUbJcWliVX+kHKl8=
X-Received: by 2002:a05:6214:1630:b0:6d8:5642:d9cd with SMTP id
 6a1803df08f44-6d85642dc50mr32592616d6.19.1732623680266; Tue, 26 Nov 2024
 04:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20241126000836.6901-1-hiagofranco@gmail.com> <20241126000836.6901-2-hiagofranco@gmail.com>
 <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com> <20241126121716.eqskoqfleyrn4fgu@hiago-nb>
In-Reply-To: <20241126121716.eqskoqfleyrn4fgu@hiago-nb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 13:21:09 +0100
Message-ID: <CANNYZj_-a3mU3z3jqxCqharjZ2pdPubPQi5jH2wko+jejLWu2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] hwdata: add recipe from meta-openembedded
To: hiagofranco@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Denys Dmytriyenko <denis@denix.org>, Ross Burton <Ross.Burton@arm.com>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 12:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207849

On Tue, 26 Nov 2024 at 13:17, Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, Nov 25, 2024 at 04:51:37PM -0800, Khem Raj wrote:
> > Don=E2=80=99t forget to send a patch to remove it from meta-oe once it =
get merged
> > into core layer here
>
> Sure, thanks. I will do it once this is merged.

You don't need to wait for that. Khem will take care of not applying
it too soon.

Alex

