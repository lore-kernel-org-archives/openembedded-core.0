Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C2CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 08:21:59 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.13062.1756023716806404486
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 01:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6vIjOou;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70dba9c96b8so2097266d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756023716; x=1756628516; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FdA/JD6UdBXas5JQQZsmPqD7bPYplu/ikIyiy9ti6kw=;
        b=N6vIjOoub2LMPyBq/FHZmuxbTwh32CvRy5xv05gug3+8zO4oYc5LIARf72BuMMWaCk
         O2bXwJa76Yc6YPlrmRSwbhn1OPh+LorEitnEA/+SE/tUPvFjDmjEOCAvuc+igbRLzdK2
         tooxZ4AByb0FyfHPApFlXZXH1ssqtfb1zWyCYfTZXc3hKyJnATCUTp+T79Xw4AjTEO2u
         1xK538zUkeTq0vwtBAgFcrcnQkljekNQOVWVN3TKse7yehgR0riypvXnLdYvepMB1S3x
         v40wv/UdzqLj6nFMZM+phj+zRmaGCvxl38ySNw01IsKxABghWpHJXp+5ulWuEB5YD9uG
         P8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756023716; x=1756628516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdA/JD6UdBXas5JQQZsmPqD7bPYplu/ikIyiy9ti6kw=;
        b=ptok6ALNBcMdrBUvSfm7VkcmsUbh4rhTYeCEW43M6qPKc81OaZrDrI+MdppZWF1N0G
         PNgJNXNgaalM3WkLgQNIyzxWJC85ynFck0tenCd1cRL8gMXAO79KSXnDx4n38Q916npx
         zH8Of6e2kOZYfsS07kQYNwg9/EcJjf9A+AuQwu3vcfqyTGYRFRSqc7diU4hZ7VQtGgCv
         Isn8sKtcu9+rcVB3C8YBEgfBTdpD0cgHWup9fit35LuT9IZ+dvCgbm14zJDQy9NMAhJL
         RcZm2wBXdEt6DEwLtaTRTrtBLN+9LAsR7ng7MaY4/xh4PAEE8N+7B2iacItBsVaZmZsG
         qJjw==
X-Gm-Message-State: AOJu0YzHDN/ufaI1f57ZnUOB26g7pceZvf3ZXR24ixMqwtBbEHnkWvk+
	BGKcVAuQ4syzS0BarbtTg8LT9JbCk+DMgTQKiM/ZDuvZ8DxnYEr+OnYypKW1MF00Tu9przAOR70
	LIPPr/u0A2kCUTZ4XZW7LmZEbQDHUGUU=
X-Gm-Gg: ASbGncvG8KGTeasiTLA/9RXRCziobSeFFoYDegl/oFDnbHhPVdiuBIWYYOgOobiP5DT
	Dhxmwdg8m1vWvGyIHnRNus7x+hwrffu2Xcgm0wnOz/TJgA2S4USR4iCzTVgJzshwvy6ptFjnNIy
	xavgcT0cmaprVtiQCQz+kFF7jHlhSvO9qHLwDL1vJPetQTB2Xx6mQv/bOEziirXYUj1MMDHrGKB
	XafNuU=
X-Google-Smtp-Source: AGHT+IEsnh8QQBi1w498m1SBHjohXD80IILRgtSvfwleA/X7NXnpDeaHFkACOfaEaNYNLVmuCtKoL0E5W1fHNmYIHvs=
X-Received: by 2002:ad4:5de9:0:b0:70d:ac6c:d5e with SMTP id
 6a1803df08f44-70dac6c152cmr40037796d6.17.1756023715552; Sun, 24 Aug 2025
 01:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250820143722.4153909-1-hongxu.jia@windriver.com> <20250821041909.1693041-1-hongxu.jia@windriver.com>
In-Reply-To: <20250821041909.1693041-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Aug 2025 10:21:46 +0200
X-Gm-Features: Ac12FXzYUloWiuLwK6_S13QWneUMMBqQHZynloCuP6cUd_XQwFtecJ_hEQH0ifY
Message-ID: <CANNYZj89EdN9FW9QiaHXKdjEvM672xDnjoQiOfvpkYbmXNnYVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] nativesdk-openssl: support multlib libdir
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222362

I don't understand. Why and when would nativesdk openssl need to be
supporting multilib? It always installs and uses a single libdir.

Alex

On Thu, 21 Aug 2025 at 06:19, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
>
> Make nativesdk-openssl to support multlib libdir (such as
> sdk-relocation-dir/usr/lib64 or sdk-relocation-dir/usr/lib)
> other than hard code `relocation-dir/usr/lib', add environment
> variable OPENSSL_LIBDIR in environment-setup.d script for
> OPENSSL_CONF, OPENSSL_MODULES and OPENSSL_ENGINES
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../openssl/files/environment.d-openssl.sh            | 11 ++++++-----
>  meta/recipes-connectivity/openssl/openssl_3.5.2.bb    |  1 +
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> index 71d378734c2..945151e1e2c 100644
> --- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> +++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> @@ -1,6 +1,7 @@
> -export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
> -export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
> -export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
> +export OPENSSL_LIBDIR="@OPENSSL_LIBDIR@"
> +export OPENSSL_CONF="$OPENSSL_LIBDIR/ssl-3/openssl.cnf"
> +export OPENSSL_MODULES="$OPENSSL_LIBDIR/ossl-modules/"
> +export OPENSSL_ENGINES="$OPENSSL_LIBDIR/engines-3"
>  export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
>
>  # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
> @@ -9,7 +10,7 @@ if [ -z "$SSL_CERT_FILE" ]; then
>         if [ -n "$CAFILE" ];then
>                 export SSL_CERT_FILE="$CAFILE"
>         elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
> -               export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
> +               export SSL_CERT_FILE="$OPENSSL_LIBDIR/ssl-3/certs/ca-certificates.crt"
>         fi
>  fi
>
> @@ -17,7 +18,7 @@ if [ -z "$SSL_CERT_DIR" ]; then
>         if [ -n "$CAPATH" ];then
>                 export SSL_CERT_DIR="$CAPATH"
>         elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
> -               export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
> +               export SSL_CERT_DIR="$OPENSSL_LIBDIR/ssl-3/certs"
>         fi
>  fi
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
> index 396e69d7e7f..23cc9b6f450 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
> @@ -202,6 +202,7 @@ do_install:append:class-native () {
>  do_install:append:class-nativesdk () {
>         mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
>         install -m 644 ${UNPACKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
> +       sed -i 's#@OPENSSL_LIBDIR@#${libdir}#g' ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
>  }
>
>  PTEST_BUILD_HOST_FILES += "configdata.pm"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222203): https://lists.openembedded.org/g/openembedded-core/message/222203
> Mute This Topic: https://lists.openembedded.org/mt/114812592/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

