Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.2054.1626982163993433322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qRQ46KEm;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 23so6582527qke.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j9sBsy5tyRzpuU6mvJAm3esXbkqVRt/iOV/BAZPa4rA=;
        b=qRQ46KEmAqVnE8yF+WbKMyCkjha2yfjJwP/Z/8BDyRrTqOjpuvKAmJwgFe7rFigWcx
         sKqEK1q/c285ZQf8cOT/kpaeTg/gwQNSpd+vn9qdO1tEciDPSxEIVoAzaBS8Y5oF16We
         dSyTghby/yQ6JACV+xUTrTMyAbq2Yzhfu2qnhh7uQDplMzoGN3fPum3EUAv5oMtxnYtW
         Yo4eN8RvdQJ36pBdGssKIFmwSMtVBcINLKGQ9AUJYUBzpa5SKDTmIkPtOWGatDOZEDH/
         hGu5//aAMCIrHLAzMnPisjpVUtz27yIUBh4vtl+juF0pF51EK4rcRM4tOe4WTzjxeXZv
         gFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9sBsy5tyRzpuU6mvJAm3esXbkqVRt/iOV/BAZPa4rA=;
        b=B8femyO2r7Tjmz60SiWAFlQx/jtltNcj4dDqcefK07RvbjaUoxsxvv5UDR3XUc2huH
         tenGOde7cgbJVf2oDdMgkMtUtmuyfQlsYV2ye68rMy4tSNO1efiMj1vKOIN/rtL8h6gA
         BCuQ39YQClnePfki5tAjSByf6IzeCocyy8ZDFo7wUEqmZYYnZ+H4yhYsk83uZPlT2wYT
         T0raBZ0x96ZpJvf56/uYpPg+u8rdDKphR/hZJoVhlIHs62bNaCt2s2o4Xu8CdOaiW1wW
         N+aW1KzLPhmFXTAnY8pNfTtwNUHi33d5QYgq/JUPHrVO9v7b87kIOSkpHERklfR5qD3B
         CV3Q==
X-Gm-Message-State: AOAM530yaURJO1m2CuqGi72LOM4qSCaqrQyC8NF556U/PB4gZPinWJ/J
	3KI2JxSIy4eY7V2eanyOke3t/LpsylcHn9i0HfY=
X-Google-Smtp-Source: ABdhPJyanebxFzumo9uC6j5EqHC5AzAy/p4CKrMMPkKVp91ZO9Sz9EM+Klz1pp5DVWWRtz449djOqp1bn3QsVLol/WY=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr1224146qkf.119.1626982163090;
 Thu, 22 Jul 2021 12:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094903.27281-1-kai.kang@windriver.com>
In-Reply-To: <20210722094903.27281-1-kai.kang@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 12:28:57 -0700
Message-ID: <CAMKF1so-Y9k-vg_uL2N98nHVvOKj-WcugyvajoaQV0civ+C8iQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot_2021.07: incompatible with qemumips and qemumips64
To: kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 2:49 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> u-boot 2021.07 is not compatible with qemumips and qemumips64:
>
> | *** Can't find default configuration "arch/../configs/qemu_mips64_defconfig"!
>
> The supports have been removed by upstream:
>
> https://source.denx.de/u-boot/u-boot/-/commit/5308a71
>

thanks, I was seeing this failing in my world builds.

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot_2021.07.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.07.bb b/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
> index bbbc99bf8d..64c20537e6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
> @@ -4,3 +4,6 @@ require u-boot.inc
>  SRC_URI_append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
>
>  DEPENDS += "bc-native dtc-native python3-setuptools-native"
> +
> +COMPATIBLE_MACHINE_qemumips = '(!.*mips).*'
> +COMPATIBLE_MACHINE_qemumips64 = '(!.*mips64).*'
> --
> 2.17.1
>
>
> 
>
