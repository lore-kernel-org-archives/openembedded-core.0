Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BAEC6FD1D
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 02:30:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.121137.1680661795828023824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 19:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WjPp/Iya;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id o2so33120268plg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680661795; x=1683253795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erP271RrNrndfhS1ADv8X15ChINLDSTjok8dxskNUe0=;
        b=WjPp/IyaMBgTkj5IB+wOxhUdN4zFt7CWoQG1CUv7eITfHvjqCs3v3Po6Gi7gvq45hZ
         uON9NCoH8jA7U+DaKIfk0DgOFlDXnY08k8oJA9vEYlcTXiRbsZ/t93aZIjwb8g5qPZdX
         4uJsvQhp/sIsTVRLVPTk0bDEUckErfOCJH7CTBHiYIZfWMfLlrk3NO28Nc8dXdFYEcxg
         qV96HkzEqPj6hFfudO9J9lQzbrKMQq8ulqgPtA65fVFTaS0ygBFN7e8GO2b+G73pfTbc
         vyeg9UUxSZONEPlLdavFmae9zQ6cS+4NGZAiwenVZhCooQVcXeX0qUeCCkMghRNd3Z9E
         E3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661795; x=1683253795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erP271RrNrndfhS1ADv8X15ChINLDSTjok8dxskNUe0=;
        b=pF7jn+0WsvKT/nsUmQgJjSFqzhqSlR2dUK0CMP6wcsZ6qH8Jj+81nxgQpZ3O2Eu5Fs
         WW8zaLYphLZ6EL5N5qVZIfBBnSxrpe7VffKujB2B9PLijPbOOgvutNOXx9gA1V/B9WpF
         XZYjHf6U1E7fbuERkCI6U6qNseU9rLumujMCRGX6q18A43QUVAFhSCJYoUbJhj3Cbebb
         RzL0bEeYaMAX+Om63nFXxK+LAvtvMrDiF/QxBRfNMt2sHjLxfPXsVejwMtz4FTu1Lkwj
         mKwTPjM6hikYlNk4sDuqDHj8RpEtH98vSWMqhThzfYgXlEG2SeVd8h+hw2J9ik6s7zPN
         qYvg==
X-Gm-Message-State: AAQBX9cdCqv8gcQiyAr9U9lpo7qsBOlO0lHZuvu5mfBlKcLBQMzzOV2q
	xeFqxrdRHXhZnySzuxZ59NrcLyNIxtk6vbWOrIo=
X-Google-Smtp-Source: AKy350b9utWigf6SgtRANJDwIjZfTrETzOGsGDeRnwwzjhVKgPYZRCVMm5UBTSna+dQt0J3ewGHQdA==
X-Received: by 2002:a17:902:e392:b0:1a1:c83c:ba5c with SMTP id g18-20020a170902e39200b001a1c83cba5cmr4156951ple.13.1680661794838;
        Tue, 04 Apr 2023 19:29:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm8937702pld.236.2023.04.04.19.29.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 19:29:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] go-runtime: Security fix for CVE-2022-41723
Date: Tue,  4 Apr 2023 16:29:29 -1000
Message-Id: <7440ebac50813e5df73da2d660a50fa97de650de.1680661617.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680661617.git.steve@sakoman.com>
References: <cover.1680661617.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179714

From: Shubham Kulkarni <skulkarni@mvista.com>

Disable cmd/internal/moddeps test, since this update includes PRIVATE
track fixes.

Backport from https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beffcd4339b86a902b21c3

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41723.patch           | 156 ++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 856c14de40..14d58932dc 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://CVE-2022-41717.patch \
     file://CVE-2022-2879.patch \
     file://CVE-2022-41720.patch \
+    file://CVE-2022-41723.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
new file mode 100644
index 0000000000..a93fa31dcd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
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
2.34.1


