Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6980C79FA1
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:07:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34761.1789114066195003768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nvqLAC9I;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so9669105e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789114064; x=1789718864; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QcdQvPdhvY94F9WKow3HI1/VT1WUHuY9Pqpzp4+fhxc=;
        b=nvqLAC9I/42P5LNdf2zcD65wJCOcJOh9LgpXKaJnScBV2s0266ZZRc1f53SAssVY21
         bOktn/MB2hXDKpPSHxzHjq5IkidG6yHaD+tyQPteTpLRrmFNMtPiYPDoGM8oeQPk83Fr
         V2A06XISn8Ex790Jjw8ywIpH/37XlcMKTmlY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114064; x=1789718864;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcdQvPdhvY94F9WKow3HI1/VT1WUHuY9Pqpzp4+fhxc=;
        b=fjOlnd2lSMcjqORQZU2JbQ2T1mQhxKs/mk4DqHGZq3Uik6ODApdcJQYwdFOH1WTed0
         EU+DCMaERGXEEPtbuDSfe5mmPWtG47QgoDjpfzWag0xTFh7SpvdP40E/xE9mmQXTtDSV
         u9TXGo7sXkkWoOBqhJmvOl2I4vosK+HIAshVZcEMlExNoSzohqy0+bjR+XY3iTCMrvZ4
         TlzTDqSaRjnHqpbiPWVTjAY+Ptc33J5TFgUgZlNSlMoJEPspgk8r0li9GyDMycrH0NeR
         e9+YeWaKpjoeQEdNwqhSKTlM6zXG1UArfzvXM4kAEac4ygvdUs+C4C+pYcUYZwJlmyuk
         b8Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzk+n9qB7mCNBWKfA+2Nd4orsi2gvji6BCJd0SQtyRuE2jtgFoiBtuTmk4nYF+DWVBtaWBnPNB/t72FWqrJwTypdw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lpMYuK+iICPhECRo0bBgu0S7LZGF5HBluwNBjUYPAAQdaMMSAv
	ksLqbXwoYP+KHDy9SzJIOW0jfvugHXoZcljhwtL5xfxOLlkqHKpEK724mfQIUQrUFug=
X-Gm-Gg: AYBFou0+XtHLeLmM2TtE5DejitbDrHeSfzI9IKixRJWLFS7jSoLuF7Kk6RPqPZQtag/
	yAJW5TRjh5v3MoYou+VyT/mDJ+YK1XBv56WzE6HvWiHQZ93iZuFp57Zhq0z3cwe1sxk16Su5Qoc
	OtJvoKPPYzrTg1a+WSBhn/KExQyhnYT5XiW+XJ8xaT64Fj6GeM95iEKXoWkrdiT+rYOGW+OYRio
	IPHYEse7n9xPk9sXH3n99ecf22R37HdmFIRO+MGtT8Cn5BkJGXOH9EQtjrJD3kUKfZR+9/aoWwu
	1RpwAy5zN5i22Q9Gwh62Wq0UJbXevT0qM8IQADLzdGn99+XLlt9IZXD7iE+CeA6eUckD90SnEat
	rEbu5vbo9r2KWj8VqadPxTYLXXf48FB/3L6cWyFkpPa/84hJOiLDwZGlpDmlS1/QC3qxccalYU6
	JKFuEyJ/c9TfqipHdf4YtTm3LXHyTorGGzov/0xSOynGDRA7L9XOentTqAJaghrGNzPIbsX2H/k
	C1ceCifXvhl+lyGDVqs2LdHEsTiqpYi6fVTbjUkstjRW62Kk6EfZSaAKqLxBDvMMA5lWVvaLw==
X-Received: by 2002:a05:600c:b96:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49e618898eamr29751655e9.2.1789114064206;
        Fri, 11 Sep 2026 01:07:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62121747sm34492625e9.2.2026.09.11.01.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:07:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 10:07:43 +0200
Message-Id: <DLCC065ZWGTZ.19S8A96PYY4SZ@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 2/3] python3-py: correct
 CVE_PRODUCT mapping
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Devansh Patel" <devanshp@cisco.com>, "Khem Raj"
 <khem.raj@oss.qualcomm.com>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260902060943.2931635-1-dkelaiya@cisco.com>
 <20260902060943.2931635-2-dkelaiya@cisco.com>
In-Reply-To: <20260902060943.2931635-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245619

On Wed Sep 2, 2026 at 8:09 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> The product-only "py" mapping generates a wildcard-vendor identity
> instead of the exact NVD identity for the packaged pytest-dev py
> source. Use "pytest:py" for its NVD dictionary CPE and configuration
> matches.
>
> This changes the generated product identity. With sbom-cve-check 1.3.3,
> the current CVE report is unchanged using the pinned database snapshots;
> both mappings report CVE-2020-29651 and CVE-2022-42969.
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit 26fa8b053b71d1f3f8da359abaef578c671c692f)
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/rec=
ipes-devtools/python/python3-py_1.11.0.bb
> index a75b9c2b14..906410e9bb 100644
> --- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
> +++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6bb0320b04a0a=
503f12f69fea479de9"
> =20
>  SRC_URI[sha256sum] =3D "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa=
41e558e6f4a98719"
> =20
> -CVE_PRODUCT =3D "py"
> +CVE_PRODUCT =3D "pytest:py"
> =20
>  DEPENDS +=3D "python3-setuptools-scm-native"
> =20

Hello,

As far as I can tell, this is also needed on meta-oe/wrynose. Can you
send a backport there, please?

Since patches 2&3/3 conflicts, I'll hold both until "python3-py: correct
CVE_PRODUCT mapping" lands on meta-oe/wrynose.

Baring future issues, I'll take 1/3.

Thanks!
--=20
Yoann Congal
Smile ECS


