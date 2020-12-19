Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.11942.1608398693288921053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fRQztJcW;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id w79so5209588qkb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=slyWN9wD32KCl/4AuweNYToL2dq2Z/F9QN0AuNN0828=;
        b=fRQztJcWn+PO4zrRz5A3OdBzI7XuMTdcKYz3QnsgC0XhA3sXdhEUuKcCvr5dfA+d5K
         +UwWXMbI2VTDjzYv5yEJn9+fl3WSmoQBtcGSVG0g8Ifdggj77nMPX+JhUM/XbqKr5nhI
         KzMTBmb5J6K7StQFZzaOlcDzX+F8CuTei4B894wOwgku+fsMXxg7nY0eP8SghcWnOn7A
         u1+woiIqc2mAbz35LngXPBzylMB31Ja7v2s16V3EGPBg59mkRZl4/didwGblt3JwyCv2
         +lbqonsxZZQF7/QrPV7r3nr6cztrAuodq64OX4uvM0spLx6pybw2zby/G7w4l6zTx9H4
         xA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slyWN9wD32KCl/4AuweNYToL2dq2Z/F9QN0AuNN0828=;
        b=UOFLfTEJ++69ZeoTSLpcZeX1uBf1dXOKqxIJIKtQ8PWMp6guqaPlo8t3VwpbY1rLnG
         SJ2oX1/H0/L3udNcwYxZHBcvbFpeOZzPICmLoyaWoaiO/0TYZVFK1A0w8L85vXMTuyC8
         yF9l4sh2COlxURC473Mjw9/LCtbpIYjkLWFmZ+XSR444O1rIud7kXfKceRQxsK4xun+P
         76iwuA2OE+5zLUrWp3ayukvd+MS2ji3j7Q2Gy5eggiSM26znHzQo1tHldyBRFqwhCP8X
         96O7HaMELYkQUGDvj7ndZqWYAWJbqTpnIShZPnwpsCsXCwZl5PBcIoPdAu0OKC07o9Nv
         8kkQ==
X-Gm-Message-State: AOAM530EmDnXVBXa/UGwVYbB76hXDv1Ss5KkhUVtVSYPZRcNGHbCBH7P
	PbZNMFdBtST02STBykqj5CWE7L3xvtAIRbdWIx8=
X-Google-Smtp-Source: ABdhPJxBDgR0ZQu7Tx33h8LecEWU2bIqsPkfRnccWjCoCHl8CPfnR5HWi45q1v9UGLsHFhfxPoxWPqe6F5CLbID39QQ=
X-Received: by 2002:a37:6189:: with SMTP id v131mr10483168qkb.337.1608398692309;
 Sat, 19 Dec 2020 09:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20201217192738.14311-1-tanuk@iki.fi>
In-Reply-To: <20201217192738.14311-1-tanuk@iki.fi>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Dec 2020 09:24:26 -0800
Message-ID: <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> The PulseAudio project plans to drop Autotools support in 15.0, so let's
> switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> some old cruft that sounds like it has something to do Libtool, so it's
> perhaps relevant for the goal of dropping Autotools. The next two
> patches disable features that aren't available with Meson. The last
> patch does the build system switch.
>
> Tanu Kaskinen (4):
>   pulseaudio: Remove OE_LT_RPATH_ALLOW
>   pulseaudio: disable EsounD support
>   pulseaudio: disable GConf support
>   pulseaudio: switch build system from Autotools to Meson

I am seeing build failures with this patch series while using clang
for compiler see.

https://errors.yoctoproject.org/Errors/Details/539474/



>
>  .../pulseaudio/pulseaudio.inc                 | 69 ++++++++-----------
>  ...-option-for-enabling-disabling-Valgr.patch | 67 ++++++++++++++++++
>  .../pulseaudio/pulseaudio_14.0.bb             |  1 +
>  3 files changed, 97 insertions(+), 40 deletions(-)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
>
> --
> 2.20.1
>
>
> 
>
