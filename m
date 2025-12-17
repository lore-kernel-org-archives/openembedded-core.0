Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317EAD6554D
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 11:02:26 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11767.1765969342434686824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 03:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kdCFlQVh;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a367a1db0so49406526d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765969341; x=1766574141; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Up6DZE5UCtV3WhC2nPc697YnJF+wfBLaSq+EsYFDMc=;
        b=kdCFlQVh82rC85dTJWcI8B3gDKj1wDylVFkQaHd1xsqj2mCJ2uPNim5swzCTRGGolA
         IoErGooGTBLkopNNqa9IjfsocP1EP1WS5a8vYWSq/tmiM81WoJIY7T3vSum42JY+cRWh
         KBhtzTMtXOvT+LGfduy9/8d9gasmJvgIGDZwBByUns7CFqtqN8u0+1NwbqxvDbcg5/Ai
         8Dr+PDGxKxgZI2bykdfkpSKrAxg/T1YSU5Ae7T77iDqDW++izdh4uuAqWw2ztyzja3Sb
         50aqFrtFRAdaarm1wY1toyp4zmVBJjgRd//m7RT/bhFgnbrRLfmswOthgQKpjnLXf3pB
         zcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969341; x=1766574141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Up6DZE5UCtV3WhC2nPc697YnJF+wfBLaSq+EsYFDMc=;
        b=UBQ7/t1AX/ZQTNK8pwRRkvALKxKkjQAQlXoJw6ywp6pOo4e3UGRPXfufVZC3HCGRJ+
         MghfXTTgRtI5n0pZri6vPKPpKNziBB2+gjATjKmqbowAjq4huXZFYVuI8F6QW7lc4H4m
         urKet4z2wua5B/DttGO5qmygMp0XaqQoi+3vVdFkulBNgAQaEa8dviBBpCzd1vT0KRrh
         XDZruQ6k/g3zlp65rPEQ4gOZfmrWbnw44+8yggJEBjNBqr1mogQGPGlrjVZ3CLUrfn3x
         o6HYSWQO9il/B00DvDBCbV13PrSI0L7ly10YTA01WNs1AV+UJXYALijER+XVYx/QgkQ1
         G52w==
X-Gm-Message-State: AOJu0Yxhyh82Cb5C0mezq6I0VhSrQqpPWvjX6visfN9cPLEuRpKWXo3m
	Eg/T5Y59u5B9A5JWMWUzEpiJyRJRvMkSrsuodKNaGcfwnVxq97TLXiPRVLQGkkF+9W5qKNuULB8
	X67+nL27j0rY2pshQpvpAfoskxA6koyg=
X-Gm-Gg: AY/fxX7kiuMuSatuPvmFrC1BnuR48+6C2t6UPBqHPQs013kQXZP8BT11MnkeieDLJYu
	G8qAolL9Vvvxrmzjuj/ysrKaYmOzvV9YS+f+zv/M7sunQKcUuwhuh7BH4U8iNmylNzUZFfw+Bf6
	FdAZmy9ErOAUyCcefB4l/ym22tCmAhbZnfyge0Z8QWdLEMDkriqzHBKhbh21RllgIjxWf2C9mT9
	IeJH8hwFgr47tzi8Rik6aVXGaEYxaQjL7c4/sIu1zvd+3jAZ6UqjggLLgX3sRN5k3I2ycSEscyv
	m0+MnV345gWGBXmhf9P/rfbDc1vvAg==
X-Google-Smtp-Source: AGHT+IFk3mTAUvr8N5HaYVATG06o6bjnLm5gc9O77U1QyPPWB3EN6TgpovvQWF69ui26mH9DurZnesqIuI6+9n42ve8=
X-Received: by 2002:a05:6214:528d:b0:888:3d48:23a8 with SMTP id
 6a1803df08f44-8887e112b20mr246953266d6.33.1765969340092; Wed, 17 Dec 2025
 03:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20251217094747.3217558-1-Qi.Chen@windriver.com>
In-Reply-To: <20251217094747.3217558-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 12:02:09 +0100
X-Gm-Features: AQt7F2qbpeO4xtnnNdA5iruQZkbUw-JzrpB6I2-_zEKy4iAhirhEfHlkIXPt7kU
Message-ID: <CANNYZj8zzUB-Q7LyhsD=MaCZPc7BYhb2cEbYDciOCxz8UaGidQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] insane.bbclass: avoid unnecessary rerun of do_patch
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 11:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228024

On Wed, 17 Dec 2025 at 10:48, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> When toggling ptest for DISTRO_FEATURES, the do_patch function
> gets rerun.
>
> The dependency chain is:
> do_patch -> do_qa_patch -> DISTRO_FEATURES{ptest}
>
> Such rerun is not necessary. And it's kind of annoying because everything
> gets rebuilt, including cross toolchain and recipes not using ptest.
>
> The ERROR_QA and WARN_QA should be enough to trigger the re-run
> if unimplemented-ptest is added to one of them.
...
> +do_qa_patch[vardepsexclude] = "DISTRO_FEATURES"

The offending code is this:

    if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
        pass
    elif
(gigantic list of elif checks follows)

I wonder if we should rather drop this first check for DISTRO_FEATURES
instead. These are recipe-level checks, and the issues reported are
valid regardless of whether ptest is in someone's DISTRO_FEATURES or
not.

Using vardepsexclude is problematic because do_qa_patch may have other
uses of DISTRO_FEATURES in the future, and the same reasoning may not
apply to them.

Alex

