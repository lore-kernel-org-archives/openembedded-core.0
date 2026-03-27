Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5E710F285E
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 17:08:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78542.1774631332419484650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 10:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NniTsvpZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso1722865f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 10:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774631331; x=1775236131; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0Ggof56c1ibsDOTnquRrydSzUjGuiW44j6YtdAoR+M=;
        b=NniTsvpZFuZSWzez1cXZ2oURbANE/FVmERGqnyRtq3Xra2sgtRxy+edYnsX2eJStul
         A65hc6Djh91dFlgByVa8QHpRvUcy1hki7jcgt+ZVG+qCbcJtgPW3QukBWDhgk+1+9cI/
         VcKe/aSX+mDKERGrLG33ahRUvIu1rGDsvNyDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631331; x=1775236131;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0Ggof56c1ibsDOTnquRrydSzUjGuiW44j6YtdAoR+M=;
        b=VJk35bhTjewptDrpk6KtVOwhCdnO3g8aM5IDDBijHOm9JUO+/wtiDNVB0o4vqTKoJf
         y6B+8w5FE3/CR+JpQH6h/XeIuLRx+uSuQF2g0bydxj0AbZ6vmNdaS5tFqlrIy/jxzcQF
         oATmIkh/pkeFRMeLTzcjyRaEPqPoujhj/oPXWArdRrWKho5mvfXikoBO/nWvY0NUxya1
         lbeON3xNlsKPZblgiqWigtyElvacuV+3epcJZTlcf48NNYBK9KkuE7va33nuVp/PUnjr
         jeRAtbgIZXKmrRxXjK382SVSmzKqtNX0czUrvbvfL4I/llI4EGO4KT7XSkwgi+yHkMJL
         iyvw==
X-Forwarded-Encrypted: i=1; AJvYcCVB7YClakuSPQohIF5DuXVAphvlklp7rybn+B+3LciUeYn5pP8FtB2w6MYX1W9Rj+QAmUpPIRwrqHo/gZVL+D6rGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxAF/LEN1JymwYy7+xEpu7EU8MEUGGJdT54VzEA5RKLEZ68lVCB
	XyTLzemwAsY9tCv5Z5C/Pdt9IaQVtUnnuOTlTQdLcIT2IPGTa09Hav7dKnND4vmmc8S0yF2fFNr
	7Fjn4nfo=
X-Gm-Gg: ATEYQzzsp/VWG+tfOLj8ZBWdPtNL1A4DiMMDqtf3BYAt51sjnluAAskdIvC2jBgcJkx
	vWsdwUFYYDe/EBZZnRm43wETtYNd0Sr0uPzgJ+hYbCe8LcnwaMaueLG8rxPxAw5VLDT14FbKkwG
	R/ExMbU4CfheCHSui2om3EFuntLrB4G68gBFvR9qOmHj6zgUHfgAWo7FzkkOspJeMFKWTxPjJYN
	PnnWSSkco4LxX3loDu9MDw2+W5RV9faCkG8XdXMKnK1AEdqSw22ZKm6Zid3sGK/O0SWjAtNmeMr
	WpcAxpLNjhmMgswMqkqjylHwWnrveC2W9KmSZZf+G+Zsxz/Icgh6MntWY2qb94YONzy/MFtXOSu
	1KWidPUJXAzkF9W3cLqZiaDBi5ApMhxJax7sL2y9TrgRF9nt0tl10yxmj/sbtc8CqwRrHpFvpnF
	JzKx+40shSI+JFLdiaeB+92DHAo0qwj17rUGk7CxwpvvmmgiNt2jENtyTvomKsBTfIaPsz4rRfz
	OalJKF/JQy80rk=
X-Received: by 2002:a5d:584b:0:b0:43b:5097:6f60 with SMTP id ffacd0b85a97d-43b9ea46b9fmr5353804f8f.32.1774631330682;
        Fri, 27 Mar 2026 10:08:50 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm17204825f8f.13.2026.03.27.10.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:08:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 18:08:49 +0100
Message-Id: <DHDQAY98IMAG.S4PA21WKSIS0@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <sudumbha@cisco.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2 1/3] curl: fix CVE-2026-1965
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260326044647.2001828-3-sudumbha@cisco.com>
 <20260326100000.2619253-2-sudumbha@cisco.com>
 <DHDQ8CB9P0YP.2MFIJ6HEBE1PR@smile.fr>
In-Reply-To: <DHDQ8CB9P0YP.2MFIJ6HEBE1PR@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 17:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234103

On Fri Mar 27, 2026 at 6:05 PM CET, Yoann Congal wrote:
> On Thu Mar 26, 2026 at 11:00 AM CET, Sudhir Dumbhare -X (sudumbha - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Sudhir Dumbhare <sudumbha@cisco.com>
>>
>> Applying the fixes from upstream commit [3] and [4] cause merge conflict=
s
>> and require other dependent commits to be backported. Instead, backport
>> the Ubuntu-provided patches [1], which fixes the vulnerability as mentio=
ned
>> in changelog [2].
>>
>> [1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu=
10.8.debian.tar.xz
>>     debian/patches/CVE-2026-1965-1.patch
>>     debian/patches/CVE-2026-1965-2.patch
>> [2] https://changelogs.ubuntu.com/changelogs/pool/main/c/curl/curl_8.5.0=
-2ubuntu10.8/changelog
>> [3] https://github.com/curl/curl/commit/34fa034d9a390c4bd65e2d05262755ec=
8646ac12
>> [4] https://github.com/curl/curl/commit/f1a39f221d57354990e3eeeddc3404ae=
de2aff70
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-1965
>> https://curl.se/docs/CVE-2026-1965.html
>> https://ubuntu.com/security/CVE-2026-1965
>>
>> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> ---
>
> Hello,
>
> Looks like this patch break tests on arm64:
>   WARNING: core-image-ptest-curl-1.0-r0 do_testimage: There were failing =
ptests.
>   [...]
>   AssertionError:
>   Failed ptests:
>   {'curl': ['2006_-_.netrc_default_with_redirect_plus_oauth2-bearer_-_dat=
a']}

And also breaks on x86-64:
qemuarm64-ptest  https://autobuilder.yoctoproject.org/valkyrie/#/builders/6=
1/builds/3361
qemux86-64-ptest https://autobuilder.yoctoproject.org/valkyrie/#/builders/7=
3/builds/3384

>
> Can you look at this?
>
> And, while you are fixing this patch, can you please resend your series
> (the 3 curl CVE fixes) as 1 series instead of 3 individual patches?
>
> Thanks!
>
>
>> Changes from v1 -> v2:
>> - Updated with the correct patch series numbering
>>
>>  .../curl/curl/CVE-2026-1965_p1.patch          | 98 +++++++++++++++++++
>>  .../curl/curl/CVE-2026-1965_p2.patch          | 30 ++++++
>>  meta/recipes-support/curl/curl_8.7.1.bb       |  2 +
>>  3 files changed, 130 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965_p1.patc=
h
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965_p2.patc=
h
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch b/met=
a/recipes-support/curl/curl/CVE-2026-1965_p1.patch
>> new file mode 100644
>> index 0000000000..8079b453eb
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965_p1.patch
>> @@ -0,0 +1,98 @@
>> +Backport of:
>> +
>> +From 34fa034d9a390c4bd65e2d05262755ec8646ac12 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Thu, 5 Feb 2026 08:34:21 +0100
>> +Subject: [PATCH] url: fix reuse of connections using HTTP Negotiate
>> +
>> +Assume Negotiate means connection-based
>> +
>> +Reported-by: Zhicheng Chen
>> +Closes #20534
>> +
>> +CVE: CVE-2026-1965
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/34fa034d=
9a390c4bd65e2d05262755ec8646ac12]
>> +
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + lib/url.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++----
>> + 1 file changed, 82 insertions(+), 5 deletions(-)
>> +
>> +--- a/lib/url.c
>> ++++ b/lib/url.c
>> +@@ -935,6 +935,18 @@ ConnectionExists(struct Curl_easy *data,
>> +   bool wantProxyNTLMhttp =3D FALSE;
>> + #endif
>> + #endif
>> ++
>> ++#if !defined(CURL_DISABLE_HTTP) && defined(USE_SPNEGO)
>> ++  bool wantNegohttp =3D
>> ++    (data->state.authhost.want & CURLAUTH_NEGOTIATE) &&
>> ++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
>> ++#ifndef CURL_DISABLE_PROXY
>> ++  bool wantProxyNegohttp =3D
>> ++    needle->bits.proxy_user_passwd &&
>> ++    (data->state.authproxy.want & CURLAUTH_NEGOTIATE) &&
>> ++    (needle->handler->protocol & PROTO_FAMILY_HTTP);
>> ++#endif
>> ++#endif
>> +   /* plain HTTP with upgrade */
>> +   bool h2upgrade =3D (data->state.httpwant =3D=3D CURL_HTTP_VERSION_2_=
0) &&
>> +     (needle->handler->protocol & CURLPROTO_HTTP);
>> +@@ -1272,6 +1284,56 @@ ConnectionExists(struct Curl_easy *data,
>> +     }
>> + #endif
>> +
>> ++#ifdef USE_SPNEGO
>> ++  /* If we are looking for an HTTP+Negotiate connection, check if this=
 is
>> ++     already authenticating with the right credentials. If not, keep l=
ooking
>> ++     so that we can reuse Negotiate connections if possible. */
>> ++  if(wantNegohttp) {
>> ++    if(Curl_timestrcmp(needle->user, check->user) ||
>> ++       Curl_timestrcmp(needle->passwd, check->passwd))
>> ++      continue;
>> ++  }
>> ++  else if(check->http_negotiate_state !=3D GSS_AUTHNONE) {
>> ++    /* Connection is using Negotiate auth but we do not want Negotiate=
 */
>> ++    continue;
>> ++  }
>> ++
>> ++#ifndef CURL_DISABLE_PROXY
>> ++  /* Same for Proxy Negotiate authentication */
>> ++  if(wantProxyNegohttp) {
>> ++    /* Both check->http_proxy.user and check->http_proxy.passwd can be
>> ++     * NULL */
>> ++    if(!check->http_proxy.user || !check->http_proxy.passwd)
>> ++      continue;
>> ++
>> ++    if(Curl_timestrcmp(needle->http_proxy.user,
>> ++                       check->http_proxy.user) ||
>> ++       Curl_timestrcmp(needle->http_proxy.passwd,
>> ++                       check->http_proxy.passwd))
>> ++      continue;
>> ++  }
>> ++  else if(check->proxy_negotiate_state !=3D GSS_AUTHNONE) {
>> ++    /* Proxy connection is using Negotiate auth but we do not want Neg=
otiate */
>> ++    continue;
>> ++  }
>> ++#endif
>> ++  if(wantNTLMhttp || wantProxyNTLMhttp) {
>> ++    /* Credentials are already checked, we may use this connection. We=
 MUST
>> ++     * use a connection where it has already been fully negotiated. If=
 it has
>> ++     * not, we keep on looking for a better one. */
>> ++    chosen =3D check;
>> ++    if((wantNegohttp &&
>> ++        (check->http_negotiate_state !=3D GSS_AUTHNONE)) ||
>> ++       (wantProxyNegohttp &&
>> ++        (check->proxy_negotiate_state !=3D GSS_AUTHNONE))) {
>> ++      /* We must use this connection, no other */
>> ++      *force_reuse =3D TRUE;
>> ++      break;
>> ++    }
>> ++    continue; /* get another */
>> ++  }
>> ++#endif
>> ++
>> +     if(CONN_INUSE(check)) {
>> +       DEBUGASSERT(canmultiplex);
>> +       DEBUGASSERT(check->bits.multiplex);
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch b/met=
a/recipes-support/curl/curl/CVE-2026-1965_p2.patch
>> new file mode 100644
>> index 0000000000..1fdb658f23
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-1965_p2.patch
>> @@ -0,0 +1,30 @@
>> +Backport of:
>> +
>> +From f1a39f221d57354990e3eeeddc3404aede2aff70 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Sat, 21 Feb 2026 18:11:41 +0100
>> +Subject: [PATCH] url: fix copy and paste url_match_auth_nego mistake
>> +
>> +Follow-up to 34fa034
>> +Reported-by: dahmono on github
>> +Closes #20662
>> +
>> +CVE: CVE-2026-1965
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/f1a39f22=
1d57354990e3eeeddc3404aede2aff70]
>> +
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + lib/url.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +--- a/lib/url.c
>> ++++ b/lib/url.c
>> +@@ -1317,7 +1317,7 @@ ConnectionExists(struct Curl_easy *data,
>> +     continue;
>> +   }
>> + #endif
>> +-  if(wantNTLMhttp || wantProxyNTLMhttp) {
>> ++  if(wantNegohttp || wantProxyNegohttp) {
>> +     /* Credentials are already checked, we may use this connection. We=
 MUST
>> +      * use a connection where it has already been fully negotiated. If=
 it has
>> +      * not, we keep on looking for a better one. */
>> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-supp=
ort/curl/curl_8.7.1.bb
>> index 9e37684b2c..e2f6f8472f 100644
>> --- a/meta/recipes-support/curl/curl_8.7.1.bb
>> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
>> @@ -32,6 +32,8 @@ SRC_URI =3D " \
>>      file://CVE-2025-14819.patch \
>>      file://CVE-2025-15079.patch \
>>      file://CVE-2025-15224.patch \
>> +    file://CVE-2026-1965_p1.patch \
>> +    file://CVE-2026-1965_p2.patch \
>>  "
>> =20
>>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


