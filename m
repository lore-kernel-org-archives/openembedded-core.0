Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29751C4167D
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.1040.1668704110057355159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WxeXGVgH;
 spf=pass (domain: linaro.org, ip: 209.85.219.45, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f45.google.com with SMTP id j6so1561405qvn.12
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVBYxDL5qIePep9NGxLFVXquK98SgMPkBp/OpVvrkTU=;
        b=WxeXGVgHey9Pu0ZMLqN/cUo/cf1iULKTOfQ6SDnMKdeiVBKYoNXcPrG2878JRzX3G+
         as+KTW7kjKComXahjjrC9BNEQTW73mQv4nTjgugV4nPYuQ64DkveqhBhNaxjUy2Uz9Oc
         Cpy7MvLE3pkR28xQMk2tD3N9tgpuEKF3PMVe5YNqXbAyzFPSmFfgTvfqT1gxl0ZRzsOu
         FllLfWOlyS6IhMww22t5CdlBk3CPCQlQzJx4Zn0q7zkfFMmVA/QnzVJfewbOK3nTpQtL
         efbisS9uhmHMvP74swa8Bwha0xjoA3yR/d6RNWYeevxts9cUHIfnQO0EXCvURV8kml3+
         IM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVBYxDL5qIePep9NGxLFVXquK98SgMPkBp/OpVvrkTU=;
        b=u51VUdq/uIqSgvr9yZuB44lOSduCgrQgxfynxtjaZl1xtHnoweArmACwbG83i6OWh/
         Dro/1pH/zXiqQaqOlE3T/sPkICHBsUGgbzv0bf+ENl3RlxhoTsg34sfEbRVtMCaLA0rM
         zqowctC2MxialYc2dK0zpsuaXEXks1RS/u2HDarlz1ZMWe2+U0QmUwLSpVee9JHPpwYe
         vYFT6YW+cPu09CaYTl90jubI53HFq1WfBxCWYAl26kEayK6+wqg2uY6YdMEedWi1o9fV
         KgdaK/sqpmBKi9bC41k6mAnwQL/t5Uz+mZnFpfcey4MFDbB5gC7V6rNebOgXfjre06nU
         3i8Q==
X-Gm-Message-State: ANoB5pmtHiLJErffCbTZ0Ppuppz4WbKNOym1soaXaSq5fho8CXh4HyEs
	1+HTFHCJapnWL1vFsEuScPuTva9pkOcAEQ==
X-Google-Smtp-Source: AA0mqf7hTp2mIPywhdoi7oBqqMOHofzJ1y7lOPfBJ9/zr5a3pYWyg31SwqIpCS8J9v1fivAmJKwj0g==
X-Received: by 2002:a0c:e810:0:b0:4bc:10c8:96fc with SMTP id y16-20020a0ce810000000b004bc10c896fcmr3157480qvn.120.1668704109181;
        Thu, 17 Nov 2022 08:55:09 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:08 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 05/11] golang: fix CVE-2022-28131
Date: Thu, 17 Nov 2022 11:54:50 -0500
Message-Id: <20221117165456.1029099-5-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173438

Upstream-Status: Backport [https://github.com/golang/go/commit/58facfbe7db2fbb9afed794b281a70bdb12a60ae]
CVE: CVE-2022-28131
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-28131.patch           | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index d670d637cd..ddd08ce0c9 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -46,6 +46,7 @@ SRC_URI += "\
     file://CVE-2021-33198.patch \
     file://CVE-2021-44716.patch \
     file://CVE-2022-24921.patch \
+    file://CVE-2022-28131.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch
new file mode 100644
index 0000000000..8afa292144
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch
@@ -0,0 +1,104 @@
+From 8136eb2e5c316a51d0da710fbd0504cbbefee526 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 28 Mar 2022 18:41:26 -0700
+Subject: [PATCH] encoding/xml: use iterative Skip, rather than recursive
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/58facfbe7db2fbb9afed794b281a70bdb12a60ae]
+CVE: CVE-2022-28131
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+
+Prevents exhausting the stack limit in _incredibly_ deeply nested
+structures.
+
+Fixes #53711
+Updates #53614
+Fixes CVE-2022-28131
+
+Change-Id: I47db4595ce10cecc29fbd06afce7b299868599e6
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1419912
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 9278cb78443d2b4deb24cbb5b61c9ba5ac688d49)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/417068
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Heschi Kreinick <heschi@google.com>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+---
+ src/encoding/xml/read.go      | 15 ++++++++-------
+ src/encoding/xml/read_test.go | 18 ++++++++++++++++++
+ 2 files changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/src/encoding/xml/read.go b/src/encoding/xml/read.go
+index 4ffed80..3fac859 100644
+--- a/src/encoding/xml/read.go
++++ b/src/encoding/xml/read.go
+@@ -743,12 +743,12 @@ Loop:
+ }
+ 
+ // Skip reads tokens until it has consumed the end element
+-// matching the most recent start element already consumed.
+-// It recurs if it encounters a start element, so it can be used to
+-// skip nested structures.
++// matching the most recent start element already consumed,
++// skipping nested structures.
+ // It returns nil if it finds an end element matching the start
+ // element; otherwise it returns an error describing the problem.
+ func (d *Decoder) Skip() error {
++	var depth int64
+ 	for {
+ 		tok, err := d.Token()
+ 		if err != nil {
+@@ -756,11 +756,12 @@ func (d *Decoder) Skip() error {
+ 		}
+ 		switch tok.(type) {
+ 		case StartElement:
+-			if err := d.Skip(); err != nil {
+-				return err
+-			}
++			depth++
+ 		case EndElement:
+-			return nil
++			if depth == 0 {
++				return nil
++			}
++			depth--
+ 		}
+ 	}
+ }
+diff --git a/src/encoding/xml/read_test.go b/src/encoding/xml/read_test.go
+index 6a20b1a..7a621a5 100644
+--- a/src/encoding/xml/read_test.go
++++ b/src/encoding/xml/read_test.go
+@@ -5,9 +5,11 @@
+ package xml
+ 
+ import (
++	"bytes"
+ 	"errors"
+ 	"io"
+ 	"reflect"
++	"runtime"
+ 	"strings"
+ 	"testing"
+ 	"time"
+@@ -1093,3 +1095,19 @@ func TestCVE202228131(t *testing.T) {
+ 		t.Fatalf("Unmarshal unexpected error: got %q, want %q", err, errExeceededMaxUnmarshalDepth)
+ 	}
+ }
++
++func TestCVE202230633(t *testing.T) {
++	if runtime.GOARCH == "wasm" {
++		t.Skip("causes memory exhaustion on js/wasm")
++	}
++	defer func() {
++		p := recover()
++		if p != nil {
++			t.Fatal("Unmarshal panicked")
++		}
++	}()
++	var example struct {
++		Things []string
++	}
++	Unmarshal(bytes.Repeat([]byte("<a>"), 17_000_000), &example)
++}
-- 
2.25.1


