Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F902CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71893.1781274409892009909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y6BXTydf;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef29c5561so518691f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274408; x=1781879208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjufYGpPW8WPsgiR3Xt8rsDvXww/9sPgg71jfiH1xHY=;
        b=Y6BXTydfCoo6IXIv07X6y9zfxCQ5wu3/v/7WrFRDNfL5piLow1IaetR8V9YCfliTzn
         hKGBU9YtEPzrZavo/KEhKkFgbEEXWwIXe3Yf+4xnDuxGwT5yN9UF/U/yxeKWYNAU6LTE
         AQqTULQ5J/otPyyyk0ZRH/B/bydytPlGUoEY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274408; x=1781879208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjufYGpPW8WPsgiR3Xt8rsDvXww/9sPgg71jfiH1xHY=;
        b=pRfsE9daLDlAnQ3p+ZgzHta8tHO65O+ixpWVEbuBiFiIMh+6zXhA4isrOA+8pQ+mcW
         YeWsELeyhNrxZX3pegXRWxmB+zWdJG6O6vt3AZBd06iuhT9PP9Ysu3G+wzw5B9hqBWbR
         0cjRn3jkNrkfKOs31/55lMZQl9vVdq5kynf8We2S/1BLQqtrjtL3RvImkgftOcnZEYQt
         AiE+uMVt7cfRm6QclVrZSm8pjqUG/wVphpi+TaPKZ72IHwAogqegnzCSBw8Fh7gQprbW
         2+hz3cKZr2UI3MR887Z4OcHjrac+9dyIaTT63cesqfgG8gUu8KujVzKCZXrkTRzss0/T
         kYwQ==
X-Gm-Message-State: AOJu0YxYOD5ptbVZJ2wdI5iGE2LPey13l7c6Xw+rSVnhLB0j765fcKkl
	0L9ntPrDyHYHy7DrmwMFLoaq9cOaRNQMBZhHJsBA+za0OVE2DoLqavlYcuKbB6Nep+Kqgfh8/1N
	eq3LUwg==
X-Gm-Gg: Acq92OEymBSyRof3yV/gqUoFUp7KvydeV9XmK69QssQOiIt5Eat7pmEx6lg5+QAYTcb
	jn1gvSxl3op1uEfszuCMgD30vS/XWodxA3s+ojmbTNQJm2kgQ4gSK7RmHKLu8q2MpiHa+OAL3AL
	Ch2PoNEt/F6pJOichE6JF1EIKiOXocfW8LwrbeTLt99yuM1YIZsWEUj3bPsmqZg+2R9e0vpSQ0W
	xNhs7gYyNRWjKtgSUBqDJ7aBrdrLt3IFBE9wUy/0RehJ6w3TqSMcam2uK9BxjOjJhoGkoRcEDOH
	MjJLbYZ5yGmA0d+mmG1uWow2owV2/YPAvqxMsqQmS8pcNytqkQ58hW5VnDqbzg8hRigmFGnuZwf
	K51/pCDDWLjZVzhhI7hhnjfSvaDbbZ+t29vwxBzLs8PM7l4a63cfm7F012oQYOx7ObOj6wol/cn
	iEfU9mHh9IDyR6uf9juucRRAaoQFxKYrUXeg==
X-Received: by 2002:a5d:5d01:0:b0:460:6731:6165 with SMTP id ffacd0b85a97d-4606dba3ec9mr4872103f8f.22.1781274408148;
        Fri, 12 Jun 2026 07:26:48 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:47 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 15/21] go: patch CVE-2026-39825
Date: Fri, 12 Jun 2026 16:26:05 +0200
Message-ID: <12a32ea67f2f2b81e67d2b1d6fbb00c6a1ab7da6.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238637

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/770541

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39825.patch                | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39825.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 002d443059..952c0e4638 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -49,6 +49,7 @@ SRC_URI += "\
     file://CVE-2026-39817.patch \
     file://CVE-2026-39819.patch \
     file://CVE-2026-39820.patch \
+    file://CVE-2026-39825.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39825.patch b/meta/recipes-devtools/go/go/CVE-2026-39825.patch
new file mode 100644
index 0000000000..6082f5fc37
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39825.patch
@@ -0,0 +1,104 @@
+From 96b1a3f872971fc38d9f2c0ed4a3d1f3ceeb517f Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 24 Apr 2026 14:10:47 -0700
+Subject: [PATCH] net/http/httputil: reencode queries with many parameters in
+ proxy
+
+When ReverseProxy forwards a request containing more than
+urlmaxqueryparams (GODEBUG) query parameters, reencode the
+outbound query parameters.
+
+Avoids potential smuggling of query parameters, where the
+sender sends many query parameters, the user's Rewrite hook
+fails to observe those parameters due to the limit being
+exceeded, and the request is forwarded with the full set
+of parameters.
+
+Fixes #78948
+Fixes CVE-2026-39825
+
+Change-Id: I691be7899c4b6208bf61f6b78dacfdf56a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/770541
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Auto-Submit: Damien Neil <dneil@google.com>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39825
+Upstream-Status: Backport [https://github.com/golang/go/commit/6795bb331782b33691f772d30c810b4c3a317aeb]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/http/httputil/reverseproxy.go      | 14 ++++++++++++++
+ src/net/http/httputil/reverseproxy_test.go |  6 ++++++
+ src/net/url/url.go                         |  1 +
+ 3 files changed, 21 insertions(+)
+
+diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil/reverseproxy.go
+index 5c70f0d27b..37b0eab6b0 100644
+--- a/src/net/http/httputil/reverseproxy.go
++++ b/src/net/http/httputil/reverseproxy.go
+@@ -10,6 +10,7 @@ import (
+ 	"context"
+ 	"errors"
+ 	"fmt"
++	"internal/godebug"
+ 	"io"
+ 	"log"
+ 	"mime"
+@@ -797,11 +798,24 @@ func (c switchProtocolCopier) copyToBackend(errc chan<- error) {
+ 	errc <- err
+ }
+ 
++var urlmaxqueryparams = godebug.New("urlmaxqueryparams")
++
++// Keep this in sync with net/url.
++const defaultMaxParams = 10000
++
+ func cleanQueryParams(s string) string {
+ 	reencode := func(s string) string {
+ 		v, _ := url.ParseQuery(s)
+ 		return v.Encode()
+ 	}
++	if urlmaxqueryparams.Value() != "" {
++		// Always reencode when a non-default urlmaxqueryparams is set.
++		return reencode(s)
++	}
++	if numParams := strings.Count(s, "&") + 1; numParams > defaultMaxParams {
++		// Too many query parameters.
++		return reencode(s)
++	}
+ 	for i := 0; i < len(s); {
+ 		switch s[i] {
+ 		case ';':
+diff --git a/src/net/http/httputil/reverseproxy_test.go b/src/net/http/httputil/reverseproxy_test.go
+index dd3330b615..deb1ab9ce2 100644
+--- a/src/net/http/httputil/reverseproxy_test.go
++++ b/src/net/http/httputil/reverseproxy_test.go
+@@ -1845,6 +1845,12 @@ func testReverseProxyQueryParameterSmuggling(t *testing.T, wantCleanQuery bool,
+ 	}, {
+ 		rawQuery:   "a=1&a=%zz&b=3",
+ 		cleanQuery: "a=1&b=3",
++	}, {
++		rawQuery:   "a=%zz",
++		cleanQuery: "",
++	}, {
++		rawQuery:   strings.Repeat("a=1&", 10000) + "a=1",
++		cleanQuery: "",
+ 	}} {
+ 		res, err := frontend.Client().Get(frontend.URL + "?" + test.rawQuery)
+ 		if err != nil {
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 5219e3c130..41f3bef1ee 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -961,6 +961,7 @@ func ParseQuery(query string) (Values, error) {
+ 
+ var urlmaxqueryparams = godebug.New("urlmaxqueryparams")
+ 
++// Keep this in sync with net/http/httputil.
+ const defaultMaxParams = 10000
+ 
+ func urlParamsWithinMax(params int) bool {
+-- 
+2.43.0
+
-- 
2.53.0


