Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.3030.1620848809176619842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 12:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eyamwO9n;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id u1so12689523qvg.11
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 12:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BxktoVwCkDDk3mNGlAFSNdLbvfUVgFaJvMHXIXISCbQ=;
        b=eyamwO9nP9sCQPRX3BINET3wTh78LiQIpaCU6n5nLJtcUycaf+FjDdc3Q66YcEWSPZ
         3b3VKut51quB326UxH93QqxETMJbBLMIGRl9KL6HC0olaGQ1ZeX6C8fcu4ay2jbnmuW3
         +6ByaVESd+sjbuMUP2eqXrOX/Bp4PZ4BKkaSHWqG0eezIsCZKfYUjuS2qj9dEkjlpwy5
         3NSX9TrC6sQAENQNfT9UelA0qM90dSBfkx0sYOr/DM+08ceqsenQJiQnwYe55CjL8otD
         YxGDmfQ1e9ioZ1jpe6PFKklQq55SWmyzGnzSCU34ELeuNJ+t68k4TP67CZ1yRzUHimTy
         gG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BxktoVwCkDDk3mNGlAFSNdLbvfUVgFaJvMHXIXISCbQ=;
        b=APlipnjO88zkg/HwFbgiWxSY8wHT5Fwt87onNA8IROLrUsYSBBRDd3GY2ImO26Vty9
         aK71QxTcb9328f+P6r7aE8sLkeJJQKfnP+DbQpAzrfcrdzHBiH2hfRf4YElAs893Cy5L
         PtKwI6YkhltQr0xseWV4JscvKCK6N4J3f9Ra7oZhNG2f/b8HSw01mp7bf6X0XvYAWvjs
         cU1Anz45O2mU8r2bJIe6WjgYAoV0He8/JIG4K0AYDnIR+dBLA03vAxUzCAQRbmwqB732
         Qq1EBiYgl3bkfS8OAEduyUjOu4OtRQCDlSaDxT0Yg62SerMsb7J7AdV4F+xMRYXOiNt2
         L7Hw==
X-Gm-Message-State: AOAM533u56ahqanpuWFHIyePrjxzbg1v1Ss/Z8mhoZm4oCho3zQLSVY9
	v63eshexki5mNTUCE7CQDVx6Q9qRyYtBXlcbBzc=
X-Google-Smtp-Source: ABdhPJyuje3DKuVq+pxrsh77IsTx2W5rAoOVDuBFHgZt57KeeTt/dYI/eJihhvp6oCVAXs5gBiACFz6xXUB62R7rATQ=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr36305871qvb.16.1620848808291;
 Wed, 12 May 2021 12:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210512182757.5602-1-bruce.ashfield@gmail.com>
In-Reply-To: <20210512182757.5602-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 May 2021 12:46:22 -0700
Message-ID: <CAMKF1srUdLzqtarC5EnYMgyO_HMBrM2Fza=YeEAyXeVVU4sd9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kern-tools: Kconfiglib: add support for bare 'modules' keyword
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce, It fixes my problem with 5.13-rc1 too


On Wed, May 12, 2021 at 11:28 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Bumping the SRCREV to pickup the following for the kern-tools:
>
>     commit 6dd85ff178cd76851e2184b13e545f5a88d1be30 [kconfig: change
>     "modules" from sub-option to first-level attribute] broke parsing
>     in 5.13+ trees.
>
>     We add the new location to the parser so we can support both
>     types of module specifications.
>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Without this, the kernel configuration audit for 5.13+ errors
> immediately.
>
> The older "option modules" parsing has been left in the code, so that
> older kernels continue to work as well.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 70b8518304..e967f485c1 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
>
>  DEPENDS = "git-native"
>
> -SRCREV = "00dfcab64b85bcb61208724a1588662184ebdd59"
> +SRCREV = "d220b063852245fdd16b9731a395ace525f932d6"
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"
>
> --
> 2.19.1
>
>
> 
>
