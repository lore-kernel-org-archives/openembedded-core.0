Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C788CD98E5
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71892.1781274409093507616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PvLj4NwO;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so123915e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274407; x=1781879207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/e2HHdfh3jaicgWbX7tEBFxmV9FhzCBp9a5wQOb4JZQ=;
        b=PvLj4NwOyvkBSewHqOT4azDuAl1UDPzk/XedvOVfkHFxQ/mqI0NRpiBRVMcAEXqNCy
         B0lxjSMsRYMOtm3ToJuyBDAE9D0aCXzBRYPhkns0DVs7MHwZ5+o+DBsA7kg40qApzgTk
         U1hdBB1AhS4yNMHsIIH814TrxszJNmemVtsXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274407; x=1781879207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/e2HHdfh3jaicgWbX7tEBFxmV9FhzCBp9a5wQOb4JZQ=;
        b=L813WvRQP6BEt8Y9sf5x8fMDkFTo9lES0y7Ip1FwpgJooGIsojEBdZPEncWchwFTeK
         T99dkgE0hTqJgmmDkR45MX7Cmpv6F+3vP3MKpG+MymD/azBAQBcFwrOXdm2ww5qkHR1F
         JkDDE1D9qzVwLk2KPxcEyISjjIota/NWMdzutqL3s5UWLM+BEKCKlzlAVVHXVM24Q84m
         oxdLOUqNrier9LJers6blhbEroM5wPAAPcAZIR4QBB+2Nfr2qg6qk3pDdDlZpQP5pD2D
         mf7l0x+/EZvBPCuwQIxgsEFoTYsjrvyk+qv2/EoLJ9hYmY6pKJegQcCtPUzKR0/gOMAs
         RFVw==
X-Gm-Message-State: AOJu0YzcTleNl/CQ11c32xgsUl9wmy+HksVyFUEG/OOyutQWmljBsS/R
	jGZt14urofGX1Jha3CuIa1zhyyx+X9PJ8XhNh1oLjHND/E+SNZUwAL/2hPIIVtxDF0X6YCBqf2Q
	ikidbXQ==
X-Gm-Gg: Acq92OFAsaTs5BKbP8yMA1yqUAx4rDBefGeFdIjZz4SIw9OanGc2tiRTZVh8t/BS+65
	Om5qyOv2VmCu5usulQHtu6/Q5K8zVSTTzf+b0l0fkORZeAVm+5ImJ3LPWSPr74BPoAgCYR1l5bt
	k4pFtWV3sFGjGgbeO/diAsgHRDWNnkPVefcxrSoj5W0l6FV97kuxW9pi1I7F3TiUWzSpoDsHWlJ
	q0NTdCg5wZNGRkgdWKUr5HDHNlLIl1OWSSli9hl1BTiZSeCWSONmJ370l2qETQTX6cnSZhQqrnR
	81uDG1srw0vzlLwc/T3SL+hSckjgRPWrG3x1qBf14gnGHfjUf0HoXjjE1RW6Mljq8ad2wkl3Wag
	SMhCaDc28/oVOYntRCZWjRWDB+EFGzQtWTVenK8bw7HA3n3jysOEfe/Qyvuyn1JnLKxfALu276C
	sIJOSZlQUNcF5XhCgVw7r2Ao8=
X-Received: by 2002:a05:600c:4745:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-490ec4fe770mr42407825e9.19.1781274407215;
        Fri, 12 Jun 2026 07:26:47 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:46 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 14/21] go: patch CVE-2026-39820
Date: Fri, 12 Jun 2026 16:26:04 +0200
Message-ID: <724767c15c6530fd3f4af6e0031ec2d1a040ab42.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238636

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] mentionned in [2]

[1] https://go.dev/cl/759940

[2] https://security-tracker.debian.org/tracker/CVE-2026-39820

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39820.patch                | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39820.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index dba826011b..002d443059 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -48,6 +48,7 @@ SRC_URI += "\
     file://CVE-2026-33811.patch \
     file://CVE-2026-39817.patch \
     file://CVE-2026-39819.patch \
+    file://CVE-2026-39820.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39820.patch b/meta/recipes-devtools/go/go/CVE-2026-39820.patch
new file mode 100644
index 0000000000..c5f84282a9
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39820.patch
@@ -0,0 +1,112 @@
+From e459f8fe1061679f866c599210466db386348f08 Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Sat, 4 Apr 2026 05:17:25 +0000
+Subject: [PATCH] net/mail: fix quadratic complexity in consumeComment
+
+consumeComment builds the comment string by repeated string
+concatenation inside a loop. Each concatenation copies the
+entire string built so far, making the function O(n^2) in the
+depth of nested comments.
+
+Replace the concatenation with a strings.Builder, which
+amortizes allocation by doubling its internal buffer. This
+reduces consumeComment from O(n^2) to O(n).
+
+This is the same bug class as the consumeDomainLiteral fix
+in CVE-2025-61725.
+
+Benchmark results (benchstat, 8 runs):
+
+  name                        old time/op  new time/op  delta
+  ConsumeComment/depth10      2.481us      1.838us      -25.92%
+  ConsumeComment/depth100     86.58us      6.498us      -92.50%
+  ConsumeComment/depth1000    7.963ms      52.82us      -99.34%
+  ConsumeComment/depth10000   897.8ms      521.3us      -99.94%
+
+The quadratic cost becomes visible at depth 100 and dominant
+by depth 1000. At depth 10000, the fix is roughly 1700x
+faster.
+
+Change-Id: I3c927f02646fcab7bab167cb82fd46d3327d6d34
+GitHub-Last-Rev: 7742dad716ee371766543f88e82bd163bd9d7ac2
+GitHub-Pull-Request: golang/go#78393
+Reviewed-on: https://go-review.googlesource.com/c/go/+/759940
+Reviewed-by: Sean Liao <sean@liao.dev>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Sean Liao <sean@liao.dev>
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+
+CVE: CVE-2026-39820
+Upstream-Status: Backport [https://github.com/golang/go/commit/0d0799f055dcc9b3b41df74bee3fbe398ae2f0e7]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/mail/message.go      |  6 +++---
+ src/net/mail/message_test.go | 19 +++++++++++++++++++
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/src/net/mail/message.go b/src/net/mail/message.go
+index fc2a9e46f8..37d7ff5df1 100644
+--- a/src/net/mail/message.go
++++ b/src/net/mail/message.go
+@@ -780,7 +780,7 @@ func (p *addrParser) consumeComment() (string, bool) {
+ 	// '(' already consumed.
+ 	depth := 1
+ 
+-	var comment string
++	var comment strings.Builder
+ 	for {
+ 		if p.empty() || depth == 0 {
+ 			break
+@@ -794,12 +794,12 @@ func (p *addrParser) consumeComment() (string, bool) {
+ 			depth--
+ 		}
+ 		if depth > 0 {
+-			comment += p.s[:1]
++			comment.WriteByte(p.s[0])
+ 		}
+ 		p.s = p.s[1:]
+ 	}
+ 
+-	return comment, depth == 0
++	return comment.String(), depth == 0
+ }
+ 
+ func (p *addrParser) decodeRFC2047Word(s string) (word string, isEncoded bool, err error) {
+diff --git a/src/net/mail/message_test.go b/src/net/mail/message_test.go
+index 1f2f62afbf..1b165317f9 100644
+--- a/src/net/mail/message_test.go
++++ b/src/net/mail/message_test.go
+@@ -6,6 +6,7 @@ package mail
+ 
+ import (
+ 	"bytes"
++	"fmt"
+ 	"io"
+ 	"mime"
+ 	"reflect"
+@@ -1217,3 +1218,21 @@ func TestEmptyAddress(t *testing.T) {
+ 		t.Errorf(`ParseAddressList("") = %v, %v, want nil, error`, list, err)
+ 	}
+ }
++
++func BenchmarkConsumeComment(b *testing.B) {
++	for _, n := range []int{10, 100, 1000, 10000} {
++		b.Run(fmt.Sprintf("depth-%d", n), func(b *testing.B) {
++			// Build a deeply nested comment: (((...a...)))
++			open := strings.Repeat("(", n)
++			close := strings.Repeat(")", n)
++			// consumeComment expects the leading '(' already consumed,
++			// so we start with one fewer opening paren and the parser
++			// will handle nesting from there.
++			input := open[:n-1] + "a" + close
++			for b.Loop() {
++				p := addrParser{s: input}
++				p.consumeComment()
++			}
++		})
++	}
++}
+-- 
+2.43.0
+
-- 
2.53.0


