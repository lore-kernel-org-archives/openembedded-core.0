Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B30DC83F05
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.25252.1751466330704208306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bGeMucFo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313154270bbso4753794a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466330; x=1752071130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDf5OZPHec+BveeuSeuRGoZtDRFi9Snih3XUg+rV3Ns=;
        b=bGeMucFoXlxLkCMDlhmYXrk8W215Blf8z5sgTqXhf0ryehfR3Pqd9hcFPvSOsJeRJx
         0YTrmnJU6qNnm2NLCyGMB1qt66mdmID0445nSg7CihgM51ow0k9Uk8NDaRKG/woeQNPH
         DDGa5UNNvCU9GrdxkYZly3x+7fk80HS+AP0AO2AlD67tGaa+2+DJ0Jor7vEw4MDVHQ01
         NYDhImP2FmiTdn8iR/VlIB+lM3Kvaws1fFt6tsqX5Bpy7DAt3EW7he1jXWG5Fpu2QVFn
         Z+oe57WBaqEAwJyg2y4f1xF2o/0HkQq6nrEppkkfiZ8jmcbtXdxCnXiFRvB9Cpt5Lfw+
         NI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466330; x=1752071130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDf5OZPHec+BveeuSeuRGoZtDRFi9Snih3XUg+rV3Ns=;
        b=rvaiF3B+VFTvcVlpmapQixtUnXTw0+Qni5jodyDBajjo1ijs+c7aLiLZXsETpFJNpi
         BOgIqkUSl8UuMvLmV76zc6s5wFWyJWCc4c+bCnaxEo9aF/vZh2z9/R0mPNCAXsS4XM3H
         NVT4FVa63GxoSxBPzRZqfwsYpZhrYpyj+E/34ATmTvbSevgYgTSN3rLpwVTcnQ8wqQKg
         n93/DEF1a0o3wiBelUJn07vwFT9faqbHvbKVAK60/3tFmIKaDy4nh+NhRSlhS0ugNrF2
         B5vCCkf9P7TiU3yi5a3SOQPCRB4Jw5gD1fDUvfaGhiOmxjfKFiD4HKgEjuLQ262MOIyA
         i0cw==
X-Gm-Message-State: AOJu0YwYgXNQ7TBMdcig3tuItrQVcZ5/5VKids7QMKKqoxC/dfZjOrjM
	j6z+QzXa/9T1XJ77HsmUA7igLXmPYNuPWKq5e+0FAdNzkR6hYDJdE4cP2DXIiB/qS6+D72wIAG4
	fDBV+
X-Gm-Gg: ASbGnct1rf7nutdRQy4h6RUNQEZ08eDgNYUSPD/d4qtsu+BtMnslpiSZlbcfKrNri8/
	FTP08/I0+adEhhlRftae0xnR3uzAY6yIi/fxhzIc0DtJQCuiv4G2y/Er2fZ0a8ENJrQswxxRcOc
	Kaks6ofkUtLM0Q8SOjxgmP8I05AN3ztJozqt9HGtj7/HXZqaWOvgRbdvXaR1FLaokVQ56BMjcYD
	7jtV0tcXBA6zqQqRriKw0Y6JpZKIcu61RV4N47/0RGmxEpZJrEzX7Gvi9M1RhZ3bVnLrjEiDLK/
	fPEzOdcrwlf/n5ohE3s05AMapPNset2FrVS5a0On2t31CAax8HXwYg==
X-Google-Smtp-Source: AGHT+IH2mRORp+mHAgOflE4z4nIIYGi3GMHkgkDSpCm/pxElDA8b06yF1COrB1kdPNVJD1F29sBxpA==
X-Received: by 2002:a17:90b:1847:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-31a90bddbcemr4795155a91.20.1751466329871;
        Wed, 02 Jul 2025 07:25:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/9] go: fix CVE-2025-4673
Date: Wed,  2 Jul 2025 07:25:15 -0700
Message-ID: <72279bbc1ff2d85563c5245195435f078c5d1a68.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219834

From: Praveen Kumar <praveen.kumar@windriver.com>

Proxy-Authorization and Proxy-Authenticate headers persisted on
cross-origin redirects potentially leaking sensitive information.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-4673

Upstream-patch:
https://github.com/golang/go/commit/b897e97c36cb62629a458bc681723ca733404e32

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-4673.patch                 | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-4673.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index b154aa3984..af09cb52cd 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -16,5 +16,6 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://CVE-2025-22870.patch \
     file://CVE-2025-22871.patch \
+    file://CVE-2025-4673.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go/CVE-2025-4673.patch b/meta/recipes-devtools/go/go/CVE-2025-4673.patch
new file mode 100644
index 0000000000..5ca4fec3dc
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-4673.patch
@@ -0,0 +1,68 @@
+From b897e97c36cb62629a458bc681723ca733404e32 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Wed, 21 May 2025 14:11:44 -0400
+Subject: [PATCH] net/http: strip sensitive proxy headers from redirect
+ requests
+
+Similarly to Authentication entries, Proxy-Authentication entries should be stripped to ensure sensitive information is not leaked on redirects outside of the original domain.
+
+https://fetch.spec.whatwg.org/#authentication-entries
+
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for reporting this issue.
+
+Updates golang/go#73816
+Fixes golang/go#73905
+Fixes CVE-2025-4673
+
+Change-Id: I1615f31977a2fd014fbc12aae43f82692315a6d0
+Reviewed-on: https://go-review.googlesource.com/c/go/+/679255
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+
+CVE: CVE-2025-4673
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/b897e97c36cb62629a458bc681723ca733404e32]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/net/http/client.go      | 3 ++-
+ src/net/http/client_test.go | 3 +++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/http/client.go b/src/net/http/client.go
+index 23f4d81..e07616b 100644
+--- a/src/net/http/client.go
++++ b/src/net/http/client.go
+@@ -805,7 +805,8 @@ func (c *Client) makeHeadersCopier(ireq *Request) func(req *Request, stripSensit
+		for k, vv := range ireqhdr {
+			sensitive := false
+			switch CanonicalHeaderKey(k) {
+-			case "Authorization", "Www-Authenticate", "Cookie", "Cookie2":
++			case "Authorization", "Www-Authenticate", "Cookie", "Cookie2",
++				"Proxy-Authorization", "Proxy-Authenticate":
+				sensitive = true
+			}
+			if !(sensitive && stripSensitiveHeaders) {
+diff --git a/src/net/http/client_test.go b/src/net/http/client_test.go
+index 641d7ff..97150bd 100644
+--- a/src/net/http/client_test.go
++++ b/src/net/http/client_test.go
+@@ -1541,6 +1541,8 @@ func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
+		if r.Host+r.URL.Path != "a.example.com/" {
+			if h := r.Header.Get("Authorization"); h != "" {
+				t.Errorf("on request to %v%v, Authorization=%q, want no header", r.Host, r.URL.Path, h)
++			} else if h := r.Header.Get("Proxy-Authorization"); h != "" {
++				t.Errorf("on request to %v%v, Proxy-Authorization=%q, want no header", r.Host, r.URL.Path, h)
+			}
+		}
+		// Follow a chain of redirects from a to b and back to a.
+@@ -1569,6 +1571,7 @@ func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
+	req, _ := NewRequest("GET", proto+"://a.example.com/", nil)
+	req.Header.Add("Cookie", "foo=bar")
+	req.Header.Add("Authorization", "secretpassword")
++	req.Header.Add("Proxy-Authorization", "secretpassword")
+	res, err := c.Do(req)
+	if err != nil {
+		t.Fatal(err)
+--
+2.40.0
-- 
2.43.0


