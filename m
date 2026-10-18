Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D067CCF2C4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:03:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22466.1792360976273378252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SN1ks4l+;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1186609f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792360974; x=1792965774; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0ip9heKpcn/AuHZWZbjFnM4ekz1+zqZxd5rBU4mbDQ=;
        b=SN1ks4l+VLvcpJrjCgUUTYGWPKI5+l/G7IkIh0XKbx+POY5OUeaVzJBUpECJXI5RmG
         +b+pG5QBDzdXQFueie3+xTYvRfDbuQSXQBa6G/6itu61pVdoSaAVLqQkHM26xJqRbAw7
         9HPKIWWP8Q1Ch+qut1c+RSiUTV+QLKxyXhJGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792360974; x=1792965774;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0ip9heKpcn/AuHZWZbjFnM4ekz1+zqZxd5rBU4mbDQ=;
        b=x24vSUZEZtVqkheSgTgw1UAaZnhEc0Rx6Tt0JnBgtkWms7pTdmZK1IuYvGuP3y7rO1
         SxSS5sUZ4VR6Z1YMSDAHIvFrD46ggVK2Ay0lXPcDR41/kP6LQp28IaKRAMNxJ5+RGRPT
         3UO7l0eS6MsQdbYAiXXjFaWqbDErUhNTY/iwDncxdc4aP39SXwBTjbnMP+i6UVf74U/0
         96gt9m7x+u4ykace+Dd0M3nnm1Q2xXb8YegepDyIB1s/aAuhOdISwpJvKzznyjuNtTwF
         xSGjGG/0u4nExnMYKN9ZtnE3XSblSRt0O92lNmGU4NWrmkaDWrd/a/nteC9PwrKd55NZ
         fG3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxg6skz3WhUMO/co8w2HS1fvffSgpkHbsYvODRw40WrbK3XlDpmc8aQEXg2IYVN5VZraYA4TkVNVDNbxd42bxO9zQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLZyC4sCzLiua4p+/zalBz1aWmyQdCmTW/tZxm9nfCAEMi3GVt8
	GJSkhCGe4+EUECrV+TQgEJKI+JmtFwFJlV3kIo9SF3mNqovoPtLM0XWmy8bH+lpIOKM=
X-Gm-Gg: AYBFou3h6u1dZOJ7nWhN0nk7VJmyqs5V52nXnm6l3QxUiXBZ5U7aTZOmFPau/Wq6zbR
	hxcE1YOR2irB9aNjVstESpYrDuFpzHZJZztdknSeyaAXcjChjmHMKUMFGPxgDTikah0nweqCj5r
	BQuoqrtaUiZKQRxcJ+2Jp/zWh6mWObE71a/5dBhQ9XEdHvXT6KGyZ/Bio7OO5TeRei8tp6GX+5q
	W+TnVNn6F05iSDCe7SChfPZLfRYdpDkhMDZZUycx9QEvzXaEAECTglbBfxUVvZtZmpvBTpnOWCh
	sx+TcCs0hlXZld/tcCKTTXxTEWS/v1hWB48tIhzUSg+1svTfYke9bivas+z1s+G9GgTUiKCV3Ly
	GgTDaspau00b2ByucvC2uz9Ey3d9Udx7NjxkOCbGdrp9GpQ1i7eMd/f8x9TClyc55YLG56+rYwO
	zRypMvFy3F/+An11XjvIGizoVqbMktAq0H0NqGFrJeX0hNLkdnbN0u/IGyrxEfUrmJ1Vnjdea/L
	2R+WjvWRQ/y/RYOnMTh0QsVCYCUyvsIrTc1sxqXv5OUWZGXSOcrHA0Y9vuyHRcYUzBpYaxF
X-Received: by 2002:a5d:5f47:0:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e0bf00821mr9212131f8f.13.1792360974161;
        Sun, 18 Oct 2026 15:02:54 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm18707027f8f.9.2026.10.18.15.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 15:02:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 00:02:55 +0200
Message-Id: <DM8AXT43G3ZB.BY4ZLM8UIUQP@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] curl: fix CVE-2026-80230
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016134019.52968-1-jaipaul.cheernam@est.tech>
 <2398061.1792329514407910312@lists.openembedded.org>
In-Reply-To: <2398061.1792329514407910312@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248109

On Sun Oct 18, 2026 at 3:18 PM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hi Yoann, Jaipaul,
>
> I=E2=80=99m preparing a six-patch curl CVE fix series for Wrynose. One of=
 the
> patches addresses CVE-2026-80230 using the same upstream fix and curl
> 8.19.0 adaptation as Jaipaul=E2=80=99s submission here. The other five pa=
tches
> address additional CVEs.
>
> Would you prefer that I submit the complete series with the overlap
> noted in the cover letter, or omit the CVE-2026-80230 patch and submit
> the remaining five based on Jaipaul=E2=80=99s change?

Hello,

Send it on top of Jaipaul's please. No need to resend the CVE-2026-80230
patch.

Thanks!

>
> Thanks,
> Darsh
>
> On Fri, Oct 16, 2026 at 07:10 PM, Jaipaul Cheernam wrote:
>
>>=20
>> Backport the upstream fix [1] as mentioned in [2]
>>=20
>> [1] https://github.com/curl/curl/commit/5267ed859d545534d0c21
>> [2] https://curl.se/docs/CVE-2026-80230.html
>>=20
>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> ---
>> Note: SRC_URI indentation is corrected by devtool
>>=20
>> .../curl/curl/CVE-2026-80230.patch | 68 +++++++++++++++++++
>> meta/recipes-support/curl/curl_8.19.0.bb | 62 ++++++++---------
>> 2 files changed, 99 insertions(+), 31 deletions(-)
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch
>>=20
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-80230.patch
>> b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
>> new file mode 100644
>> index 0000000000..5a6bb35986
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
>> @@ -0,0 +1,68 @@
>> +From 7d34e6397166b10600c2ced93f95641d5e7c1575 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Mon, 24 Aug 2026 23:37:49 +0200
>> +Subject: [PATCH] openssl: no server cert is only okay if also not pinne=
d
>> +
>> +Reported-by: Stanislav Fort
>> +Closes #22660
>> +
>> +CVE: CVE-2026-80230
>> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/5267ed8=
59d545534d0c21675a2b70af5a3b6e3ef
>> ]
>> +
>> +Note: CURL_EASY_STR() macro does not exist in 8.19.0, so the pinned()
>> +accesses data->set.str[] directly instead.
>> +
>> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> +---
>> + lib/vtls/openssl.c | 26 +++++++++++++++-----------
>> + 1 file changed, 15 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
>> +index 1cf357c..cb6fcc4 100644
>> +--- a/lib/vtls/openssl.c
>> ++++ b/lib/vtls/openssl.c
>> +@@ -4607,21 +4607,24 @@ out:
>> + return result;
>> + }
>> +
>> +-static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
>> +- struct Curl_easy *data,
>> +- X509 *server_cert)
>> ++static const char *pinned(struct Curl_cfilter *cf,
>> ++ struct Curl_easy *data)
>> + {
>> +- const char *ptr;
>> +- CURLcode result =3D CURLE_OK;
>> +-
>> + (void)cf;
>> ++ return
>> + #ifndef CURL_DISABLE_PROXY
>> +- ptr =3D Curl_ssl_cf_is_proxy(cf) ?
>> ++ Curl_ssl_cf_is_proxy(cf) ?
>> + data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
>> +- data->set.str[STRING_SSL_PINNEDPUBLICKEY];
>> +-#else
>> +- ptr =3D data->set.str[STRING_SSL_PINNEDPUBLICKEY];
>> + #endif
>> ++ data->set.str[STRING_SSL_PINNEDPUBLICKEY];
>> ++}
>> ++
>> ++static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
>> ++ struct Curl_easy *data,
>> ++ X509 *server_cert)
>> ++{
>> ++ CURLcode result =3D CURLE_OK;
>> ++ const char *ptr =3D pinned(cf, data);
>> + if(ptr) {
>> + result =3D ossl_pkp_pin_peer_pubkey(data, server_cert, ptr);
>> + if(result)
>> +@@ -4803,7 +4806,8 @@ CURLcode Curl_ossl_check_peer_cert(struct
>> Curl_cfilter *cf,
>> + server_cert =3D SSL_get1_peer_certificate(octx->ssl);
>> + if(!server_cert) {
>> + /* no verification at all, this maybe acceptable */
>> +- if(!(conn_config->verifypeer || conn_config->verifyhost))
>> ++ if(!(conn_config->verifypeer || conn_config->verifyhost) &&
>> ++ !pinned(cf, data))
>> + goto out;
>> +
>> + failf(data, "SSL: could not get peer certificate");
>> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb
>> b/meta/recipes-support/curl/curl_8.19.0.bb
>> index 0573e08ea4..c2697d6dd8 100644
>> --- a/meta/recipes-support/curl/curl_8.19.0.bb
>> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
>> @@ -9,37 +9,37 @@ SECTION =3D "console/network"
>> LICENSE =3D "curl"
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0515352b285b9c3f66464b135c9c0=
fdc"
>>=20
>> -SRC_URI =3D " \
>> - https://curl.se/download/ ${BP}.tar.xz \
>> - file://run-ptest \
>> - file://disable-tests \
>> - file://no-test-timeout.patch \
>> - file://CVE-2026-6276.patch \
>> - file://CVE-2026-5773.patch \
>> - file://mbedtls.patch \
>> - file://CVE-2026-5545.patch \
>> - file://CVE-2026-6253.patch \
>> - file://CVE-2026-6429-dependent.patch \
>> - file://CVE-2026-6429.patch \
>> - file://CVE-2026-7168.patch \
>> - file://CVE-2026-4873.patch \
>> - file://CVE-2026-8286.patch \
>> - file://CVE-2026-8927.patch \
>> - file://CVE-2026-8932-dependent.patch \
>> - file://CVE-2026-8932.patch \
>> - file://CVE-2026-11352.patch \
>> - file://CVE-2026-11586.patch \
>> - file://CVE-2026-7009.patch \
>> - file://CVE-2026-8925.patch \
>> - file://CVE-2026-9080.patch \
>> - file://CVE-2026-9545-01.patch \
>> - file://CVE-2026-9545-02.patch \
>> - file://CVE-2026-9079.patch \
>> - file://CVE-2026-13608.patch \
>> - file://CVE-2026-80229.patch \
>> - file://CVE-2026-9546-01.patch \
>> - file://CVE-2026-9546-02.patch \
>> -"
>> +SRC_URI =3D " https://curl.se/download/ ${BP}.tar.xz \
>> + file://run-ptest \
>> + file://disable-tests \
>> + file://no-test-timeout.patch \
>> + file://CVE-2026-6276.patch \
>> + file://CVE-2026-5773.patch \
>> + file://mbedtls.patch \
>> + file://CVE-2026-5545.patch \
>> + file://CVE-2026-6253.patch \
>> + file://CVE-2026-6429-dependent.patch \
>> + file://CVE-2026-6429.patch \
>> + file://CVE-2026-7168.patch \
>> + file://CVE-2026-4873.patch \
>> + file://CVE-2026-8286.patch \
>> + file://CVE-2026-8927.patch \
>> + file://CVE-2026-8932-dependent.patch \
>> + file://CVE-2026-8932.patch \
>> + file://CVE-2026-11352.patch \
>> + file://CVE-2026-11586.patch \
>> + file://CVE-2026-7009.patch \
>> + file://CVE-2026-8925.patch \
>> + file://CVE-2026-9080.patch \
>> + file://CVE-2026-9545-01.patch \
>> + file://CVE-2026-9545-02.patch \
>> + file://CVE-2026-9079.patch \
>> + file://CVE-2026-13608.patch \
>> + file://CVE-2026-80229.patch \
>> + file://CVE-2026-9546-01.patch \
>> + file://CVE-2026-9546-02.patch \
>> + file://CVE-2026-80230.patch \
>> + "
>>=20
>> SRC_URI:append:class-nativesdk =3D " \
>> file://environment.d-curl.sh \


--=20
Yoann Congal
Smile ECS


