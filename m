Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AE9CD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:01:48 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125584.1781514098987698012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 02:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xSL9A2Oi;
 spf=pass (domain: smile.fr, ip: 209.85.208.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so3838183a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781514097; x=1782118897; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9EW3jjnVS03bR1Aq1mWJGYr3C+mqzwLuRuJ5EV6G1A=;
        b=xSL9A2OiFRZK+3e5mBS4Z0js4/yikVVqR4iaInOC3zt7rWq78QHhSJcBx9Q0M+LZXB
         6L2hnEGo/fldYd0VpBXon8BVygX7Rv2/KN4w/ZBE5rDuqI1l1/9qQmgG0qKeNphkmM5o
         r/xbTb7JWsL2wL9Z944VcNN7OF01nZdu8nI68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514097; x=1782118897;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9EW3jjnVS03bR1Aq1mWJGYr3C+mqzwLuRuJ5EV6G1A=;
        b=FXaMsS6HtmSzxAioDXBvFVoL50MTJKEQnZaT3LDigh+Pev8dM7JecaX0OoBftWmzi+
         z24e4zcL7DMTmeAE0M6/oTW0V3qVj47UHImqLfcA0M3fYEMj0akY3HxjbB1zk8fvXhtS
         uSSZp2XMvuXh3QXEbEfFy7h7b2fxUmXTj4PFVpUK23JHmuEtYBgpwrbEpv0WGiCK/o4P
         JBm83VCxe7jP7i7F6pc3wik1DUQEXN0JAElyLUmFmRfOLFg3NY8skraXa0QGhgVVAPLo
         4XRJDCVUGpSJ7rt2lSBB0Wz5d9eDzqZLgxym/71qqPklV7lSxSQJpercxsd2Gcy8L25p
         CPXg==
X-Forwarded-Encrypted: i=1; AFNElJ+VaWtj8ggKHW3IslGC8oMsgY1PU/+8hdFuJSU3ZUfbfHN+C+2LDM0yZumHUA+4f6d5lgweIWMSSJpPi6+RD6sM8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzz3v0mzgOig0l/xVoGOpQtA12fUsUhi/YKdyMMCZiviMcBn9So
	KNPethLISTLrlXYZV84b4/L+m8Po1g5/MG006TXtTA0xkluVumUhjKDnqJUrY99D9ak=
X-Gm-Gg: Acq92OELd6HNZhaC6GqGc9gMv4S0pDCDBmLxLmEH7exLQmsxaF1fTrNK5ph3VjjzROb
	vCaxlB66OTPDdBkH3ofQbbAkwoC/tbsWdP7ND0jXbOy12jaodsrIUiXwS22W2ylv2ju2AuxiwdE
	8sjnO11WCMcKmY0YDbpiZDHwSHJZ4VwlDnhtbStCfepCeElCi6lxcJ2+v1slXUMWnEILhQXvezE
	ku8MXtUSM/fttusEpg3+WRyeEPI1yJ9ZQi/EbNBiR6p6oiHu4r4Fk+bFdKZojyumin/WK7Cb5Rt
	DA6pqy7cvLG1Z6NfCXOtyUxxm53s3T155YC08kg+ijwH11BdrrJMcJgnJ7z7EBL4a5UIVfII2GM
	7JQrWoKgv6shW35+T10ZVsiu/W8i0VpbqB9Iu0WHbud4/ScRIPTB5jaV2K1hsNXGnTsTN1iRe39
	ZPfitoargetdt+syDsyzyaqjdpusvXNzG8HFz1mvEwPg7PyvSYnchIiR3WzRWPwNKpioskeA2sv
	MzdnnLWa88uHWM=
X-Received: by 2002:a05:6402:3494:b0:68d:d511:4a9f with SMTP id 4fb4d7f45d1cf-69378a29707mr5699628a12.18.1781514097049;
        Mon, 15 Jun 2026 02:01:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919a009sm3202819a12.2.2026.06.15.02.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:01:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 11:01:35 +0200
Message-Id: <DJ9I1H3FGLVT.387B1AALA6MXN@smile.fr>
Subject: Re: [OE-core] [PATCH] openssl: upgrade 3.0.19 -> 3.0.21
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Nisha.M.Parrakat@bmw.de>, <Suresh.HA@bmwtechworks.in>,
 <AshishKumar.Mishra@bmwtechworks.in>, <Nikhil.R@bmwtechworks.in>, "Aditya
 GS" <aditya.gs@bmwtechworks.in>
To: <adityags2004@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260615083317.2657-1-adityags2004@gmail.com>
In-Reply-To: <20260615083317.2657-1-adityags2004@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 09:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238826

On Mon Jun 15, 2026 at 10:33 AM CEST, Aditya GS via lists.openembedded.org =
wrote:
> Upgrade OpenSSL from 3.0.19 to 3.0.21.

Hello,

This does not match versions from supported branches. What are you
targeting?

Regards,

>
> This upgrade brings in upstream fixes for multiple CVEs:
>
>   - CVE-2026-45447 (High): heap use-after-free in PKCS7_verify()
>   - CVE-2026-7383: heap buffer overflow in ASN.1 multibyte string
>   - CVE-2026-9076: out-of-bounds read in CMS password-based decryption
>   - CVE-2026-34180: heap buffer over-read in ASN.1 content parsing
>   - CVE-2026-42764: NULL pointer dereference in QUIC server packet handli=
ng
>   - CVE-2026-45445: AES-OCB IV ignored on EVP_Cipher() path
>   - CVE-2026-34182: CMS AuthEnvelopedData may accept forged messages
>   - CVE-2026-42766: NULL pointer dereference in password-based CMS decryp=
tion
>   - CVE-2026-42770: FFC-DH peer validation uses attacker-supplied q
>   - CVE-2026-45446: incorrect tag processing for empty messages in AES-GC=
M-SIV and AES-SIV modes
>   - CVE-2026-31790: incorrect failure handling in RSA KEM RSASVE encapsul=
ation
>   - CVE-2026-28387: potential use-after-free in DANE client code
>   - CVE-2026-28388: NULL pointer dereference when processing a delta CRL
>   - CVE-2026-28389: NULL dereference in CMS KeyAgreeRecipientInfo
>   - CVE-2026-28390: NULL dereference in CMS KeyTransportRecipientInfo
>   - CVE-2026-31789: heap buffer overflow in hexadecimal conversion
>
> As a result of this upgrade, the following CVEs are already fixed in the
> upstream version and no longer require local patches:
>
>   - CVE-2024-41996: vulnerability that could lead to denial of service
>   - CVE-2023-50781: fixes related to certificate validation and memory ha=
ndling
>
> Upstream changelog:
> https://github.com/openssl/openssl/blob/openssl-3.0.21/NEWS.md
>
> Signed-off-by: Aditya GS <adityags2004@gmail.com>
> Signed-off-by: Aditya GS <aditya.gs@bmwtechworks.in>
> ---
>  .../openssl/{openssl_3.0.19.bb =3D> openssl_3.0.21.bb}     | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.19.bb =3D> openssl=
_3.0.21.bb} (95%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.21.bb
> similarity index 95%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.21.bb
> index 293b450cd0..2531305cda 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.21.bb
> @@ -12,20 +12,13 @@ SRC_URI =3D "https://github.com/openssl/openssl/relea=
ses/download/openssl-${PV}/op
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -           file://CVE-2024-41996.patch \
> -           file://CVE-2023-50781-1.patch \
> -           file://CVE-2023-50781-2.patch \
> -           file://CVE-2023-50781-3.patch \
> -           file://CVE-2023-50781-4.patch \
> -           file://CVE-2023-50781-5.patch \
> -           file://CVE-2023-50781-6.patch \
>            "
> =20
>  SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
> =20
> -SRC_URI[sha256sum] =3D "fa5a4143b8aae18be53ef2f3caf29a2e0747430b8bc74d32=
d88335b94ab63072"
> +SRC_URI[sha256sum] =3D "617e29af8e421f46649484a4937e48c685e47f46488167c9=
82f88bc4ec1d522f"
> =20
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"


--=20
Yoann Congal
Smile ECS


