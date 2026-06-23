Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F08CD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 08:07:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15971.1782202069886664205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 01:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WMfuKuik;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so4925295e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782202068; x=1782806868; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU6Rc6CnBtUvZPMbmaGmZOGMLeoYxEhFecxj1rxb+6c=;
        b=WMfuKuikRa8FGgSgPU82pBpQM3RZZ/lG7GBuTSoTpzGuFwThpjvM98hGLH4XLUKXAh
         tIb7DkerhxOLkolc1Nc5wN2GCY2+DSVw0hhhU3ZU93dWwY7pu+HF5y/XNggio1oye5UQ
         PPMys1Rsh5ac1EQRnIEjJLimCvQhk+lvaVv20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202068; x=1782806868;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nU6Rc6CnBtUvZPMbmaGmZOGMLeoYxEhFecxj1rxb+6c=;
        b=XwpEhBnlocnypwKGnAyw8jYqpV8dpV69iFZ2w1PtscO47c6UIja6FvvWNvBTBIloQ8
         nCCzYrwKXh1wTTYFtdYBQ6dGR1e/cOsjZ4/lDh9e7Rh9VSbcvgJrP1LWZSmIbs0rcYd5
         PmZMbq39bvq10cuwNcrMQXfzzDHsFX9LMA2jHqy8TCdein1f8QNRlJRniqVBSN6JypWf
         2QDtFmadgXMBnAklTzjDNfsyR5ZI8268Q3zlLn6X3w9bdxy2z9ukF0eD9QHNRFpRz6iz
         SHKRUqfiprkuSUQvDZAfDDJevjB+5noLUeLcw7xGYkkYK8PXRzRfDW3rUoN6c4tc3F7+
         +Cng==
X-Forwarded-Encrypted: i=1; AFNElJ/Ygs9OqqrU9kL+jBfLCM0HZoZgEsuP/aQzYe8+TY4YzPx453WEw0hDq5/gHjkgWDIrNfsc7mloVTdmzXGF9r0PUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJEcYuC3iClS9Fa6tvheDFIjsWLte0H1srFCCQicrbFLbHRqyn
	a8PV/0MoqUhtWn9+MtPjMRixr3Xl12mFcH1pM/tDfUehYsRpayFAfFqJHMikXWOKIU8=
X-Gm-Gg: AfdE7ck5Q939bDDESdyWlDuaaLKT8wHAqB85pqH6E43b6YFxF0iECP9u/oc2pSl+L8i
	LThNnV+T4xrM3LCXTIPxLka/6IQfSDBxHqPmBRvppA0AHvYpUdVRfkQYlh+jWv9RJmxJdk4KzpS
	EdFkgHVLp6Ue/gK7Uo2F3zQc2tAzrppVVHApfdAsnoBWrI8KS8MerUnVTEMfjSE7JfwSwWKKO70
	RbHQ5pewykbQkfxiFW3tmB2sITZkp6+BnaAaFq0qW6dH1J+xZskSQcM4/ZdNB5aUylpqjYd7wsF
	TlRS1rWgufVTG0ShCjxUmYXBXR3KA3XPZxJ+71G4ThmM12hYYd5xvIb/zxuxqYw3dD5i+eVLpQD
	6MWy+K7fiE9ibOMvwEu5C5AxVWNMPKh8abUJpxYwqCD8KF7qvueFNC29h8s3CZhXyki8SPDdAQV
	k5BfTm8szALdcgH4q+8Jz9Fp8qh/uSQEcQQsYEFWD/7l7Eocd1TWK5S4+zuXp+bltAER3/sMhY6
	0V0jA==
X-Received: by 2002:a05:600c:3b89:b0:492:37a3:acda with SMTP id 5b1f17b1804b1-4925a0444c4mr39732065e9.0.1782202067804;
        Tue, 23 Jun 2026 01:07:47 -0700 (PDT)
Received: from localhost (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221da1sm33451799f8f.36.2026.06.23.01.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:07:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 10:07:47 +0200
Message-Id: <DJG9WMVQMIFF.3TZSO15OKI2BQ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] curl: Fix CVE-2026-5773 - SMB
 connection reuse across shares
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 08:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239339

On Tue Jun 23, 2026 at 9:48 AM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> libcurl's SMB handler marks connections for reuse (connkeep) without
> verifying that subsequent requests target the same share. This allows
> a second SMB request to the same host to reuse a connection
> authenticated for a different share, potentially accessing data
> without proper authorization.
>
> The upstream fix removes connection reuse for SMB entirely in
> lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the
> equivalent fix is changing connkeep() to connclose() in lib/smb.c,
> which prevents the connection from being returned to the pool.
>
> Tested with SMBv1 server (Docker dperson/samba):
>   Without patch: "Re-using existing connection" for different shares
>   With patch: New connection per request, no reuse
>
> Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)
>
> Reference: https://curl.se/docs/CVE-2026-5773.html
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hello,

The backported commit is in curl 8.20 but wrynose is only in 8.19. Can
you check if the fix is needed for wrynose (and send it there if that is
the case)?

Thanks!

>  .../curl/curl/CVE-2026-5773.patch             | 30 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-5773.patch
> new file mode 100644
> index 0000000000..a62b389d62
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
> @@ -0,0 +1,30 @@
> +From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 5 Apr 2026 18:23:35 +0200
> +Subject: [PATCH] smb: disable connection reuse
> +
> +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> +
> +CVE: CVE-2026-5773
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575=
d6412dc0ff532acdf94de35a6c2a571]
> +
> +(cherry picked from commit 74a169575d6412dc0ff532acdf94de35a6c2a571)
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + lib/smb.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/smb.c b/lib/smb.c
> +index 7c73cbcec..a1f5c9b31 100644
> +--- a/lib/smb.c
> ++++ b/lib/smb.c
> +@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data, =
bool *done)
> +   if(!smbc->send_buf)
> +     return CURLE_OUT_OF_MEMORY;
> +=20
> +-  /* Multiple requests are allowed with this connection */
> +-  connkeep(conn, "SMB default");
> ++  connclose(conn, "SMB default");
> +=20
> +   /* Parse the username, domain, and password */
> +   slash =3D strchr(conn->user, '/');
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 14d63d6373..d026731751 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D " \
>      file://CVE-2026-1965-2.patch \
>      file://CVE-2026-3783.patch \
>      file://CVE-2026-3784.patch \
> +    file://CVE-2026-5773.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


