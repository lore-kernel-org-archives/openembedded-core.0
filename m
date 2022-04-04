Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16313C48BCF
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.30489.1649039462508241743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kzwZDogy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id x16so2315139pfa.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gj+c+onQn8ZnJDGJhTuQ5iILMveMRkUNmzl/G3T/+LI=;
        b=kzwZDogy9m+6OgfHusDGJ4xKhLB0npHV7sFQ7eX+ek4b4MX/GcFsOwLQN3CZ5ZXK+W
         Ud/ybtk+snKd4208bZxoFemjyV+Zq5k2O5jO3kapk8yKETGlEpFDqsAHhEuwElK9yxU5
         tFY/O19XMhZ5EobgiL7lzW+iz4VumHXoXkeRC6e1zInewc53C9pO8OJ2IDvA2unuHO1S
         6IslwzFCO+TaMopdplSZ/dIqjJjTShhvo+DSM+Uc+ZhhdElvjy05jJgBYTHBI0Y/K34V
         mNxPcyxoh2jpBxInTDTkJM4+12PkDuo+f8xqjSaTGnqY8VjKE39VjwQi+dtafwLXBw/0
         v5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gj+c+onQn8ZnJDGJhTuQ5iILMveMRkUNmzl/G3T/+LI=;
        b=0o5ezfxJE9Vw9A/60x40Gz7ayhtfN+PiZ0eoOC08iTL/h43ZQwSvZfzq/dbD6NoJkd
         Q64VcKQr7IaUxPgHNbhK5Ki/K+VRs+VX2wYxt00MAQDlfgmkDzMNGSsNCel/M8z4gWt7
         vt+hGApzm3pL83vpyiGQXMMqQUTwAtRAcZyEzMejbyY4pQebPgi1YBh6S6fMPTumNId8
         YYm4fktTl/qtj4XNd65AGv9cSasEV9uLlJfu6KgVBuygh43HbUWOUQ3h3vCv/nHiD40x
         MifrGyQ1pnkvlvv/p4GB2RRap4t5XSCbWxZGbzQsVeJVyb9E8txBpZ9GUTn9a16hBkNL
         +C0g==
X-Gm-Message-State: AOAM531WKlfwUHzsFY/ZjBJ4r2HXlp4d0Bp3GfuhEzQLQOXGw4QYpaGX
	hN5Mq4beNkkstKTHgYHvZhX8Qv+tuJLhI/2kPQ8=
X-Google-Smtp-Source: 
 ABdhPJypcMsb6TUl+x2L/Itep7GJ1wET94ThdbYwr70SQS9eTKOsZSRhE9io3P0AZZxfkNRstPMOVA==
X-Received: by 2002:a63:2a0e:0:b0:380:aeb3:d46c with SMTP id
 q14-20020a632a0e000000b00380aeb3d46cmr23880597pgq.404.1649039461322;
        Sun, 03 Apr 2022 19:31:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.30.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:30:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/8] go: backport patch fix for CVE-2021-38297
Date: Sun,  3 Apr 2022 16:30:23 -1000
Message-Id: 
 <a2428925bb68387bfeefa37d8500d23631211a64.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163974

From: Davide Gardenal <davidegarde2000@gmail.com>

Patch taken from
https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
from the following issue
https://github.com/golang/go/issues/48797

Original repo
https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  4 +
 .../go/go-1.14/CVE-2021-38297.patch           | 97 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 9b3c3b30a8..f98757d10d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -19,9 +19,13 @@ SRC_URI += "\
     file://CVE-2021-34558.patch \
     file://CVE-2021-33196.patch \
     file://CVE-2021-33197.patch \
+    file://CVE-2021-38297.patch \
     file://CVE-2022-23806.patch \
     file://CVE-2022-23772.patch \
 "
+
+# file://CVE-2021-38297.patch
+
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
 
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
new file mode 100644
index 0000000000..24ceabf808
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
@@ -0,0 +1,97 @@
+From 4548fcc8dfd933c237f29bba6f90040a85922564 Mon Sep 17 00:00:00 2001
+From: Michael Knyszek <mknyszek@google.com>
+Date: Thu, 2 Sep 2021 16:51:59 -0400
+Subject: [PATCH] [release-branch.go1.16] misc/wasm, cmd/link: do not let
+ command line args overwrite global data
+
+On Wasm, wasm_exec.js puts command line arguments at the beginning
+of the linear memory (following the "zero page"). Currently there
+is no limit for this, and a very long command line can overwrite
+the program's data section. Prevent this by limiting the command
+line to 4096 bytes, and in the linker ensuring the data section
+starts at a high enough address (8192).
+
+(Arguably our address assignment on Wasm is a bit confusing. This
+is the minimum fix I can come up with.)
+
+Thanks to Ben Lubar for reporting this issue.
+
+Change by Cherry Mui <cherryyz@google.com>.
+
+For #48797
+Fixes #48799
+Fixes CVE-2021-38297
+
+Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1205933
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Than McIntosh <thanm@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/354591
+Trust: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Heschi Kreinick <heschi@google.com>
+
+CVE: CVE-2021-38297
+
+Upstream-Status: Backport:
+https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
+
+Inline of ctxt.isWAsm followin this implemetation:
+https://github.com/golang/go/blob/4548fcc8dfd933c237f29bba6f90040a85922564/src/cmd/link/internal/ld/target.go#L127
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ misc/wasm/wasm_exec.js           |  7 +++++++
+ src/cmd/link/internal/ld/data.go | 11 ++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
+index 82041e6bb901..a0a264278b1b 100644
+--- a/misc/wasm/wasm_exec.js
++++ b/misc/wasm/wasm_exec.js
+@@ -564,6 +564,13 @@
+ 				offset += 8;
+ 			});
+ 
++			// The linker guarantees global data starts from at least wasmMinDataAddr.
++			// Keep in sync with cmd/link/internal/ld/data.go:wasmMinDataAddr.
++			const wasmMinDataAddr = 4096 + 4096;
++			if (offset >= wasmMinDataAddr) {
++				throw new Error("command line too long");
++			}
++
+ 			this._inst.exports.run(argc, argv);
+ 			if (this.exited) {
+ 				this._resolveExitPromise();
+diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/ld/data.go
+index 52035e96301c..54a1d188cdb9 100644
+--- a/src/cmd/link/internal/ld/data.go
++++ b/src/cmd/link/internal/ld/data.go
+@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section, n int, s loader.Sym, va uint64
+ 	return sect, n, va
+ }
+ 
++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for wasm_exec.js
++// to store command line args. Data sections starts from at least address 8192.
++// Keep in sync with wasm_exec.js.
++const wasmMinDataAddr = 4096 + 4096
++
+ // address assigns virtual addresses to all segments and sections and
+ // returns all segments in file order.
+ func (ctxt *Link) address() []*sym.Segment {
+@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
+ 	order = append(order, &Segtext)
+ 	Segtext.Rwx = 05
+ 	Segtext.Vaddr = va
+-	for _, s := range Segtext.Sections {
++	for i, s := range Segtext.Sections {
+ 		va = uint64(Rnd(int64(va), int64(s.Align)))
+ 		s.Vaddr = va
+ 		va += s.Length
++
++		if ctxt.Arch.Family == sys.Wasm && i == 0 && va < wasmMinDataAddr {
++			va = wasmMinDataAddr
++		}
+ 	}
+ 
+ 	Segtext.Length = va - uint64(*FlagTextAddr)
+ 
\ No newline at end of file
-- 
2.25.1


