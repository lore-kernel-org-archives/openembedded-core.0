Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DA0CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19436.1762873125006093458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zsFXWFfM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so3018040a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873124; x=1763477924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpfbwH+Qzdd2H7DupNakfnLty0xxekGy4I4OZlADvQc=;
        b=zsFXWFfMcCNtNk/QHngzgnhTvSVdKxLTJr1A/1XEuHXBk5FNMJSaErL1ZQB0c3PbzV
         NHdjKHUVA0CWBXZbg8we/jpiSyGGh/fgOfyqTjV9JkTnBzg+6pPb9f41N8CZL4UVBppr
         eCHp9egMb+6tJ2e0VARKQJORIl+63NjlOn7z6zYYCilZtETgWOBTVjlrXWR1V5ft86Kf
         ZUCLiuWtUaX7vhw78B7735xS2r6cy351qSB7lyi+n8fFlYfXoVVeWgLkuIqo43yfOjOH
         5kemxIZaS6/0hwuX01/BhTnBsnixYqfphNy4SHyupvzf4yzBa/g4q7hjsyQVpM3QStx6
         kd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873124; x=1763477924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpfbwH+Qzdd2H7DupNakfnLty0xxekGy4I4OZlADvQc=;
        b=jKmeY4yEM2UNhJF2/T8diMjTAlZSnYpGcY+7qkhBHdCZnVVHHvjVOtsBqA7EHt8Tis
         +cqAJObzaJgoAB+eLdbfMIAM25PEpWQhOoUU27J+nRf+2K3MvXkbhrlNhcOb0idHNo5a
         N0S9CKfC4K9V9ZCqLYuPt1e+yye46rG7vNXNAEC4eyG8FwM9msfGYPUrRWpeioXLVYOA
         75rwb2f0NHlpPuzxh/VRp+Ey+68d3hhDaXZr/Z3wvKcaPv1uNs07c8nuzg8ABqAE/ay3
         UEBqfRRq2Ws25J4JhS4T95fHLGdx5GrS0b7Dv5xWsEYjNxPzDgQDNChfTqoZeiYl8C1u
         F2pg==
X-Gm-Message-State: AOJu0YwwmM4XOT5dddxGVA8OXmB6BkN9gq92FJgYKvu7XDZuDANVRrND
	7gK6GlBTJcd2HHDlNBfLgVF4TAoYSleKbJ/eKs0YvMvXus/9ZR+71LUzAXhvpQ8pTYDS9N36rRe
	3K6kw3o0=
X-Gm-Gg: ASbGncuiW0Kiqsx/h02KuaasIW0ta7KZxQvsKWeauBSNT2DKT5Lwfr+jlPECQqaTa2C
	Rh1ACYYcy5NTS/okkiZWWn8ubG10TasU9qov6h+ZZm4PUn5JYB1UPs3Ry5vi2DYJvQ98MwzQmC/
	TR9i2Hrjtcoxxn0jp9jfLnt3WSUypkRYXl3aw8qXcRt/Vr1AJqcjPBCv13NCkRBoduhboIuaet+
	ounZ/THyWF3xfFqqLfN2ThgtpBTUEMd0cJsz+Syul+lJOw8eWSJELKCqST6UnXwGq/z3cBbBYtw
	mqiCc7DB1hKOaHHBp2N4CbTPI/s6xvdvxxZS8CGIrv38TYowcXNbJi1oFieamzEnxcGoCK8AeKM
	IQR/s9u3k6BS3U4nwIzG20e6M+TIIVO6IXNIj5zyq7jTqjakKHk2mgJ2WlQtTE6VJYlQWI4fz1p
	3qAQ==
X-Google-Smtp-Source: AGHT+IHFIDpZRqkewMLWqndy19qGISZyStMxTAFnEZ5dRJhvLfHYcYsoHkIgk0yJJujEApkRwDEnJA==
X-Received: by 2002:a17:90b:4a10:b0:341:124f:474f with SMTP id 98e67ed59e1d1-3436cd0c3e9mr14444046a91.32.1762873124106;
        Tue, 11 Nov 2025 06:58:44 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/19] go: fix CVE-2025-58185
Date: Tue, 11 Nov 2025 06:58:10 -0800
Message-ID: <f27acc863ee34b56e2c49dc96ad2b58fb35e2d46.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226167

From: Archana Polampalli <archana.polampalli@windriver.com>

Parsing a maliciously crafted DER payload could allocate large amounts of memory,
causing memory exhaustion.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-58185.patch                | 142 ++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58185.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index a364e1aae8..38992219c8 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -21,6 +21,7 @@ SRC_URI += "\
     file://CVE-2025-47907-pre.patch \
     file://CVE-2025-47907.patch \
     file://CVE-2025-47906.patch \
+    file://CVE-2025-58185.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58185.patch b/meta/recipes-devtools/go/go/CVE-2025-58185.patch
new file mode 100644
index 0000000000..63250614ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58185.patch
@@ -0,0 +1,142 @@
+From 5c3d61c886f7ecfce9a6d6d3c97e6d5a8afb17d1 Mon Sep 17 00:00:00 2001
+From: Nicholas Husin <husin@google.com>
+Date: Wed, 3 Sep 2025 09:30:56 -0400
+Subject: [PATCH] [release-branch.go1.24] encoding/asn1: prevent memory
+ exhaustion when parsing using internal/saferio
+
+Within parseSequenceOf,
+reflect.MakeSlice is being used to pre-allocate a slice that is needed in
+order to fully validate the given DER payload. The size of the slice
+allocated are also multiple times larger than the input DER:
+
+- When using asn1.Unmarshal directly, the allocated slice is ~28x
+  larger.
+- When passing in DER using x509.ParseCertificateRequest, the allocated
+  slice is ~48x larger.
+- When passing in DER using ocsp.ParseResponse, the allocated slice is
+  ~137x larger.
+
+As a result, a malicious actor can craft a big empty DER payload,
+resulting in an unnecessary large allocation of memories. This can be a
+way to cause memory exhaustion.
+
+To prevent this, we now use SliceCapWithSize within internal/saferio to
+enforce a memory allocation cap.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+For #75671
+Fixes #75704
+Fixes CVE-2025-58185
+
+Change-Id: Id50e76187eda43f594be75e516b9ca1d2ae6f428
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2700
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2984
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709841
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-58185
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5c3d61c886f7ecfce9a6d6d3c97e6d5a8afb17d1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/encoding/asn1/asn1.go      | 10 ++++++++-
+ src/encoding/asn1/asn1_test.go | 38 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+), 1 deletion(-)
+
+diff --git a/src/encoding/asn1/asn1.go b/src/encoding/asn1/asn1.go
+index 781ab87..16c7138 100644
+--- a/src/encoding/asn1/asn1.go
++++ b/src/encoding/asn1/asn1.go
+@@ -22,6 +22,7 @@ package asn1
+ import (
+	"errors"
+	"fmt"
++	"internal/saferio"
+	"math"
+	"math/big"
+	"reflect"
+@@ -643,10 +644,17 @@ func parseSequenceOf(bytes []byte, sliceType reflect.Type, elemType reflect.Type
+		offset += t.length
+		numElements++
+	}
+-	ret = reflect.MakeSlice(sliceType, numElements, numElements)
++	elemSize := uint64(elemType.Size())
++	safeCap := saferio.SliceCapWithSize(elemSize, uint64(numElements))
++	if safeCap < 0 {
++		err = SyntaxError{fmt.Sprintf("%s slice too big: %d elements of %d bytes", elemType.Kind(), numElements, elemSize)}
++		return
++	}
++	ret = reflect.MakeSlice(sliceType, 0, safeCap)
+	params := fieldParameters{}
+	offset := 0
+	for i := 0; i < numElements; i++ {
++		ret = reflect.Append(ret, reflect.Zero(elemType))
+		offset, err = parseField(ret.Index(i), bytes, offset, params)
+		if err != nil {
+			return
+diff --git a/src/encoding/asn1/asn1_test.go b/src/encoding/asn1/asn1_test.go
+index 9a605e2..249d4e4 100644
+--- a/src/encoding/asn1/asn1_test.go
++++ b/src/encoding/asn1/asn1_test.go
+@@ -7,10 +7,12 @@ package asn1
+ import (
+	"bytes"
+	"encoding/hex"
++	"errors"
+	"fmt"
+	"math"
+	"math/big"
+	"reflect"
++	"runtime"
+	"strings"
+	"testing"
+	"time"
+@@ -1175,3 +1177,39 @@ func BenchmarkObjectIdentifierString(b *testing.B) {
+		_ = oidPublicKeyRSA.String()
+	}
+ }
++
++func TestParsingMemoryConsumption(t *testing.T) {
++	// Craft a syntatically valid, but empty, ~10 MB DER bomb. A successful
++	// unmarshal of this bomb should yield ~280 MB. However, the parsing should
++	// fail due to the empty content; and, in such cases, we want to make sure
++	// that we do not unnecessarily allocate memories.
++	derBomb := make([]byte, 10_000_000)
++	for i := range derBomb {
++		derBomb[i] = 0x30
++	}
++	derBomb = append([]byte{0x30, 0x83, 0x98, 0x96, 0x80}, derBomb...)
++
++	var m runtime.MemStats
++	runtime.GC()
++	runtime.ReadMemStats(&m)
++	memBefore := m.TotalAlloc
++
++	var out []struct {
++		Id       []int
++		Critical bool `asn1:"optional"`
++		Value    []byte
++	}
++	_, err := Unmarshal(derBomb, &out)
++	if !errors.As(err, &SyntaxError{}) {
++		t.Fatalf("Incorrect error result: want (%v), but got (%v) instead", &SyntaxError{}, err)
++	}
++
++	runtime.ReadMemStats(&m)
++	memDiff := m.TotalAlloc - memBefore
++
++	// Ensure that the memory allocated does not exceed 10<<21 (~20 MB) when
++	// the parsing fails.
++	if memDiff > 10<<21 {
++		t.Errorf("Too much memory allocated while parsing DER: %v MiB", memDiff/1024/1024)
++	}
++}
+--
+2.40.0
-- 
2.43.0


