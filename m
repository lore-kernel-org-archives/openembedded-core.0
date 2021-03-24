Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.3309.1616578910244102662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 02:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=2FBwQHTv;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id d191so12499108wmd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=btTtn7hDaWt6iW4ENWKtJUHdq3iOb+5jnQsLVqGKHoA=;
        b=2FBwQHTvgVJhAAxek3sMlq42d6ADF50ZNC6pzBeB8hI5pulv5sFf2z+3JXEXKBhOj8
         nuOLFs2iMiSExZMUlw2cmMTBC94zuZb55h5GE/e2KNNoHVG0mOxidsPe8aRjg5Y4mCtZ
         JW4xIxNkoSUW9QRAF/s0G5nJmJN9J+cS+v7hs5rSL45HeueRiw8DSWgGfddcWR+pZE+6
         46nAxv/L+6yQ9soH9aIrO7BLbNs501707R4eM8H6nDX6TDZav2WFYhR0tcO6aQfdjkve
         S6xQf8T+cf5IEemuZZ5ME6CT0TbteePgXjcCPEuWkCI57jgKumPNltvWrar5cjupC983
         8kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btTtn7hDaWt6iW4ENWKtJUHdq3iOb+5jnQsLVqGKHoA=;
        b=JN15sZXwsOUMBuI/fGoo8qGcvdR0Mgt2wXbdNU/3NkTZrgNgGZsN4hMDfgiUoBWfm1
         nWwyXsgeyZVsPgoZSw3Gw5C2hR5OLEv6ubutdg67OujnxsQcA7nGcbhYv+hhEm8l6gJe
         bKQG/JE8E1J00OI/WOvIwVWcJigusbGQWAMnQSOw4GqEqy1BK/bhd3b+4GZTu8wHLjGt
         lWEie0dnhdwl2z6vPLpeTzWNX2vLXkSSUEnHjxrs8l0YJCsrsklMYYQVqJ+3wEB1l0mn
         RtNuwoR4mV0q3OtoB9FIpAbtxQcFZPjrRxoDCxQE7YVgFV7+1fxMfJT9GjU9KQf7ji6N
         J6ew==
X-Gm-Message-State: AOAM532RtzZYNjnTMWcDGPcmUcBHuK8iHg+DajKhbKRKbEKzkEoN87gE
	qDJAe1dn6Wt2pk9mbjOs4cMY0J6tWdfkx6cF5cjFgg==
X-Google-Smtp-Source: ABdhPJxXVwbxGBKcUAIbU7+V3NVk2fksuP2RKch03v8BjKXC7JYR+rv9RDYZd8h2/M2w2/IAbnKtA5YdzNzGgeKY9aU=
X-Received: by 2002:a1c:2155:: with SMTP id h82mr2043298wmh.169.1616578908488;
 Wed, 24 Mar 2021 02:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210323212814.567119-1-ross.burton@arm.com> <CAJ86T=UsfzS0KMHVpyXkeL3aio9mU-9hszabKq56EBeZ+RxEuw@mail.gmail.com>
In-Reply-To: <CAJ86T=UsfzS0KMHVpyXkeL3aio9mU-9hszabKq56EBeZ+RxEuw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 24 Mar 2021 09:41:37 +0000
Message-ID: <CAAnfSTuPcUV3FSThU_Zbs2Bn2vKJykFboGmiH+ZsOAHvj2VP0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: ensure BUILD_* tools match target tools
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Mar 2021 at 21:53, Andre McCurdy <armccurdy@gmail.com> wrote:
> > @@ -541,7 +541,10 @@ export BUILD_AR = "${BUILD_PREFIX}ar"
> >  export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
> >  export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
> >  export BUILD_STRIP = "${BUILD_PREFIX}strip"
> > +export BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
> > +export BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
> >  export BUILD_NM = "${BUILD_PREFIX}nm"
> > +export BUILD_READELF = "${BUILD_PREFIX}readelf"
>
> Do these new variables need to be exported?
>
> As far as I remember a few of the BUILD_xxx variables are "official"
> autotools variables which some autotools packages may expect to find
> in the environment (although googling now doesn't find any
> references).
>
> If so then the rest (i.e. most of them, and certainly these newly
> added ones) are OE specific and only used in OE recipes and classes...
> and therefore don't need to be exported here.

It was all in the name of consistency.

The Meson cross-file sets readelf, so to mirror the new native-file
also sets readelf.  There wasn't a BUILD_READELF and if someone is
changing BUILD_CC there's a good chance they'll be changing the entire
toochain, so I added any missing entries.

Yes, BUILD_* are effectively OE-specific so we could unexport the
entire set.  I'd prefer to do that than have some exported and some
not.

Ross
