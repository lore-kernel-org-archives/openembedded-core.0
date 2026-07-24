Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9422C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:41:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15753.1784886078025736067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g9k6j+Qz;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8efef6533aaso1605816d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784886077; cv=none;
        d=google.com; s=arc-20260327;
        b=h0XuJgq5VrM31vn7SucLl7LdEwo/XUWstfyTA/3gWQmdTGdHD7xZ+btl/REy55fLat
         1kAvkQfuQZpgWJRBWQ9OzJM1NuaxvBFok5U91xeNmFGde/+Meytfe9rXd6Z0G8mnNd0f
         uM/Ps5SH7WPTW/Y+plDii7ineGsHyDW96OZPKVTcYnHPh00zju7AvZzTFGjwpMUOVnDY
         BspeOv+U1LAkLF2n7lA1AjOGQiHmy2IuyMBimbY4keid0PJXDE/tjPXEdllka6/Kj9GY
         WFYzyTZRbHL9v1wqJrdWJDOVZj+5bepZdm81r0QttaD4h80nc/us5TR0AoOE+RZ3Wbem
         jt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jy6vFiYQAeecuUsvcg+n+wvVdhVX3nxD37DK/TmnNvQ=;
        fh=TMIfwxgAU8BuWOyKrzhPp3htqU9AnG2dhnCwktNY3t8=;
        b=NKUB3fMuLwn3U/9bN9ulp2MzzDv63jXc1S7foap7SYiVcxui0/sCjjeuKsyfmdKT8V
         DldXaSb9CA6GcWhYuhHsRKlXarSUCtAOAB+IO5CkjrcO+9094QvcIxMJlFh2PeT1HZKe
         bxe8YHYIXvCSOUc0p/weu5/xFIM4R7IIht0WEN5wOSM8YcVLp2wjB0gEm87YOFHOC1oS
         5ExeG/qvFyxCBnsOa/U/gFjIDz6o6WGIxD+lhc/+rquudIaH5xmTVP/+mEFFrxI20mU8
         P/0jeoxse65ijP0nTcrW9DRSFo19MksvJeshDBZQW7lFYS5V3ScZxR+Y2fTMSJnOFkoZ
         b2Fw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784886077; x=1785490877; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jy6vFiYQAeecuUsvcg+n+wvVdhVX3nxD37DK/TmnNvQ=;
        b=g9k6j+QzNVpQCiSUsyu6+u/+eyOOWqkCV6H3yaOjbmVhik579GgKtEwyGAZfbhW7XT
         pQC7DqHOoGD3yLl/WuF4GnBpkmlvBlc8JMMB+KF3aTl8+ay17SMKfu3yPrjfO1gsK+hk
         7cF2vRYAQxicBydBl51r88IHqAmZ4cFroqX4CTbgqX+mhXtef8j4qM6cMt6/yDyO9QaL
         yiqG/pN4iHzveHOCdYaV97NwnpDp58KLYmYicFYEFtD04ae5nzsamO8ONBbv9FTRO9RG
         URWdjQSbv6LS6hG9megBZ5cej7SIQ17gxMnAawf38k/uoLngMFR790jXYjQmiUxrOuFV
         KTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886077; x=1785490877;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jy6vFiYQAeecuUsvcg+n+wvVdhVX3nxD37DK/TmnNvQ=;
        b=U43uZkWc6KVD3CDd2Ku2g5/gJeEgeP6HeAkoXawXOdlC22ena1AtGd+HVv8PP981E5
         s53HDh2QC6/Gr8nuZLCFsgekbSQMLnSyQ+lqdHujYRLCFJMgRZ2LFylbQvY0HidUjjyw
         FjZU/iPh1mV8GbwWCjzIRJnhMF6qeVsXEEcVIAgX3/i+TnYF8jSVcaZQ+lVQV8a7L3JQ
         0o+ux2oBidF4wLpFL6ickjYowWwPlcon8r82y/XOew7P9QQZtMCah8kiYtFnBrcu3o+u
         lp+DVq/fTk5pPNimNocT6901TYyYtrQtSIK+s1BpQLomEi8IQXaf3qTo4y6IcQl1SUEl
         Ilig==
X-Gm-Message-State: AOJu0YzyDw168k3q5ofI42YJC7zZIvW3+oR/73y3hl83hW0InXHK+vff
	c0tiszZnWIhy8tLuMgp0WIRwg8VQ9fc0sBIQZBTZVDwQttV3vQq8wfBwHuPII/pmoam0luNzA1q
	S6qYJH84Yl3x/exYeeEFu/vS7KiHdTgHvcA==
X-Gm-Gg: AR+sD12bevhjdZ8YEPWtXsPiZiWimk4i7HN2rP6UZr3jIY5y6tJ18SD+4urpLrRobqF
	BLY+xvqhlaQHP8E1En9f6UHA/B/WZI/Jpy/SWTJmCBVsd5fHo9dwo2qUaLggTdLWPpM/zsng9DM
	HiEcwdYTxrUbtHIX/LPwfTmg+QVv9QhFqx2uOKK+OJMQBBC30XpDweN+exs7vJvh7upPfSCFOEG
	7L2emyxr1Ebrs4hHnC7DssfY2okXEOAfU/RTqo4L0ivGekfLP34O6naa6Yhjwj+xfIT9gvC+efq
	lSroeYgeVXzUoz/vsq76
X-Received: by 2002:a05:6214:449e:b0:8e9:f62b:8f92 with SMTP id
 6a1803df08f44-907ca5ad160mr78802506d6.56.1784886076946; Fri, 24 Jul 2026
 02:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jul 2026 11:41:04 +0200
X-Gm-Features: AUfX_mySzSheRzRUlwwUePsuhxFM6TteG8Dqn1mMwIVLgU9sEpvl3QRM__RReo8
Message-ID: <CANNYZj_1jYeAKoMu57+n6mWdp3cqyWQSeOMLnOViX+MVS-pQTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust-cross-canadian: install
 target-specific env scripts and fix rustlib lookup
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241923

On Thu, 23 Jul 2026 at 13:21, Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=windriver.com@lists.openembedded.org> wrote:
> Also update `CARGO_TARGET_<TRIPLE>_RUSTFLAGS` to add an explicit
> `-L` search path to the target `rustlib` directory inside the sysroot.
> The path is selected dynamically based on the multilib configuration,
> choosing `lib` for 32-bit targets and `lib64` for 64-bit targets. This
> ensures Cargo can locate the correct target-specific Rust libraries
> during cross-compilation with the cross-canadian toolchain.
...
> +               if echo "${RUST_TARGET_SYS}" | grep -qE '(32)'; then
> +                       LIBDIR="lib"
> +               else
> +                       LIBDIR="lib64"
> +               fi
> +       else
> +               # multilib not enabled
> +               LIBDIR="lib"
> +       fi
> +       LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/\${LIBDIR}/rustlib/${RUST_TARGET_SYS}/lib"

Sorry no. Hardcoding libdir names like this is not okay. You need to
find a way to obtain them from original definitions.

Alex

