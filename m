Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.47528.1629243863971347578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 16:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnYHKKko;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id az7so930458qkb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dBLZzJT/ZeoJNkTWdu9pU4mkAouVGM5Y4lZj8FUu4Oo=;
        b=ZnYHKKkobciwhk6aJBJrEUj9ky5ZkMi2uz99Yd0OGK6exc9Iil1rCsns/fXw035kCc
         uTkF/Pvs3fTgX8Bt2RKwpwIGGzLr1vb+dt167Gk1OsPkiH+gtHP0EGFRNsHN0PF1kjqe
         W/z8QJs/bQWLrxpeSId6JVtke8uOdV5u0UVPtpBnA7s+AtnZHxHcfkoAB2XH6aqTbRZx
         La2s0GsuYU6YvlUZC/LFIJd7ob/wHHVjiBBOYjxm0f2U3/Cu2nrNZgUnnSTEGfC7IYjf
         JWU6P+0uiGbB/c4t4lInbF6XrAbb8PBVpDLVchHrhO7aAJUiFw34fYlIyubmlKEd5HcE
         h/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBLZzJT/ZeoJNkTWdu9pU4mkAouVGM5Y4lZj8FUu4Oo=;
        b=jjDn60B+0Mk7a7kJx7ZnOQGiJaWxTNi5oNq7DPtK6rw+2xnoJ9Oy7ucI+zAl7fQ6oU
         U6Hk3lfxhNxaCASFhiuVBA1np4L0yHZnbApsceWSqfiDL2r4hf6n2IedJC+NI0o7iofk
         SyAQ6N0jqK7+mTlqRWl58kwwzYD0jr+ypfE7oAXcuXMkemUWYAQuuBNcECeDyUjKk+/G
         z00lNQ1wFp9hy7uGKo2pJB7voJDwLP95IDzKMqqNIiG7v5142BQZvcUVpxC+tUuG/0a4
         6k/mY4BqB2gMr3zjNhplQlopslHLMJXULQr4LFeO9frQg9jo8rsTt/KjP/qJokFR0fAI
         qEtw==
X-Gm-Message-State: AOAM530nBSK+lSIaCdr7Nz2Zf0piecNTAjzQNsor1U/hZJZwv++G1VN2
	j6oi1MYTUjf3ic7CnyolGJgl0rG950R6UPrpINg=
X-Google-Smtp-Source: ABdhPJxG1zDADBInmsKkZ3WGfMC1SlO1Yr8UeWnCu8yJacpPNajMitqNJShD9DF9sdix6IT/WYU8Rill/iml3S6YTQE=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr6316962qkg.381.1629243863106;
 Tue, 17 Aug 2021 16:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210806181402.3014345-1-maxims@google.com>
In-Reply-To: <20210806181402.3014345-1-maxims@google.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Aug 2021 16:43:57 -0700
Message-ID: <CAMKF1srK8+bJ=g-UPoCrNuk9dkdoypRknHKjmpxrHO1hjwyLzQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] meta-oe: libusbgx: Configure the Devices Used
To: Maxim Sloyko <maxims@google.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 2:47 PM Maxim Sloyko via
lists.openembedded.org <maxims=google.com@lists.openembedded.org>
wrote:
>
> Add ability to configure the UDC used for specific schema.
> The feature is backwards compatible, so existing users don't need to
> change anything.
>
> If one wants to specify which UDC is used for specific schema,
> for example, `eth0`, they can add this variable to the configuration
> file:
>
> UDC_FOR_SCHEMA_eth0=f8000000.udc
>
> If the device file exists in /sys/class/udc when the gadget is started,
> it will be used for this schema.
>
> If this configuration is not present, first available device is picked.
>

I have already picked up your prior patch and its in master now
https://github.com/openembedded/meta-openembedded/commit/3cf2475ea059184820525bb949c11c3da0e64af8

if there is delta on top of this please rebase and send

> Signed-off-by: Maksym Sloyko <maxims@google.com>
> ---
>  meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>  mode change 100644 => 100755 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
>
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> old mode 100644
> new mode 100755
> index 1a106b785..9e22671a9
> --- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> @@ -7,5 +7,10 @@ for i in $IMPORT_SCHEMAS; do
>  done
>
>  for i in $ENABLED_SCHEMAS; do
> -    ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
> +    configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
> +    if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
> +        echo ${configured_udc} > /sys/kernel/config/usb_gadget/"$i"/UDC
> +    else
> +        ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
> +    fi
>  done
> --
> 2.32.0.605.g8dce9f2422-goog
>
>
> 
>
