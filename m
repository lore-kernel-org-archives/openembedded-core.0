Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D7E9D828
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 23:00:27 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44583.1775430024396958517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 16:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EXfqyo16;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so3119093f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 16:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775430022; x=1776034822; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEJLx7TsLDSUjgrVbpLY7vrJJs01eXR8r8jW+4BMpHg=;
        b=EXfqyo16bP0TBe49EGmEWGF4W4mlBeHHAQl90fwolZEg4eO/lIS54TUgFf4f8Hk4M+
         JEcKb4Z5PmmzRKyf8eBTBpxJljTeWz2OJWU/BxWFRVGi419LVy0EFhA33sgBU1W2LXL8
         g2b3Insduz86DtIP7wG/9AVgKyiFWr0Ev3/j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430022; x=1776034822;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEJLx7TsLDSUjgrVbpLY7vrJJs01eXR8r8jW+4BMpHg=;
        b=IavF4KuHT2NKfr6z4k+LkoFRGkxc6Tu8fPbA3wrvs/wRuNVkymsJ76+8ovuYban7bR
         6IqqKR3g+39zl1pXBOobQ2RqcZSo/Bzys15+TsKfnPNvkCU24Yq56Dch/4iSQcRrU7BT
         BFiayzqZphDahoxiMttiTmYDL+W8/fEovWg7139sQYh9hqk1kojntttRLXWiqYgS/OlH
         97gKk1l25+a7/9FO4tYRqVM8m+GmO39kY3eeMFbhBdXzzVO40P1clzkmlbibLpvcPZxj
         8YfE6bWFn5u1VFGPlPMhM9Cvxyk820M+6+Gjiha5orglT7fEN3XmcH+BMQUDxvXjOWgY
         VlTw==
X-Forwarded-Encrypted: i=1; AJvYcCUwAr8jxVH4cugCHME1IDqOJVgNGcZGQcPg2payU81Roe1PzCZnVua+zZZ2n8ANhIsXoTeFhisT9IWcK2hg+7jOcw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YybUIUiztK5UlUSzpWFA/AKuJ+YDALNXp0JqJAHTmO5Uh7UKHVV
	Ygp+yQL3xIwhSEBHZ/mbRk6nAYECN6Jwdq7EkQbaAEKB9Ep+WeHe9f7nI8wn5z5u6pPnjbL7ydZ
	Iua1wJW4=
X-Gm-Gg: AeBDievK7wjE0Fw98lK1L63GWYgUIO8fu8Y3kh/DGbuElmHPSepxwBiQJt1l1LWisUM
	Hr/xTDiPeNZNulnbysLqjJylAlVlJVXvhjkIRtabNIlCuKu3bFRjfH1KrOcBXAbPaxytlwxV7Dx
	vS4uHD+5df8RutkVWgHCfKwADxhDh2krgk/YqcwrI1EjwL8TRUrv5snsWtYyF5Tm0IDEMJZGes4
	cfBHGL5sVXee08w24YtfP3kvV+tEG55XgG+2ltE+mRdArYFh7pOqFeY7pMh5HCMPJ1av5eMTOfW
	WWMm8BZYXLkne54QWwVZpEYO1pUmqjR4P/pUr5EBG1Ce2MpJE8oaYKLKPaBG/vhi5mIA2kG84H4
	A/PcbnMvc4YtRrVIfkpwvK1Wa8JZDPZ501frNUWPRXzI9F2mcMeH8zEt3YMHUCjgiZKf4lTg9mk
	kr+RAP8zVDxZt760OkzwNYO4qng5FEBybYty8Ax/uOAaWNaOlzJZRkRzUd8h7sbvgpZV7dJSYra
	LuafXpckboMdPE=
X-Received: by 2002:a05:6000:2489:b0:43c:ff3f:c635 with SMTP id ffacd0b85a97d-43d292db150mr15957723f8f.34.1775430022376;
        Sun, 05 Apr 2026 16:00:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm38161949f8f.33.2026.04.05.16.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 16:00:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 01:00:21 +0200
Message-Id: <DHLLF032FZNH.11L4QM7EJC5RQ@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH v2 2/4] curl: patch CVE-2026-1965
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260321094723.273058-1-vanusuri@mvista.com>
 <20260321094723.273058-2-vanusuri@mvista.com>
In-Reply-To: <20260321094723.273058-2-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234642

On Sat Mar 21, 2026 at 10:47 AM CET, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> pick patches from ubuntu per [1]
>
> [1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.=
0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
> [2] https://ubuntu.com/security/CVE-2026-1965
> [3] https://curl.se/docs/CVE-2026-1965.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>

Hello,

Patches 2-4/4 of this series look good but they are needed on scarthgap,
they where sent but broke ptests:
https://lore.kernel.org/openembedded-core/20260326044647.2001828-3-sudumbha=
@cisco.com/T/#mc969f24be8b39369604b1de445f2af5e38bac083

I'll proceed with review but can only merge them if the equivalent
series is fixed on scarthgap.

Maybe you can help/fix the scarthgap series?

Thanks,

> ---
>  .../curl/curl/CVE-2026-1965-1.patch           | 98 +++++++++++++++++++
>  .../curl/curl/CVE-2026-1965-2.patch           | 29 ++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |  2 +
>  3 files changed, 129 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch b/meta/=
recipes-support/curl/curl/CVE-2026-1965-1.patch
> new file mode 100644
> index 0000000000..1d0f5c59e8
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
> @@ -0,0 +1,98 @@
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
> +Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/=
+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
> +
> +CVE: CVE-2026-1965
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++----
> + 1 file changed, 82 insertions(+), 5 deletions(-)
> +
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1145,6 +1145,18 @@ ConnectionExists(struct Curl_easy *data,
> + #endif
> + #endif
> +=20
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
> ++
> +   *force_reuse =3D FALSE;
> +   *waitpipe =3D FALSE;
> +=20
> +@@ -1496,6 +1508,57 @@ ConnectionExists(struct Curl_easy *data,
> +           continue;
> +         }
> + #endif
> ++
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
> +         if(canmultiplex) {
> +           /* We can multiplex if we want to. Let's continue looking for
> +              the optimal connection to use. */
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch b/meta/=
recipes-support/curl/curl/CVE-2026-1965-2.patch
> new file mode 100644
> index 0000000000..fa5fefd251
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
> @@ -0,0 +1,29 @@
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
> +Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/=
+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
> +
> +CVE: CVE-2026-1965
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + lib/url.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -1542,7 +1542,7 @@ ConnectionExists(struct Curl_easy *data,
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
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index b8fa8b5266..0e107f1e75 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -71,6 +71,8 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2025-15079.patch \
>             file://CVE-2025-15224.patch \
>             file://CVE-2025-14524.patch \
> +           file://CVE-2026-1965-1.patch \
> +           file://CVE-2026-1965-2.patch \
>             "
>  SRC_URI[sha256sum] =3D "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d=
3d690cdce58a583c"
> =20


--=20
Yoann Congal
Smile ECS


