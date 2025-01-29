Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D449C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:57:15 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.8776.1738141026298036611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 00:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YnIxz6Px;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46df3fc7176so59504931cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738141025; x=1738745825; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBAOy3Nj+dHtMFPV6oJfhcnjH8jZJtJ9ejFJT2UIm2o=;
        b=YnIxz6PxH7rynOIcoctQgE1+94MGJdeAxR1e+qwyLXo0JAHhpB4hC6Tg0W8ZeljXeH
         +9j2FekdHhdzwLLQ8Jyt0RxHKf1sGl8Fqr8ELdfp7UI1Y5asa0RbrQgXcRV0RzXvO25C
         djyFl4Vm9GV/pH5vZf8ytaXYDBK+U+QfXiDsR1yu6eJAAoh70g6vFeZGkpZnFsrciLM/
         XZL7fMhW1ixQPI3adxvwv752wasul1qnC5ygA3oMD84cys2QQXfSDqZMDeKcMokblVRe
         QKrcHK8c6FnYApboD2kfZjgD4JYa1VDjq25MCSWXnSZRG4KHdJOSa6zqL9NIooAKTNOb
         ntjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738141025; x=1738745825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBAOy3Nj+dHtMFPV6oJfhcnjH8jZJtJ9ejFJT2UIm2o=;
        b=XeWPKZm++Jcrj0kEqGRvXKiuzrj4x4YMod3+Odt7zGBWXdhJJMNYV9bf6EvscUrK21
         Et3dU4F6Zp2HVNoTSRlSgCKsMif+cJE0pNmOcmUywYW7Rz8FZ3EV/QwtojSQRahHBMsu
         ISnbd7TJFD+qSOV1s7x5PZKCUXARnKVgAwmdHF5qOl45BwqJXKWbQQyR/D7ostUobsV0
         rrTcvCFlGRsNbfYV7tJveBWR5/P6/7397Z2XKOFvZ41wedwXlBWGce3SRNs+hG87QsKx
         K0dLBoHEGp01amtwr5YpHO9XLZv7rlsT12uSKGFAgAzNWk/n1DhKowp01DXnZRRtdsTd
         Mp8A==
X-Gm-Message-State: AOJu0YxpZaAZk8KBU4g6Z/A+D6OVODM9FuQptoUvpTTjc+kuL/XJR5P1
	tdOOEY+dDzj7G2VzPbMYsyvE3FIhEZFnf+Nhz3T+wNq75r/k0YpHdPji7IFag/FDKzLp0hpbMso
	8LhXxM4hOGb2VwZNr8xuAUBgKh24=
X-Gm-Gg: ASbGnctMezBpM1YTq3vWHfcvm5Od15cjTRLzugwRzy0Rpa1F+FN8mPusYhsFhxQrvo4
	lGEFKqD3dSQjMXiTn/JMKde3/Kb5uyGkqU9vTB1Cb/4387nElxkbKGSGoRiV83403JrjfCx6wNd
	AXvrujRT7t3m7Dz0HrKMWZr/Zj+6wz2uw=
X-Google-Smtp-Source: AGHT+IGlSBAEah41xkFIzJ1+gL0a3h1ahDHkPuMG7p4dcZmNtiZMcKWd76bEMc+jU5DIwk6KmZT8AR8dO5tc+eEiXUY=
X-Received: by 2002:a05:6214:29ea:b0:6d8:80e8:d567 with SMTP id
 6a1803df08f44-6e243c2b69bmr41316616d6.18.1738141025273; Wed, 29 Jan 2025
 00:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com> <20250129080902.1863054-3-zboszor@gmail.com>
In-Reply-To: <20250129080902.1863054-3-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 09:56:54 +0100
X-Gm-Features: AWEUYZlqd9lpzjYeo9qMTSFEMLcdrBYt0NVjzBIUlHI4OQnZyzoHKuzJe6N0Z5E
Message-ID: <CANNYZj_hHHtuSfGMnwhCgDGg7YHzw2p4f4N-oCsHaMTVFviqYQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/3] rpm: Automatically enable using rpm-sequoia
 for signed packages
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210352

On Wed, 29 Jan 2025 at 09:09, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:

> +PACKAGECONFIG ??=3D "archive ${@bb.utils.contains('PACKAGE_CLASSES', 'si=
gn_rpm', 'sequoia', '', d)}"

PACKAGE_CLASSES is not meant to include things like that. 'sign_rpm'
should be set with INHERIT.

You also need to re-enable the signing test in
meta/lib/oeqa/selftest/cases/signing.py and check that is passes.

Alex

