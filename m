Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5E6C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 11:35:55 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.63852.1680003350738215164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 04:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dGyeOApK;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: skulkarni@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso1256398pjc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680003350;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbUy3MBRAMIyW39AVBRXFMOXl+sMlNkLPBHjsM8yXMg=;
        b=dGyeOApKcok4YhehAFZppgkUk84G+qag9E+9uxPgfxE7L9JP21kxxfA2B8Y3eh0TZc
         fKt8cleL2ytWkgIsFmowKXPKva33Fks57h6OE89nbnqoCvuvF7PlWmFAMZPb7YSmMfRe
         DvFTImZfCh8CT/lKCxKcIFHvPrp+sQG5vixkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680003350;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbUy3MBRAMIyW39AVBRXFMOXl+sMlNkLPBHjsM8yXMg=;
        b=vdX18HlqYNeabmu9IrJfXgS+Pk9jfAQ0o/0+MM515NhR2+dDj7O0/Bu6bww/HrbJJz
         cZBa8pq77vfRmEVIvxnL3ZvDEs2WDqimf90WbM2VJYudYSdfmtpa0BK6WfpwuPyxpvtb
         lbVZFXenapJPtKjvWWhmSDsMP4lBe/za7lbGLQHjyTM+CxNBMfs95ZP27rrrGkL4UJ/Y
         H7owKken+zmHpTPLYnnMwN5Z0QOdspzXtkOVMRGZh7bKCO4PbseGLasujLM2cO9/7EfG
         C9sYAlFy7RG/BwR3yRSlIyQJjW+IvjxaO1g5PplrW8eB14B+nijc3FDM0BwWFaLGpeAF
         7IiA==
X-Gm-Message-State: AAQBX9fRKtzh9/Rv5vVgBL1BFuKh2ZAW5DqtkbZY448/WabaQ1n+Z2Tq
	0fK2Mu0MvvN6smhIAABl+FSlEuf5gTXEGFhZpkU=
X-Google-Smtp-Source: AKy350ZKHCT+TtK3RLtrtJvhLXTCGHJK/CNq9uCC87D4ws1hqSt/g+mNiWR5pk2V9yFhwRmYFk5CmQ==
X-Received: by 2002:a17:90b:314c:b0:23d:42d4:b9f5 with SMTP id ip12-20020a17090b314c00b0023d42d4b9f5mr17239685pjb.37.1680003349593;
        Tue, 28 Mar 2023 04:35:49 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id z9-20020a17090a170900b002369e16b276sm5885504pjd.32.2023.03.28.04.35.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:35:49 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] go-runtime: Security fix for CVE-2022-41723
Date: Tue, 28 Mar 2023 17:05:41 +0530
Message-Id: <1680003341-23780-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 11:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179228

From: Shubham Kulkarni <skulkarni@mvista.com>

Disable cmd/internal/moddeps test, since this update includes PRIVATE
track fixes.

Backport from https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902b21c3

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc               |   1 +
 .../go/go-1.14/CVE-2022-41723.patch                | 156 +++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41723.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index be9abb5..f2a5fc3 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -52,6 +52,7 @@ SRC_URI += "\
     file://CVE-2022-41715.patch \
     file://CVE-2022-41717.patch \
     file://CVE-2022-1962.patch \
+    file://CVE-2022-41723.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41723.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41723.patch
new file mode 100644
index 0000000..a93fa31
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41723.patch
@@ -0,0 +1,156 @@
+From 451766789f646617157c725e20c955d4a9a70d4e Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 6 Feb 2023 10:03:44 -0800
+Subject: [PATCH] net/http: update bundled golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+Fixes CVE-2022-41723
+Fixes #58355
+Updates #57855
+
+Change-Id: Ie870562a6f6e44e4e8f57db6a0dde1a41a2b090c
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1728939
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/468118
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Than McIntosh <thanm@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902b21c3]
+CVE: CVE-2022-41723
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/vendor/golang.org/x/net/http2/hpack/hpack.go | 79 +++++++++++++++---------
+ 1 file changed, 49 insertions(+), 30 deletions(-)
+
+diff --git a/src/vendor/golang.org/x/net/http2/hpack/hpack.go b/src/vendor/golang.org/x/net/http2/hpack/hpack.go
+index 85f18a2..02e80e3 100644
+--- a/src/vendor/golang.org/x/net/http2/hpack/hpack.go
++++ b/src/vendor/golang.org/x/net/http2/hpack/hpack.go
+@@ -359,6 +359,7 @@ func (d *Decoder) parseFieldLiteral(n uint8, it indexType) error {
+
+	var hf HeaderField
+	wantStr := d.emitEnabled || it.indexed()
++	var undecodedName undecodedString
+	if nameIdx > 0 {
+		ihf, ok := d.at(nameIdx)
+		if !ok {
+@@ -366,15 +367,27 @@ func (d *Decoder) parseFieldLiteral(n uint8, it indexType) error {
+		}
+		hf.Name = ihf.Name
+	} else {
+-		hf.Name, buf, err = d.readString(buf, wantStr)
++		undecodedName, buf, err = d.readString(buf)
+		if err != nil {
+			return err
+		}
+	}
+-	hf.Value, buf, err = d.readString(buf, wantStr)
++	undecodedValue, buf, err := d.readString(buf)
+	if err != nil {
+		return err
+	}
++	if wantStr {
++		if nameIdx <= 0 {
++			hf.Name, err = d.decodeString(undecodedName)
++			if err != nil {
++				return err
++			}
++		}
++		hf.Value, err = d.decodeString(undecodedValue)
++		if err != nil {
++			return err
++		}
++	}
+	d.buf = buf
+	if it.indexed() {
+		d.dynTab.add(hf)
+@@ -459,46 +472,52 @@ func readVarInt(n byte, p []byte) (i uint64, remain []byte, err error) {
+	return 0, origP, errNeedMore
+ }
+
+-// readString decodes an hpack string from p.
++// readString reads an hpack string from p.
+ //
+-// wantStr is whether s will be used. If false, decompression and
+-// []byte->string garbage are skipped if s will be ignored
+-// anyway. This does mean that huffman decoding errors for non-indexed
+-// strings past the MAX_HEADER_LIST_SIZE are ignored, but the server
+-// is returning an error anyway, and because they're not indexed, the error
+-// won't affect the decoding state.
+-func (d *Decoder) readString(p []byte, wantStr bool) (s string, remain []byte, err error) {
++// It returns a reference to the encoded string data to permit deferring decode costs
++// until after the caller verifies all data is present.
++func (d *Decoder) readString(p []byte) (u undecodedString, remain []byte, err error) {
+	if len(p) == 0 {
+-		return "", p, errNeedMore
++		return u, p, errNeedMore
+	}
+	isHuff := p[0]&128 != 0
+	strLen, p, err := readVarInt(7, p)
+	if err != nil {
+-		return "", p, err
++		return u, p, err
+	}
+	if d.maxStrLen != 0 && strLen > uint64(d.maxStrLen) {
+-		return "", nil, ErrStringLength
++		// Returning an error here means Huffman decoding errors
++		// for non-indexed strings past the maximum string length
++		// are ignored, but the server is returning an error anyway
++		// and because the string is not indexed the error will not
++		// affect the decoding state.
++		return u, nil, ErrStringLength
+	}
+	if uint64(len(p)) < strLen {
+-		return "", p, errNeedMore
+-	}
+-	if !isHuff {
+-		if wantStr {
+-			s = string(p[:strLen])
+-		}
+-		return s, p[strLen:], nil
++		return u, p, errNeedMore
+	}
++	u.isHuff = isHuff
++	u.b = p[:strLen]
++	return u, p[strLen:], nil
++}
+
+-	if wantStr {
+-		buf := bufPool.Get().(*bytes.Buffer)
+-		buf.Reset() // don't trust others
+-		defer bufPool.Put(buf)
+-		if err := huffmanDecode(buf, d.maxStrLen, p[:strLen]); err != nil {
+-			buf.Reset()
+-			return "", nil, err
+-		}
++type undecodedString struct {
++	isHuff bool
++	b      []byte
++}
++
++func (d *Decoder) decodeString(u undecodedString) (string, error) {
++	if !u.isHuff {
++		return string(u.b), nil
++	}
++	buf := bufPool.Get().(*bytes.Buffer)
++	buf.Reset() // don't trust others
++	var s string
++	err := huffmanDecode(buf, d.maxStrLen, u.b)
++	if err == nil {
+		s = buf.String()
+-		buf.Reset() // be nice to GC
+	}
+-	return s, p[strLen:], nil
++	buf.Reset() // be nice to GC
++	bufPool.Put(buf)
++	return s, err
+ }
+--
+2.7.4
-- 
2.7.4


