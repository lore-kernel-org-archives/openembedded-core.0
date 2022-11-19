Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B659C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:18 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.26049.1668880097457767399
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0A3xZu8w;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so5775836pjh.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZsZrMxaqyEAGE9lOdn3WwK74AIxIiNhIk30SxMig44=;
        b=0A3xZu8w+mdCQ3uTlgM3813WF8/NH21CJOBiRY1ypmNeVF6Rv87C3LWsbDT1yi3SFd
         r9TlGRK5UAI+fYRawiFnHMU0xUB+LYFAPoyDogEQqrxV5SsWgDWMIuexVhoUagAy4KwL
         XDTOY2TLm4dDoFPNnEh5em0C7EBk9LzCEF/XsDAoTZ0bv3/4OptdJQuWL7B16Dxl4txV
         TnWmwip+loyDZlOv6chAaA63t7rKBYqqdwuIAqmhu/MJYh8nazHjMQSfREWprYVaSkMT
         5OpHW/1F2rGEmKRVoO/nVhBoPo8wJQtpTW4/8IQyAHfoUWf/nG4ymuT0CoV5np8NPoFK
         PWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZsZrMxaqyEAGE9lOdn3WwK74AIxIiNhIk30SxMig44=;
        b=TqHFatTTOlECGj+x7U429mXMmH+CWoq1IGjvBdId8HCV7cyE1U8oFhwMyP46ZH31iu
         axTsUFqeshiGGmZpHNrv+bscg0OBEXqRK0k5wfFvI7nyeBdfeothW4EV8qKUZRy3M66n
         0qTv9fjKar+65CwRZAghy1lCN254VsW1mivtOJDX7I8yJOhSJ1p1Ge7Qrrpb817IY93/
         bw8vYTHHSVysOvz6AukKY/gtwfGpPUmOoLW12axvXJa6ad9//np7T86BtAsmESoq4ZUZ
         vjJ0FN2gnu4ihTTymzA5hmkAMZVYxZ1Uw/s1LicuHqEj9FfQ/KRcg5JFjVLTv7N/FU6T
         uNbQ==
X-Gm-Message-State: ANoB5pnMNZeRvwxzch+0cPjqTC51TCkWMZvnImG1QHOTvBl/H0/ml/Sq
	kmr26BQdbwRRs/XFA8IlSd8c2x86LfdAL/ZMEuo=
X-Google-Smtp-Source: AA0mqf5hNencOTC7m5B9vSu6+ZVqdYcSQ0A/HD2+NHJjszDxi55x2DF8dUwrAVxyENeoNv7KQJFEOg==
X-Received: by 2002:a17:903:44e:b0:176:a9d6:ed53 with SMTP id iw14-20020a170903044e00b00176a9d6ed53mr1426985plb.5.1668880096501;
        Sat, 19 Nov 2022 09:48:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/21] golang: fix CVE-2022-28131
Date: Sat, 19 Nov 2022 07:47:39 -1000
Message-Id: <dc51b7597254596e5dda4505ac42be37c6a6ce26.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173529

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Upstream-Status: Backport [https://github.com/golang/go/commit/58facfbe7db2fbb9afed794b281a70bdb12a60ae]
CVE: CVE-2022-28131
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-28131.patch           | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 08eefdcb5c..525a3e77c5 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -47,6 +47,7 @@ SRC_URI += "\
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


