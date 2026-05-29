Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D8CCD6E50
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 15:23:30 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12670.1780068202849122059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 08:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S0zdFINO;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ccd86df7d4so23659016d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 08:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780068202; cv=none;
        d=google.com; s=arc-20240605;
        b=QuP2LlkmSx4Hi0/Qf+9ReQlmaTAmPzwxQ7nrFs+D4S/Sy3oYnO+U/ZZ6rvO0Zihj0F
         HjG5WWIgP3gj1AlkvSuMggWcfihQyN12MBKeGJk/CZiLUnf0I577DUcKf44D64kc9koX
         OangoyqWX35p2ytVuWy9WGqlrxOKD56yNEAcWVq3fCVDP+c0QJXWxf30wJqdP39pDsst
         Tf4v4gWwzQo/0PH5NhZxdzcR1nHQrgOgvZv4uRHokKD4dIAsyVdn1bHGJmS4FcuJC2Tt
         8oeEUZhKiWRwZ+xTu6xUZRxqkSANesGw1ZRJ+O9zyEJir15xH6GieqQ/Ze66xp6WgMnH
         H7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P4V6tYMiQI2BY+aDlbnHYVyeA1POnwVZ/3UT+mD1s3c=;
        fh=1fa5HmGIEitzdCrM+iFQoOAJt1ZSUN4QhNbwog+eX0Y=;
        b=cF3z65tSOo+HjtOxXuRYfM3IPYuMs3jgO1KRGoWNDBtdO7oV07ens81VlY+pXIYlnS
         IO+HKZkVwyEfPiEZiBoGsInORk4ZX8xeyixOOeb8oIENgzd7RUfvuvv6CeVZ1x/C6ded
         Ppuoiq1a4a8b8sYpi1F3y/1DfvxHbyopyP6wxZRQZp3AvHwmQ5NYtz1EnEEyI9kCYDxA
         hlrY9zsFvLUXV6OljQKDd20y3dwdQdCgnOveN6y+lpUa/VqK+VGhmeknrRTxKu08X3eA
         8HRMVuArmeg603GclHx2fqPlJeCEq26Pw0MRhqPzTvtG+HHf5LLSlwGgloN+8iW1FkEm
         5G6g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780068202; x=1780673002; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P4V6tYMiQI2BY+aDlbnHYVyeA1POnwVZ/3UT+mD1s3c=;
        b=S0zdFINOwdrfb8ygY2uE3RBLzOV1u4/k0Yh8+dMcng8rPuSTVwZ7kZxV73rz4ZNaCT
         q0GlGPfMf013tz7KW2mQ6WyawhOgB2qAA7+l5F8/YwHhhUZhonKD7yLuRrYxyWM9Utfw
         AksJ2U+1SfcKye+NnVYIGZ68fdrqfCqPPZXXg1CQRHbHo7eMKLcN9l1wlNTObcVia/q0
         uVOKWQIVYC4Qz8idet7Cm9Ke+ekz/ujxsWGMkoMsmf/zBlnBy++oibb1/NQfJiVA+++E
         zvReu1wj4hFecAjHMw9zZZ/NDA4feXuZPYqgUd5ZA1COiRHjftcPd0utsM2RbEeSYo0F
         sGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068202; x=1780673002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4V6tYMiQI2BY+aDlbnHYVyeA1POnwVZ/3UT+mD1s3c=;
        b=d3zeQPCXwEjQ+rBh2qSUpxm4iIDX2Ra+8EszNOaW7IbF9J6oHIdn0zO0M8TnCZEIzy
         mJg43iZQREBI/KxnYVaDO7ojiOMAHL8nNTsUqbwgfr87mzXmreK1a4+ECZCf8TkVBzHU
         28twh136zKyRAwezI/Ucl64Rj/MFXc41QsvL/MoCb49VqFLyUyQg+hOj89EfrqxjVcx2
         VypTNmgpzCOivRHl95ZaYoc3d4kRnlyI2zEv2uvqxuRETvAVpNXjSlqSRV78oFyveC92
         qXPJHBp44PfnOgalZusYZVmvfyHLPLExJXplBfAcHVIgpZWIwmkRHQry7w4iAVcCQimu
         PZQA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZYsqMdrSqaJzyFk55zFg4UTF8qzrczVCupTnTwpRY0etVrWsxAtkkL/kBbK4rLrx9ljDIa7LU3WThS99Vpzl2NA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEWGiYizOPuRTAsG0+4Dbq9Zc7LlWNPTE/E5rv62Ir2bX9GrXX
	3uSnBUaElhqpuoTX0SqMU+x0Hj+x4IgIbBjgC76VFmLZcsPcKusdHhuvihY/djifJqW5p4OvFII
	NFXquAleFqsvURzeCNcRryKGtPF8BMIK1JtZR
X-Gm-Gg: Acq92OFY+fHTsFvppwlTdslnTdvftgOTITXI/GcI438Hi4RedHCYBshQFmvExhezWic
	8yzz3y75e17ScfACRqZADEOvNIZaVhzDbEU9qRGkIShfcLdB5c2Vtwu7o+DH6TdvvO2e9MfCdHS
	KROS5FxUlqgutpbFAr7PzRsDRg7r04nYXz5KMbzb7tzR67JAvWnHV9sO8DbXLHBGhLk9yYucVwe
	JSDAIMfE/s5igMhj0zBJXaiF6U2OAeHJpyNk72TLpBy09lBdLZmpgUUBWanMFJT9sTb6EldiYbU
	OlxJuBVd7OYr32ulWQhEfo0LFBzzbxSHaKdgNHDV8Q8KCKFnkg7R
X-Received: by 2002:a05:6214:411:b0:8ca:2410:4b05 with SMTP id
 6a1803df08f44-8ccefdf79d7mr1669546d6.40.1780068201635; Fri, 29 May 2026
 08:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
In-Reply-To: <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 17:23:09 +0200
X-Gm-Features: AVHnY4LI71hfnWeXTZtM6kmXMMlyytiGfOLddKC5IN5w0JG_O_REu743MAQG6Xw
Message-ID: <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 15:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237761

On Fri, 29 May 2026 at 16:45, Quan Sun via lists.openembedded.org
<Quan.Sun=windriver.com@lists.openembedded.org> wrote:
> > glx: failed to create dri3 screen
> > failed to load driver: vgem
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3924
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3786
> >
> > Can you have a look at the issue?
> It seems this issue is not caused by the qemu upgrade. I also asked an
> AI agent to carefully examine the build/test logs, and the following is
> what it says:

Unfortunately AI has produced a total hallucination in its analysis,
because it looks only at the build log given to it, not at the actual
change that is being tested (e.g. it wouldn't see in that log that
there is a qemu update, and it wouldn't go and analyse the qemu own
changelog and commit history, and it wouldn't run the same test
against qemu 10.x to narrow it down and so on).

I went and tried this test with qemu 10.x on the same host, and it
passes just fine:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3928

Then I cherry picked the qemu 11.x patch, and the test then fails:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3930

It's still possible something is misconfigured on the host (it runs
tiger vnc standalone server to allow X clients such as qemu to render
into it), but the issue is clearly triggered by the version upgrade.

Alex

