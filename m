Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6649.1617800173940940165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 05:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iywo8KtU;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id x15so8670854wrq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Apr 2021 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tacabadJLNgUU90GctGYAg6Pen0Lnto51oWESM2JQQM=;
        b=iywo8KtUcu4Ob4NeFhLclaVxtgl5kR4cwBT3Mr7eOeoJCfCAuTxKX/6UbWgwiG+qKm
         Dg/H+5Y20IHyvHM6FeoiSmuMvh6GdBK1gO0gK21d+KeuYa59jueSzAE9ba35l5ogHxUE
         feXiUaBvDje5FblXmX19h657JfvfMJCoMooSSch77vWw8rUCKb/raZy2HRY92RFQOEil
         2c41eFiEv1tFIxNyf5mHz5F2Jm8CpTkhc49h4M6+d7bUWzx1lFkq2lMYIyKzXWr82Wsl
         phNNzRhaUV0jOgllTADFPq4HLFm3j3ixOHoEHP7RpUCcibI7oaXlmad5mpFNtYsAXMCy
         0FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tacabadJLNgUU90GctGYAg6Pen0Lnto51oWESM2JQQM=;
        b=Ek7/gQnCK+LQuGBwlD4KID8YD7snRkEVpsIwmczZiLeF/FNoioMWPW3atGXDYjHNub
         PTtSPAYILxe7bOa3fYDGGbdHpxS8RSajLXthQJeGhW3FYCWuhKe8U6B8vdDBFknj3CSW
         pkctyf5CeGVuiIUaaIuMCFrSBWU7dfKuL4H3k+YaoINxM5VhT5E4sfTDb77Fw4UeZ97j
         UWvVGGGsbMaOY9YdhCTSUzEx7hRI3g+UrwNVjs3PDzv87445uEaJ/fcWC1Ekqxj8fLAt
         M6CceftwJsH69zkcsueLuU4EpnXh0uD8yM8gn1fM/AR6bAI6raCeFcsFXUkvLnHhTdru
         poCQ==
X-Gm-Message-State: AOAM531ZSSTfIbctGxbv2CS0bEMx5hmZYt0g1xxZR6XfL5hkckrIGpPF
	Ib3cCxRGrT60AoX8XUD9A6JnLPfDWd7kmZaHc10=
X-Google-Smtp-Source: ABdhPJxY6nzo7ojoW2HTJsJh9/zwu0ZdihKHUVzXBQDR26Rw8Ocn2lUWiGwIIxJ7ztAm9e5JT8W3CrcS9drF5ed9J2c=
X-Received: by 2002:adf:e0d1:: with SMTP id m17mr4281165wri.90.1617800172376;
 Wed, 07 Apr 2021 05:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1617791467-4066-1-git-send-email-pemorrow@linux.microsoft.com>
In-Reply-To: <1617791467-4066-1-git-send-email-pemorrow@linux.microsoft.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Wed, 7 Apr 2021 07:56:01 -0500
Message-ID: <CAJdd5GZZkiq=r5yR2oSLNheVhoqLTDVUCDau1iGKexr=i3Mteg@mail.gmail.com>
Subject: Re: [meta-mingw][PATCH] go: add environment setup batch file for go
To: Peter Morrow <pemorrow@linux.microsoft.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, peter.morrow@microsoft.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 5:31 AM Peter Morrow
<pemorrow@linux.microsoft.com> wrote:
>
> When building the nativesdk for mingw we need to set GOROOT in order to build
> anything out of the box.
>
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>  recipes-devtools/go/go_%.bbappend | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 recipes-devtools/go/go_%.bbappend
>
> diff --git a/recipes-devtools/go/go_%.bbappend b/recipes-devtools/go/go_%.bbappend
> new file mode 100644
> index 0000000..9933108
> --- /dev/null
> +++ b/recipes-devtools/go/go_%.bbappend
> @@ -0,0 +1,9 @@
> +do_install_append_class-nativesdk_mingw32() {
> +    install -d ${D}${SDKPATHNATIVE}/environment-setup.d
> +
> +    cat <<EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/go.bat
> +set GOROOT=%OECORE_NATIVE_SYSROOT%\\usr\\lib\\${BPN}
> +EOF
> +}
> +
> +FILES_${PN}_append_class-nativesdk_mingw32 = " ${SDKPATHNATIVE}/environment-setup.d"
> --
> 1.8.3.1
>

I've put this patch in master-next oe meta-mingw. This is the wrong
mailing list for these patches, please use
yocto@lists.yoctoproject.org time.
