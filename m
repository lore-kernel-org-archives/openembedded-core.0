Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF4CE81BB2
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:50:19 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46693.1770641415915033606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfLLfHjl;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89505dd3e24so54231166d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 04:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770641415; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3duPf0BhUb14O0PiR03ix8G8r7MsDWkdaKNPr1s4WhE4gZ4Y4zIi4i/hrUAZ8coCr
         FWQMUC1UN0Y1Ci/XEqZ6k9+owLw+J5ln2JQ90Vw5/k1OcevhRXjFwcGhPaiVqorqnFDc
         Ovt+Fv/1t99NKAZ0p5sKIhwqHBREHA13hjWE86+u8CMk/lcJrfGG6tQZSRcIBqWBrPtF
         Wpe1LN9pbpnj8TBYvzmXkmfoPODbB3KA2+rB0uW/U/mDTX2ZSEFAOktNvAUNqe9vZ3YQ
         pRgkIXlsUYKhQaJP6WznJXqFtEXWcL1AnuHIiBRKDj5NX6q+ltYzqxBZtkxjqxUo4g7W
         N6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MNQaLDuPELPYsWRN2q853k/fmNiyJqp54a0PUryFM8o=;
        fh=I46jCjhiABAKRx/F1Dn+UefSYFVmJyEssQXMQa/O84w=;
        b=g04LJQ/QXxPcFYABvGbB2TMV+ieEQ6rUsGnIPL+ZZWL2GPyHSBjTqOA2JizWEhOpig
         PPxDkl6K044Xlp8t9Sc48vzS3NDRrm3F5uyEuJwPcL96/lzP5cdAb9fLjmvW39aXIWcK
         QxBMiWF1HWqm7kmp5POYkfUmO4Z8YCa695fLKzgMl1rxZWNEKldkJ7+mbGd2m54DY+bc
         wtj+NNwJ8a8lTgwHXXu9EFvKGadc04zicLNkQmk3FQGRLGVvYarz0mEDU4BG3ZCuQzEl
         5ka1OG3YQ1PyjSdar5t7TQdIg9OCvmohYH0waY53IsqRkDsY8VBkRCaGB/Wy92xqEv+o
         sB5g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770641415; x=1771246215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MNQaLDuPELPYsWRN2q853k/fmNiyJqp54a0PUryFM8o=;
        b=JfLLfHjlN3T17q+5zxgE91QmiVRMPgH9AkkBTExe3Cd/L5Jku7wmtr035nLeB78awC
         3UMGWazGFvSK2ZZVCQAZbpocQrHf2KlKOqHsVGbluKZqw4lxyE1gA5neOgYgOx0nqhui
         4Az2RH3UIw6a8/tqjDqLOL+1YiqnwDDb3MF2lHBzuBujpiDLQ0eNhilxY2z8zEeyE8iV
         tnehGE4rB51DdgB0oiLu8a03Aluww2X8431fl4k4+Zrc5WZPVkyqxYkY9XW46R88zlWK
         MA2iW57rl/Grl6jGkQ2bTlsjAmFbki9q81PHzoumnMtAlq6FGk3L20QodvZnN0Yql8Tm
         peVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641415; x=1771246215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNQaLDuPELPYsWRN2q853k/fmNiyJqp54a0PUryFM8o=;
        b=IURZ5CweJtuT29YQgjUHd0R4uOJlBfhKVbC8ieEXBDdVlZGOt+QAJnv5+2KgTJRIy8
         xnz/zzyx0iD1vNuTwQiw2/2hUk3pVS540l67rj6fsk+CGD9XEFjl+AKKs92Ytfi15QbL
         72htORHSBPFdqo/S2OC3bt+WNFBl1lmpes5F3MKiGptpHx/Hn+NL4TGwm2Wxd7ptss+3
         1cgl/Hl13fnYwgdLaXopCWIoDrGffdMhW9WXhrh1zUruiGkicNa92okCkOxnoYeLFOY6
         +W1zB7UgIC1hHHt4u0WdbbhIgX7ZBqkt2FeND1J4Z/MmnLUaqwA3jnz+Y+UgA+CRVGBx
         DhtA==
X-Gm-Message-State: AOJu0YwIge6uCAIGN1eBxnP/FG9qVJEQhy8PVn063PCWGeuftAJH3ng/
	4ryQUtfrAmKPneezj72GVZef3LBMV5hCz3IpnmOx/Jgl3L2w8JP4I8/UfKp4kg+fGaMXYgA8dQu
	ZIwbWKOztqHpD8824cpofXqalYOLBfgE=
X-Gm-Gg: AZuq6aLtcF0Z7B2/Hymc0s0L2XEiUoFJMs73RNkizNsRIiE/bnfPhEd2YGgOY1K7JvX
	SJBj9z/dvpNKtqVtdsS/NmAxcwb/9ElUFrZjgRR3CRmNCvcIBtL2ADxbko8pXxrPS7nlzP4tR2y
	DIqpHYd5xWlJAK3RHmK7vekAFGAQKPwp12dNlORicma+pnIqgPKu6I34nLIY3B+CsVzx4Z3YlBv
	bY/MZNjzmr1F+YHT7pUg084sqsitJ1b1ICQBhFRuQ8A7/2M4z4L04kuU+3HBvYgasnpkfZtGYgW
	axDPg6v7RacY+NE1zh+dzkcvqZFbEw==
X-Received: by 2002:a05:6214:5085:b0:895:d97:a2ba with SMTP id
 6a1803df08f44-8953d0c9676mr159093736d6.67.1770641414791; Mon, 09 Feb 2026
 04:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20260208145813.7400-1-logan.gallois@gmail.com>
In-Reply-To: <20260208145813.7400-1-logan.gallois@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Feb 2026 13:50:03 +0100
X-Gm-Features: AZwV_Qj9_JhFL6ERqJUxOrGORU-cit91RnUZo8SoCJy5eG88i89piq_bkig_wrc
Message-ID: <CANNYZj8qtkSk6oxuFYE_08pevA0MpTSqxxoMzGS6MNj=O7f3=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
To: logan.gallois@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230787

On Sun, 8 Feb 2026 at 20:12, Logan Gallois via lists.openembedded.org
<logan.gallois=gmail.com@lists.openembedded.org> wrote:
> When using the new bitbake-setup tool, an oe-template created in a
> custom layer was ignored because the TEMPLATECONF variable was not
> exported to the environment.
>
> Export TEMPLATECONF so that bitbake-setup correctly picks up templates
> provided by external layers.
>
> Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
> ---
>  scripts/oe-setup-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
> index b391f3b9254..0a3146fd503 100755
> --- a/scripts/oe-setup-build
> +++ b/scripts/oe-setup-build
> @@ -101,7 +101,7 @@ def setup_build_env(args):
>              f.write(cmd_base)
>      print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
>
> -    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
> +    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)

I'm afraid the issue needs to be explained or demonstrated further.
TEMPLATECONF is only used by cmd_base, and so is set as its prefix. So
what else needs it in the shell environment?

E.g. why
TEMPLATECONF=... cmd_base
does not work for you but
export TEMPLATECONF= ... && cmd_base
does?

Alex

