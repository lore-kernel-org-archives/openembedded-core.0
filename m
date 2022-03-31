Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB38CC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 14:39:57 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7884.1648737596623476668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 07:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U8EiwI3e;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id w25so28399488edi.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xegHpw7zcL/RBU4uUlIe+oCKCaKvCBqNIt0P396xTRc=;
        b=U8EiwI3ebscGV+y+JgB3lUnkNh18DHHDtPG0g2merL3I1bqQ8IhQorkSRtJJCa0936
         msKZjWNUi3xNn6p8QgCwAUeqH1HwXuoWYkserz3CJ2+euZ9AkstDdq9jYgcqE+4G9X1j
         9sAiqSiAJg6rO5sGY2YfIZbsfVLAbXqZzvr5hdLY1BirQKU4ngIYnR384lwQJ1VmNF//
         X20+jSJBD9cAgfil/cC/mfxSsO3XZTCzWZVhQ1V486MIwqhuOrsIJUHNFmBTyo4UYfa4
         OTHToY01mjzQrMP5pwx+NwV9efWNyxuLIQm6Nj7d7O39oI5Qfzo4iQaIkveHO/Z18OgI
         05Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xegHpw7zcL/RBU4uUlIe+oCKCaKvCBqNIt0P396xTRc=;
        b=2ZIeLcG6+J1yAh6PGp8ZIZVE/K2OUecOzre3h53FkKJ5Oeiyf7TlruWb+49CPX3Hhb
         /dSVzOX6aYNMsCslH9l25lZXpjKS1+GVdT5sa/aOezNEmdsAetCF5Ws+aTE/aF6IEJ9c
         WoZNWDbIQU86Ae4K9+CS++58Ro/Y+7+zguAi86UJVAHbNSpbftxfxnilkOWoGVslU1Qz
         yWNG6kz3L7qhM4HdSuzBOLZu6oy1MhkhyOoHSvijO7pLnYoHxjggm67UdaUfQWuI6HES
         RWKxuJeSDzYf2O5HeXX+rz8onOyn7G2t7XonR86igM1eznty+vPuWMqaQWN9eL/H0AYr
         ZOvQ==
X-Gm-Message-State: AOAM532X4n/D/0VjGSN38CH5N/sh1u3lUnsrUAMOp5T1KtHy6rLa3s47
	lkNjQp5tcNMaS9Jzo8XT5dy9SUiF4vhhEg==
X-Google-Smtp-Source: 
 ABdhPJwvxAc6UhZmmX/yVDKWk6KO4adMr7PUqSYJpQyItIe9mdLbJfULOSK1VzIi4eIDsjUcfuNChw==
X-Received: by 2002:a05:6402:1718:b0:419:564:6b62 with SMTP id
 y24-20020a056402171800b0041905646b62mr16774099edu.361.1648737594513;
        Thu, 31 Mar 2022 07:39:54 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-52.retail.telecomitalia.it. [82.60.178.52])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170906778700b006df7e0e140bsm9602183ejm.140.2022.03.31.07.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 07:39:54 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][dunfell][PATCH v2] go: backport patch fix for
 CVE-2021-38297
Date: Thu, 31 Mar 2022 16:39:37 +0200
Message-Id: <20220331143937.218470-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 14:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163837

Patch taken from
https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
from the following issue
https://github.com/golang/go/issues/48797

Original repo
https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
V2 Update:
     Update go-1.14.inc to the latest revision
     Inline isWasm method to solve compile error
     Thanks to Steve Sakoman for the feedback
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
2.32.0


