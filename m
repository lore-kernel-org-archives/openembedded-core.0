Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B53CF3D5E1
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:56:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75377.1775545003294655450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J0XYD9oV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso45885585e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775545002; x=1776149802; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRoGLKgnvNNgPtA67yhxIJKzDVj49tHblmNB15eRGSI=;
        b=J0XYD9oValZTJwspWX5h1LG8U/bTp9ta5nCfAfxfQCfBDAEvSPH68mDM08U2ENmxaj
         1SAu9mPPAUkkYyzEvNruLn8hre40M+xZt3TKFwSudtw7yhjsX7+JW7itLLKPknV+/tD1
         60cNNeMDykgi9+tEdYTacqgdHgjjeZuEcAnwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545002; x=1776149802;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nRoGLKgnvNNgPtA67yhxIJKzDVj49tHblmNB15eRGSI=;
        b=qLzEU52sn+0hSp0wHI7ZcQVJCf0iAcI+6H/jpxwdKYEr43x+8I7XvJJCuA4ZeB9CxI
         ULI1aXdQaeRn+QcfbTir9GB4ULae66iAHQ1VmPJ1kyTddz3QFJy6x3WdxT6fQJYgdfmO
         JoPKxHkqGhF5W5oKMlHF0LzRyKK17IWJT7k9s6HEkNFhKRcELA9v/T+HMRWTKwcocwVU
         Z4oz6eBnVKhM0R/IbuWVnUnlQXsaWAt2eI5jyr/nwjJS+MBhMuuJVJvWKfNBxcZ0KfpK
         TkxsLlyOXluF4h3F+b7FzQumdWVTU7ygEnC2xYl/eweJZ8S+p5Hngp+X6GiKZdAdvVOZ
         mb1w==
X-Forwarded-Encrypted: i=1; AJvYcCXRbZrhPTLkOvZwbUEdCf4yU4CbFw9hHQOYS/+a5txX8Pu2F6AWjRgBtvTnVU+kizrkYfWNFPmsQDiCpP/jIkhywA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYn1KBzyPRED0rGS2vGRi9yV0EU/5f0X0v2/S+QuCzMN3f4zcM
	PVKZ5ahYKLyF/8iJtN3aB8BcimIWYCabQRZuAC3JoZTGcxow+w6LGduYIaZaW5tIW4c7UATEREM
	J2GaN1ZY=
X-Gm-Gg: AeBDiesdxQ79fByZUdWNneeFuOk+bfxonTOpovYl0g9nzQMy5OFn1nhPnlKNpEHm8C5
	TJ3dS5htHkOwsC+rpFAvkebmDEbuma2v0jYoOocdrM8eFNgDnCskUu8aJxXjyX1uQuDmFeP1nX7
	hBkeDRVHbc0GZyAAXJhEGCJj8TckmqGgXEit1cxAmLFv5mzpy/JCGTjBosgIAdzFsmFBXpthzD7
	I3wfE3GUE6lLkGwmlk9ZsUWJNei7M8sWg8w5lN8KhmstO4S+LPzHvwnFaSKoyZ0+/kYaDuzp2BG
	EPBTCyU4w675XhMRQVU4khoDiT4GJxd/gB1XODZlAZgZOx6rL5O0tsKNrmpfzCHllj8ElWjA3kC
	0kxFH5wEPlUJ20IQUoHWM9CnPdqefae98vpR3ka+K8IsjoZpjISvYWhLbp8L09lv4T990RdySB+
	Dza2roLHuLt6FWBONRYMP6qHM5/+eXs25JjlEmxmE9dNEudkdtzaQwkRZ4OkElUXy/+g7EHpyZO
	bDHiE3AR9ggKIc=
X-Received: by 2002:a05:600c:8216:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488ac0175camr103588355e9.5.1775545001449;
        Mon, 06 Apr 2026 23:56:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm257469315e9.10.2026.04.06.23.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:56:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 08:56:40 +0200
Message-Id: <DHMQ68TM9P25.3HID9IYO5SE14@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][patch 1/3] curl: patch CVE-2026-1965
X-Mailer: aerc 0.20.0
References: <20260406132129.440817-1-vanusuri@mvista.com>
In-Reply-To: <20260406132129.440817-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234702

On Mon Apr 6, 2026 at 3:21 PM CEST, Vijay Anusuri via lists.openembedded.or=
g wrote:
> pick patches from ubuntu per [1]
>
> [1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu1=
0.8.debian.tar.xz
> [2] https://ubuntu.com/security/CVE-2026-1965
> [3] https://curl.se/docs/CVE-2026-1965.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---

Hello,

This series passed ptest on AB:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3454
I will finish review later but this is good enough for me to un block the
equivalent patches in kirkstone.

Thanks!

>  .../curl/curl/CVE-2026-1965-1.patch           | 102 ++++++++++++++++++
>  .../curl/curl/CVE-2026-1965-2.patch           |  34 ++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
>  3 files changed, 138 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/=
recipes-support/curl/curl/CVE-2026-1965-1.patch
> new file mode 100644
> index 0000000000..acc8bfe044
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
> @@ -0,0 +1,102 @@
> +From 34fa034d9a390c4bd65e2d05262755ec8646ac12 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 5 Feb 2026 08:34:21 +0100
> +Subject: [PATCH] url: fix reuse of connections using HTTP Negotiate
> +
> +Assume Negotiate means connection-based
> +
> +Reported-by: Zhicheng Chen
> +Closes #20534
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/34fa034d9=
a390c4bd6]
> +Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/c=
url/curl_8.5.0-2ubuntu10.8.debian.tar.xz
> +
> +CVE: CVE-2026-1965
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 62 insertions(+)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index 1439c9e..792c422 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -936,6 +936,18 @@ ConnectionExists(struct Curl_easy *data,
> + #else
> +   bool wantProxyNTLMhttp =3D FALSE;
> + #endif
> ++#endif
> ++
> ++#if !defined(CURL_DISABLE_HTTP) && defined(USE_SPNEGO)
> ++  bool wantNegohttp =3D
> ++    (data->state.authhost.want & CURLAUTH_NEGOTIATE) &&
> ++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
> ++#ifndef CURL_DISABLE_PROXY
> ++  bool wantProxyNegohttp =3D
> ++    needle->bits.proxy_user_passwd &&
> ++    (data->state.authproxy.want & CURLAUTH_NEGOTIATE) &&
> ++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
> ++#endif
> + #endif
> +   /* plain HTTP with upgrade */
> +   bool h2upgrade =3D (data->state.httpwant =3D=3D CURL_HTTP_VERSION_2_0=
) &&
> +@@ -1274,6 +1286,56 @@ ConnectionExists(struct Curl_easy *data,
> +     }
> + #endif
> +=20
> ++#ifdef USE_SPNEGO
> ++  /* If we are looking for an HTTP+Negotiate connection, check if this =
is
> ++     already authenticating with the right credentials. If not, keep lo=
oking
> ++     so that we can reuse Negotiate connections if possible. */
> ++  if(wantNegohttp) {
> ++    if(Curl_timestrcmp(needle->user, check->user) ||
> ++       Curl_timestrcmp(needle->passwd, check->passwd))
> ++      continue;
> ++  }
> ++  else if(check->http_negotiate_state !=3D GSS_AUTHNONE) {
> ++    /* Connection is using Negotiate auth but we do not want Negotiate =
*/
> ++    continue;
> ++  }
> ++
> ++#ifndef CURL_DISABLE_PROXY
> ++  /* Same for Proxy Negotiate authentication */
> ++  if(wantProxyNegohttp) {
> ++    /* Both check->http_proxy.user and check->http_proxy.passwd can be
> ++     * NULL */
> ++    if(!check->http_proxy.user || !check->http_proxy.passwd)
> ++      continue;
> ++
> ++    if(Curl_timestrcmp(needle->http_proxy.user,
> ++		       check->http_proxy.user) ||
> ++       Curl_timestrcmp(needle->http_proxy.passwd,
> ++	               check->http_proxy.passwd))
> ++      continue;
> ++  }
> ++  else if(check->proxy_negotiate_state !=3D GSS_AUTHNONE) {
> ++    /* Proxy connection is using Negotiate auth but we do not want Nego=
tiate */
> ++    continue;
> ++  }
> ++#endif
> ++  if(wantNTLMhttp || wantProxyNTLMhttp) {
> ++    /* Credentials are already checked, we may use this connection. We =
MUST
> ++     * use a connection where it has already been fully negotiated. If =
it has
> ++     * not, we keep on looking for a better one. */
> ++    chosen =3D check;
> ++    if((wantNegohttp &&
> ++	(check->http_negotiate_state !=3D GSS_AUTHNONE)) ||
> ++       (wantProxyNegohttp &&
> ++	(check->proxy_negotiate_state !=3D GSS_AUTHNONE))) {
> ++      /* We must use this connection, no other */
> ++      *force_reuse =3D TRUE;
> ++      break;
> ++    }
> ++    continue; /* get another */
> ++  }
> ++#endif
> ++
> +     if(CONN_INUSE(check)) {
> +       DEBUGASSERT(canmultiplex);
> +       DEBUGASSERT(check->bits.multiplex);
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch b/meta/=
recipes-support/curl/curl/CVE-2026-1965-2.patch
> new file mode 100644
> index 0000000000..07dbf4e973
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
> @@ -0,0 +1,34 @@
> +From f1a39f221d57354990e3eeeddc3404aede2aff70 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sat, 21 Feb 2026 18:11:41 +0100
> +Subject: [PATCH] url: fix copy and paste url_match_auth_nego mistake
> +
> +Follow-up to 34fa034
> +Reported-by: dahmono on github
> +Closes #20662
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/f1a39f221=
d57354990]
> +Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/c=
url/curl_8.5.0-2ubuntu10.8.debian.tar.xz
> +
> +CVE: CVE-2026-1965
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index 792c422..22ed0be 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1319,7 +1319,7 @@ ConnectionExists(struct Curl_easy *data,
> +     continue;
> +   }
> + #endif
> +-  if(wantNTLMhttp || wantProxyNTLMhttp) {
> ++  if(wantNegohttp || wantProxyNegohttp) {
> +     /* Credentials are already checked, we may use this connection. We =
MUST
> +      * use a connection where it has already been fully negotiated. If =
it has
> +      * not, we keep on looking for a better one. */
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 9e37684b2c..0b4c93ec66 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -32,6 +32,8 @@ SRC_URI =3D " \
>      file://CVE-2025-14819.patch \
>      file://CVE-2025-15079.patch \
>      file://CVE-2025-15224.patch \
> +    file://CVE-2026-1965-1.patch \
> +    file://CVE-2026-1965-2.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


