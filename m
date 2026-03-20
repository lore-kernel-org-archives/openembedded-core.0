Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441C0109878A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 14:29:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14125.1774016990324334550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 07:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DIPRukP7;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso1364102f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774016989; x=1774621789; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SecBAF4PU2hz6PzX2vWsfTh5oezC80WzaklIxsrvhG0=;
        b=DIPRukP7V4XBVNe80aKH3HrJpAPF8I7j5S7Nu47fWIhlT6I2H4wAWNqNej2RfiIQYq
         Kh0FuZANpczKCLLNNAmITVEdc8QvfvdSpnJoejCCM5xe/Df7dRfKwwaPWmRzfs4pNiRI
         exmkNqkO7QohoBFYlgZytC9LVVQLcAGuUmr9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016989; x=1774621789;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SecBAF4PU2hz6PzX2vWsfTh5oezC80WzaklIxsrvhG0=;
        b=fTaLP+kUNm5lRPFZAi3mDYb7G+pMONoUpVlX4NNRU45Wa95SakuwYiL6vY3Dfd42nS
         x+1FjSLBmCnjZeFdNIY/UGXdZwr5441fLqHDzYrRw/qDZHU54WIUzWhhERkuyB6tNTF8
         w3FRM6a7DE49OLPLGrWXKxaXh1Sl8GSZYz+JsvsuG+bohor+drlg3Gfop8T1jLOtSBAN
         ppNWOXVhNV46HigbGOGHUyVrjYC52CXylV7r4z/+SvFO8Mmd5BOHfSyRi9QXlNLqI1kK
         IeJofab1kz/joQafhlQi3mQZMRc+Idtu/3SGs2vfAG14gjtHUTa0wcDsV7tjFWhbPR5v
         L5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWlEcl41PG/HBdXLACM8NJYcpT+1/K6OjSO0vr9OxYypgtUmfe1eK5AfkGaqdbESz3HH5R7XdzebqkcOZO/JNsbbg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2gGXQtQvr8upvvou17QLoXLoTTZxSxoH2CBdnbn7fJJTp8awF
	+wNCyy5SjQBGrPjFwuZtnahnSsx0Ymr6hu4U/ADzuNRKqBbd+x0b67jjIwleBEQwH4o=
X-Gm-Gg: ATEYQzzKauM8XcNWhZNAo0bhBgYGl6lCPTMBbcH8o7L2kJV+pEH/1Q4vTkfVPUeXu0Y
	BgY3KIW/Ou1oWNjMlyzTRXQ7IYS2B0e7oNY5OD3/cXmikV+U/Jw5pCKGljkmUN1btGBN102pliy
	h+K7LEzgBJPo5v02XfLX83IwVYLTMwtD+etpINhpFhFOOEfo2ksoJwOBLpCcSnobeu+vLi0VJt5
	s1LR96CK1cZhkB77MRXjtc2ocWOH8/bKVP1Q7TiQ3pQnNvhKAiSXo/liUqYAz46cWQ+XYmKDAq8
	6OEhH3ZYf8um/6XZHvTh2zzvyRfC0902jN6fFrHLKf5JPtcoYxxqczCmoWyd2TlNeJlPWe+dn3J
	Fald+RijCFx8KpYg0Vh4P9ZoraPd6i6cQZcxD45JB+sKwv7EdVmKFLf2VbrGkpSgUN466D5KukU
	mc0VxOnhKONhupHWQTGVRa45lX4ee2nEvlH///EVvIIqQ6MeTJT7JAWmYNIkZiaza3+XO7KPHQI
	1pQor5AXjIZXHM=
X-Received: by 2002:a05:6000:290b:b0:43b:50d6:4f14 with SMTP id ffacd0b85a97d-43b6423db4emr5950536f8f.6.1774016988415;
        Fri, 20 Mar 2026 07:29:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470380asm6360244f8f.24.2026.03.20.07.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 07:29:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 15:29:47 +0100
Message-Id: <DH7OJD1OK560.20DYBG2U7KWUE@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH 4/4] curl: Fix CVE-2026-3784
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260320075604.551251-1-vanusuri@mvista.com>
 <20260320075604.551251-4-vanusuri@mvista.com>
In-Reply-To: <20260320075604.551251-4-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233612

On Fri Mar 20, 2026 at 8:56 AM CET, Vijay Anusuri via lists.openembedded.or=
g wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> import patch from ubuntu to fix
>  CVE-2026-3784
>
> Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.deb=
ian.tar.xz
> Upstream commit https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f=
3]
>
> Reference: https://curl.se/docs/CVE-2026-3784.html
>            https://ubuntu.com/security/CVE-2026-3784
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../curl/curl/CVE-2026-3784.patch             | 74 +++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-3784.patch
> new file mode 100644
> index 0000000000..8f3d56bab9
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
> @@ -0,0 +1,74 @@
> +Backport of:
> +
> +From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Fri, 6 Mar 2026 14:54:09 +0100
> +Subject: [PATCH] proxy-auth: additional tests
> +
> +Also eliminate the special handling for socks proxy match.
> +
> +Closes #20837
> +
> +Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.de=
bian.tar.xz
> +Upstream commit https://github.com/curl/curl/commit/5f13a7645e565c5c1a06=
f3]
> +CVE: CVE-2026-3784
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c                        | 28 +++++++---------------------
> + tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
> + tests/http/testenv/curl.py       | 18 +++++++++++++++---
> + 3 files changed, 42 insertions(+), 24 deletions(-)
> +
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in
> + {
> +   if((data->proxytype =3D=3D needle->proxytype) &&
> +      (data->port =3D=3D needle->port) &&
> +-     Curl_safe_strcasecompare(data->host.name, needle->host.name))
> +-    return TRUE;
> ++     curl_strequal(data->host.name, needle->host.name)) {
> +=20
> ++    if(Curl_timestrcmp(data->user, needle->user) ||
> ++       Curl_timestrcmp(data->passwd, needle->passwd))
> ++      return FALSE;
> ++    return TRUE;
> ++  }
> +   return FALSE;
> + }
> +-
> +-static bool
> +-socks_proxy_info_matches(const struct proxy_info *data,
> +-                         const struct proxy_info *needle)
> +-{
> +-  if(!proxy_info_matches(data, needle))
> +-    return FALSE;
> +-
> +-  /* the user information is case-sensitive
> +-     or at least it is not defined as case-insensitive
> +-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
> +-
> +-  /* curl_strequal does a case insentive comparison, so do not use it h=
ere! */
> +-  if(Curl_timestrcmp(data->user, needle->user) ||
> +-     Curl_timestrcmp(data->passwd, needle->passwd))
> +-    return FALSE;
> +-  return TRUE;
> +-}
> +-#else
> +-/* disabled, won't get called */
> +-#define proxy_info_matches(x,y) FALSE
> +-#define socks_proxy_info_matches(x,y) FALSE
> + #endif
> +=20
> + /* A connection has to have been idle for a shorter time than 'maxage_c=
onn'
> +@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,
> +         continue;
> +=20
> +       if(needle->bits.socksproxy &&
> +-        !socks_proxy_info_matches(&needle->socks_proxy,
> +-                                  &check->socks_proxy))
> ++        !proxy_info_matches(&needle->socks_proxy,
> ++                            &check->socks_proxy))
> +         continue;
> + #endif
> +       if(needle->bits.conn_to_host !=3D check->bits.conn_to_host)
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index 8fdd954c7e..c33183e096 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -74,6 +74,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2026-1965-1.patch \
>             file://CVE-2026-1965-2.patch \
>             file://CVE-2026-3783.patch \
> +           file://CVE-2026-3784.patch \
>             "
>  SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
> =20
Hi Vijay,

This my general feedback on the whole curl patch series.

I noticed quite big differences between the upstream commits you cited and =
the=20
ones actually provided in this series. If these backports are from Ubuntu=
=20
or Debian, please include the direct links to those commits as well.

Additionally, your backport for CVE-2025-14524 ([PATCH 1/4]) differs=20
from the one by Amaury Couderc, which has already been merged into scarthga=
p.=20
Maybe it would be simplier to cherry-picked it ?

One last detail regarding formatting: the last four patches include=20
a 'Backport of' prefix in the patch header. While not strictly forbidden,=
=20
this is unusual and adds unnecessary noise.=20
Could you please remove these headers next time?=20

Thanks.

Regards,
--=20
Fabien Thomas
Smile ECS


