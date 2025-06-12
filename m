Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00867C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 15:29:46 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.16540.1749742185420534622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 08:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SCLcU7uZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7111d02c777so8540077b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749742184; x=1750346984; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og7wWPdiyiPf3aJ7PNdf8i64eq3knfE4ap9HsTzqq6w=;
        b=SCLcU7uZEg2USQnkkpx7ugfEdyFBi2EBhdHC5saQNLoIJySJ0vT9p4c0qorJeLpFIy
         xmGDSGHpD+3G9F9lAeYa0TddU1rsnk1hCG0Id3D1TntBeqxJxPx3Ej+4W8+4/HCD4rkI
         pKYtVVYrrMvEO/b8DXX75g0c0I5uKEB1uE6qQzKkPPNx0Qto/SD0l1zjc1TTICaGPUjv
         I86FIj+F1y1lysX5enBx9X+d76kqEdY3lp90TVNXy03aI0AT1ILy0GMK/bYS6d4456n3
         +/Ww9kOgubYXq4F8FJ9/on/3Dh5S2fRUgxR6u/KXiyw2dCtLfUwXetoueo7xmd8sCGdw
         A+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742184; x=1750346984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=og7wWPdiyiPf3aJ7PNdf8i64eq3knfE4ap9HsTzqq6w=;
        b=RXDYOPyTKp4k+You2UwEtj9OooLzZ7LstedUJLYUHa4ya4siAJwoVJfIYNBTCbPom1
         TV69srhnfaKLqaWvl6oNNOPl+qfwVJZoxXhrJmaMrOzXAk51ZYdDoLntRXxbsRF8U70a
         79ZlCWKBVk0VpVd4G0nqncG4OvQJ8+OYaDYOQlxAXU3VHzaR8zI/+4M3GkE/Fxyb7qvb
         H6RcjDxkcKghHubb6marm2jVGQckVviQZrJWznkpm9Jc2/2IlV8A3+lkAPROOJ/Ktm1K
         cGuisDzE+WZrLV6uQtdBXDE0DQAw9B5nRh1awDiUzz475qJlMfNrZ4gWTp97JllQcPi5
         oJ1w==
X-Gm-Message-State: AOJu0YzlWFSHAgaXtQR3qpQJT8iqre91SrpXHitl4gQNfKihJn0fAEb+
	VkcYM/ysIeEczW0FAPtKlaJI1N0ghrQe0+sO89Z5EPE7ZYTZ4VQe4MX05XOg3LCBiW6bDx4BFwP
	2rxDJD4X7gCQw1GawcgxObBInhObWS89c17TBQUreokLTYGa6CENo
X-Gm-Gg: ASbGncvwpxqL4rEk0COi8GxUy8qvfrAVPjwZtYeDHsvRvKNC7jnuZhz1r7W1/syHo5o
	7KHmsGPR1d9GCetypuDdvmud9a8WotajU2QWN68rzpu3WHDFtISNoODj2BMjIyKwML4S6ZXfaBT
	JQZaoTN4AoXeozMjG4PbwEybnivIaaGnk3goWzn3pvDsWv6vExxhi3chOlV5DVOQWfF5CkMmZ0N
	bI=
X-Google-Smtp-Source: AGHT+IFe2bCT6gY2HNOgZIoTWgLkxn9tapITicLKFx5cV6x3dbhtF2Di9p67jhbMwhV7TRivQDTDFXk2iSxmrqpvG1M=
X-Received: by 2002:a05:690c:6182:b0:70c:a5c2:cef8 with SMTP id
 00721157ae682-71161ef9c1dmr5376027b3.19.1749742184399; Thu, 12 Jun 2025
 08:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250612064317.3489718-1-yogita.urade@windriver.com>
In-Reply-To: <20250612064317.3489718-1-yogita.urade@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Jun 2025 08:29:33 -0700
X-Gm-Features: AX0GCFsfspUbw8wN6m_PA3pRZWTVgipI_h1sfFeOWf1xlObaQYkXbO15uVE4loc
Message-ID: <CAOSpxdZ6w4nwOpgVtYinBpAsJBFihddvk=7k-03tzoGmjDZkiA@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH 1/1] curl: upgrade 8.12.1 -> 8.14.1
To: Yogita.Urade@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 15:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218530

Hi Yogita,

I can only take bug/security release version bumps.  Major version
bumps like this are not allowed in stable branches.

Steve

On Wed, Jun 11, 2025 at 11:43=E2=80=AFPM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Handle CVE-2025-4947 and CVE-2025-5025.
>
> CVE-2025-5399 fixed in 8.14.1 was introduced only in 8.13.0, so Yocto
> never had version vulnerable to it.
>
> Rebase patches.
>
> Add openssl-native dependency fo ptest to fix following error:
>
>     Missing or broken 'openssl' tool. openssl 1.0.2+ is required.
>     Without it, this script cannot generate the necessary certificates
>     the curl test suite needs for all its TLS related tests. at
>     ../../../curl-8.14.0/tests/certs/genserv.pl line 33.
>
> Install curlinfo for tests required since 8.14.0
> https://github.com/curl/curl/commit/7a1211d474afd4e36bfb39f2b870a418bce42=
138
>
> (From OE-Core rev: d990ee6c49e3fcf969e54688397d47f0d0892ba1)
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  meta/recipes-support/curl/curl/no-test-timeout.patch       | 2 +-
>  .../curl/{curl_8.12.1.bb =3D> curl_8.14.1.bb}                | 7 ++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_8.12.1.bb =3D> curl_8.14.1.bb} (9=
5%)
>
> diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/=
recipes-support/curl/curl/no-test-timeout.patch
> index 677d177302..5b901a6fe9 100644
> --- a/meta/recipes-support/curl/curl/no-test-timeout.patch
> +++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
> @@ -14,7 +14,7 @@ diff --git a/tests/servers.pm b/tests/servers.pm
>  index d4472d5..9999938 100644
>  --- a/tests/servers.pm
>  +++ b/tests/servers.pm
> -@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon vers=
ion string
> +@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon vers=
ion string
>   my $sshderror;   # for socks server, ssh daemon version error
>   my %doesntrun;    # servers that don't work, identified by pidfile
>   my %PORT =3D (nolisten =3D> 47); # port we use for a local non-listenin=
g service
> diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-supp=
ort/curl/curl_8.14.1.bb
> similarity index 95%
> rename from meta/recipes-support/curl/curl_8.12.1.bb
> rename to meta/recipes-support/curl/curl_8.14.1.bb
> index 4192693da8..08ad9cdb17 100644
> --- a/meta/recipes-support/curl/curl_8.12.1.bb
> +++ b/meta/recipes-support/curl/curl_8.14.1.bb
> @@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-curl.sh \
>  "
>
> -SRC_URI[sha256sum] =3D "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f1=
5d001613c76de202"
> +SRC_URI[sha256sum] =3D "f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53=
fd584cc12e9120dd"
>
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
> @@ -126,12 +126,17 @@ do_install_ptest() {
>                 ${B}/libtool --mode=3Dinstall install ${B}/tests/server/$=
name ${D}${PTEST_PATH}/tests/server
>         done
>
> +       install -d ${D}${PTEST_PATH}/src
> +       install -m 755 ${B}/src/curlinfo ${D}${PTEST_PATH}/src
> +
>         cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
>
>         # More tests that we disable for automated QA as they're not reli=
able
>         cat ${UNPACKDIR}/disable-tests >>${D}${PTEST_PATH}/tests/data/DIS=
ABLED
>  }
>
> +DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED', '=
1', ' openssl-native', '', d)}"
> +
>  RDEPENDS:${PN}-ptest +=3D " \
>         locale-base-en-us \
>         perl-module-b \
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218483): https://lists.openembedded.org/g/openembedde=
d-core/message/218483
> Mute This Topic: https://lists.openembedded.org/mt/113602392/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

