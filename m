Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F4CC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 10:22:51 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.48507.1743416564760933501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 03:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eBov/IRp;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e91d323346so46164506d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743416564; x=1744021364; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=roGsR/RtIIXnAq0HM+Tewo4JZcX2qhLkIlEgv2axrKc=;
        b=eBov/IRpCGcPUe/njhToH3XWGwtfUKI7ntV/wXLAkaxc8hDHkNZ6vRx8GwS7dltm2X
         zRbmynczYTAiaEJ5CbfnhF2PwrapEAnSF3cLaumBuzOu8ag3bULal0+BRHQjNfWGooc6
         P2L3MTHiy8RZ48Fd1aUd6l1VAXnhk0G3eKeyy9uWE4IHOUUcnAQQc/9Eeq6ML1fiyMre
         YlP5Yil4oRc4aRecic3+GDse+ETeYBdKY3ukKomvgj3F+bEldUYXpgT6qv1LsHXU8Yy/
         tUWB9LpP/Xq+KSS1J2kEUuzao350xRAd8KQZoaIVxuYfVCP9kvZoH8ir+GrQkd4d59V5
         or+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416564; x=1744021364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roGsR/RtIIXnAq0HM+Tewo4JZcX2qhLkIlEgv2axrKc=;
        b=LfXjvg0Mmtem0P+X0IjOt/Ak9TtDKI/d1yjqQDakYcd/pd2KM8Y9itR+L429HzM4d4
         07voLvjMWdEteNdHOhTzIfygTL4iBRL1dcJML9Z4SoY+B5HiJ3pdqqeF01Gr99nZuezY
         5d8QoDn26ochVfmw5xz7dFcfDJlDL8ht4DgNcwmjHgB956Kpj5vZOHhmSJZqyhuqCgLI
         nUKOFHcoC34QuKEvMiCLzj2aBovg33v6ckvdg+K4/twtQS4SgMVFn++fTyGfEg14TQ61
         9f4TK+fbC5o8bAlXNeXIYKPxQ79VRaDotffprjj7TAgQKpsNPoKV+im4VVfsmJmJdE1T
         aqfQ==
X-Gm-Message-State: AOJu0YzhqWmDxS4JwlupuPh5Wp2C9t7cQWC+8Vrc33m996kq9XJ/s4JX
	voX4/RxSvciLUm8HMjCcURu0QeoRq1E1o+qON+2xuu12+8C/2QIiOFADE8Ga2fnoxFV9khh+j7r
	hai9JKW35E80mbpVW71KbiE954qoGRQ==
X-Gm-Gg: ASbGnctprt9y40JmiHoH0Y6iOpLEO4CbajVJxHWvXiTxdOdQHDWn6tWdgh7Eov8SrDJ
	pp1mJ5kWEPMyyMwVwu4x/GkHCWO1cJCpjmVlWLQQkNtV35Ou7ZmA6jMqiPs7j9ce+oLCYMfZ5yD
	fJ/wawnUMwWIt1PD+8B0sM/okE0jn52+t7VsdqtiMVJ3VFzseIBbQ3TlmyYXn0
X-Google-Smtp-Source: AGHT+IFLkGiVMv6Kp7csKyakCe6N1/ro+LbCBRbsgHOXxKuQta5MJwA8inM1tIsbZZVXucpmWOPALUezx4jvUqPbjeo=
X-Received: by 2002:a05:6214:212c:b0:6e4:5971:135d with SMTP id
 6a1803df08f44-6eecbb641b2mr180854946d6.18.1743416563845; Mon, 31 Mar 2025
 03:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com> <20250329-mesa-25-v3-9-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-9-f4d0328eb867@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Mar 2025 12:22:32 +0200
X-Gm-Features: AQ5f1JqeTyshx7Q2Hrp_gSfOAWUoo6quMOXovY9wHdaLpPHzHHIsCdsSmNeRhMg
Message-ID: <CANNYZj8b-ff1PNpBV9NBQ182RsmOtq9SDvMVCdPFuW9v3AoWag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 9/9] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 10:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213963

On Sat, 29 Mar 2025 at 21:07, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> +Correctly generating LLVM bindings requires several croos-compilation
> +arguments. Provide them to rust.bindgen(). Karol Herbst on IRC suggested
> +that a proper fix should be to fix meson's rust.bindgen() to support
> +cross-compilation. Carry this patch until meson is fixed.
> +
> +Upstream-Status: Inappropriate [OE-Specific]

This does need a link to the meson ticket then.

Alex

