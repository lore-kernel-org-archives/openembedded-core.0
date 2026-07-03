Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963D3C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 09:38:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88738.1783071519057019380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 02:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YRaT9CDf;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso377330f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783071517; x=1783676317; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu39cIKdQZRipZWFo6Pi58xdnyCzip2RrN3UikiFN/w=;
        b=YRaT9CDflBJuqQM+hD+t8y1zgooZqzJ2gowL/NY7hbM4637gAv3Kxv3aonROrqUZpq
         5cy4wPaFAcdT25oQFIp01ZRHkRzgjM2+whCPuUt+OXF3tVlz2jeJ5SUODWLFy2kGLqlE
         mzzqhsFLiYIMzPyTPZBJ1jXuraiLDXnU2ugqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071517; x=1783676317;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iu39cIKdQZRipZWFo6Pi58xdnyCzip2RrN3UikiFN/w=;
        b=XHAnQfp82tI6bbdFut34FqL5c6CQgXYV03TpKXsConnMiQBecqcGe95cASn7qxquHO
         ekfDoQpAnamTJ7+Fi0rGvnkjsNde8W0dd3msQvtgE0WiRy11UvEG6Rm5jj6O7rfqg6A8
         G1NuOB8MwTsOGxL8sI/62QAry4DnOg8P1RtoVLLyDCZF+2xIuZD8OFoGLjXMgpPDjEvR
         d3pAlDg/9l7QUTruntKGt6cePQk4VGleWp0yROl4sq+dL54btOSGABfuKeeWuWdsDdCn
         u3J2q72g4mixfaXjAzqsUrZrsakZTj91oXpBs0WMHPrWKxGnY5xYFEbuoRWyu/lB0Bhx
         C6dQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXpZbsgNQT/lZVR2/MLEQCi81gzz8cEeLLFQU4ooGryugt8Q9wPtAcMOTyV4jS/IKUtm0jKZ8UDp1u/fy8/GTOAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMNwEBxDs+P5S8f0Rwjafa41eNm7Whmt9EE/td2W31R8wdcg5/
	o9KW/dr9ptAPHNehopql2QoVibKdY56Ud+j0rY+1oi1q7+jzis0AsuMjBNC3cb+2bp0=
X-Gm-Gg: AfdE7cnqApT27SbJspsS66mBGcSQYYhdTawAsjswHbVOmHmdS6iG/AlONJ8fJxRZ3SS
	xUQxL3v7DbwFu5vGGNZPYoXBvqtnPW3rgME9CZBZ6P827nYTGHvcdg4afsAIS4yTuZ1EsPp0lJ4
	OMCSQ6r1bwj+Du2HGr2AwQhSjkXN1ePAs9PT5N14ItU9ol2j7biMNTZ18RWefxf+3vHVee9ijiF
	wjSWrMMVcaOilr7ESnsW08C0Bn/oIQmof4dWYMwwGmafdbFCjQ8vvcSqr3VYegD+qjkYecI3Fw8
	LUDJKYNK7P7x1uVZvUY+1ycyGqTlxQ3ih008iKWmu5SUEL6aZcQMrH43OBnjTuQtnAfosvZyUIT
	9DHelTMKW0zzOiq/WAeftqRV8d5jhDQGqMb2Z1rso/XxbHJPmbkHoATh/r7OEh9NrQS1663ZKyw
	q4quKuYtVyMkYi5vm8ZfDMImqcDKOc4GzoDvPh6sdY1oj4W1eLvLCTgsMhtXCcas3N7njVTkvKd
	IuqdA==
X-Received: by 2002:a05:6000:2406:b0:45e:f684:7347 with SMTP id ffacd0b85a97d-47757e577f6mr15851813f8f.12.1783071517127;
        Fri, 03 Jul 2026 02:38:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dba3csm15884862f8f.3.2026.07.03.02.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:38:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 11:38:36 +0200
Message-Id: <DJOU3MGL8GSH.27D0R685LL2P1@smile.fr>
Subject: Re: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629131453.1077612-1-adongare@cisco.com>
 <20260629131453.1077612-5-adongare@cisco.com>
In-Reply-To: <20260629131453.1077612-5-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 09:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240101

On Mon Jun 29, 2026 at 3:14 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Backport the upstream fix [1] for the netrc credential leak on redirect
> described in [2] and tracked by [3].
>
> [1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f19=
9ace306
> [2] https://curl.se/docs/CVE-2026-6429.html
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-6429
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../curl/curl/CVE-2026-6429.patch             | 362 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 363 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-6429.patch
> new file mode 100644
> index 0000000000..f4398e00f6
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
> @@ -0,0 +1,362 @@
> +From b4024bf808bd558026fdc6096e8457f199ace306 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 16 Apr 2026 14:26:20 +0200
> +Subject: [PATCH] http: clear credentials better on redirect
> +
> +Verify with test 2506: netrc with redirect using proxy
> +
> +Updated test 998 which was wrong.
> +
> +Reported-by: Muhamad Arga Reksapati
> +
> +Closes #21345
> +
> +CVE: CVE-2026-6429
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf80=
8bd558026fdc6096e8457f199ace306]
> +
> +Backport Changes:
> +- curl 8.19.0 does not have Curl_url_same_origin(), so the same-origin c=
omparison is kept inline in Curl_http_follow().
> +- Adapted tests/data/Makefile.am and tests/libtest/Makefile.inc placemen=
t for the wrynose test lists.
> +
> +(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + lib/http.c                 | 121 +++++++++++++++++++------------------
> + tests/data/Makefile.am     |   2 +-
> + tests/data/test2506        |  64 ++++++++++++++++++++
> + tests/data/test998         |   1 -
> + tests/libtest/Makefile.inc |   2 +-
> + tests/libtest/lib2506.c    |  71 ++++++++++++++++++++++
> + 6 files changed, 198 insertions(+), 63 deletions(-)
> + create mode 100644 tests/data/test2506
> + create mode 100644 tests/libtest/lib2506.c
> +
> +diff --git a/lib/http.c b/lib/http.c
> +index b960d79..9ac96ad 100644
> +--- a/lib/http.c
> ++++ b/lib/http.c
> +@@ -1201,75 +1201,76 @@ CURLcode Curl_http_follow(struct Curl_easy *data=
, const char *newurl,
> +       return CURLE_OUT_OF_MEMORY;
> +   }
> +   else {
> +-    uc =3D curl_url_get(data->state.uh, CURLUPART_URL, &follow_url, 0);
> +-    if(uc)
> +-      return Curl_uc_to_curlcode(uc);
> +-
> +-    /* Clear auth if this redirects to a different port number or proto=
col,
> +-       unless permitted */
> +-    if(!data->set.allow_auth_to_other_hosts && (type !=3D FOLLOW_FAKE))=
 {
> +-      int port;
> +-      bool clear =3D FALSE;
> ++    bool same_origin;
> ++    CURLcode result;
> ++    CURLU *u =3D curl_url();
> ++    char *oldscheme =3D NULL;
> ++    char *oldhost =3D NULL;
> ++    char *oldport =3D NULL;
> ++    char *newscheme =3D NULL;
> ++    char *newhost =3D NULL;
> ++    char *newport =3D NULL;
> ++    if(!u)
> ++      return CURLE_OUT_OF_MEMORY;
> +=20
> +-      if(data->set.use_port && data->state.allow_port)
> +-        /* a custom port is used */
> +-        port =3D (int)data->set.use_port;
> +-      else {
> +-        curl_off_t value;
> +-        char *portnum;
> +-        const char *p;
> +-        uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
> +-                          CURLU_DEFAULT_PORT);
> +-        if(uc) {
> +-          curlx_free(follow_url);
> +-          return Curl_uc_to_curlcode(uc);
> +-        }
> +-        p =3D portnum;
> +-        curlx_str_number(&p, &value, 0xffff);
> +-        port =3D (int)value;
> +-        curlx_free(portnum);
> +-      }
> +-      if(port !=3D data->info.conn_remote_port) {
> +-        infof(data, "Clear auth, redirects to port from %u to %u",
> +-              data->info.conn_remote_port, port);
> +-        clear =3D TRUE;
> +-      }
> +-      else {
> +-        char *scheme;
> +-        const struct Curl_scheme *p;
> +-        uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, =
0);
> +-        if(uc) {
> +-          curlx_free(follow_url);
> +-          return Curl_uc_to_curlcode(uc);
> +-        }
> ++    uc =3D curl_url_set(u, CURLUPART_URL, Curl_bufref_ptr(&data->state.=
url),
> ++                      CURLU_URLENCODE | CURLU_ALLOW_SPACE);
> ++    if(!uc)
> ++      uc =3D curl_url_get(data->state.uh, CURLUPART_URL, &follow_url, 0=
);
> ++    if(!uc)
> ++      uc =3D curl_url_get(u, CURLUPART_SCHEME, &oldscheme, 0);
> ++    if(!uc)
> ++      uc =3D curl_url_get(u, CURLUPART_HOST, &oldhost, 0);
> ++    if(!uc)
> ++      uc =3D curl_url_get(u, CURLUPART_PORT, &oldport, CURLU_DEFAULT_PO=
RT);
> ++    if(!uc)
> ++      uc =3D curl_url_get(data->state.uh, CURLUPART_SCHEME, &newscheme,=
 0);
> ++    if(!uc)
> ++      uc =3D curl_url_get(data->state.uh, CURLUPART_HOST, &newhost, 0);
> ++    if(!uc)
> ++      uc =3D curl_url_get(data->state.uh, CURLUPART_PORT, &newport,
> ++                        CURLU_DEFAULT_PORT);
> ++    if(uc) {
> ++      curl_url_cleanup(u);
> ++      curlx_free(oldscheme);
> ++      curlx_free(oldhost);
> ++      curlx_free(oldport);
> ++      curlx_free(newscheme);
> ++      curlx_free(newhost);
> ++      curlx_free(newport);
> ++      curlx_free(follow_url);
> ++      return Curl_uc_to_curlcode(uc);
> ++    }
> +=20
> +-        p =3D Curl_get_scheme(scheme);
> +-        if(p && (p->protocol !=3D data->info.conn_protocol)) {
> +-          infof(data, "Clear auth, redirects scheme from %s to %s",
> +-                data->info.conn_scheme, scheme);
> +-          clear =3D TRUE;
> +-        }
> +-        curlx_free(scheme);
> +-      }
> +-      if(clear) {
> +-        CURLcode result =3D Curl_reset_userpwd(data);
> +-        if(result) {
> +-          curlx_free(follow_url);
> +-          return result;
> +-        }
> +-        Curl_safefree(data->state.aptr.user);
> +-        Curl_safefree(data->state.aptr.passwd);
> ++    same_origin =3D strcasecompare(oldscheme, newscheme) &&
> ++                  strcasecompare(oldhost, newhost) &&
> ++                  !strcmp(oldport, newport);

That code (which is not in the upstream patch) failed to build on my
machine:
$ bitbake curl-native
| ../../sources/curl-8.19.0/lib/http.c:1245:19: error: implicit declaration=
 of function =E2=80=98strcasecompare=E2=80=99; did you mean =E2=80=98strcas=
ecmp_l=E2=80=99? [-Wimplicit-function-declaration]
|  1245 |     same_origin =3D strcasecompare(oldscheme, newscheme) &&
|       |                   ^~~~~~~~~~~~~~
|       |                   strcasecmp_l

Can you check please?

Thanks!
--=20
Yoann Congal
Smile ECS


