Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CFDFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:52:58 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7186.1777359172059074260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 23:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k/rtD59E;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so92428711fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 23:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777359170; cv=none;
        d=google.com; s=arc-20240605;
        b=Bzg//U10wso/IRTuGkclCpRhgqeEEQEnYHjL+4JyTgP2J/PNP1R6Sw5STyEZsFRapR
         Z1BY+yAeNo51gHs8MRoFghppc7jzKRG2hNOgIXkv5JqWR+8n+ocvZLiJVJGUJaKTcU3O
         RkD/lHT3RmShSGzKeUm1NxMJEFEUbpmVGW5HgXTOeQX8i0VWgtZ5FDZZ0j1WQUbdQ+0R
         6TxKrO9bCedlh6NbzVcYS+KFEwgMMNtrLc/EPWdQiYdXweIR4ud01GKAZhxEn4gyZgpC
         ZU1mTpAfREdoewnbxIm8x+8FGnpAPsK4Znc4lXcxuH49AyAawnXiT7OE39VFRWztgm6p
         ZTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P9YW+xEO2Fy/vyJGzyhPnmkrY692b08n8pxcQOaFv2w=;
        fh=FJvvNZzC1+tssucen1z9H0yO8l2jfdgelWo3Pjo9ULo=;
        b=GTe34tE1bKvI78h+U1j49AC31rWhncAsDnHMuTxc0KHmHBC5fq+NNEWq72zb10HD77
         SITa2cfakSqEk/z0q1zLsTPU4LjMAGrXI0IbIU1g2XZJKw4xUnkq5U5POOo9mUM4W2V9
         3QpMnd9sZTB6JBlaO1ATLJdv8jPnphRU5NyjgbvUNSeWF+42msAYd+QrOqze1IxMnhjP
         Fo6QPUCWSl/o3Gie7PG4D1HjSaRqRuDiSLVcyF6fixAHiAiMfVB68jFXnNLlX3MJ9QFR
         VmXrjez7OrB4pv86U6RBm9t9tRBOdqFxr/WQ7/mAgnK6lyNsHtPGPQai7o9z5szeg2ys
         wp+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777359170; x=1777963970; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9YW+xEO2Fy/vyJGzyhPnmkrY692b08n8pxcQOaFv2w=;
        b=k/rtD59EgUqiqXC4o33DEYhFac5QBtSjWi81qLJSbjJJs3MKh8L/7p4jIZ7El37EwF
         WRkVDKw3hR9Tw8VkoxwYdJfXIjbtzztJr0Lq0aOGNd8FVWGTHMgznwvP1pJI1NEX0U0r
         BQL3Zag5rM033/ApbICH9f8j0ZP8MgN9U+Ovy8cuHeJQYRIT5wFcus/2uxb4fXC78kaK
         kUVeWZiuL2kkkTru802NJ16wYM6mT4NZAJ5nRYv3EUBNmEe02UNi9m0eH642b92i+qaS
         su64EiiTMyBCecYGBPFVBc/cetOHVNxOGW6fBsb/4705vYP+5EQI6hT3XJSLwCc+8Xd7
         qvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359170; x=1777963970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9YW+xEO2Fy/vyJGzyhPnmkrY692b08n8pxcQOaFv2w=;
        b=CjkU7NW0W71ppQnBt1cHpkSJ7SNKZ1hjeQU2Lq5w3TMwAX4e1FgcYoKvhhGG0a/43+
         PTngK5I6n1lr2Bz9dkQjhw0302FVSLTGePgMGbt6MP/iYwDFxfOuQDrJE0eI2B6VLt1G
         IRuF1f804hjMVkIFrwKV8YjuIO7pzw/2Dr+8tTvRXkWv7bPdqINEuvFH8XCb5TFtdAF1
         q4gvZzc3mpvHvYoHZlvHigA4A4lqpDu4VNHHQLNUSPBZV10aO3Rfwmr+cEQQQ4hd+Muf
         pUs5UHiHCd1mLxidQo8Jn0ajpLc2y2ZoBmKSoFktTCoNZFS9xdT1Nkmav9H1PAEQAw8s
         3NRA==
X-Gm-Message-State: AOJu0YwzHShJ15Lqm5crshya5qV4kVzSynUcJbXLxXdZX+G7Sz8J5Cma
	kWN0SaThayeGfY6rzDMV1ODMvWGj5Y5eB0z78sMJY7Uj9Xkwikg9s8NzoYQEWS18IXc8Z/K68W1
	wLl6JlFCrtgFOXTofiLe+SrEqT1m9eSQ=
X-Gm-Gg: AeBDieuN/HqMq+dpIcjvLD2rIYAeBnTlJRhkESZdJOJ097Bh5qzfZjNf7zhGJzW91lW
	syiy4xwecN1DfEHMyMDzsF+xQpkwR1aoNQUH2VzIDfQkIR03/dn9vXyxvgUhql2o9MHYDrETpzt
	+ep8ER6SoBlmp0F0Xhdp2McbBpq43wBmAaLX2JUskoXE0ayEv7a/DuxS/3ltOIOYLwQ2i5poMuj
	yZj3LgibzulaWm/LHOw+wLo60URVlc3SqcooGQT1mt5bqoGKtfmIjqk50N037PPipLXzWis/gtd
	FqtbLCsaKZs4EuknTsvSozl8Zf+7oR0jEwyrmzeyok1YIXat2wyXNE4JJWcl8zYSglqRU61Bl2g
	A
X-Received: by 2002:a05:651c:b13:b0:38a:a77a:b0b2 with SMTP id
 38308e7fff4ca-392411fa3e5mr5483641fa.30.1777359169952; Mon, 27 Apr 2026
 23:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260428064329.1591381-1-mikko.rapeli@linaro.org> <20260428064329.1591381-2-mikko.rapeli@linaro.org>
In-Reply-To: <20260428064329.1591381-2-mikko.rapeli@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Apr 2026 08:52:37 +0200
X-Gm-Features: AVHnY4J0pl4ROqZGSqWU2KLqkYk-yB7tZNMiATXZQGzbygSxxIzCWoGKjrhk-tc
Message-ID: <CA+chaQfN=O1YD0C03ZL-gKLzG+B7sHXzJ4Sx-eLfY5Q3CyEOGg@mail.gmail.com>
Subject: Re: [scarthgap][PATCH 2/2] ghostscript: fix build with gcc-15 on host
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236039

On Tue, Apr 28, 2026 at 8:46=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> (From OE-Core rev: 02e282f6417274a93c6f01978bf33e2d171297b0)
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...Fix-compatibility-with-C23-compilers.patch | 67 +++++++++++++++++++
>  .../ghostscript/ghostscript_10.05.1.bb        |  4 +-
>  2 files changed, 68 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bu=
g-708160-Fix-compatibility-with-C23-compilers.patch
...
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> index 57a1098521..8f132d55c6 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
> @@ -25,9 +25,7 @@ def gs_verdir(v):
>  SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-downloads/relea=
ses/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
>             file://ghostscript-9.16-Werror-return-type.patch \
>             file://avoid-host-contamination.patch \
> -           file://CVE-2025-59798.patch \
> -           file://CVE-2025-59799.patch \
> -           file://CVE-2025-59800.patch \
> +           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.p=
atch \
>             "

This part doesn't look right, did you remove CVE patches by accident
when resolving conflict?

