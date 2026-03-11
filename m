Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2D3FD2D9D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:16:05 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16942.1773220561792709012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QN8O9JkD;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899f5d337f7so9960296d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773220561; cv=none;
        d=google.com; s=arc-20240605;
        b=OWJhXcPgGvDg7EWd+jITPLIBuVk9lzYZMhr1he0CT1QdkOC3TYP3aomYxbCgRCkiJ0
         o968tPw3kw16S8Xtlxwq9YG7WZyO6wpDRH6CFyKL5+hrZuZxPtZAdzZl3ki346MvNGlW
         TJKy+Hsf9YbI3OxC0Ts760CI1IKI9JXRUufjm1tOY8SHg5auczUxY2jRq3xEcYEhZ2Lf
         emBG6fP62eEPejg284hMxVVCYTBI4kBBZ1zBA7VOoGmpEnfXGLnTZkiPME9gpeA7SKLR
         J12winkwbLAoOIyvtoLwm5lBrV4b+GC1WToBmzcI/GcUUkhKxVK+7PRgUk/6O0pZ5nxp
         0X/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kPtMaMNEqWdbKZ2n/yC7aV4WJyJ3yIJGh4TLXAzB0CM=;
        fh=yRup0gQd4Qk9N6eUNj8kXkuKvdCTwWcKSeXZ5+LSHis=;
        b=RHb4hnU3dViyobWxzaiZy0RTPbyY7yfUouIaN7B4yv8MLkyamXT08yBpMLxAY3t/HF
         I7eukz2quBnGIgfu+9oNvXVkkZR4w3cVdIbadJPZN8G+q12HcUJNtdwuQfq8Dr9deSIq
         n5M3Vimzn5U435slMwhdNj7RIczdzqtVpKt+8pgRbw2JlVO4YSbQ+ORLL2SyXIVuIhna
         Jhc6YJgbIfCzp8A4Wi0hQ2OS7N4NeuqA4+I/aws0RncO3Kyblduutj59DxOWsxtl9gNU
         MjG84NiJIPazmY5WEr7900c/HnjDD2L50VGCTbXvhEOeb4gS2gyVBafGWo02zYbQyZQX
         u58w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773220561; x=1773825361; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kPtMaMNEqWdbKZ2n/yC7aV4WJyJ3yIJGh4TLXAzB0CM=;
        b=QN8O9JkDTlIPfN3NsICmNb/klyy9hRoK5HHE+BjR1g8D/DOFHFr9sa9cA1S/0esg++
         ocHvKKhQ7UQupv1FY+qm4NRAV2qIhnuxUP1yy5va6xNlpHKJsUiAVSSWNnkcGyVOfKDr
         ciHyiXS30ktqerDdpt1q9OHVkNTtlzMVY7HqO0pvUDGrXVIhW9Jw2vo0ZQdCOoyx8v0u
         CC5RGY4SxbShVkAAnT/jysfLyTu7MUyQVXACJpPozjAeqfpRYhTFVKPKd6hYxm41skrJ
         FGZuOrjESz5kIgVtfIq0EOoQDrlRE14Q5gtspSE/qzFaqwtg4Az1U1ogKuSZOJ/rPnsn
         MLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220561; x=1773825361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPtMaMNEqWdbKZ2n/yC7aV4WJyJ3yIJGh4TLXAzB0CM=;
        b=gGGT9zSU/3m5KUiyWioDPVmgGnFk/uxjL0IbjaBxBs+BhR7TaHBHVTKRNXMH2v1t74
         vxmbhrwrWM0H9ISzABXZj+6CJUNz0+EmcvMwnhVswYZB89OoZkZznis9hRP6y+EKjQEX
         fxNDxwbR12RnZre1gXBhBFLfW1Nn00YLKz9xzh2cMnlxi9KPj1V6tqKn8GuUw16Xkt6V
         OKfaXXESDGCjLthtYEUterKpXq3KV9oxY/PuC+hFO7A7PSxqJ+47bXnYFWPeUO1HYdTE
         FfctGKEDirwFisHjDMLCUK0o2NjT1E2ive0PtVFwKbvLtYMpSCP3u6lceMEvLL18TKbG
         kFew==
X-Gm-Message-State: AOJu0YwWukX2C4wYIK8ApBSnwjBOqs5+hDVeTmBUJSucLEAZwL7ioX8Q
	h6vR+w4c3ClaBXJSnjk6nozW6lfqKyG318ZM2U6fcoYrPr1vb7MFyiQEzKg3UVS5P5L/kuIeyS/
	bss1JxraU4DCi4rq1k/lOUiIsxEaY2fLqRA==
X-Gm-Gg: ATEYQzx2kPcTPyOu3I6eWjVwfAycEd6yZTDxn/hExn6FbtUN/sXzJYXEWSQw3GRS+2s
	BlQMTLsleRe2Ib+kazKzacsj/0xlrkSEyiAyx6VYM7cEAmSlE2Mphe/Q0160b3S8EN0M/JqeP01
	qDtnI6ZXd1N0JuKwOx/bvKJ47jzxZTXHmJm6qzieTs8Y7f1jqlwIjz6PA4bEzLgUr+p2DQt+6dd
	1Nl8d8izGq4P6mleG04N7N3BE3hffbc+scT4iayX6CMtwVig6WPydZrbZ33Nd+uP8bZ4LcmTbBE
	24D8c2K+DARQkDaTwU3q0UGCXoj7nKb/u97wg4sj7A==
X-Received: by 2002:a05:6214:230d:b0:899:ff66:814f with SMTP id
 6a1803df08f44-89a6653f26emr20997866d6.21.1773220560734; Wed, 11 Mar 2026
 02:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260311082523.711109-1-changqing.li@windriver.com>
In-Reply-To: <20260311082523.711109-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2026 10:15:49 +0100
X-Gm-Features: AaiRm53dkd5Rl1SlYRL8Wjc5mS4hBH4neqwQMyEOKd5vEq-kaesuYk5y_fwvzfg
Message-ID: <CANNYZj-8T7fs-mnfXCA9AGZdt2J_uRrFQE0o9_szrXes5bez=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232850

On Wed, 11 Mar 2026 at 09:25, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>
> Fix do_compile failure:
> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory

> -DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
> +DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native libdrm-native"

This is not seen on the autobuilder, so what is the configuration that
triggers it?

Alex

