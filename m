Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52692FCC073
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:14:09 +0000 (UTC)
Received: from sonic311-43.consmr.mail.bf2.yahoo.com (sonic311-43.consmr.mail.bf2.yahoo.com [74.6.131.217])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73807.1772815709847549908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 08:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=Zjb/nY4n;
 spf=neutral (domain: yahoo.com, ip: 74.6.131.217, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772815709; bh=e3ZS6kYp2RP2faHt2aNHiBdBDScGHSUWaYb1lVzWM/0=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Zjb/nY4ngZhLnV8ICUAl6+cK9SRdghSK1VyMPaKjfgltcXe4BH7RtgHuYPPHWK4Iw5xQ8wW/WR2iFDcV1h+dAXstWxBBtZ5hvxKp9qOKUk8ZMfPCL1KqySpbEd6GqjEeImwTL3/6xQQ+NH2iEeaHNhYrtilhY5ItzED64JcCyZqG4fe0GQmn9iZt5MgmfkN0jCwmHUvpgqVJNvsDOSodNv8gAV0glGSdwXWZKAdCqCmpHwQ1BOfuxEJb651bBK4v5zAwUBpv7PWHCWGdhwdfjujWw3IlxzytVEcudwDHGhuBqPyX608HZqlSlgAPrc0vHIK5yvlIP0J6sk64qTn8bA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772815709; bh=M0EdkcwMKvkcUq3XdVCBnCWTRzuHOIXMn+bMkQLqO7b=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=q0O2gOdDed5x/eI88Wfa8oDCcqIh+jM0+ij1dJvnd1y25HoEEMFECeCu0Sw85PRXgLIbyBpaBQdDdg+NZdYImchxD9dFgoeHx/V5vDK/GmBHulBKI+Tm/TaCG9gWiQGG4Jb9VCPLaKPpmNL0BTKLgoZI1FmptH+ec2zdPXXO9ffL5KVii1eSYlOL1iOTLCf2Cbhvzy/eK3ehC8N/B3brl9xZTZPp8AAKwmk4vmk4eYkyhWzlfBv4m/NYblqBgdy29lXZ9jWYSKiK2PXna1lwOc/mB9127693oEk29BMMHYgwzoWJqsC6fQeV3nm+33U9xUpRv/RUwfebvQvrzXJm3w==
X-YMail-OSG: 5MUuvFYVM1ljhOVN8uhOs2ZaB08fgjKlYEFlXzyO7YsYe7tqWhso8Z9195epm.3
 .tz.EkDpwbGMrNKQ1nJfWfET8RuaqiElGuW5c46_LjxDl7.zGyFJw3KEGWWBwa36G.gukZenSv_G
 h3iEe1qMacbvcpzG3z0A6wNpEnLXhkR3Rc2obbA45q76oinInBF03APF09R6EgH.GLoTv2uE8o.I
 ZDrMS1queqC7h0WN0kERVY0IDo0avPCyIOOVPFnmfPuiPEmCwcUlJXXhIoUN1.EZjhLX.uUIGgU4
 rQwhylMb6JSrWHhMtCQXtmpZpomD4b8l_UtaaYOsav0mv2T9lFkIKuJB9m6Ml.9Yjd.HvGpyNjeD
 .CdBMXrEmpk1g58QP5WpqYGHzGS1SjqUXn.gQLzZLmHyoDUtSKSXgf7.fh_ZjHIcFRUQa9bCIBCE
 FunbMs51ciUWXhupnjXqS0BY.D89DkuKHCWiDCcH6Y6IeLWp7G2xYScVdz.xunUmgyiocUvf99XQ
 kK6Wcsfjb4XYhNOpLA3cs2H1uWrOvsBBwUhArfJ9bBN.zhtDRPBIycGMbsmYqw3ZyLbu6U905cIb
 vHnVvcfN7FFPq9Csv6MGHRf2wzucIeOjZk72101sCp5qVCE9Is8A9uHnWbzCc3YcQ_zykB2W.6U9
 VIeLzNZ1AvstQB5hwJ_mPDSno0_ypfY5onLDBrWYHbbTxcki2TbikyaV_HuA8QakilQfzEZt4OzY
 09M.19ITD1NTmfvfyfc4hhK.JPVtrzdTTEMB8.gWXcE.ssPmJkT4UoSXXKwtvH_vzYAj3ZO_UKEs
 GKu46E2jXE1XYX.EtaEbW9eKDeHLSDcpsF7Z9kx8rJLC7MtdmM6Hk8uaA45L.cx8Pt9QqNLN7BAk
 zSSJak9ERTsHY3Xd871rDTCSqQvkDrqBb6l5IaQD6Y4L57hflv8_Y1WCLcFULMNWMd95UfOZydZ9
 SyTinavJyopOwjbyhHwdkrFdIRa7qk2RSQqRImqlz0DXeqvo4lvy42nqO.NIVAXDGh3dxXkYdi._
 UrDxqjX7JisL7sdvvv5OC6CQHV3YRPrf0FAjbRyYO_CAtIP4akAUo4SCq7sOiJQH5FobbYZpB4aM
 6Jiea.kGioa4j85Z76Ep8GfZx1O.FpDOpBf467tnV0DOki87I_zlLdLhgVw2V5PSQ7mOrNPKqaBW
 sW5WCugfiEU64saQ5wtNaT5DzBXlBc7VSaFy9WM6nghCeusDdVczXE8DA0wI2er_KLpoSFeE6wuP
 ZMGowjZMhBoeeN87Mh7wwgH9fO3efaY7srs1eq8zuZpepkLSZxDPWS3utps6ZZzQbjxGByoaP7i7
 U4ZI86uss8VsGrKXo2iFMYEQPM7KKLQYUqahSAM7l5TE2URSsoGgl9EmNVKCnEsoXnVgf4WuMwmY
 cUgDhM2ns266JZmq6SdbIRuaip1ErTjVNNZvZuiDdkmV6mVlWyiaQL.uniJhrUWIiGCd5iN5VwKq
 q5prk0_sqUSanHaYtOcuCG9FIk81TE_.dG0s9p2Q_Hhupkjef5naxeQc6E_t9ItetnDxLhoBalV5
 6r2BKLQBLZtm34qvmmhnWrzCt1gkTNQ4A0F4WdBjYFbiaAlD_tXY7r59fK_w3objtiSbCG9eFggQ
 oxyjZ8QgstEYEZt9p_S15LczT3tLY68y7qcjlcSQA06cPsc_YOBR6Lh38GQwMpOQ8jUUE_93YsZ0
 DfoafnCij04.upAQQS2gvXlAn4Ip4TTDm0EmfBqNlBNAF2lC3widbS9HQ3D0IG5oT.48VDV_nexf
 _6AHl2BPe1SZlHVBlHGsrzWwDvld9vtoNoM_d2LIQLLsVlrkeiLoH7zLJXe9Wk5wNerlw9C.tMuj
 e7D5u9C8mUYNvfqBZwFBCHDlzI_bCyOook3qE9j6p6NU.9deH63QCL4ps8YXMZHorAW00zW7jYkh
 dVXBL25zBdtry.nytj1dwZ2yY9VkbI.k5RcCBbzU68Bn8oR6uQDbf4fPePbzqCFs11bA1U9crKYa
 9Lf9NhP2.UpEhIXlY96PdcNpxdgBchuPCT1Isj7WWz9mZhi9aOp5yFdXt0XdV99uMz_IJPNJTFUo
 HjHXoZjL8QqnMqrcoxx3TQ8W_EpJqYucs8VEQg0o3zqoZjKgiYOR4e1r7jCdcx9MbnW_I0gaNzbz
 UUoX.MCJ.QvLd75alrjLq6PtfhnIXFd3SNYC48vlMeXj0Tg.IroxhmkWyitk7.MAYh7y2odhWBL7
 tbGohjVva8stwhLdMs.x7cdjdqrGabEZlJFtl1CSUwBas3lNIPPT01U4vGrE.y29WnzFLu3bzwQE
 t1a4g8SO9GjurtsvqfKUj0oX9DEv0P8ooeWs6dDqRqO9Z4GDzgsY9f3CnnzV6jAh3qWdJzUEzzGN
 9ZH9Zl5RjAsb8GNmVFw--
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: fe165e44-6c1e-44cc-89ad-80f5d208353b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 16:48:29 +0000
Received: by hermes--production-bf1-697f88457-629ff (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5f3d391e62a5cb2278e1d07e9f03f0b1;
          Fri, 06 Mar 2026 16:36:26 +0000 (UTC)
From: eduardo.f120@yahoo.com
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [oe-core][PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
Date: Fri,  6 Mar 2026 13:36:19 -0300
Message-Id: <20260306163620.952359-1-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
References: <20260306163620.952359-1-eduardo.f120.ref@yahoo.com>
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232596

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


