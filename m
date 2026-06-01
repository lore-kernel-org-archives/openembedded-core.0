Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34E6CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:55:45 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2171.1780329338506676518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kwyQ5PWA;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49041e84237so84508905e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780329337; x=1780934137; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHmDR/if8NhUGINJSeaCTBbSdCOHhZ2XuhvDAuHYvtE=;
        b=kwyQ5PWACmTIbbycKsWFUBSqJ8EK2PqsO466xTqrl4YWECsbuU5Tlt/zdSHDuPaVSA
         UGN6M8lipcNOQPnsgBjkM+/gFaUw/QzKcZfFOMHxODnzdkInvkbO5ANEFHhPAuPjtGt4
         k0dv/YFHeBOUVjBdxPKN2qSHVfbNNG5n19/DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329337; x=1780934137;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHmDR/if8NhUGINJSeaCTBbSdCOHhZ2XuhvDAuHYvtE=;
        b=f2n81VUg5B761Bm9XJTg7puKR6zyLsoty1vWkq5d/bLKnxVNJofMkOwWbqL0Jw99qH
         a60cmh79g/Qs0IC5wv2StPop8M+LfuytZzFcfmd1FshbKnxUKCWnRkfHfN4YwqzfqHro
         M7tiwNTtbPCgUTKlFE9Ske6fXb8xMMyxXS0ca2U0IvHPDGhvPybBulo7LQC1XQJheRaY
         DfUSCNPqL/N8JiMq1oca1+6DrZbv2Y0KZSH4ZxqWXa+JxRicq/KwIOk19r9+DZ3mwqp8
         2pGVOjsguCS7m8PhNrHfiBXTC9WS/j9GbQRoo55m6A/pqocstx51u+q5ukLlLi5Kijy1
         A3xA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZFVfVFMuiPuiCVg4MdbNPFHYmQil9AiNNHPfMh9RuU7Lf64gIrwacXnuYIBidHLLeTRwe9fmUx49xIvxPzDUJtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqcN+bi/mj4HTnI+kzWOXBYxlSBvlg6ZLm7s9LECVMIosf16Pb
	JRnoHH4wajz07YdtUt3jkMgX7OTyfRr/bF+oGb+wHKlFFoDc1rXIiLnCbol9HvyRPV0=
X-Gm-Gg: Acq92OE4QTkAjDKsv6EX0+2Kmm9J/uHLZXyZIy+O8ZGWZTR2LenRXSOCosnc82XkNhq
	gy5Vb3tRSx7BN6d12DIGzQteWsHC1SmjaB6R8I6fhka1UnBFLcx/RQEpHmFwfa+fvKxTyzfHBSn
	GiosoAStq6qMFemI2NMhnt7HArEhBl54u5pXUCLQoJLGyQMHzTq5vIzYlL9cKB9l2lYcCjlp4qT
	ILPUW9ioTYJmQVrPXP8BpbJ8wXAplWCmKbWhBF4sPsWD0S98P8Gr+mP1pskyG2Jfx90HL/kqdML
	SJMkP16ORVZlK3VeVHbppJ5UGgaUpGAobAwB75jT73CetqyYSOMwEVE6QExZvnEVo0XW3rZDQkq
	b1VkzkrHXGCQiHCYUNw8i5JhvSmsevFpM/wL4s4/B2yQCSrpN7iUuz+mG7GtjtwSRf700KdpJv5
	oWCB/G5eVVjpT/sR40aAo9VwpYYjm2E5RhHKmk+zYBwhSmc+KwS/m/9RnHU19lyax9zJpC7o9c/
	7F7GOfFOmhOqxPlHQu0Pw==
X-Received: by 2002:a05:600c:4287:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-490b0e64bd7mr975535e9.6.1780329336574;
        Mon, 01 Jun 2026 08:55:36 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c50f6sm29198020f8f.16.2026.06.01.08.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 08:55:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 17:55:35 +0200
Message-Id: <DIXU2TW2A07U.3OQ6G54VPJAYT@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <vchavda@cisco.com>
To: <hjadon@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH] go: split CVE-2025-61726
 regression fix
X-Mailer: aerc 0.20.0
References: <20260528011239.528751-1-hjadon@cisco.com>
In-Reply-To: <20260528011239.528751-1-hjadon@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237968

On Thu May 28, 2026 at 3:12 AM CEST, Himanshu Jadon -X (hjadon - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
>
> Restore the originally submitted CVE backport and carry the ordering
> correction fix separately for internal/godebugs.All as a separate
> regression patch. This keeps the security backport easier to audit and
> makes the follow-up fix explicit.
>
> The ordering issue was introduced when the existing backport patch was
> modified by commit [1]. The same change also dropped zipinsecurepath
> from the patch hunk context. Restore the original hunk context and keep
> the ordering correction as a separate follow-up patch.
>
> Keep the regression patch immediately after CVE-2025-61726.patch in
> SRC_URI because it is a direct fixup for that patch in the same file and
> hunk area. This is safe because no later Go patch in the current stack
> modifies src/internal/godebugs/table.go, so placing the fixup here makes
> the dependency explicit without interfering with later validated patches.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3Db670b11ff=
4845b64f861041681ace9c21db16eed
>
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>

Hello,

Sorry but I really don't see the point of doing this split.

The upstream commit did not have the regression bug. AFAIK, the
regression was added during the backport and we can fix it in our patch
(and we did in the commit you linked).

Regards,

> ---
>  meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
>  .../go/go/CVE-2025-61726-regression.patch     | 49 +++++++++++++++++++
>  .../go/go/CVE-2025-61726.patch                | 21 ++++----
>  3 files changed, 60 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61726-regression=
.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devto=
ols/go/go-1.22.12.inc
> index 3fa421e223..c095e54fbb 100644
> --- a/meta/recipes-devtools/go/go-1.22.12.inc
> +++ b/meta/recipes-devtools/go/go-1.22.12.inc
> @@ -33,6 +33,7 @@ SRC_URI +=3D "\
>      file://CVE-2025-61729.patch \
>      file://CVE-2025-61730.patch \
>      file://CVE-2025-61726.patch \
> +    file://CVE-2025-61726-regression.patch \
>      file://CVE-2025-61728.patch \
>      file://CVE-2025-61731.patch \
>      file://CVE-2025-68119-dependent.patch \
> diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch =
b/meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch
> new file mode 100644
> index 0000000000..bb2b5ac439
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go/CVE-2025-61726-regression.patch
> @@ -0,0 +1,49 @@
> +From a92d36cef2c1838e58dd1ec51bd147bd94e916fc Mon Sep 17 00:00:00 2001
> +From: Himanshu Jadon <hjadon@cisco.com>
> +Date: Thu, 14 May 2026 05:40:12 -0700
> +Subject: [PATCH] go: Fix CVE-2025-61726.patch variable ordering
> +
> +The backported CVE-2025-61726 patch introduced a regression in
> +src/internal/godebugs/table.go by adding urlmaxqueryparams out of
> +alphabetical order.
> +
> +From Go's source code[1], the All table from godebugs must be populated
> +alphabetically by Name, and Lookup[2] uses binary search to find the
> +variable.
> +
> +The wrong ordering caused Lookup to return nil for urlmaxqueryparams,
> +which triggered runtime failures.
> +
> +Fix this by moving urlmaxqueryparams before x509sha1.
> +
> +This change was validated with docker-moby (original issue), where a
> +container ran successfully and no traces were observed in the logs.
> +
> +[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table=
.go#L20
> +[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table=
.go#L100
> +
> +CVE: CVE-2025-61726
> +Upstream-Status: Inappropriate [OE-specific backport ordering fix]
> +
> +Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
> +Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> +---
> + src/internal/godebugs/table.go | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/tabl=
e.go
> +index 4ae0430..7178df6 100644
> +--- a/src/internal/godebugs/table.go
> ++++ b/src/internal/godebugs/table.go
> +@@ -51,8 +51,8 @@ var All =3D []Info{
> + 	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
> + 	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
> + 	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
> +-	{Name: "x509sha1", Package: "crypto/x509"},
> + 	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"}=
,
> ++	{Name: "x509sha1", Package: "crypto/x509"},
> + 	{Name: "x509usefallbackroots", Package: "crypto/x509"},
> + 	{Name: "x509usepolicies", Package: "crypto/x509"},
> + 	{Name: "zipinsecurepath", Package: "archive/zip"},
> +--=20
> +2.35.6
> diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/reci=
pes-devtools/go/go/CVE-2025-61726.patch
> index bdd10bc933..ab053ff55c 100644
> --- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> +++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
> @@ -1,4 +1,4 @@
> -From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001
> +From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
>  From: Damien Neil <dneil@google.com>
>  Date: Mon, 3 Nov 2025 14:28:47 -0800
>  Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
> @@ -36,7 +36,6 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
>  TryBot-Bypass: Michael Pratt <mpratt@google.com>
>  (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
>  Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> -Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
>  ---
>   doc/godebug.md                 |  7 +++++
>   src/internal/godebugs/table.go |  1 +
> @@ -46,7 +45,7 @@ Signed-off-by: Eduardo Ferreira <eduardo.barbosa@torade=
x.com>
>   5 files changed, 85 insertions(+)
> =20
>  diff --git a/doc/godebug.md b/doc/godebug.md
> -index ae4f057..635597e 100644
> +index ae4f0576b4..635597ea42 100644
>  --- a/doc/godebug.md
>  +++ b/doc/godebug.md
>  @@ -126,6 +126,13 @@ for example,
> @@ -64,19 +63,19 @@ index ae4f057..635597e 100644
>   to concerns around VCS injection attacks. This behavior can be renabled=
 with the
>   setting `allowmultiplevcs=3D1`.
>  diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/tabl=
e.go
> -index 33dcd81..7178df6 100644
> +index 33dcd81fc3..4ae043053c 100644
>  --- a/src/internal/godebugs/table.go
>  +++ b/src/internal/godebugs/table.go
> -@@ -51,6 +51,7 @@ var All =3D []Info{
> -	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
> +@@ -52,6 +52,7 @@ var All =3D []Info{
>  	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
>  	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
> -+	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"}=
,
>  	{Name: "x509sha1", Package: "crypto/x509"},
> ++	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"}=
,
>  	{Name: "x509usefallbackroots", Package: "crypto/x509"},
>  	{Name: "x509usepolicies", Package: "crypto/x509"},
> +	{Name: "zipinsecurepath", Package: "archive/zip"},
>  diff --git a/src/net/url/url.go b/src/net/url/url.go
> -index d2ae032..cdca468 100644
> +index d2ae03232f..5219e3c130 100644
>  --- a/src/net/url/url.go
>  +++ b/src/net/url/url.go
>  @@ -13,6 +13,7 @@ package url
> @@ -119,7 +118,7 @@ index d2ae032..cdca468 100644
>  		var key string
>  		key, query, _ =3D strings.Cut(query, "&")
>  diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
> -index fef236e..b2f8bd9 100644
> +index fef236e40a..b2f8bd95fc 100644
>  --- a/src/net/url/url_test.go
>  +++ b/src/net/url/url_test.go
>  @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
> @@ -178,7 +177,7 @@ index fef236e..b2f8bd9 100644
>  	url *URL
>  	out string
>  diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
> -index 517ec0e..88d6d8c 100644
> +index 517ec0e0a4..335f7873b3 100644
>  --- a/src/runtime/metrics/doc.go
>  +++ b/src/runtime/metrics/doc.go
>  @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordere=
d lexicographically.
> @@ -194,4 +193,4 @@ index 517ec0e..88d6d8c 100644
>  		The number of non-default behaviors executed by the crypto/x509
>  		package due to a non-default GODEBUG=3Dx509sha1=3D... setting.
>  --
> -2.34.1
> +2.35.6


--=20
Yoann Congal
Smile ECS


