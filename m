Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946ECDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 18:35:54 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.20499.1697135750903668098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 11:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jmKZ21gZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53dd752685fso2308596a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697135749; x=1697740549; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYkfnc87+ZxGhjCECbpwLNdROioeoPKlmVbTvgkfGg0=;
        b=jmKZ21gZmahzOiU14NmNGtoY+E0FhAOS1mFs+73kyvAUX4DYu4E/4+Cu1K+E84Dsi+
         Ka3N+kJruIx0ynyko90zByrMEoHc8vaIjxwvJz4mM8AP+cRBoFKxcr4lzYo8PjbRMJ/w
         BH8b3ry8y4D/QMisMh1uRFQGN9m9ipUifaicVxEwOWU1iN3UdyTaYJYF+jN6Ax5L2l73
         Tdgh8GoAZKeJ5TiaVCS7RHh0SNIpGzlAn3EQs59rI6KHcbq7GbvbM8U0OC3UctDjv6fq
         yt4DerMN0n8SSQRpuWz30l3ClCrF+/ppr2Ft3UTM2vWTIxcGTIGAc5F916dlSQzlAFS+
         Mjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697135749; x=1697740549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYkfnc87+ZxGhjCECbpwLNdROioeoPKlmVbTvgkfGg0=;
        b=aW90m72w9Ec/+3cZGl7lfPwS7VPSystmnutXI+XxqRtVb0IXpJnzyKAijjxX9efv5x
         A9WOvfWlBrbgNu+htwdC5kVVt4bicoWSPFAOF2ep8wKmrr6Zu5acIuocjAcERs4W1PaQ
         a9SF5jYbHaon7j+wIC5DSf8aPS8eaBLuu9YnnxqAK/aLJlaqwOOHIAebJkBb+2FcgEgq
         d7vqdU2vTDZ+iKPwvcda9jR0X2iIg9TWVAvA5B1upQ/gyKLk773Al6/FMZkvniHtHVch
         doAibiHmOcCinFvC4V7WzKiEmaLBUiJPXfAHvQGQnK3cNy75JjUse/v3yZSnFI3QthF+
         aWKQ==
X-Gm-Message-State: AOJu0YyM7C8yQzL8Zt1Hb3VhevuZ6Q4xhYouHiiF29a5Hubca7Bu7CWH
	gvlylLzWH+jd6KQHqeoZJSku13XgP5M+LH0DyAAXxQ==
X-Google-Smtp-Source: AGHT+IFL9O5KeDLa40DJyQXHVtX25u9C/V3vBS5vQPahXlGq9tuJi2eSqnYMV2y8pXvN+Oq2SU8/G9reFmSzA3GEftA=
X-Received: by 2002:a17:906:cc5a:b0:9ba:fe6:225 with SMTP id
 mm26-20020a170906cc5a00b009ba0fe60225mr11477974ejb.55.1697135748831; Thu, 12
 Oct 2023 11:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231012055444.564180-1-mac@mcrowe.com>
In-Reply-To: <20231012055444.564180-1-mac@mcrowe.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Oct 2023 08:35:37 -1000
Message-ID: <CAOSpxda0t9GWwcD-0nXGHEkiRy+DBQD9mAgbMY=zDmJAm7z+Bg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] curl: Backport fix for CVE-2023-38545
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 18:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189019

On Wed, Oct 11, 2023 at 7:55=E2=80=AFPM Mike Crowe via lists.openembedded.o=
rg
<mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>
> From: Mike Crowe <mac@mcrowe.com>
>
> Backporting this change required tweaking the error value since the
> two-level CURLE_PROXY error reporting was introduced after curl
> 7.69.1. The test required some tweaks to not rely on more-recent
> improvements to the test infrastructure too.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  .../curl/curl/CVE-2023-38545.patch            | 146 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
>  2 files changed, 147 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-38545.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-38545.patch
> new file mode 100644
> index 0000000000..40a92ce3fb
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
> @@ -0,0 +1,146 @@
> +From 600a1caeb2312fdee5ef1caf7d613c12a8b2424a Mon Sep 17 00:00:00 2001
> +From: Mike Crowe <mac@mcrowe.com>
> +Date: Wed, 11 Oct 2023 20:50:28 +0100
> +Subject: [PATCH] socks: return error if hostname too long for remote res=
olve
> +To: libcurl development <curl-library@cool.haxx.se>
> +
> +Prior to this change the state machine attempted to change the remote
> +resolve to a local resolve if the hostname was longer than 255
> +characters. Unfortunately that did not work as intended and caused a
> +security issue.
> +
> +Name resolvers cannot resolve hostnames longer than 255 characters.
> +
> +Bug: https://curl.se/docs/CVE-2023-38545.html
> +
> +Unfortunately CURLE_PROXY and CURLPX_LONG_HOSTNAME were introduced in
> +7.73.0 so they can't be used in 7.69.1. Let's use
> +CURLE_COULDNT_RESOLVE_HOST as the best available alternative and update
> +the test appropriately.
> +
> +libcurl's test support has been improved considerably since 7.69.1 which
> +means that the test must be modified to remove use of %VERSION and
> +%TESTNUMBER and the stderr output can no longer be checked.
> +
> +Upstream-Status: Backport [fb4415d8aee6c1045be932a34fe6107c2f5ed147]

Missing CVE: and Signed-off-by:

Please submit a V2.

Thanks!

Steve

> +---
> + lib/socks.c             | 13 +++++----
> + tests/data/Makefile.inc |  2 +-
> + tests/data/test728      | 60 +++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 69 insertions(+), 6 deletions(-)
> + create mode 100644 tests/data/test728
> +
> +diff --git a/lib/socks.c b/lib/socks.c
> +index 37099130e..f3bf40533 100644
> +--- a/lib/socks.c
> ++++ b/lib/socks.c
> +@@ -521,11 +521,14 @@ CURLcode Curl_SOCKS5(const char *proxy_user,
> +       infof(conn->data, "SOCKS5: connecting to HTTP proxy %s port %d\n"=
,
> +             hostname, remote_port);
> +
> +-    /* RFC1928 chapter 5 specifies max 255 chars for domain name in pac=
ket */
> ++    /* RFC1928 chapter 5 specifies max 255 chars for domain name in pac=
ket. */
> +     if(!socks5_resolve_local && hostname_len > 255) {
> +-      infof(conn->data, "SOCKS5: server resolving disabled for hostname=
s of "
> +-            "length > 255 [actual len=3D%zu]\n", hostname_len);
> +-      socks5_resolve_local =3D TRUE;
> ++      failf(data, "SOCKS5: the destination hostname is too long to be "
> ++            "resolved remotely by the proxy.");
> ++      /* This version of libcurl doesn't have CURLE_PROXY and
> ++       * therefore CURLPX_LONG_HOSTNAME, so let's report the best we
> ++       * can. */
> ++      return CURLE_COULDNT_RESOLVE_HOST;
> +     }
> +
> +     if(auth & ~(CURLAUTH_BASIC | CURLAUTH_GSSAPI))
> +@@ -837,7 +840,7 @@ CURLcode Curl_SOCKS5(const char *proxy_user,
> +
> +     if(!socks5_resolve_local) {
> +       socksreq[len++] =3D 3; /* ATYP: domain name =3D 3 */
> +-      socksreq[len++] =3D (char) hostname_len; /* one byte address leng=
th */
> ++      socksreq[len++] =3D (unsigned char) hostname_len; /* one byte len=
gth */
> +       memcpy(&socksreq[len], hostname, hostname_len); /* address w/o NU=
LL */
> +       len +=3D hostname_len;
> +       infof(data, "SOCKS5 connect to %s:%d (remotely resolved)\n",
> +diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
> +index 3d8565c36..5ee2284ff 100644
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -89,7 +89,7 @@ test662 test663 test664 test665 test666 test667 test66=
8 \
> + test670 test671 test672 test673 \
> + \
> + test700 test701 test702 test703 test704 test705 test706 test707 test708=
 \
> +-test709 test710 test711 test712 test713 test714 test715 test716 test717=
 \
> ++test709 test710 test711 test712 test713 test714 test715 test716 test717=
 test728 \
> + \
> + test800 test801 test802 test803 test804 test805 test806 test807 test808=
 \
> + test809 test810 test811 test812 test813 test814 test815 test816 test817=
 \
> +diff --git a/tests/data/test728 b/tests/data/test728
> +new file mode 100644
> +index 000000000..7b1d8b2f3
> +--- /dev/null
> ++++ b/tests/data/test728
> +@@ -0,0 +1,60 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++HTTP GET
> ++SOCKS5
> ++SOCKS5h
> ++followlocation
> ++</keywords>
> ++</info>
> ++
> ++#
> ++# Server-side
> ++<reply>
> ++# The hostname in this redirect is 256 characters and too long (> 255) =
for
> ++# SOCKS5 remote resolve. curl must return error CURLE_PROXY in this cas=
e.
> ++<data>
> ++HTTP/1.1 301 Moved Permanently
> ++Location: http://AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/
> ++Content-Length: 0
> ++Connection: close
> ++
> ++</data>
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<features>
> ++proxy
> ++</features>
> ++<server>
> ++http
> ++socks5
> ++</server>
> ++ <name>
> ++SOCKS5h with HTTP redirect to hostname too long
> ++ </name>
> ++ <command>
> ++--no-progress-meter --location --proxy socks5h://%HOSTIP:%SOCKSPORT htt=
p://%HOSTIP:%HTTPPORT/728
> ++</command>
> ++</client>
> ++
> ++#
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<strip>
> ++^User-Agent:.*
> ++</strip>
> ++<protocol>
> ++GET /728 HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++Accept: */*
> ++
> ++</protocol>
> ++<errorcode>
> ++6
> ++</errorcode>
> ++</verify>
> ++</testcase>
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-supp=
ort/curl/curl_7.69.1.bb
> index 2a52e8233e..4012776613 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -53,6 +53,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>             file://CVE-2023-28320.patch \
>             file://CVE-2023-28320-fol1.patch \
>             file://CVE-2023-32001.patch \
> +           file://CVE-2023-38545.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188976): https://lists.openembedded.org/g/openembedde=
d-core/message/188976
> Mute This Topic: https://lists.openembedded.org/mt/101913143/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

