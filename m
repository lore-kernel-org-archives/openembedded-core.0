Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7210A10F285B
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 17:05:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78443.1774631128081060116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 10:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XHr/s+Ew;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b9675d36so20757275e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774631126; x=1775235926; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDkxkTJO+G+JJhXjA2E9BR2ReQHOi1dlzXkaklhJXRI=;
        b=XHr/s+Ew2v+y9ecxe4cO2GQsrbZSBp5wz/e/ZpXcMNixKO362i+JNH8spysKZMCVeE
         nnpTzyKCazMRorTIydf2TOkd8Ohu0mp7S0m+T9R5KD2Jc9VHsr0Wywdkj6q0k6BfyIc8
         JzklkcvgmYbRYZYXHRh6V/WxSsDZV72tsHfng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631126; x=1775235926;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDkxkTJO+G+JJhXjA2E9BR2ReQHOi1dlzXkaklhJXRI=;
        b=UEZdeKybw4GvdHyX3eti16sJrDv6kZv+CyqPrFEJUtJmF//XySEsFpxUo9r10jmi3A
         kXrh8xV3uNtjWSQaWaRZaOkN2oYqII9Gw8s294uyvTkrRQJUCB8MYJU39icxBsjxl/4A
         +GmQI9NyRFOOBZa0JR9/5ZazKK327sxJD9g3TXCfjuC1tY32Hr5IIcd+igUdjFHxWSAC
         DK7nmS5EKLZnPgynhet4tsjAr1FQAVj1j4wmQcSlWdMiSij/P7jxBnsGyAX+RnCrRUVd
         01mbLR6wwiSpn5p+uGvVpdtIb7sk0N0oRBDLOwz3CUA4fBtpBmC9Z7DCXt8InfMnF35s
         9oDA==
X-Forwarded-Encrypted: i=1; AJvYcCVoiBE3N8UYRh9ZL2JAKne9ieAu0afjYIkoYsdH+zlbDYuImAGlKvWDNyDQoGltN6TrLFgeEEeZeaWvgLgmE+OHlg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzkVAT5I5VulbaRX6zWavogXLiJ54VgUn/DOZQIvgPIQCvslxs
	YBsof+jId+6O7mnm77nE+8msXUZYs2uXs2GsXH6aC/emtzWWkOSK+qlfmi/IaFGmvS1Ug6cXjuB
	KGqNdtjI=
X-Gm-Gg: ATEYQzxFTYkBVkLTD4yNYsmG7hGQPVVuhXIcauxKMCiYm049YvxvxLPE9EroRHNK1Ea
	+RSdxPfh1ZPZ+8SlKZuCeejx7LphmjkZlM3Oob6Md+9X4nyB42/5rAU7JamACzRmGW9DJ8sHui+
	zkIUM9T+xYR5ysamNBTp6uBRa3Z6fAnJJgXlOIOn+TeC9QDA0qyam1H9PB0NkaOxFQw5uFsXMA3
	8JHv3or/9br5GLQy/z6XTMw4IYIEGa1T++NqKdAhGCBwoslqfZ+4bzs2o7UD2Q0oCRf1TStF1vP
	iPgZMeaUAnxQnYVsfR2V5zg2dYU0yeplU5vY54trB0go4NnNDAi5+zbzTWB636G/yuUR16F8f+l
	oKmbcUc67r5QcJkAa9f3kOkiNizXmwvN5DQPxg+JAcQvD578cXuT3M0P3L8VrWBWR7Im0Y3vVJ6
	7NjnWb3UteebY8PXkU8np52aFL37dpt80Ue2wc8RzgBz5X1otNmwGkOgbrZWcVJzmMTkQStNK/D
	uzG+f/E4usYlH6X/WVilpnGHg==
X-Received: by 2002:a05:600c:34cf:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-48727d84062mr61752165e9.13.1774631126329;
        Fri, 27 Mar 2026 10:05:26 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c78bc2sm103311095e9.5.2026.03.27.10.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:05:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 18:05:25 +0100
Message-Id: <DHDQ8CB9P0YP.2MFIJ6HEBE1PR@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 1/3] curl: fix CVE-2026-1965
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260326044647.2001828-3-sudumbha@cisco.com>
 <20260326100000.2619253-2-sudumbha@cisco.com>
In-Reply-To: <20260326100000.2619253-2-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 17:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234102

On Thu Mar 26, 2026 at 11:00 AM CET, Sudhir Dumbhare -X (sudumbha - E INFOC=
HIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> Applying the fixes from upstream commit [3] and [4] cause merge conflicts
> and require other dependent commits to be backported. Instead, backport
> the Ubuntu-provided patches [1], which fixes the vulnerability as mention=
ed
> in changelog [2].
>
> [1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu1=
0.8.debian.tar.xz
>     debian/patches/CVE-2026-1965-1.patch
>     debian/patches/CVE-2026-1965-2.patch
> [2] https://changelogs.ubuntu.com/changelogs/pool/main/c/curl/curl_8.5.0-=
2ubuntu10.8/changelog
> [3] https://github.com/curl/curl/commit/34fa034d9a390c4bd65e2d05262755ec8=
646ac12
> [4] https://github.com/curl/curl/commit/f1a39f221d57354990e3eeeddc3404aed=
e2aff70
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-1965
> https://curl.se/docs/CVE-2026-1965.html
> https://ubuntu.com/security/CVE-2026-1965
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

Hello,

Looks like this patch break tests on arm64:
  WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing pt=
ests.
  [...]
  AssertionError:
  Failed ptests:
  {'curl': ['2006_-_.netrc_default_with_redirect_plus_oauth2-bearer_-_data'=
]}

Can you look at this?

And, while you are fixing this patch, can you please resend your series
(the 3 curl CVE fixes) as 1 series instead of 3 individual patches?

Thanks!


> Changes from v1 -> v2:
> - Updated with the correct patch series numbering
>
>  .../curl/curl/CVE-2026-1965_p1.patch          | 98 +++++++++++++++++++
>  .../curl/curl/CVE-2026-1965_p2.patch          | 30 ++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  2 +
>  3 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch b/meta=
/recipes-support/curl/curl/CVE-2026-1965_p1.patch
> new file mode 100644
> index 0000000000..8079b453eb
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch
> @@ -0,0 +1,98 @@
> +Backport of:
> +
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
> +CVE: CVE-2026-1965
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/34fa034d9=
a390c4bd65e2d05262755ec8646ac12]
> +
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + lib/url.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++----
> + 1 file changed, 82 insertions(+), 5 deletions(-)
> +
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -935,6 +935,18 @@ ConnectionExists(struct Curl_easy *data,
> +   bool wantProxyNTLMhttp =3D FALSE;
> + #endif
> + #endif
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
> ++#endif
> +   /* plain HTTP with upgrade */
> +   bool h2upgrade =3D (data->state.httpwant =3D=3D CURL_HTTP_VERSION_2_0=
) &&
> +     (needle->handler->protocol & CURLPROTO_HTTP);
> +@@ -1272,6 +1284,56 @@ ConnectionExists(struct Curl_easy *data,
> +     }
> + #endif
> +
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
> ++                       check->http_proxy.user) ||
> ++       Curl_timestrcmp(needle->http_proxy.passwd,
> ++                       check->http_proxy.passwd))
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
> ++        (check->http_negotiate_state !=3D GSS_AUTHNONE)) ||
> ++       (wantProxyNegohttp &&
> ++        (check->proxy_negotiate_state !=3D GSS_AUTHNONE))) {
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
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch b/meta=
/recipes-support/curl/curl/CVE-2026-1965_p2.patch
> new file mode 100644
> index 0000000000..1fdb658f23
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch
> @@ -0,0 +1,30 @@
> +Backport of:
> +
> +From f1a39f221d57354990e3eeeddc3404aede2aff70 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sat, 21 Feb 2026 18:11:41 +0100
> +Subject: [PATCH] url: fix copy and paste url_match_auth_nego mistake
> +
> +Follow-up to 34fa034
> +Reported-by: dahmono on github
> +Closes #20662
> +
> +CVE: CVE-2026-1965
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/f1a39f221=
d57354990e3eeeddc3404aede2aff70]
> +
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + lib/url.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1317,7 +1317,7 @@ ConnectionExists(struct Curl_easy *data,
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
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 9e37684b2c..e2f6f8472f 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -32,6 +32,8 @@ SRC_URI =3D " \
>      file://CVE-2025-14819.patch \
>      file://CVE-2025-15079.patch \
>      file://CVE-2025-15224.patch \
> +    file://CVE-2026-1965_p1.patch \
> +    file://CVE-2026-1965_p2.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


