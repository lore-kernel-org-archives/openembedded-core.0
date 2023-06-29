Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E216EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 12:59:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7476.1688043572971316759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 05:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Qb1EwW4+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fa99f6a482so6547495e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688043571; x=1690635571;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V64dcWQjiSavh+YT5FKIRZdRDqjpX4e4uHqU/p1zM7o=;
        b=Qb1EwW4+SYgwXdnfExH5oaJiLQYDUzH3oUp0NRlbZZA0sWE31QukHX9nj5c9rmDDe4
         i3QWCV6g2mcexLZktry6BvqB5wmTzy0UwibPZ0BBnXaJ/5IKvb7p4k2WtmZcP4kx2E6W
         cWHRwKRoHIsfvj8KoePogxvddzWcBoTAgkTH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688043571; x=1690635571;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V64dcWQjiSavh+YT5FKIRZdRDqjpX4e4uHqU/p1zM7o=;
        b=gOIEk6BqzYLSA0ERNNwZ4neQO8rLTvMTI6Pv3QIAWhcpcsVWs/kYiDOVqgHRoIf82i
         ZBc3Q6rICGUqbCrpDEA19ZsQWPF1M9XI2S4/YEr08bIobrAT7tXg3wExaOYoZehIU+mm
         B+AXV4FziHpWualabHb3di8A0InakWu8bGgcLj5A4K35dak8prnQr+ZZ38qDPKah0ew2
         fq7uMpowcUxIpH3LaoLdGhDn9dbyjFPjh77DAbF/msMDJ5C8PwMhO58aiacf8WsdMDwJ
         y+KJmTR2bq0WMeoIyGe9qc6Haq1vW+YULVrDyfYVVaDOu9LKyxyxmc+6yjJw0rvvpPSC
         XIJg==
X-Gm-Message-State: AC+VfDxxQQi19hc3OfOnLIlGK/lY2Ncc+5XGjd4s38q9eYj7L8VcOXCU
	8cPpoNQ8DCgdHSVGzJWI4Bhpiw==
X-Google-Smtp-Source: ACHHUZ5ENphK1jce6wNZ6dJHGZeVwOKlYFVOopi3BEFUgiu9WNIyJDOLl3QzIROzy31yy9lP5xyJHw==
X-Received: by 2002:a7b:c847:0:b0:3fb:b3aa:1c8f with SMTP id c7-20020a7bc847000000b003fbb3aa1c8fmr3272959wml.28.1688043571258;
        Thu, 29 Jun 2023 05:59:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c218600b003fbc0a49b57sm723028wme.6.2023.06.29.05.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 05:59:30 -0700 (PDT)
Message-ID: <496effdc79d480db0c0b3067c9d75b34b32acd8d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: fix the pylibmount installation
 path
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com, tgamblin@baylibre.com
Date: Thu, 29 Jun 2023 13:59:30 +0100
In-Reply-To: <20230629-pylibmount-v1-1-342da6733d5d@baylibre.com>
References: <20230629-pylibmount-v1-1-342da6733d5d@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 12:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183623

On Thu, 2023-06-29 at 12:37 +0000, Louis Rannou wrote:
> Append the install task to move the python library from ${base_libdir}
> to ${PYTHON_SITEPACKAGES_DIR}.
>=20
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
> As we install libraries of util-linux in ${base_libdir} (/lib), the
> python library pylibmount is also installed there. An issue was raised
> when pylibmount was added to PACKAGECONFIG.
> ---
>  meta/recipes-core/util-linux/util-linux_2.38.1.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.38.1.bb
> index 9ea7a04e8a..f9a9fdcfaf 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> @@ -1,7 +1,7 @@
>  require util-linux.inc
> =20
>  #gtk-doc is not enabled as it requires xmlto which requires util-linux
> -inherit autotools gettext manpages pkgconfig systemd update-alternatives=
 python3-dir bash-completion ptest
> +inherit autotools gettext manpages pkgconfig systemd update-alternatives=
 python3-dir python3targetconfig bash-completion ptest
>  DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
> =20
>  PACKAGES =3D+ "${PN}-swaponoff"
> @@ -320,3 +320,12 @@ do_install_ptest() {
>          rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
>      fi
>  }
> +
> +do_install:append() {
> +    if [ -d ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ]
> +    then
> +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> +        mv ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ${D}$=
{PYTHON_SITEPACKAGES_DIR}/
> +        rm -rf ${D}${base_libdir}/${PYTHON_DIR}
> +    fi
> +}

When it is being installed, can we not pass the right path into the
build system so it ends up in the right place?

Cheers,

Richard



