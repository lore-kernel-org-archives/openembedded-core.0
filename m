Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFFECA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 21:38:45 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.33788.1755207524074633270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 14:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PG+Z3sla;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e931c866031so1462300276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755207523; x=1755812323; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOm56nWKyAt0SttREFGcHInTv29fH4FTgo0T5i2qyxE=;
        b=PG+Z3slaKHHekIHk/eJae4U95BSVnkUFRxH/Ptyqf6Fx07WnCLpe4TPZ+sfEBrslcC
         Vb5K/Y1kupSKehDL8gLPEBeopFTz6iiyvJfxFlk20YXGr7kTnczMW1H0oOyPYc/XGFSS
         LLozH/96gB6fohmJUlU/tsJyFlL5MzCdPEQxF4A5NZPIdJaA4UZszZj9mRNe5ZCbNe/V
         Dqj1j7PsX5Onu+nN0Riodox8vJboAAXjkbRDxXKvld92ZkDqtjdDRsrb1+Yeifc/LRJe
         jxJDL3tJ4JT4F8upiboTW92peUj/HO1fbXTyIadWavzjl0cuw/7a5AKDIb8c0b3k6jnk
         vKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755207523; x=1755812323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOm56nWKyAt0SttREFGcHInTv29fH4FTgo0T5i2qyxE=;
        b=FmFFw1V2sjKHTaT71QIzhIrVE3EYC8XN63bOkMLTB/nbyc6uw7apS+2MolWMHtolzE
         ZvOC9AqD5FzuTJQZGaTunlwKsRsBbleu+skcmZC6TNAHFTMNGXDd7SDfTuG6zop3ZfrG
         FYS6SfntzoAGKV11r/h6/5Y/0vR4LqGWyHqmdBDXfh5x0zEEtGQzP3d19bEBpwxn5iM3
         i5nf7jq6NebNudhOKV/RCDvH7DIBseiVboxc+8zMAfG8OZRAZZJOJo//fh7KdokhaFV2
         LLbLM29wdZxcSxT16C6KdBuUrGk4tya56C0p66aqOAbMdyQQNKdd5vYNMtmB6RaVydOQ
         43rw==
X-Gm-Message-State: AOJu0Yyjm8zO0P3Bj2T3rBZbiUKD4kZTR7326RpUdVzXuHc9hkkYHaZm
	HQxfUHNd3HqOZMZBqkOthteuDOhQ3EBByeoq3FLeh15u0JmyBLurFFkfNHyX8wJjmuMHWi2qvBT
	aHPxWmP2wsbpD2hmIhh8mvXM9nKoJHQ2r6sxp
X-Gm-Gg: ASbGncsMrQERhZQbGHkajjAkN91WzQHqYNBzSR2k4XO1fXUXlzLHqDBe2FyZ8i1roWw
	Yu15SMrSjIGsPS7K78bpxEB52WzWFxbzFsfNSepAGKbHwYEZO8Y99gMB9SfOb4hQoyU+Fn2QPoH
	kxyi0GCPHDOpjFnZ2B55dBlfjfxi+FPWX0k7LCW40PMAdbsVo2VpWfZus9fbyNfzZ+CAFdljofA
	JE+z7vEbeA5wdwe7lSDasdrOSw0ClQrtwqH
X-Google-Smtp-Source: AGHT+IHvdnb3q3LWW9lKXnc0PZ8m2RFRVUFiI1S/rGTmnBeLBShE+Lcxa1wqBELdRlB/5C6638XPGIMZEuFxuDDidns=
X-Received: by 2002:a05:6902:5405:b0:e90:6a88:ea9e with SMTP id
 3f1490d57ef6-e931e20b8dbmr6028324276.24.1755207523128; Thu, 14 Aug 2025
 14:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250814212650.3003016-1-d.schultz@phytec.de>
In-Reply-To: <20250814212650.3003016-1-d.schultz@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Aug 2025 14:38:16 -0700
X-Gm-Features: Ac12FXwDK27Lp-UNhJW85xP89mFDC-1Ys_jGR7-EaIrEllRWAOprqR0fjozqPv4
Message-ID: <CAMKF1soqz-Nq1UoMiArmc_Wkgb29M0vF-opwZC4Xb4JZcyudxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta-networking: mbedtls: Remove branch and tag
 from SRC_URI
To: d.schultz@phytec.de
Cc: openembedded-core@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 21:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221873

On Thu, Aug 14, 2025 at 2:27=E2=80=AFPM Daniel Schultz via
lists.openembedded.org <d.schultz=3Dphytec.de@lists.openembedded.org>
wrote:
>
> This recipe uses SRCREV as well as defines a tag in the SRC_URI.
> Only use SRCREV since defining both will generate an error.
>
> Fix following error:
>   [...] FetchError: Fetcher failure: Conflicting revisions
>   (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
>   from the url) found, please specify one valid value
>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> index 88b50a406b..3788b05838 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a=
6c2f1ef1630d341e026d"
>  SECTION =3D "libs"
>
>  S =3D "${WORKDIR}/git"
> -SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;br=
anch=3Dmbedtls-3.6;tag=3Dv${PV} \
> +SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps \

Don't we need branch atleast ?

>             file://run-ptest \
>             "
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221871): https://lists.openembedded.org/g/openembedde=
d-core/message/221871
> Mute This Topic: https://lists.openembedded.org/mt/114708405/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

