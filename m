Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.4100.1627075216206979335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 14:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5Y88CoS;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id f22so2685917qke.10
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yGPD1F9pvrDgZD4iTmS0H0h/sDFbYalTUbxIIA/Hj4M=;
        b=D5Y88CoSeqUiHZU16xwPSVVHJSL8i4LemJsiER/WI5/oCXh8B0CSIXwwsknQf3/NTe
         8s4+CaLNeG9name4ySXZjEMm1dfz3q1LweiXfw1H6q2Y2VuhNrts3HH2VSedNmw9Hd9B
         IzqMY0BwbcU9Qi3hGxjo5Ecb7iQgiNj+o/3wg6Ym5960fGziEIvHopwwP1kEpL1oGCiC
         XlpltCZFSZ+/akrVzfo/6y5aqFc+40v5cXrKScGcgZiqr9acO92XIV72kAI6eY+K3EKb
         /6H2yDsKCbn88OuUz9pMc0VaNCnN6xXORxoxOd2Qzexekz/ahA8UhInFvaMnPCIiEe8a
         hOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yGPD1F9pvrDgZD4iTmS0H0h/sDFbYalTUbxIIA/Hj4M=;
        b=t6xs9Tr7T7XwfTFbwyF0WKFfTgW2fAIvyz/MWsb2cIwb+j67F+SKkQNxvzI3jWnn8N
         1eEgLNSVIYTWXB+0VIF7a2TJ12P6G/u+zpVkYB/OodG8ZXpa8jb0pjpjf+R4DE5nVN83
         Rl50kE/p2Hx8p92dxzEaID2n0Psw+DMoeEbn0yFxB+cddvKZgRacVvfeZHERRkyWhq5m
         EgYgpX8FZAbOO354qsXheqm+oJ3+P2EhMhaonCo8nGzuDRQ+3nqA/otIyPPhlpENjWHd
         l9KuqSVjxnnw3Nkzuo87ehrqJbyXP6G4EkHfILRSf8WaRAlRLX8XUCKChfkiLe5Qo3Ir
         kmeQ==
X-Gm-Message-State: AOAM5332erclJdMB/zadaUDENFFgOnTgESg3WHS8tl+Wp7Y7PRPa+2Kv
	j7Uy/tVc4zZtm3dBrdkvK3rnwW7iBjnZdj9boNM=
X-Google-Smtp-Source: ABdhPJyLdc79ksjTCMFKwuAbKpYeBzSZdqhO8fb0YCwQf3iTgDdMmhLnM9Ee7YzBXAUoPRshDjx0j5APtdPwEt4EvtE=
X-Received: by 2002:a05:620a:b81:: with SMTP id k1mr4477330qkh.119.1627075215136;
 Fri, 23 Jul 2021 14:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210722215047.1735683-1-fib@cisco.com> <20210722215047.1735683-3-fib@cisco.com>
In-Reply-To: <20210722215047.1735683-3-fib@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 23 Jul 2021 14:19:49 -0700
Message-ID: <CAMKF1spia0JPU23LsuUzXZ1T+i6GDOtpA_jRxiRKK=5hT0LX6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] qemu.inc: Add seccomp PACKAGECONFIG option
To: fib@cisco.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nathan Rossi <nathan@nathanrossi.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 2:51 PM Ruslan Babayev (fib) via
lists.openembedded.org <fib=cisco.com@lists.openembedded.org> wrote:
>
> From: Nathan Rossi <nathan@nathanrossi.com>
>
> Add the seccomp PACKAGECONFIG option to allow building seccomp features
> in QEMU. The libseccomp library is available in additional layers (e.g.
> meta-security).
>
> Additionally this serves as a way to disable seccomp by default to avoid
> the configure of QEMU automatically finding it (via pkg-config) on the
> build host when building qemu-system-native and auto enabling the
> feature.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 8f927bdf54..e25c2524aa 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -210,6 +210,7 @@ PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
>  PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
>  PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
>  PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
> +PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
>

also enable it when seccomp is in DISTRO_FEATURES please

>  INSANE_SKIP_${PN} = "arch"
>
> --
> 2.26.2.Cisco
>
>
> 
>
