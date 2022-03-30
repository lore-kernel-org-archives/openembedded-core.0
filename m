Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA950C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 15:50:05 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.85.1648655404526779083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 08:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c3V5QRRV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b24so24920031edu.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUOqnZac2pVI5R/RsXLLR6kWv/m7kkUPdgsMCi9G6lc=;
        b=c3V5QRRV9MzAozc9PVF3VxwYHDI0fv8aQk7EXitfxiNXverRFiOMelZcRe/NRaqrCR
         8za8CeywD3T5SfbPmzfH06DnHrSPnT1Oe8L+0LmV/vwBPMBjH6UBqsnut2sohPovRdVt
         O4PGMt39TdQEhkWXb83IIhxerOe//4WnfEz4qOff/lEqWBpf5QX0nN/lmow2licVWv/1
         93iaYdZU8GKsDboQHBNWpcFvP9ko80tjfJqDncTrbp5FppNXHR+pkLSXgiLxvuGRuyTt
         xV+1G0VEN98uZnYMMvRoFlTNG/CAhZftbuthWOOKLMR81ROttiQ8Q8vvCVyzoUl3ofVI
         wkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUOqnZac2pVI5R/RsXLLR6kWv/m7kkUPdgsMCi9G6lc=;
        b=RlTALT/owke+bgvR52/uRIBHG0FLPEcBJmuaLhJoNAMKgNFh+1aZhFTV2v9pCMBar1
         RzwB0Y/2FTr/oZZmM75XPtZE2YFY2wHS8vmZLOul/Ld6jx/uj5YL7ALRLhOUeOfBFxXs
         VVpsTM7X1WIAaOd381J0c32cbgRRfEpNW1OqzNlkX/fvIVmIERmL3GLHGx4kmUTpdOkf
         /8V4AjLwimQ2Y5DxWloizFg+g6YI6mf+05TXeVgIYUlrr9zsZurQ/mtqgOYi1jt+CFmk
         A8foqE+Q3pJKCQFo1JBvtJ8zgyClT18fp6U3y8gRPHT7+uZiwkUtpgC+0IkLSz9zqySB
         NKIQ==
X-Gm-Message-State: AOAM530wp+3Qg3syViLgTj1zjXTinGmKJxUdhp92qAyi5YRz4RDNuO0y
	Tk1iqVXJ6Joa0uNfcDu43nZkBPMo9rG56w==
X-Google-Smtp-Source: 
 ABdhPJwJJ1XCdeXFACt8N+jPyejeqdlw1cby8/MbcHJqIE+mQSkB+pAQM9qXHd0vACuVNEMQDhEtJw==
X-Received: by 2002:a05:6402:138c:b0:413:3d99:f2d6 with SMTP id
 b12-20020a056402138c00b004133d99f2d6mr11364515edv.189.1648655402223;
        Wed, 30 Mar 2022 08:50:02 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-30.retail.telecomitalia.it. [87.5.19.30])
        by smtp.gmail.com with ESMTPSA id
 nc13-20020a1709071c0d00b006dfa376ee55sm8397532ejc.131.2022.03.30.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 08:50:01 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][dunfell][PATCH] go: backport patch fix for CVE-2021-38297
Date: Wed, 30 Mar 2022 17:49:46 +0200
Message-Id: <20220330154946.70352-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 15:50:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163787

Patch taken from
https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
from the following issue
https://github.com/golang/go/issues/48797

Original repo
https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-38297.patch           | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index abc6f42184..947f1798ee 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://CVE-2021-34558.patch \
     file://CVE-2021-33196.patch \
     file://CVE-2021-33197.patch \
+    file://CVE-2021-38297.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
new file mode 100644
index 0000000000..0b5d0b591e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
@@ -0,0 +1,94 @@
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
++		if ctxt.IsWasm() && i == 0 && va < wasmMinDataAddr {
++			va = wasmMinDataAddr
++		}
+ 	}
+ 
+ 	Segtext.Length = va - uint64(*FlagTextAddr)
+ 
\ No newline at end of file
-- 
2.32.0


