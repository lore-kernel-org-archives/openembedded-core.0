Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98646E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 15:33:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.59378.1734363193753898587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 07:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQv67+Kf;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4882842e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734363192; x=1734967992; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JPnjmRSnA6MCg6ju1aGxNluiGxYIOcObWDPGd4ktBg=;
        b=jQv67+Kfw8Ej+adRmGE+7LNKI+eOGxX23X6yb4c9nSQorjFMENty611uDOxcCAEjpv
         QEID0lj11us8O9OmG3fjvhcZwkouxMQYExp5Bq9FuZdBg5RKSoy2mHfmvJBlBxCO3Ynk
         g4rz/jie3S0Cd78wum8EfpVwOW2SFA2kAwjjQcYOPEjAwG8XLkM/q17A46NG4eYhnkEq
         ZuHDKnOYa95rerA4rcj1qPBHT/EFnoLVOdRhLch6aIXrwbkwBedmc0/YeOzrnwO/LUsb
         a8YL4SQfQUXpVkWniCDSZ6rUo/s4/q6qfL2XZQbUh2WGQB5fAf7B2xDPmYn82FOO8AU8
         u5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363192; x=1734967992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JPnjmRSnA6MCg6ju1aGxNluiGxYIOcObWDPGd4ktBg=;
        b=HNbWyujfW7bzUluhoT0JuiJPg20q3x+C1qSDbQB2TvoB7phG3QbcAPcdiyzhGMPAfb
         UWhT4ptOpl1JS8F5SCpkIGQMX51Eze1pDrZVI+ea8sKby7CXvWzU7R8e4UwEmm6ACeIU
         pL37kjSibGfgMfC59rjmp8K4EyCeUTrbunE92wsbaob1W+ImkEGN4On/YfGGRzeWJRY8
         yWLdmE5yu61U8pIV+Uxqk3SPJhcBxBnGF3ZS2NZhQwkVHqQygnzZjzu3DXD/QF/5zgRP
         3HonpLNSSLr8/tLfZXAmQ60tmxaRxRrUpD3qz6wlmEu8d60BO6oHh2IavSQRgoEfBwNs
         n7pg==
X-Gm-Message-State: AOJu0YxYwk6/nFieJTF3Y9Tkw++cNpF04zV8ZXBR1JMW52DuH+ru8/iN
	uN/iN5BtgLNlzH1Pi17u2B+4DPZS72tE7srSFjAaPujPsPPLMI7Lt3+yuvn5rTX6/EVxgDy8FPU
	0EPjbvw2PB3Fwq6AolAHBwmOqcXc=
X-Gm-Gg: ASbGncsDIAAA6DnXNgN2+NWWISnTHtcBS2ES9i45TQCVbXzagKTqyJGdYaUVYL0Uium
	SPxjfZjQbSKjDFHY4Ghp9FcrZKuCQOeqexvMPHtUIgG38BOcl2Q7N
X-Google-Smtp-Source: AGHT+IGkHHowDPMGH0fsLvO+4F4XVTND0XgJozMQdjBZXCJnVc4hG+9shCAAUcUpPUYEFdnIyI0/QY6Ep3TeulS6Tdg=
X-Received: by 2002:a05:6512:3a83:b0:540:1e5e:3877 with SMTP id
 2adb3069b0e04-54099b71a89mr3278242e87.54.1734363191428; Mon, 16 Dec 2024
 07:33:11 -0800 (PST)
MIME-Version: 1.0
References: <CAJdd5GboPsjC+A9PBBSGX_41PYLGdWCoJF5V1u6J2+R-NC1W4w@mail.gmail.com>
 <20241216052052.338858-1-hongxu.jia@windriver.com>
In-Reply-To: <20241216052052.338858-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 16 Dec 2024 08:32:58 -0700
Message-ID: <CAJdd5GZjMFRuq7DKFewyAze+dLE73QyUunXOp=3=HC5Cg9sHrQ@mail.gmail.com>
Subject: Re: [PATCH V2] meta/lib/oe/spdx30.py: make StringProp to decode SPDX
 alias with actual ID
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 15:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208775

On Sun, Dec 15, 2024 at 10:20=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, it s=
et
> license_text_map with SPDX alias other than actual ID
>
> The property of simplelicensing_customIdToUri is ListProp(ObjectProp(Dict=
ionaryEntry))),
> and class DictionaryEntry has key and value, the property of value is Str=
ingProp other
> than ObjectProp in which could not support to decode/extract SPDX alias w=
ith actual ID
> in image jsonld file
> -----------
>       "simplelicensing_customIdToUri": [
>         {
>           "type": "DictionaryEntry",
>           "key": "LicenseRef-PD",
>           "value": "http://spdxdocs.org/openembedded-alias/by-doc-hash/d5=
3e90e23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-nati=
ve/UNIHASH/license-text/PD"
>         }
>       ],
> -----------
>
> This commit make StringProp to decode string as IRI first in which replac=
e SPDX alias with
> actual ID. For other situation, still return string as usual
> -----------
>       "simplelicensing_customIdToUri": [
>         {
>           "type": "DictionaryEntry",
>           "key": "LicenseRef-PD",
>           "value": "http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd=
-57e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69=
fe170e0720b85/license-text/PD"
>         }
>       ]
> -----------
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
> index 5cd2eb45c3..160b55f84b 100644
> --- a/meta/lib/oe/spdx30.py
> +++ b/meta/lib/oe/spdx30.py
> @@ -96,7 +96,12 @@ class StringProp(Property):
>          encoder.write_string(value)
>
>      def decode(self, decoder, *, objectset=3DNone):
> -        return decoder.read_string()
> +        s =3D decoder.read_string()
> +        if is_IRI(s) and objectset:
> +            obj =3D objectset.find_by_id(s)
> +            if obj is not None:
> +                return obj._id
> +        return s

Sorry, this can't be done this way. These bindings are autogenerated
using a tool (shacl2code, see scripts/contrib/make-spdx-bindings.sh),
so it will be overwritten next time the bindings are generated

>
>
>  class AnyURIProp(StringProp):
> --
> 2.25.1
>

