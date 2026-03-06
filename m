Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575F4FCC070
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:13:09 +0000 (UTC)
Received: from sonic303-31.consmr.mail.bf2.yahoo.com (sonic303-31.consmr.mail.bf2.yahoo.com [74.6.131.230])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1118.1772820499401042061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=b0/VAMbb;
 spf=neutral (domain: yahoo.com, ip: 74.6.131.230, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772820498; bh=e3ZS6kYp2RP2faHt2aNHiBdBDScGHSUWaYb1lVzWM/0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=b0/VAMbbRbl9tD8iHy+lE0btCCr5iWxES69b2FxkkJcJ/6J7AkJwfV8PepprkEnUzX0JAp0KEKnr+qHT8/ha2moPly5hE8JnvRQHf9flfLKmWQy3o+3TDT3Pu6ayf+kDqZKqpUJPfp/nm5x/+GAfHmnm4agvU7knVKzsPahFaDulnY8JUNy/W9hfyuctRCBSq9LwYxBmX/d18M5jad9kw1u2ff9wh17hNDwr1VtKYBzyoH4pZfW3AuNQNHYFXUlUXrqcWTLT20gGUDSJoNYrnh0gdFc4FRIvnMkjgHqvW1j7ASOS4htLbJxR1XaStejAtuNs49H2fw3y6wO/pgJy1w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772820498; bh=DpF/OatUTllVQf5ZH0yVsDiYOJP2I7HxZ1mChnU52pw=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=msNUAG4gUQAXkmyH8gR3pMBH25YqIlRNiPdUn5gJ2bGnntU98BzJoxU/G+YA99JmZ5LNNbgvFh1JjWJPFm6DweH/qvrMIXeE85SBP/ycm7u37MuTac0i3lzeVX999JYPRg5oNdYnr9oC652Z4vbJ+7oRzBiMh7SOFMqw+l+X1EuJLTP+37lYGqvnLrOfGQenElLpV9CfumCtHuBiM/7hwMWvEUcGXqdkW3lW7Ssj0pTFdyw0YMGUFeffLwmFJSvxTO3bmj0LF1iSFrgeBI7J0GHcZl/P64se03WK23yGsnCc5/L1l6+3EaD1AAYwI2CnpzlTv0sdLvUK1vJ4yFAnSw==
X-YMail-OSG: vb2Af68VM1kSSmIiwxTJtSORhfRzptsp0kQLI8_JPTNEFx9DgpeX5lgDtcIs5Xu
 kXsV3PucNQssdstp9eVjqqksD0SICxP1VT5._QlbrJmxlHO3AhCIlgJ3__TFgTnCihyUK4_yQEFb
 dkLy5AgakaPa0ysIa__c5f3lWf.fjeM6usGz6xGBSkTUDWQ45KsjGJAnax4FNEkH0Wxl7xC7JOQG
 xaHE1kh28UmO0UL1oksz1TK3u4SqzN3HO2lzhWL5TMmtjLUL69LMqReSWhC7Npi8UCgXtgNexPpd
 tTSRixMATzuYQpULQpwF3_PfPdlUO_qx4b5Gy1ZrWbXczvAHi5FtDtCLh2R6AbwksUlAbhVBa_zu
 QD6JVdhYclm4rj0rudfCZlb5Fdp6lRBiBCgZieOqZfScRp.X6ywlQah5L.7p0F5xOacDZ1.ANoXj
 ym2Cc3_hncbHVJtezL96Mcu2aIidbcUnIoSY9jiMFZsQr45oWBfVuUglqMI4gyRcpyatiYSMmn6a
 RCGkwSj7F8gM1xsJbUwOCkvckMO.Hz5RZHnAKuHsttOtwpXf07CtEVZ.YQ5WaYEJqXFdBz.u3Idw
 uw4iFZ9wnVS5BQIj79ZPxeUpLG0mQM0QA1Z2lOSJKX0RnnvDh_XJhmFQSJl_rRFoRQsmi5yDYOQz
 EMTgaECKaKNfu6zGEQCqzSPhX.cW4VfYAOGfmyYBf6qGU8m.H9_PrDIxIqIPITc4dl5vpLqehvuQ
 6O45Ivjfql5gZ.OFpaX_fqcBeLducKNbwGefeitbC4GBKRClA_TOKRM2KxnZESjQ2dwRWZu4LT7i
 OkSdldGuCnPCFcng9a6ncoLnIE9qc.ylsuqGgISFLhiw6lZ6fP19MXiwzX2fd6QhXUtu9vn4ZkW0
 eJyoWGQ.hThkWeTDpWbOWvIvhHfbi7JaxXm9z_j4jKmEqAX4FdlxDCNJJWwgKg_VYivQ4aJW7Ymo
 9EMdUZcWOgK1RqCETOObrup8X8hvpNSoF63kvoqZoEnkZW_OLdps9YnA92IzHhcKg04W.aIbYzqQ
 V1pXEce4XAP_2wzMvLA8RBetl6JeaNGj9Sja7PmJo_0Y2BTVh48ncSZ4aoQQ7sgwKhEuZWlNuJnh
 ThcXf5KWVn.BqZpFAf3lUwMsuyxwOjVvesuOXnOB..fvuABUMOY7neaNuhn7c9LHJdQ._rBH7OhD
 PqSfiYemypIaf5sTjY1Tz8rELvyao8LnAaNxuZIQGorO3dgkdb36MVN_un7qmad8GXl439zhHNCm
 6chLOU6vZINV_crqA2E9PD4pka8_ijO2.dxNOdonomAfM1WvfsABgCSV1kdZaFHSPlTA3dfoCpE0
 P4MFCDjg3Gee3J01xSD6EzZ19HKZQaZR3f63fyC0Q.QA.BmYr9v1Q_HPdD4mNUsvkOTQDfSu4GWB
 Oir67aHe8LdK.2w7KBdYRE7kTqm2jHfCf7Oe5iyjvZ9wPw3W0gGXl.6RcMNUu6PmBUZdXNXWHmyN
 Ic6qoP69hcCmkc_EWwb.MX5mkixdDkQsKFrcNuviPGRKM4uAgr9ELI8gjWkux5mtsl.FbKLEU622
 C9WGUFhHAqIzw75hj.quxZEhOMD5gmDY5iktqU.XlKDnf7m1Tv_DGDwD4tOLZaWFWyJ9HIsHHv3a
 dBxWT_EKYpVXhkOcHeZ7Bf1JGl_.Q2KrMymqER6YMpe.kiJYif_8gX3BYccUJnc3eNv0dfGIk6Xo
 .NeFj8ysgm.2Di0c4vzRke8v3Tmuq5_fIlwildtoURP3aSMM8nhzQYrMxzNAyAOHBiM3v0mUa_3f
 YqTh2IuvLHZunSICY6U27AUYCoaef6O7i._bDM.HuxVpsrWgfgyxvKckC4uP64fLmUfbmRGLSTxC
 dpOhsb2VBQ8uHYYQ9XHP3MlJpmBampX90Le53aFBZevB8Cg0M9d8YA7nip0e93x0CKGycq7kIA_G
 UZOkOzUYyTMbkYy33TGxzRBINusqxC0yi1QChIwKmjLZXQCKQkvaL.lLtUroe3GOU339Z7psaDwZ
 cp3yaEZFTdXNpIlXqEAGJ_gIl0S6nEIDQX3hgfdB0SgcTauuvNnkj1xPEMGiNC5Utkhh3h9AFJ1L
 xeTorp8qy0cTTyHd5AyOjz1XRdgyclETr4HeS9HAFzeYMROGxTuaR28FLkE0UXk8Owp3ckP85o0Y
 u9rbiF_ssUll.rjxypZsnQ2z.YFuTb7q8s4JajwHAwbQnehTNc.x1vSVc1kdmo186_rLsyX7erGC
 Pyz9QQLxXPDyRvUOEA72RN7Q_kuQh20Km_zZbCsOv8J.jf7aZSXWW_WCvHR9OpAju_oQ3SQ8Gp6S
 CDTxcO8wa7uj8QFrxqk71ycbrJ3R_zeN4xNBj0MzhRFPS.tcXnqDldEo7MeInbQcdEQObxmyW
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: 44a8c2de-6f88-4e84-ae36-253967325381
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 18:08:18 +0000
Received: by hermes--production-bf1-697f88457-75c9h (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7a7301eb53a3a3fd449217282b97619a;
          Fri, 06 Mar 2026 18:06:17 +0000 (UTC)
From: eduardo.f120@yahoo.com
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
Date: Fri,  6 Mar 2026 15:06:05 -0300
Message-Id: <20260306180605.1047779-2-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306180605.1047779-1-eduardo.f120@yahoo.com>
References: <20260306180605.1047779-1-eduardo.f120@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232593

From: Eduardo Ferreira <eduardo.barbosa@toradex.com>

Commit 6a1ae4e79252f9a896faa702e4a8b3e27529a474 introduced a patch
backporting a fix for CVE-2025-61726, but this patch also introduced
a bug.

From Go's source code[1], they say that the 'All' table from 'godebugs'
should be populated alphabetically by Name. And 'Lookup'[2] function uses
binary search to try and find the variable.

Here's the trace:
Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker Application Container Engine.
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:34:53 http: panic serving @: godebug: Value of name not listed in godeb
ugs.All: urlmaxqueryparams
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [running]:
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*conn).serve.func1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/http/server.go:1903 +0xb0
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8740?, 0x4000b526c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtime/panic.go:770 +0x124
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:383 +0x2c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End(0x40011b4a80, {0x0, 0x0, 0x40
006441c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:421 +0x898
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8740?, 0x4000b526c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         runtime/panic.go:770 +0x124
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug.(*Setting).Value.func1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         internal/godebug/godebug.go:141 +0xd8
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).doSlow(0x22?, 0x55748a9b60?)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/once.go:74 +0x100
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).Do(...)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         sync/once.go:65
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug.(*Setting).Value(0x5575b21be0)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         internal/godebug/godebug.go:138 +0x50
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlParamsWithinMax(0x1)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/url/url.go:968 +0x3c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQuery(0x400069a630, {0x0, 0x0})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/url/url.go:985 +0xdc
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQuery(...)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/url/url.go:958
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Request).ParseForm(0x4000bdab40)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         net/http/request.go:1317 +0x33c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/docker/docker/api/server/httputils.ParseForm(0x0?)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]:         github.com/docker/docker/api/server/httputils/httputils.go:104 +0x20

The 'Lookup' function was failing due to the wrong ordering and returning 'nil',
which was not being checked properly and caused this issue.

The fix was to just reorder the line where 'urlmaxqueryparams' is being
added to respect the alphabetical ordering. And for that the whole CVE
patch was generated again.

This change was validated with docker-moby (original issue), where a container
run successfully and no traces in the logs.

Fixes: 6a1ae4e792 ("go 1.22.12: Fix CVE-2025-61726.patch variable ordering")

[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20
[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L100

Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
 .../go/go/CVE-2025-61726.patch                | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
index ab053ff55c..65fe62a4da 100644
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -1,6 +1,6 @@
-From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
-From: Damien Neil <dneil@google.com>
-Date: Mon, 3 Nov 2025 14:28:47 -0800
+From a41ff6cac6acdb8a55708d9f1e40efd8c4f87421 Mon Sep 17 00:00:00 2001
+From: Eduardo Ferreira <eduardo.barbosa@toradex.com>
+Date: Fri, 6 Mar 2026 13:38:46 +0000
 Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
  GODEBUG to limit the number of query parameters
 
@@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
 TryBot-Bypass: Michael Pratt <mpratt@google.com>
 (cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
 Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
 ---
  doc/godebug.md                 |  7 +++++
  src/internal/godebugs/table.go |  1 +
@@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore <deeratho@cisco.com>
  5 files changed, 85 insertions(+)
 
 diff --git a/doc/godebug.md b/doc/godebug.md
-index ae4f0576b4..635597ea42 100644
+index ae4f057..635597e 100644
 --- a/doc/godebug.md
 +++ b/doc/godebug.md
 @@ -126,6 +126,13 @@ for example,
@@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644
  to concerns around VCS injection attacks. This behavior can be renabled with the
  setting `allowmultiplevcs=1`.
 diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
-index 33dcd81fc3..4ae043053c 100644
+index 33dcd81..7178df6 100644
 --- a/src/internal/godebugs/table.go
 +++ b/src/internal/godebugs/table.go
-@@ -52,6 +52,7 @@ var All = []Info{
+@@ -51,6 +51,7 @@ var All = []Info{
+	{Name: "tlsmaxrsasize", Package: "crypto/tls"},
 	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
 	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
-	{Name: "x509sha1", Package: "crypto/x509"},
 +	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
+	{Name: "x509sha1", Package: "crypto/x509"},
 	{Name: "x509usefallbackroots", Package: "crypto/x509"},
 	{Name: "x509usepolicies", Package: "crypto/x509"},
-	{Name: "zipinsecurepath", Package: "archive/zip"},
 diff --git a/src/net/url/url.go b/src/net/url/url.go
-index d2ae03232f..5219e3c130 100644
+index d2ae032..f796077 100644
 --- a/src/net/url/url.go
 +++ b/src/net/url/url.go
 @@ -13,6 +13,7 @@ package url
@@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644
 		var key string
 		key, query, _ = strings.Cut(query, "&")
 diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
-index fef236e40a..b2f8bd95fc 100644
+index fef236e..b2f8bd9 100644
 --- a/src/net/url/url_test.go
 +++ b/src/net/url/url_test.go
 @@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
@@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644
 	url *URL
 	out string
 diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
-index 517ec0e0a4..335f7873b3 100644
+index 517ec0e..2efb13a 100644
 --- a/src/runtime/metrics/doc.go
 +++ b/src/runtime/metrics/doc.go
 @@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered lexicographically.
@@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644
 		The number of non-default behaviors executed by the crypto/x509
 		package due to a non-default GODEBUG=x509sha1=... setting.
 --
-2.35.6
+2.34.1
-- 
2.34.1


