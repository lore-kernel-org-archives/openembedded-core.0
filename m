Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5507CFCC06F
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:12:59 +0000 (UTC)
Received: from sonic308-30.consmr.mail.bf2.yahoo.com (sonic308-30.consmr.mail.bf2.yahoo.com [74.6.130.229])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2485.1772824189458986365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 11:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=NmR2rS27;
 spf=neutral (domain: yahoo.com, ip: 74.6.130.229, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772824188; bh=SXZLLjuTaJZoeTinFccz325zcfTDnzvUZyNuZjixVi8=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=NmR2rS277EGWwbfrIfCU1oh4RwE4oNhQkG0050DfEgpbonq6FHxPn0ngM+kPLKbDEZM82sAkFnWtuqqVU/fa18WfCTMrN4T1kDmqjHVu37w1qvgqwE/x7i7xarhDr5pK3+zQOIpzRnubmRvp0H+vUetZup3a4ukucEXp5K4XJyhkKnZi7753zJC8xtIG/7XVnZ4HUfB9X6OdHGAPUlsnxadlNpOsWCUpIkVOcIF/KEDYfyrc9R1SXJgJv0/iB3VJAXoFVP4RhAL6aimkF9wWvP5P6JI/pq+6MXMDsgj8nxNr1lJBi6oUE8w9jPTrEV407ReKIh50z90YYH85mfULbg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772824188; bh=LkURBfQ2Fl0oqdsCnrvcncgfqQ63CdZgokuLbNUypsT=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=QGvVpLY95RO+OWIpA8DmVQ0MNiTuSxMZoYCzDQq5FWO4SrAAc/ziNk1J/lNQCjfXeRynAaMHC1z5GD/LqAEdi9aECvP/77cZMjl4u6CTYSNABbvDkmsOft0Kb3Xnek6QOh+KhqkMansKl84hzwZdmS7u7YWw9Q5oHqM0vb+q9Yt1EM341WeF2YruuYnzPkYzO4IQu+L2e3/u3NIltLjlaYzkLbKJH24R8IkseYy10fzIdA3hSQXhiJoSS4mfaMNGf1cA1JWIQ9hugildCelS+/1BBaNRaxOa+DHDHD8EKI8XJOAveD2E5Dkl/bXkwj+Ht9bBgPu7pR+3TrkemFLv4A==
X-YMail-OSG: iMECzbUVM1nbpm5rgIzfYRZpPh0O7HOMY6g.IRsvnQ3o3faGGdKyiTpieD4kaID
 OeCm.i84iZP0NvAjXa6YxSx3lP6CoHpzVauLz5Qwe2hD.TA75nLh6n2yx4YQEE0y2SaApqIu_.hT
 1ouOzW9.mgLfX8nHapOAWnhPYi7Lw9E6CLrGw.Pef3e_a8irNXVHGnuunLHgaMQX4a8IBtW62koC
 kONU19GLPgafd8z1KiPmKX_BDEQtAzPUQ0qTpYQfyLL9iEjtMSqKuz3UXlOkDc42h7gsrK5ADoY7
 IEsOHI8K92ACQ1WVtdzap0TW4V0gmsQ5cRrrB8MzedySb8zEdiQqdZ0W.w5VU2LJC99Typn8YLFw
 lm9GDnG8Rpb9OTKTJHGkcGGCknTXZkv0htcHI40SP2Od.3Kdvs2YGgsTL0InTqO9HVKI4sJ1cqWF
 HIYop.JoAjI1VzKIGS37dTyrRwPraDqjwjjzvHsytotSXFB6ujEETKbA2SRHznrOM_ub6qBsDJgj
 WOUC8GA9UmN.Mes9TKANrZR_XRS1l1ghg3.LjOLT9TNSsqzfD_UYtF2ykSuGjyyr5IWSnqNlegiP
 MiRET_ZSE.s7hQNmuZvs50r5kqzOJZfpFwr_7yBtcHjQco836Elwpuc.njgzET3jr41a9ZxY1vmg
 L8JLMvTe06lqLC0sKxQfjhTN1m2vZv3MjOS91n1AIH5.fEhQ446BaPEZkdUC.LEIS9_ubf6ha0jd
 REXKwoqPg1rfhbVOj9kH67FdWtIdYlorJD6VlwMyHkOn5CZheKyLD1Ew0aj69SGVe6p8xiTnMMrr
 ZMCzlPpqCjijwXQ21nOHR0FKdHl_muV4G_CeMVCyhwyU1.0PEvTT5ZMIMjnBlJ1MMt_WKTSFgM7T
 DFyZvT8JcMMrdNsqqf80zpsAFDyoqOxGEqDTGzmEzmVnn73PhkWCtEtOrQtOLmR45N7HOgQN0bA0
 COvySwXS_02BzBnzP7Nsnb9U8g35BdBNcMr7I7Q2g8zCPrKyTxC2vKCnmyvWcjUcsbicz8ElV3cl
 F0mp9Dxsi7XzuJ0oPVvn82oKwvXt.DmLpd8E7ZzAapSsXYLiH6m.Svyauy09EOFH6aEczeLPgcb7
 XcTHqeglVCgdMAUkxMUJg125QMINabpkMtxkasUN5ciW.F4Xx31ArxFebnVEqsLJUJAVZoi2y3VB
 3JHfAkiHEmoNDHxmMQvbl1BodsQwCTjRGF9.9H2XY3lGilQZt858NUtHp0yDSNua0BezQs00Mqac
 _LFpTx3rzp_1dVr_FcplFpZwKuC2XUYTXTFf6F5MPpgQ0F0mGycbwURf3Rtkk2xeu9bQjJzROi69
 FmfIwk1eD57XkVZBa0d49aCAKXXZ8yS_q64i4vsS9U6YUS6e0a1Z66lIk.M3FOXSu6Z3tgI.bFJt
 DJ8aC6ambxIac9f_9HbGEX9CjP_WIJNbayxKyirHOZZKmkqjnP8lVK815odzuVOaRc2NFLEXWDEj
 z3kuSe4eh8HD6tUSqWCeu9maF9J6cL_irxm2rYIOWJAL3xXGVxaMh3FEx2RqepNFgFEAXdHCwhos
 HJLuJ39JE.OYLPnHRlFFzMlQBaE5DxtHPdET5SYZ2v25R0FTNVyZPJ0GGB8kdBnnVYr7fZ4Vbs0R
 JAgMUZjfU57iM1KnqMg3IwBU7BJx4f_2ZCLPhLdaVUSshOL1.kMaosJCjW8xazGp8GRcDfCPrbeo
 f5I3ZEWn0kp0vdiJhIOFvL9w3ya1NqndAUn.Fp3prC_E0iikqWbnHThYwxECfA.mGwvghFMOn619
 UxQEQ5P13jrhs4GF8wh_bLCQsSOFVW.B91pju_As5KXTPPxgz53G9tX7zXt_oL49Kf8mIOC7x6EN
 2iGlogZwKffpe8chdxSahSB5J3hfTgflIk51WZgstsDezoWAc1QR4ZWLr1dBf..KaiD3VwwfgKR2
 itOYibkc4Cl_Lr_tFMINr.TZUbMbhdKsanYjeEXdJIdpnExE69VSxBq2H_nyc5hWbpsn.LbVg.N1
 88ho8B_0h5V_04dOW1CLlWlE48IZR9nUGkSKrUWFo4NYl0jsFjXhLUcr6ifZPcUYNkktYKzouwUm
 dt1YGmuDOSDcM1CClSxdUBTYL2RUxBuTYoAPwsotylVHCnb9qYxrAbKJBUNKZ9cKaUFS56GM3LYa
 G0QlibaDIU_adaZd0.5kldXzWUPocGbNZjkNY6erJpJABfKnooVozSO65B3STT8l4yYimxK_IVbz
 I_81tuhlsXU4zoqIHcaZx7FlsNvIMAAdBMa8Lz77xo0NuPQtrlNkEpU3Zic5GKxu6MvuLO5C7z_I
 yY0Qaeuxbfri4uSk4ohgMA5WjMfWZRvqIKohGCPP_mF82gH9Viveid1Pp9IaE32BGNnPEM1Mxqnk
 -
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: 3f2f0926-3667-4434-a056-0efda5882fd4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Mar 2026 19:09:48 +0000
Received: by hermes--production-bf1-697f88457-frrfs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3e42c407ad661ab34fe1047b65e0bf88;
          Fri, 06 Mar 2026 19:07:47 +0000 (UTC)
From: Eduardo Ferreira <eduardo.f120@yahoo.com>
Date: Fri, 06 Mar 2026 16:07:34 -0300
Subject: [PATCH] go 1.22.12: Fix CVE-2025-61726.patch variable ordering
MIME-Version: 1.0
Message-Id: <20260306-fix-cve-61726-patch-ordering-v1-1-4679209c6d85@toradex.com>
X-B4-Tracking: v=1; b=H4sIAPUlq2kC/x3MMQqAMAxA0atIZgNtlSpeRRxqGjVLlVZEEO9uc
 PzweQ8UzsIFhuqBzJcU2ZOGrSugLaSVUaI2OOO8aYzHRW6ki9Hbznk8wkkb7jmqklacKbjethS
 XNoASR2b9f36c3vcDkha8fG4AAAA=
X-Change-ID: 20260306-fix-cve-61726-patch-ordering-bca2814cdf4a
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>, 
 Michael Pratt <mpratt@google.com>, Deepak Rathore <deeratho@cisco.com>
X-Mailer: b4 0.14.3
References: <20260306-fix-cve-61726-patch-ordering-v1-1-4679209c6d85.ref@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232592

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
 meta/recipes-devtools/go/go/CVE-2025-61726.patch | 25 ++++++++++++------------
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

---
base-commit: a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375
change-id: 20260306-fix-cve-61726-patch-ordering-bca2814cdf4a

Best regards,
-- 
Eduardo Ferreira <eduardo.barbosa@toradex.com>


