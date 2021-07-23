Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.901.1627064501776451506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 11:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fedyU/Ln;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id z2so3553234lft.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kd1SLDBCA0outcTatLoC7UPkg+WBO1RlJzt2zIF2MM=;
        b=fedyU/LnNgHBnFgMmq+05eeA17B0f7nIpm/3GMG4JPdaSPk9gzTbV8+iGSdUq/DsUb
         cTR+PiVnBelouI+pQTH/xLymPXZkvvj4+xKeHvWnuGKBz+HYtwkQquSg8nJveRFTpe/M
         5T2/1zAyKNE5M/x3ROMTSdBgFKb965wrDa15rbfXjmKhhXSXyq4cjFGFLB8vvOhqfxnD
         mbe2GdI/vIC9DeT90sANNdCtI1tlics9AzQ3pUdrX1tQ4Ss6lrG2WmC4iVhVwgBWPDx8
         kN7PddlPe2ANqt5XG/JzVEshtC/1ev35ngzeD+7G7r1OdpzxaJdTk+ZHSOOM38GYcnKb
         l+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kd1SLDBCA0outcTatLoC7UPkg+WBO1RlJzt2zIF2MM=;
        b=Qwz/sF26xYFQ5KCAP9X5xUPGiUjlb1Z+1URrBd/YvY4zUmC3jndDKQgNxPJaGyuzn4
         d0DenAbHQ8/9bl8wtVWWsQV3v+73g9MyteX681zFQEscnkh8YMT6I1fdbKuRJ5vOlAXW
         hYSI/CDbkIyaI67B41o08cr1/sghdSgj8NyyO9RI8NmGKTnkGSuZ1wTrO5Vav/ax/YQY
         S/C2XAToeEhY+OxsqGpy1zOhl2fQg9R9AtW/9cAOONkcltsiL2bAyvQrLuyJNaN+dVoj
         lTjRgjp8MH4VGMELapQD05FhQATG7gAfaSmdqknXTydNlaZddCNv3zpLMqPyF3WXnmbG
         C7/Q==
X-Gm-Message-State: AOAM533+1rB8R7+JNKLmanhxxXlKHB1CrkYUk1DTkjwEkHK6XQp8wACE
	BL+mqrChZ0o4KYeeHEFqd0I6Jy6vYz9dfNTHrWI=
X-Google-Smtp-Source: ABdhPJxlwIigSGXt1L15LLawA71958NZ+vouWGBtr3ftGTBTAy83suVuRtRTYjPyzwz7mifo3IHpgUKLMj7bl/IQm9k=
X-Received: by 2002:a05:6512:2205:: with SMTP id h5mr3930434lfu.257.1627064499827;
 Fri, 23 Jul 2021 11:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <YPnzFOuJhmDW/kb4@piout.net> <20210723092141.366318-1-dwrobel@ertelnet.rybnik.pl>
In-Reply-To: <20210723092141.366318-1-dwrobel@ertelnet.rybnik.pl>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 23 Jul 2021 11:21:28 -0700
Message-ID: <CAJ86T=WoGumcNmbX_7xN1rma5AFcUwVhn6W_H+WKBRYXMXb-wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rootfs: remove ldconfig auxiliary cache where appropriate
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 2:22 AM Damian Wrobel
<dwrobel@ertelnet.rybnik.pl> wrote:
>
> Removes the /var/cache/ldconfig auxiliary cache directory from
> the rootfs when:
>  - read-only-rootfs is in DISTRO_FEATURES,
>  - ldconfig is not in DISTRO_FEATURES.

Comments say DISTRO_FEATURES but code is checking IMAGE_FEATURES in both cases.

ldconfig is a distro feature and read-only-rootfs is an image feature,
so both the comments and code seem to be wrong...

> In both cases the /var/cache/ldconfig/aux-cache is useless.
>
> Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> ---
>  meta/lib/oe/rootfs.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index ad9fd77c8b..8e63ebac9b 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -302,6 +302,16 @@ class Rootfs(object, metaclass=ABCMeta):
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
>                                    'new', '-v', '-X'])
>
> +        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
> +                                        True, False, self.d)
> +        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
> +                                                 True, False, self.d)
> +        if image_rorfs or not ldconfig_in_features:
> +            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
> +            if os.path.exists(ldconfig_cache_dir):
> +                bb.note("Removing ldconfig auxiliary cache...")
> +                shutil.rmtree(ldconfig_cache_dir)
> +
>      def _check_for_kernel_modules(self, modules_dir):
>          for root, dirs, files in os.walk(modules_dir, topdown=True):
>              for name in files:
> --
> 2.31.1
>
>
> 
>
