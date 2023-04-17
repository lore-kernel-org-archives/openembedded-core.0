Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C2BC77B7A
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 16:42:31 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.767.1681749742238322906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 09:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1oomhmZ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bbdbso75727a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681749740; x=1684341740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBvNh/QZc+fpQPqLXKyugnxXE4dEIjpvXDv8tng0VVs=;
        b=1oomhmZ8ITQ5gtI/xCnmtCr0FdtBz3px1ifiSaI7OBAPM7YrfEuQy9vrIkhIQdfwLH
         1jPTsUVeOtDBU+YaC8Tr7syOIuA+7m9ao7n+GTwZVAnHynco4xx1x7zEPFIz4H6G3n0o
         c6yD5gAHfjCIEGCITm6eweVFac/2bZ//88mfW5sdX1Mz6MoUbYDi/1plqrY+Pxvulk+B
         g6A0E4iGUTACy4hsVOuKLhkybXovlPBKha/nnkFq0HK5Az2V1bEMExZgYF9dZ0BUcz+K
         1J0bZh94/6WMr2aMSFa5XHdS7kICENRWg6qMRZ9vFS3UTapjY5/+trWWoC5cOTavSZHO
         vMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681749740; x=1684341740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBvNh/QZc+fpQPqLXKyugnxXE4dEIjpvXDv8tng0VVs=;
        b=GyIEstc6itxJfI3v9/ZZfET/+8DidHjufm13JH3l4BIIHXYDD+pNeFs01X3dfQEcJA
         XGj6hQYFdkPne3NB6FdzDKd+v9gG33YnaEiAl/ZZWL7saYr+IZuuMqDjeUHSpOkAqcwh
         fA6yCrBcJQgxAwRAXLoBkM8exsCidHKz+kigkxwllqINa3Osgg3HWk2GTl6siYUUM7An
         WwFGyvLhfznuAsgco1AaWdSoL8C6DpiETURkRVBnqNH2tAmSCnJNYwoDDdtbniV3KZzZ
         XtcQsgGnfl/gRzbiznBKO+2oHBuFYgbEltRslAH4i8SEvpQhoaC6JH8M6Nsc9n6bT9cW
         iLWA==
X-Gm-Message-State: AAQBX9coIVWc3Nr0gY316Cz3Rq17aERO66+en7gtetqQmU2pEfjQIdaZ
	C5WKS/3OyOvug0lZvoeLGGxra6sZySMoe9iLZzXSYXob/2LsFR6Hqnk=
X-Google-Smtp-Source: AKy350Zj0lYgyFxD9gJEwuLiPpEm5m9XpdkBZHU3JZuEEQs69rWRJ8HmpOvQ1rV9S/wdcqpKBezoMAVom0MKZI9i18Y=
X-Received: by 2002:a50:d0c5:0:b0:504:ca21:cc64 with SMTP id
 g5-20020a50d0c5000000b00504ca21cc64mr7366720edf.2.1681749740540; Mon, 17 Apr
 2023 09:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230417062207.3870781-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230417062207.3870781-1-mingli.yu@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Apr 2023 06:42:09 -1000
Message-ID: <CAOSpxdbuzJiBAiSw4P3+YJc6rUqg1zvU_vsVds9zWq3L5V=EzQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] curl: Fix CVE-2023-27536
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 16:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180164

There is also a patch submitted today that fixes this CVE as well as
two others: https://lists.openembedded.org/g/openembedded-core/message/1801=
43

Could you review the above patch and ack if you approve.  It would be
nice to fix all three patches in a single commit if possible.

Thanks!

Steve

On Sun, Apr 16, 2023 at 8:22=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Backport patch [1] to fix CVE-2023-27536.
>
> [1] https://github.com/curl/curl/commit/cb49e67303dba
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../curl/curl/CVE-2023-27536.patch            | 57 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/r=
ecipes-support/curl/curl/CVE-2023-27536.patch
> new file mode 100644
> index 0000000000..842c70785a
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
> @@ -0,0 +1,57 @@
> +From 6b1ef6d5ebbfd5e68dea1eea2dc0c6cc4dc2e394 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 17 Apr 2023 05:36:18 +0000
> +Subject: [PATCH] url: only reuse connections with same GSS delegation
> +
> +Reported-by: Harry Sintonen
> +Closes #10731
> +
> +CVE: CVE-2023-27536
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/cb49e6730=
3dba]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + lib/url.c     | 6 ++++++
> + lib/urldata.h | 1 +
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index df4377d..8c43c3b 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1350,6 +1350,11 @@ ConnectionExists(struct Curl_easy *data,
> +         }
> +       }
> +
> ++      /* GSS delegation differences do not actually affect every connec=
tion
> ++         and auth method, but this check takes precaution before effici=
ency */
> ++      if(needle->gssapi_delegation !=3D check->gssapi_delegation)
> ++        continue;
> ++
> +       /* If multiplexing isn't enabled on the h2 connection and h1 is
> +          explicitly requested, handle it: */
> +       if((needle->handler->protocol & PROTO_FAMILY_HTTP) &&
> +@@ -1807,6 +1812,7 @@ static struct connectdata *allocate_conn(struct Cu=
rl_easy *data)
> +   conn->fclosesocket =3D data->set.fclosesocket;
> +   conn->closesocket_client =3D data->set.closesocket_client;
> +   conn->lastused =3D Curl_now(); /* used now */
> ++  conn->gssapi_delegation =3D data->set.gssapi_delegation;
> +
> +   return conn;
> +   error:
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index 69eb2ee..c2a7e6c 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1131,6 +1131,7 @@ struct connectdata {
> +   int socks5_gssapi_enctype;
> + #endif
> +   unsigned short localport;
> ++  unsigned char gssapi_delegation; /* inherited from set.gssapi_delegat=
ion */
> + };
> +
> + /* The end of connectdata. */
> +--
> +2.23.0
> +
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index 945745cdde..888527857a 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2023-23914_5-4.patch \
>             file://CVE-2023-23914_5-5.patch \
>             file://CVE-2023-23916.patch \
> +           file://CVE-2023-27536.patch \
>             "
>  SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180120): https://lists.openembedded.org/g/openembedde=
d-core/message/180120
> Mute This Topic: https://lists.openembedded.org/mt/98313621/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

