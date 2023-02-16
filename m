Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35973C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:26:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.12553.1676561168018897853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 07:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nPNAnNst;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id d40so4173058eda.8
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 07:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cy28SDvcUQ/4rWPN+RG/2bOO3/UpY/aDSLhs94LBjcE=;
        b=nPNAnNstRSxjv08SruEJgACoMXB72ZLaJwJU/DUpMQV4lHMHOkjLJ5TfuW4yemt96x
         ygGTzUPAml139l72XJa+W/3xa0HaBKAQd8aUE3oUAaIwyxNzSnNClpK+8EeNuHAfFPUN
         5/xm+9kP+qHXtfIA0xDTur9W37U2diBFNj25NMTrp03wVcyVXYpF1TwGkoWHdkqFnIIK
         11z/oXHnCt92Gwh0L7AJY0HptyPjSTpuX1OSyTGG+HkRO/zHL7IVdRbxM46Sk7RT1CEs
         I3QQ5ZPvEnnfJAgeYek+8r07j/s30q9nCZDieX9iQ/OgtPILbmkBAutH1Vp6SnXJpmwY
         6IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cy28SDvcUQ/4rWPN+RG/2bOO3/UpY/aDSLhs94LBjcE=;
        b=mUfuUhw8HChIrFnbSg9asSqQ1yUV7dbHc9uVdZBHEydJO1QA3LbbywgCStw/IKvvqS
         Hrx+dEePxZ857izTRZCTFqjC9AoZ9W109etVLfgMV7kw+hT6SeJdyXykFkmhJNgmQsmn
         yx79bnLSD6+YqTUDs7c31iPazWfGCUEtPIHa+AdNdub7s/peqi4bCpRFnwvT32LBjBj7
         OivAHiNXceKz8bpinDHXD3Y9tOFo7DYt93Fv6nkC7sjTvHYoEbub6wR4Yw5EHVfhFEaH
         v/BwaWSGtVbjk0k1/Bc9CyVYT1OmxEjr2e9YXGDI7y8JUiqVgavJeiXxY9moRueGy+ku
         sqFQ==
X-Gm-Message-State: AO0yUKXr+RumqXslQmV/53dIUPRoJ2G4ETk6wtYZSWgpK1Op8edGmT8+
	N/Km7jpAj+/faKkdBRlykFQzgJVas4e4o/0a2hE=
X-Google-Smtp-Source: AK7set8X3421nD/4BaX9+4rOLGXSIzR8K4pLll+jIDhLnhYVZQzhFiUcnN1tm/sKP5mMtHfbY8cIL4DMVKva6prWER0=
X-Received: by 2002:a50:d695:0:b0:4ad:7997:a47b with SMTP id
 r21-20020a50d695000000b004ad7997a47bmr117416edi.2.1676561166382; Thu, 16 Feb
 2023 07:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20230216003023.4153138-1-saul.wold@windriver.com>
In-Reply-To: <20230216003023.4153138-1-saul.wold@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 16 Feb 2023 09:25:54 -0600
Message-ID: <CAJdd5GaYwcjawUy35PAkhKwHbTFP6kpOFmY==tfNZG6Yw6n4cA@mail.gmail.com>
Subject: Re: [PATCH] create-spdx: Add check for variable contents along with quotes
To: Saul Wold <saul.wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177294

On Wed, Feb 15, 2023 at 6:31 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> This adds a check to ensure we that if a variable is
> empty it gets an empty string, this also adds quotes
> to indicate the variable contents.
>
>           "comment": "CUSTOM_SPECIAL=''"
> or
>           "comment": "CUSTOM_SPECIAL= 'variable contents'"
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index 28a42e009f6..8b18ada40a4 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -484,7 +484,10 @@ python do_create_spdx() {
>
>      if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
>          for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
> -            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
> +            if d.getVar(var):
> +                recipe.annotations.append(create_annotation(d, var + "= '" + d.getVar(var) + "'"))

Why the extra space after the = ?

Does the variable need some escaping in case it already has a single
quote in it?

> +            else:
> +                recipe.annotations.append(create_annotation(d, var + "=''"))
>
>      # Some CVEs may be patched during the build process without incrementing the version number,
>      # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
> --
> 2.25.1
>

