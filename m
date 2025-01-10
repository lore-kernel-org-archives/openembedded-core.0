Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00257E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:05:59 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.19199.1736517954839686643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 06:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MLJkeAGF;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e399e904940so3154707276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 06:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736517954; x=1737122754; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezjDpvwgCjpnvnly1hDCCuH3Z+nIPLVzZfzXru+s+Yc=;
        b=MLJkeAGFo6F0fhQOPMXNNn8mk4zBqRjzDDhx32AilymxLBphmWzp69ogYdxvWBc+zq
         JCsZqsKSq3qqI8e2QYlRbwAFuPUtlEuoSRSA01/yc4WT24YCph5AP8Tue1gUWcqXnKj2
         NI6Yc+jcEZ/wgMZrWiMgSwupkE4iCy4+JxTMpAgc7fMEfme2AMRhFdP1rgGoE392K74F
         05RMl/tudMz+mlSZV+Atz9ZwwueZKYPRoaDUPxB2wp3IQEf2S5y0ynLDPvYA+bXIttmM
         lFN3JUcONArzQEkAq+ZcB2MDKu7mPxuT/gVFF8QhmJcSwduirbD8fsYieDfBY54t7Mcu
         GOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517954; x=1737122754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezjDpvwgCjpnvnly1hDCCuH3Z+nIPLVzZfzXru+s+Yc=;
        b=MjgClgULomHG7x72hgx2f1L++x6z3SXvjXdWxX1fC2v7pq4y9ouJl9DxRGqw6mMIks
         xLVt/aMN27t3JWfEbSHJ3K52Isr5GCRY3BvQt34/H+QJHARbepqGyyFeicg88J8SItJM
         CYw2UviMDFN8rNI51JuJH8fEHCfdNjE63uLmu5cXrok82Z/LeyhKn/7ZI+HUI+EJrMMW
         PR89ClrBK8LJtXyzGWrrNk5LZnwWGEgpnQU4TNOj7s/EpcTEPpBDZVGg+wCRtzSbZdHo
         yz3+5ZeNHqSZuNAMuiUT6NO6BqpaFVKSHXVJCktVu0AjKDvLJP1SszpznQNeqiOugsL/
         aNjQ==
X-Gm-Message-State: AOJu0YzvY9L/uN0O5miP/TQRSPXX1/XtymVMZsRZGJRAAmLH/wk1Vv75
	SoKxVM24Rq1Rz/pgp7cHcnid2wopyJRI1yPtQOQrAwmnUOATEEoMRUNhYzebn7MUsUYiSGCQEQy
	38xdpP+6B0Dh5aTYkYfkq+rXAFZ0A7Ul23LohSQ==
X-Gm-Gg: ASbGncvB3M8o25g5p90PGeMD9/WjxuceI8MNP5AwhVfy4fBI5KRNKnp0skUfj0zzoqF
	PwLlN5D3ZLREknX9yITIKHPAPlebCgO9hpVA7nw==
X-Google-Smtp-Source: AGHT+IG0vycMYyAL9NLAhtBOEnRn6EFlb10O9aN8pwDWijp5nlPPzbsc3O88EIvgp7lXq3YyOSHOLiGQ6N1kNvMGu+M=
X-Received: by 2002:a05:690c:62ca:b0:6ef:a187:f3a3 with SMTP id
 00721157ae682-6f5312a2e85mr81209597b3.27.1736517954006; Fri, 10 Jan 2025
 06:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20250109102051.3685800-1-madmarri@cisco.com>
In-Reply-To: <20250109102051.3685800-1-madmarri@cisco.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 10 Jan 2025 06:05:43 -0800
X-Gm-Features: AbW1kvYZ0uwLNa2yMvNvEovd6v5Zaw9-Uf7ScA1ltiUFmO3YkITHHYrXWSwSx5s
Message-ID: <CAOSpxdYD-bFJ+PApvgH=wfQbLDGc-JckArXvA2M2AyBPQ4JqZg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] strace: add vendor to CVE_PRODUCT
 to exclude false positives
To: madmarri@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com, 
	spushpka@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 14:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209654

Hi Madhu,

This patch should be submitted and merged to the master branch before
I can take it for the stable branches.\

Thanks,

Steve

On Thu, Jan 9, 2025 at 2:21=E2=80=AFAM Madhu Marri via lists.openembedded.o=
rg
<madmarri=3Dcisco.com@lists.openembedded.org> wrote:
>
> - To avoid false positives such as CVE-2000-0006, add the CVE_PRODUCT
> value with the vendor.
> - The CVE-2000-0006 has the vendor paul_kranenburg:strace.
> - This change has been verified by running do_cve_check task for
> strace package.
>
> Signed-off-by: Madhu Marri <madmarri@cisco.com>
> ---
>  meta/recipes-devtools/strace/strace_6.7.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/strace/strace_6.7.bb b/meta/recipes-de=
vtools/strace/strace_6.7.bb
> index c8c83cdf7c..30ac31ee69 100644
> --- a/meta/recipes-devtools/strace/strace_6.7.bb
> +++ b/meta/recipes-devtools/strace/strace_6.7.bb
> @@ -54,3 +54,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
>  "
>
>  BBCLASSEXTEND =3D "native"
> +
> +# adding 'CVE_PRODUCT' to avoid false detection of CVEs
> +CVE_PRODUCT =3D "strace:strace"
> --
> 2.44.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209625): https://lists.openembedded.org/g/openembedde=
d-core/message/209625
> Mute This Topic: https://lists.openembedded.org/mt/110513535/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

