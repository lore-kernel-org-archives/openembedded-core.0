Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB5CD13D8
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19439.1762873134724098381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2XR3tA3i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo3489820b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873134; x=1763477934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfE/2R5OSmz1OXS2a9yR6anIB3l/IGwhLiwrX+exU4k=;
        b=2XR3tA3i1PaqSW1g54AwGDTG41G0qtypsj5dX8vQjpB+4RVJ5x6UqyLQVJvNDRljbQ
         iDwULWhdlbB95jvk9tR+cclbn1TfdkEYxqq2+tevDl5ViFJNRhBi/FmGdyFdGudUDa8v
         64XkB5StEGuHmZO7a3rzOS8ACLafW07STNqM2fwXQIQDtFlSWLedc0s88sfHGd/ytKzx
         EZDDudc9y8XgASmWtx6QEUnmngihT7Qx5/W2zQhPE8QovG+tMj+HiAD3VcG8FHMrBqoh
         FPLF1lVRPR9IZ40LhZKniixWJXER+D1tAccGdGiQ62+XSxURhFpvQ3ARM+UpmrLbI50u
         ryNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873134; x=1763477934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PfE/2R5OSmz1OXS2a9yR6anIB3l/IGwhLiwrX+exU4k=;
        b=WMl5Ss/TGIBnQLSBMeLHDxckSiqj9knUZVojiY8wdr33TVUcq5xRFVDN25L7abKkhz
         jo7eCw/gkp3TKor8XlzwFnIEU/ucqkiSEoqKPOYU1gQ2AgcEk266bVbZ8ALoXiSyFbRC
         vXxHj+ZsMw9fNBaq8LFO/Cf/6iTKiOy0kb4Z+t7P/CFRtLRqTnkpYBKozjIIR0ShbFt+
         iCo5Q+EbVOdRNGcsu7wXob4LnireT0tT5FDejzpGqHCFrfdOCVDGMYPjd0WOz8qmv3xd
         PGoXyTx7lX7g1S3TRxJpdQReP4lh/V8gneXC2LnOJGY+8JNOXBSg/Bbn0n6DUQDR2Lz2
         grAw==
X-Gm-Message-State: AOJu0Yx2FjlEjI9R8ke8W0I/GkpCJ7XbAU8Ve3dAwaNrw20vzsBYUjae
	wPQEgMMRG1eGoVhlDJezd4mCpxeEZo7RehKAl3a10K95wyepVTeK0YdMAkRQgwZOb9C5745mZw4
	hdRJx11Y=
X-Gm-Gg: ASbGncsTD4LvYP7mLlBSc9NHcpJhwnun1yO6Gu5EpWPcu5B+7Jaft38fRYjPKtip02G
	rz9NfnyeNbMXhUEeVPdSeTR1T4j54If6dlwQ4OIDJHSrEW9AfvTi3mPDUlTWAxR0VsuZPtDVy3o
	t/yFZ+7XG6e6aaRz/I8qgWK1QzCnmY4PbQP5PzqHi4F73/ziAT3guUEZY7Gn5cv/5bMUTwaTeV/
	kRETldO838ZkQznuZlh6LtZm2IHQacAHHEisWZALbkGQL/6m0Q+nsGiwKnak0cPA+ZI6Pp8LIa3
	JVhaVsVuB8LCcAH0Vqvxofi0v2oe3xWl397VhbLeW2fQ6ZRjFLlylMbcVVLjMSjjee2OG+L5l2U
	8GVA34y3sPVnUsEiiU1ZQMUo6qJXnjSTA5dX87Nn4RMRPHMEDX8rM09iA5O/NVhaAW5A=
X-Google-Smtp-Source: AGHT+IFnUvD6lPGHR135eAEXTv3dXldGtSTf8/rZuzVJT+OBTn/mEMhp2z6wjly+UWvqNr3fM1fBKg==
X-Received: by 2002:a17:90b:2d48:b0:340:d511:e167 with SMTP id 98e67ed59e1d1-3436ca9ad15mr16239749a91.0.1762873133892;
        Tue, 11 Nov 2025 06:58:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/19] go: fix CVE-2025-61723
Date: Tue, 11 Nov 2025 06:58:15 -0800
Message-ID: <228e4aa70743b92eaf1abd5526827b34b33f3419.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226172

From: Archana Polampalli <archana.polampalli@windriver.com>

The processing time for parsing some invalid inputs scales non-linearly with
respect to the size of the input. This affects programs which parse untrusted PEM inputs.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61723.patch                | 223 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61723.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 2be5c8b519..9996cfb870 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://CVE-2025-58188.patch \
     file://CVE-2025-58189.patch \
     file://CVE-2025-47912.patch \
+    file://CVE-2025-61723.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61723.patch b/meta/recipes-devtools/go/go/CVE-2025-61723.patch
new file mode 100644
index 0000000000..b1664e701d
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61723.patch
@@ -0,0 +1,223 @@
+From 74d4d836b91318a8764b94bc2b4b66ff599eb5f2 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 30 Sep 2025 11:16:56 -0700
+Subject: [PATCH] encoding/pem: make Decode complexity linear
+
+Because Decode scanned the input first for the first BEGIN line, and
+then the first END line, the complexity of Decode is quadratic. If the
+input contained a large number of BEGINs and then a single END right at
+the end of the input, we would find the first BEGIN, and then scan the
+entire input for the END, and fail to parse the block, so move onto the
+next BEGIN, scan the entire input for the END, etc.
+
+Instead, look for the first END in the input, and then the first BEGIN
+that precedes the found END. We then process the bytes between the BEGIN
+and END, and move onto the bytes after the END for further processing.
+This gives us linear complexity.
+
+Fixes CVE-2025-61723
+For #75676
+Fixes #75708
+
+Change-Id: I813c4f63e78bca4054226c53e13865c781564ccf
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2921
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2986
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709842
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2025-61723
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/74d4d836b91318a8764b94bc2b4b66ff599eb5f2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/encoding/pem/pem.go      | 67 ++++++++++++++++++++----------------
+ src/encoding/pem/pem_test.go | 13 +++----
+ 2 files changed, 44 insertions(+), 36 deletions(-)
+
+diff --git a/src/encoding/pem/pem.go b/src/encoding/pem/pem.go
+index 4b4f749..d365012 100644
+--- a/src/encoding/pem/pem.go
++++ b/src/encoding/pem/pem.go
+@@ -37,7 +37,7 @@ type Block struct {
+ // line bytes. The remainder of the byte array (also not including the new line
+ // bytes) is also returned and this will always be smaller than the original
+ // argument.
+-func getLine(data []byte) (line, rest []byte) {
++func getLine(data []byte) (line, rest []byte, consumed int) {
+	i := bytes.IndexByte(data, '\n')
+	var j int
+	if i < 0 {
+@@ -49,7 +49,7 @@ func getLine(data []byte) (line, rest []byte) {
+			i--
+		}
+	}
+-	return bytes.TrimRight(data[0:i], " \t"), data[j:]
++	return bytes.TrimRight(data[0:i], " \t"), data[j:], j
+ }
+
+ // removeSpacesAndTabs returns a copy of its input with all spaces and tabs
+@@ -90,20 +90,32 @@ func Decode(data []byte) (p *Block, rest []byte) {
+	// pemStart begins with a newline. However, at the very beginning of
+	// the byte array, we'll accept the start string without it.
+	rest = data
++
+	for {
+-		if bytes.HasPrefix(rest, pemStart[1:]) {
+-			rest = rest[len(pemStart)-1:]
+-		} else if _, after, ok := bytes.Cut(rest, pemStart); ok {
+-			rest = after
+-		} else {
++		// Find the first END line, and then find the last BEGIN line before
++		// the end line. This lets us skip any repeated BEGIN lines that don't
++		// have a matching END.
++		endIndex := bytes.Index(rest, pemEnd)
++		if endIndex < 0 {
++			return nil, data
++		}
++		endTrailerIndex := endIndex + len(pemEnd)
++		beginIndex := bytes.LastIndex(rest[:endIndex], pemStart[1:])
++		if beginIndex < 0 || beginIndex > 0 && rest[beginIndex-1] != '\n' {
+			return nil, data
+		}
++		rest = rest[beginIndex+len(pemStart)-1:]
++		endIndex -= beginIndex + len(pemStart) - 1
++		endTrailerIndex -= beginIndex + len(pemStart) - 1
+
+		var typeLine []byte
+-		typeLine, rest = getLine(rest)
++		var consumed int
++		typeLine, rest, consumed = getLine(rest)
+		if !bytes.HasSuffix(typeLine, pemEndOfLine) {
+			continue
+		}
++		endIndex -= consumed
++		endTrailerIndex -= consumed
+		typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+
+		p = &Block{
+@@ -117,7 +129,7 @@ func Decode(data []byte) (p *Block, rest []byte) {
+			if len(rest) == 0 {
+				return nil, data
+			}
+-			line, next := getLine(rest)
++			line, next, consumed := getLine(rest)
+
+			key, val, ok := bytes.Cut(line, colon)
+			if !ok {
+@@ -129,21 +141,13 @@ func Decode(data []byte) (p *Block, rest []byte) {
+			val = bytes.TrimSpace(val)
+			p.Headers[string(key)] = string(val)
+			rest = next
++			endIndex -= consumed
++			endTrailerIndex -= consumed
+		}
+
+-		var endIndex, endTrailerIndex int
+-
+-		// If there were no headers, the END line might occur
+-		// immediately, without a leading newline.
+-		if len(p.Headers) == 0 && bytes.HasPrefix(rest, pemEnd[1:]) {
+-			endIndex = 0
+-			endTrailerIndex = len(pemEnd) - 1
+-		} else {
+-			endIndex = bytes.Index(rest, pemEnd)
+-			endTrailerIndex = endIndex + len(pemEnd)
+-		}
+-
+-		if endIndex < 0 {
++		// If there were headers, there must be a newline between the headers
++		// and the END line, so endIndex should be >= 0.
++		if len(p.Headers) > 0 && endIndex < 0 {
+			continue
+		}
+
+@@ -163,21 +167,24 @@ func Decode(data []byte) (p *Block, rest []byte) {
+		}
+
+		// The line must end with only whitespace.
+-		if s, _ := getLine(restOfEndLine); len(s) != 0 {
++		if s, _, _ := getLine(restOfEndLine); len(s) != 0 {
+			continue
+		}
+
+-		base64Data := removeSpacesAndTabs(rest[:endIndex])
+-		p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
+-		n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
+-		if err != nil {
+-			continue
++		p.Bytes = []byte{}
++		if endIndex > 0 {
++			base64Data := removeSpacesAndTabs(rest[:endIndex])
++			p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
++			n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
++			if err != nil {
++				continue
++			}
++			p.Bytes = p.Bytes[:n]
+		}
+-		p.Bytes = p.Bytes[:n]
+
+		// the -1 is because we might have only matched pemEnd without the
+		// leading newline if the PEM block was empty.
+-		_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		_, rest, _ = getLine(rest[endIndex+len(pemEnd)-1:])
+		return p, rest
+	}
+ }
+diff --git a/src/encoding/pem/pem_test.go b/src/encoding/pem/pem_test.go
+index 56a7754..7025277 100644
+--- a/src/encoding/pem/pem_test.go
++++ b/src/encoding/pem/pem_test.go
+@@ -34,7 +34,7 @@ var getLineTests = []GetLineTest{
+
+ func TestGetLine(t *testing.T) {
+	for i, test := range getLineTests {
+-		x, y := getLine([]byte(test.in))
++		x, y, _ := getLine([]byte(test.in))
+		if string(x) != test.out1 || string(y) != test.out2 {
+			t.Errorf("#%d got:%+v,%+v want:%s,%s", i, x, y, test.out1, test.out2)
+		}
+@@ -46,6 +46,7 @@ func TestDecode(t *testing.T) {
+	if !reflect.DeepEqual(result, certificate) {
+		t.Errorf("#0 got:%#v want:%#v", result, certificate)
+	}
++
+	result, remainder = Decode(remainder)
+	if !reflect.DeepEqual(result, privateKey) {
+		t.Errorf("#1 got:%#v want:%#v", result, privateKey)
+@@ -68,7 +69,7 @@ func TestDecode(t *testing.T) {
+	}
+
+	result, remainder = Decode(remainder)
+-	if result == nil || result.Type != "HEADERS" || len(result.Headers) != 1 {
++	if result == nil || result.Type != "VALID HEADERS" || len(result.Headers) != 1 {
+		t.Errorf("#5 expected single header block but got :%v", result)
+	}
+
+@@ -381,15 +382,15 @@ ZWAaUoVtWIQ52aKS0p19G99hhb+IVANC4akkdHV4SP8i7MVNZhfUmg==
+
+ # This shouldn't be recognised because of the missing newline after the
+ headers.
+------BEGIN HEADERS-----
++-----BEGIN INVALID HEADERS-----
+ Header: 1
+------END HEADERS-----
++-----END INVALID HEADERS-----
+
+ # This should be valid, however.
+------BEGIN HEADERS-----
++-----BEGIN VALID HEADERS-----
+ Header: 1
+
+------END HEADERS-----`)
++-----END VALID HEADERS-----`)
+
+ var certificate = &Block{Type: "CERTIFICATE",
+	Headers: map[string]string{},
+--
+2.40.0
-- 
2.43.0


