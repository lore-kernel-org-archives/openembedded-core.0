Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7DAF4181D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:07:07 +0000 (UTC)
Received: from sonic310-14.consmr.mail.bf2.yahoo.com (sonic310-14.consmr.mail.bf2.yahoo.com [74.6.135.124])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19748.1773075850188286444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=k613cj1k;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.124, mailfrom: eduardo.f120@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773075849; bh=uwaaXyIufDUeq5YYSkpIDrQksZNchG253uQUBfSIx4Q=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=k613cj1k7CZF64V00aPlQhXebi62EvQ4GkYQeazmaU42QiknYAHwK2vC3S4TByCwwA2Yvi7R+rdCMNv0e0iQlc4QAehls+jxWGTRKINF4QSJ7YSi821Ybq9VL1esRVs4cRCaClW3QxK27ecAPD/wMy9pRPc/H7ZrQiQQgDZvjEeQfDUrVhJJehHkSQFjwl4vOkyYhSHXTRLFR1ujy6j3jaAC2IiSjw7ETFOv0aTXpylxu6bjQuZZ65Kt1n0vZjZ/nvzNuh72FIvrSSDacFeXX4Pa4nztfojNgl3hxvLIraEVAmey6n+KCtSpZQuiSUOz2fX/f5jjNrSxOhjkN4vC3g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773075849; bh=hcR5pm0sVaOrFawpzJZwP+2x8yyhGMSWu+kDsdk3Y+9=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=dTLj4nImMpvcDCybWTakA/f+gCInU3ba7NK0vX18htmiF7r5UZvaIJRwsFYbdGYi1b7RKdOPDcUGM76AMtO+K/3zAFCPGvx6xMlf3DAYFr5h0GnAnTAvRifq+WNTkjL8vPb3XuXxoi8fgPgrR4sR9dISoIUbAH/DONr21UqA5coRPWfgET+B9NjHB6rqgFXAgptYt8iPAesn7L9NJYlvoTbIIZPQJM+i3ttlhmLwL7EBDqknT9vXqsUoT2yziH1pxrx5xY4EGwaAzedo45Lff3tq/ddE6Lveow5H4R+WRkitbhx8MijutFpoeP4oa5gCsi8gtIUBQmqD1y5ZyYEsFA==
X-YMail-OSG: 4SJqecUVM1n7R4lsPb0FrtDHRLxYmPDvEU8UTyVrYmbuZ1DYuU0Wbg9tXmqFnb4
 cL8.HNqgvLGZm4S0OTAhFSJfZIcQyrsj_JbtZ7TJPRa3BKL54T._T9.hJtVTkaU14e39orbR89k8
 LxWh43ZumZlxMi2hX.EShWco7lKiTQA.JIp73qAJ9pxSrCT5LIfo7eJP0Vl7.oynYlOpMWBHytfZ
 zjnTgq3LdIEcgCfS1kdrfZfQ_.rZUpZG9UveqF.OiwyoIezuVxQoDiAww7Z6CAgywbQbFDFDtW5W
 NqVo7.aq.1YSs8SQz4Tdc0VC8_HVbKd9WSJV2BAbXmP1_kEi43Z56WsAgY3V9QfQVDiT2GiFj.mh
 PaNmr9.hg4ncjIq34GCBbkOY7kGSHhDpLER8yAcxPMmp2UjwhLc6PXluxdh0G6hue60HRicfeVU8
 iuuu2Mp81yIFx2HuJnkLlTTIY5Kwe8In5W66rWKzXzZy65boR149lvwD1pChcPQS2fN8fDNiKbll
 T6NkJMPw4Gpf6a0E7JVhlej6cq309Wt3RxkSQ.t7Mk5JofYAhI5tHW4kc1s3Qbstdkm8XAgHohDl
 0pCZTp.SHCcA0Prov5oSVpLpiAZaPNbuF9z0gInAEypiIjtSDlJsxaZNw519pZwnz1GZIjjHwRoh
 tH6QoqEWwI.AE2G.MjOQmIFOXDZlJ9BF6XcdogbHTWziqTksM7l5UVOFLEOAUd5MNr4t4abjPC_Q
 HfAcogfCH7M7y14RkreYNMSvRzSfya1JB9ZpiOrIWn0h1Iom2zVVA1pMkAdS1NFAxEdDZIApsmPG
 QS1vLPysLsc3iiAu16occLE4u1BKx6SBCopJEzqA36ttLwzCghumL1tLQrZeEjwO22V6inGHgvAh
 CPoOv4JoJ6HidT_czcLKn7smwLPSKOQLybI.42xRLAP7POiCC8MhMViOtA3LylamG7FyqP3TAqsx
 BuQ4uZIYGS4CO5ZF6jjgJEqJdBjjbM9Of8U5WzxLyKia65uZvfJ9.9GjENKrf3rIAdb30ZMCdgnL
 eMPoNdeL_eqC0wLN4OwDGalAUCYike_BHYRQAX8LahevT0UcBqfCEa7h4xgwNXwUHUjBVsf0VJE9
 rvRrdBSZKyg7KZcpdD7FKlIkhaZddGvXdVLBUJfnxaK6.5fTE5_yVX5v6N6A86DS0Y2WEnvawjD6
 7HxJ5NbppuJt8iTR.FJZRzm3K02vRYjoftsRcKI0i.YcO.AIrgBeZLadSz2ReJbqNc1ql6bpZ1cR
 4gS.ZNMpM6rJyUeZL2Zk0YGE_pht1pZimFR4y0mhZP_EA1R5.gbLsIheQxFx7K60Gz7wAzH9xWG9
 pdfCY0CXQAHaF_gw4IFg4YzAwNmZ30uOaq1bBsUI3c2_Md098vWWc7aTtLnOXlsEc2bEbSMt5wUv
 2jhmynZyAjn5q55GmP4hECFifACGIP9_HM.s4Pm0hbno01sAqcH6C_hgTV9GmPxf_5K.uZAqQZqU
 XTMmp89vrAULxKevuA0S1F_jA.Ee4ALTQl0j3l0df3VCRpPfB9D0QZBs7Blr8Yf.nZq93s9Op35.
 DU0k2jCViy5BV.OoHNhY..jk4nfq4SdOZDQaT9gsO5f2KIAouiJwN770kyQTptJodkpQHgSxgQ09
 8nS_3JnMxwk_Kt9NxeE265YoTZqKRO.eQ9Vzr29DgN9aSniL1l3yCz4Cpc0Vo.ljEqtC1GZzjEwc
 I7vPvLD_g0rUrrerGGog1cPk2Odq2kHdMVaXxYks4I_uRjTq5I3QbAbgDqjQUERzTjjX5.hbL7bg
 mJ_I47fPkO.IpKVUPuGav9xvfnaU316HiM.gm853jDKwl4c34Z1DS.kqvMPg0ygvFWf4y45.Em2t
 nbtgJV0k01GyDaXDElJXDUa.zWTeMqUAEFfWtdSGjQ_X5xq1DdbS8nm8dChLPkxdvsnRKC_Acr.P
 IlLgVsUeaT7TD.XLfytmUs3W18CvO0Z72h.rck4eDzHZJk4s5FG.IXstocIr1Bm2VJ39dpg06zGp
 uoMTV2ey9ZdII4sbezY0h4v_grud.Z6e5kcKC.Vl6a6WupZZ4t5C1aFlU6s74foUATchZYHRyoxf
 .DQ5r1UXh_hFbR.XXGg1cV5xXPCC7dm3Cw26m.MURld.bb6KKbZn3XkBSfsIP9FsXb93qIdWX678
 9EwXfQQZMFxMXE9_plxuZLPYaQvieNbug6glWoGSbioMtrL9S6wm0yCNuoYQA6IPgEa.r0PnIxxF
 GjeNFvOl.LTG5paXSsjE0fuAeAhgb_1JaySBen0bp1PKbwkDDXsOtw9GPbkdJtuo958ZdcZ0qCvm
 rnoEFYAdGct9aXPqo5BmgwFWKR.Zq39Or9m0-
X-Sonic-MF: <eduardo.f120@yahoo.com>
X-Sonic-ID: 1cf45579-f2dc-4c0f-b3f3-11cd7ba3ac15
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Mon, 9 Mar 2026 17:04:09 +0000
Received: by hermes--production-bf1-697f88457-j2qvt (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 044e4c41307db729c31fc9dd57381a8a;
          Mon, 09 Mar 2026 16:54:05 +0000 (UTC)
From: Eduardo Ferreira <eduardo.f120@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Eduardo Ferreira <eduardo.barbosa@toradex.com>
Subject: [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch variable ordering
Date: Mon,  9 Mar 2026 13:53:50 -0300
Message-Id: <20260309165351.311700-1-eduardo.f120@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
References: <20260309165351.311700-1-eduardo.f120.ref@yahoo.com>
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232732

From: Eduardo Ferreira <eduardo.barbosa@toradex.com>

Commit 6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)
introduced a patch backporting a fix for CVE-2025-61726, but
this patch also introduced a bug.

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

[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20
[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L100

Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
 .../go/go/CVE-2025-61726.patch                | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
index ab053ff55c..bdd10bc933 100644
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -1,4 +1,4 @@
-From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
+From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001
 From: Damien Neil <dneil@google.com>
 Date: Mon, 3 Nov 2025 14:28:47 -0800
 Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
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
+index d2ae032..cdca468 100644
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
+index 517ec0e..88d6d8c 100644
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


