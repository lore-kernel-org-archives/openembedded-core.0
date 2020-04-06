Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.6222.1586156444934750346
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 00:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cDsCYJ7I;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id 71so5218251qtc.12
        for <Openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 00:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=d4+2hwNANB2OrXSZxLV55dFMgjV71SO5C+bQLnsd7BI=;
        b=cDsCYJ7I6qbfU5FD5uODiGEYax49Y8tAsX492GNOUcMW3H7KoBE9TjfYXdpiPHkRwD
         b2KB+SXe9wL+zM5JzLOnf4LjCXcjsnAzum3o/F2PHU1TopYabz5qaGvK9zLoS5NZLsn2
         RwiBxo9uAgBucVuoxHr4QSOyxRoW3cbk3yMZNdLEEgJGZSDC//c2GJHtKyRYO5w0b+sT
         149frZAk/PMO8jYrG/wc4z0ph42hMClEfa2OxrhjJk565e/6vnh0Sv3+aUNO4yEm1Cj1
         7ohRZYgTyHILSFRgxweuUbjOHEmD++e05Js0X2pSZnoeqhnmruegyHMWS3RrHXGH4+Js
         8UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=d4+2hwNANB2OrXSZxLV55dFMgjV71SO5C+bQLnsd7BI=;
        b=Y36BpTvzNEkgHxLjV1ffkCXb0KZA9ElCOuawJLakSKtQBk6hhzYDmkib2hDeEhh0yv
         rv5CX4wbJ30yaPJQ6J2orGvONz3YmCGS5y9Y6Pc0QVxRB+4GwSCcwA7SlGQ+4ckBueuh
         5+HDk0vuajZ8dA9UvZ/+ap7SqgTTHUCZLfc1d/kUu/Az4JRaJOKcPwGYpmgB5RliaKbP
         t2+TyuxKLYGnd1hXXoQPJdVIKJlOatbiGYC5QBmFbdiMp4kfrAbBw47RYui3aEpp5lv7
         9qFTMkSNhqC5OWNxAm3RtLDobBJA/bxqD+7payg+2FugMb4Sy1wnZgiPZHtPa9mxOC3D
         ckbg==
X-Gm-Message-State: AGi0Pub8EkjeNiaIDfOJ1Zr6hKql4fu1yCWObujPq4Hf5u6xNyLfejSI
	LuUJ3e8lWcdFn8s7XB+ZRllwU3d8HpKx9KQ5PhzRVWQF
X-Google-Smtp-Source: APiQypK6+rwNBC/wpUAqgZqWIhMCHxRxc5TpPHidZpkWta5SdX1pFv3DIWt9kh8uPXdrB9m5U4q4JkQN72hkAcP3UXw=
X-Received: by 2002:ac8:1bb8:: with SMTP id z53mr5175676qtj.132.1586156443861;
 Mon, 06 Apr 2020 00:00:43 -0700 (PDT)
MIME-Version: 1.0
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 6 Apr 2020 12:30:32 +0530
Message-ID: <CANUMPcVyxL9c3x0z9cv6EYads+LGeYL4ccwFbnnvyA_gkx9MXg@mail.gmail.com>
Subject: librsvg-2.46.4 recipe build failure.
To: Openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Regarding, https://github.com/meta-rust/meta-rust/issues/264

As per my analysis the
"openembedded-core/meta/classes/autotools.bbclass" inherited through
"openembedded-core/meta/classes/gnomebase.bbclass" from  seems to be
overriding the "meta-rust/classes/cargo.bbclass" from meta-rust.

$cat openembedded-core/meta/classes/gnomebase.bbclass

GNOMEBASEBUILDCLASS ??= "autotools"
inherit ${GNOMEBASEBUILDCLASS}  pkgconfig

The "librsvg" configure  and compile  scripts in "temp" directory
contains "autotools_do_compile" with "inherit cargo", it should be
"cargo_do_compile".

Reference:
"bitbake rust-hello-world" builds without any error ( with "inherit cargo").

Is there any way to disable "autotools" for "gnomebase.bbclass"
through "librsvg-2.46.4.bb"  ?

Regards,
Vinay
