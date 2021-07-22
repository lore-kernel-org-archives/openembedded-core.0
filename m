Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.1692.1626980429079384601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KeDEO+8v;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id m16so10025149lfg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yLYmJzdZ3P+u9Eu+LUcU6A5F6TDv9Nzkiu2atQqyRgo=;
        b=KeDEO+8vRGd1BV2YjxSNStbHo5noNbdcMIvdQFt8AmeCjdykMOlmUWsA24yUiS4D42
         aNX4yq6U3/pWmX5R2VPf1IpW8iypLu95L2g3adJ0Uce/u4Wau3alS1XCYqRSRHu8DEGc
         mps2t2WriyHuKpg3GqnuEvfrXH70jKCfYjj6wSG+c14WAXJxbdCSocBqwE4LlNw3oYzu
         EtopHn26cvHqIYH5r90kfZL9boBAWiObQZtRXRVeXfpt6P9YV7XlMDuuQI9/gWrO4f38
         8de/nUjVEf/GdbabgkdChpnwA3QN51SFWnvKFAsvEslTQN3YIGAQPgGel+7gO91gbUeq
         QAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLYmJzdZ3P+u9Eu+LUcU6A5F6TDv9Nzkiu2atQqyRgo=;
        b=BLfyh+CnDVdMqGf+qZ4bZH+/qxef2xI4omu17T2CFYyHKttG8GiDtJiW536+bymUtV
         boVCh+EtLWjqbbyO+xD6GnG43kroCs7M1nYHqdxbpow1v26IxmRU8RnETudbQrd11eFu
         DqvhGiDKq2JIm935+aGXwZ7eix8pRJOHkTEO05aN1Kfm+72rqaTKBxMTGszmoV3JmvoT
         LErpBIhlf8WfCmLVMQRdVuxty6AzXNpJkUUJpOEf3ZQQEjeRxaTHh+OJ6FivQ03+3/mG
         Pxj6GTjfGD+EX6OGyXw2Ar952w2Kfy1+UtGJEh/gMEJbxZH3CkU++LeaZVd0sqmDh5tq
         h5gA==
X-Gm-Message-State: AOAM531pK7xFObP/Vnj25lu5j1Kd4yhRz+dxuKHYUm1I+oh0gW9+5xqo
	+40owX/G55H0ymnbqvHd2tFHTHTH/GSes2BAAZ0=
X-Google-Smtp-Source: ABdhPJyzw0pMfV569JhFalDcdzHrt86tAgnjWos0c5a/nq6qeLjbJrcHLrs+IzJJPasqT7Ianxib53XcXatiTE8BrFA=
X-Received: by 2002:a19:48cd:: with SMTP id v196mr572361lfa.269.1626980426937;
 Thu, 22 Jul 2021 12:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl>
In-Reply-To: <20210722094822.1102062-1-dwrobel@ertelnet.rybnik.pl>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 22 Jul 2021 12:00:15 -0700
Message-ID: <CAJ86T=WmKA=aSWBF0iNv8=MiWQNu6Rj0n+3ONDKB481OZC2nng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs: remove ldconfig auxiliary cache where appropriate
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 2:48 AM Damian Wrobel
<dwrobel@ertelnet.rybnik.pl> wrote:
>
> Removes the /var/cache/ldconfig auxiliary cache directory from
> the rootfs when:
>  - read-only-rootfs is in DISTRO_FEATURES,
>  - ldconfig is not in DISTRO_FEATURES.
>
> In both cases the /var/cache/ldconfig/aux-cache is useless.

Should there be a test for package management being supported in the
image too? A read-only rootfs is one case where it's not possible to
install ldconfig support at run time but a writeable rootfs without
package management support would seem to be another?

> Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> ---
>  meta/lib/oe/rootfs.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index ad9fd77c8b..80673fab3f 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -302,6 +302,15 @@ class Rootfs(object, metaclass=ABCMeta):
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
>                                    'new', '-v', '-X'])
>
> +        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
> +                                        True, False, self.d)
> +        ldconfig_in_features = bb.utils.contains("IMAGE_FEATURES", "ldconfig",
> +                                                 True, False, self.d)
> +        if image_rorfs or not ldconfig_in_features:
> +            ldconfig_cache_dir = os.path.join(self.image_rootfs, "var/cache/ldconfig")
> +            bb.note("Removing ldconfig auxiliary cache...")
> +            shutil.rmtree(ldconfig_cache_dir)
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
