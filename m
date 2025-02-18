Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7E1C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 12:09:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.18029.1739880559710273858
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 04:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yVpEClLP;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3092643f4aaso32368081fa.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739880558; x=1740485358; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDoK+IRQs/k0mq5ze07SbDrNJsWmSge834fH8sLBIqA=;
        b=yVpEClLPUau/1h6SLHbV3S1cztXKh/O6KkjTm3jSuf3DBtiwqS7UWarmtRHlVeMQG9
         mtGshthdjqFVb5WvuL2TLG2LhxkPuKtk1GmUjqaOfbXk0WyEraoP8a+MltsBSaV4uTnT
         uOT8yCmY6dkcVHgKLdV6ilxUt64WleC+1u/mph2iCWnlZtNP5npLxAyAxaCqnilb9803
         A/2LCBeFjYeo+9PIgTRc7iN6lLUrs2ob8+BnDd9AQXbKjUInvineuE0QLcmbPRwfcAqi
         OKdWBlhAR+fFn1RILHdgneA4qkqmugEkFxt7f+cy89qO5mOzkpeZJ4XfO14cGUpRn3eY
         KqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739880558; x=1740485358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDoK+IRQs/k0mq5ze07SbDrNJsWmSge834fH8sLBIqA=;
        b=YzDV4aKpoS2S1q6oDZ9Cao+IZvXNwvg5y0oPMhVtQAwUjZuV4AD+o5dPGQ0ZO0FmjS
         DZkFdXnQt3xdPIaLNjyKsWqwxms3LGoZsDN40yOdXYz+M00ov19dW5/N9sPGk8CHjZO3
         qOwByBdvvgxRzHOpAVVplaR0p75K/2Tyo8Wb1iZx5ssxIcaUhZqS4/l1USuTx4kjp4Te
         Exe/MVjhCK+9Tf61oICp0OAJqO3d8pRBNsTY83z/KapKSx7O14VNDyPOoT4v4gklN8m1
         9q8DAu2xQraVxLZjq+FwDOF8zKk4ZHeBL2duC5+pKB81PNYb/sA7byYe+4yHLEXbEQ0S
         HkYA==
X-Gm-Message-State: AOJu0YxqHcd+OiGoFXgq/BXKPSBGIwBEmD77oZBqHNJ6RjjIfilxCpU7
	sttXwXEemfe9NOA+yAM5EQKqCogReoOaF/sA7lREQLJbznWGV8H5vROeVGAxbuA=
X-Gm-Gg: ASbGncsjS+OdCQuP5gtm/esG4y53ApGH75f3TG3tEYttr//hnZVUGvYcEXQ7nEMsLuj
	61jWXzKKdBuZ7XigOFSb0vtdgdiFcJINmCUxeCZFXg2C1YK0VCmGazTw/nl4D1tLM4qHdPhqkN9
	O+dy67DJMSYR25fIrmkrg5+mg0i2kr4XfNoTfWB/F9SgpMlL7Iv+Vj9bjTT2yxNUlqxtiBj7fjt
	WExImZsVhj1HfFwJ2UqiRyZGAPV/LFLVmegt5LCes+AMUDpXAhn+8MZCNidYO+wxFZPa1djDlih
	A9/03VwTePozmzCrjMcAY/eU/l8/V1V5xnal75XT
X-Google-Smtp-Source: AGHT+IGY3grLOUlDA7lDuTIMVuJSf1Wrqeh/l3qSnPkRsYdt+2WcDNY6U45x4+pJFtbmXRUI/CAdcQ==
X-Received: by 2002:a2e:8194:0:b0:30a:26cb:f9e9 with SMTP id 38308e7fff4ca-30a26cbfbe4mr30728161fa.17.1739880557736;
        Tue, 18 Feb 2025 04:09:17 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30921a593f6sm15807661fa.65.2025.02.18.04.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:09:17 -0800 (PST)
Date: Tue, 18 Feb 2025 14:09:13 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: uvv.mail@gmail.com
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 2/2] oeqa/selftest: Drop dependency on systemd-native
Message-ID: <Z7R4aTJKc8rICiV8@nuoska>
References: <20250218115647.40502-1-uvv.mail@gmail.com>
 <20250218115647.40502-2-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218115647.40502-2-uvv.mail@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 12:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211609

Hi,

On Tue, Feb 18, 2025 at 12:56:47PM +0100, uvv.mail@gmail.com wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> 
> The tests don't need it. On top of that, this extra requirement
> creates a dependency loop between systemd-systemctl-native and util-linux.

Yes, this is the right thing to do.

Reviewed-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Cheers,

-Mikko

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/uki.py | 1 -
>  meta/lib/oeqa/selftest/cases/wic.py | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
> index cd20a99aca..9a1aa4e269 100644
> --- a/meta/lib/oeqa/selftest/cases/uki.py
> +++ b/meta/lib/oeqa/selftest/cases/uki.py
> @@ -94,7 +94,6 @@ WKS_FILE = "efi-uki-bootdisk.wks.in"
>  
>  # efi, uki and systemd features must be enabled
>  MACHINE_FEATURES:append = " efi"
> -DISTRO_FEATURES_NATIVE:append = " systemd"
>  IMAGE_CLASSES:append:pn-core-image-base = " uki"
>  
>  # uki embeds also an initrd, no systemd or udev
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index 207e487002..4f5d43b5ee 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1363,7 +1363,6 @@ WKS_FILE = "test_efi_plugin.wks"
>  
>  # efi, uki and systemd features must be enabled
>  MACHINE_FEATURES:append = " efi"
> -DISTRO_FEATURES_NATIVE:append = " systemd"
>  IMAGE_CLASSES:append:pn-core-image-base = " uki"
>  
>  # uki embeds also an initrd, no systemd or udev

