Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4C2D116F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:10:01 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9665.1764688197525487986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I55A/V7X;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so6823153b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688197; x=1765292997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G49MjZ/BoBQrjeY4WMc2r6r5hN/XFJxCl/1Cox2wVA8=;
        b=I55A/V7XdnhcR5RIZVO/G6ASKfPtJs8Gz2Mv+P2HO7uzRLxjfkJfh/+ikuzOLHtTC9
         /EtviYU1lNTStUdPW7bpGbkkQHYNpFHbaPt9FOVIRmAgQaU2Wrpuyw4biXTI51Wcr68Q
         MFn0qX/d9nAy/mZiuuz7vuoTuHDRbO7FrhUl045UkbdiU6OA+HfEtEepPM3rid3XiiZz
         bP2uL9PyaGtgEwCfDvPFEiGHxtux+aNw7XsT2y6pvoCJs4amzh2MmsEioimQ0/o2O6Q2
         4/x3ZizVvqsk6LLN00aNh7Ckrt4PMfs3LVQ751CK1QmFWuv3n8+Vv+zUdqHO5/DWNBuN
         oP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688197; x=1765292997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G49MjZ/BoBQrjeY4WMc2r6r5hN/XFJxCl/1Cox2wVA8=;
        b=emVz+TE2AwZ6Nf2Jvp3X45Di0rvcyjCp+YgKZlwa21+X7MClI2p3B7/K8WjYUL/rLy
         tN1NR9aFeV7zR6J4d+magkkl0B8UyhSt+STsq1m+LowqNtrlFLl0oPcYnAWRRV1JMWHi
         SeCRIXkkZYOVzoF6TPCaQeZBjN1MP748+sDriJc4J9iMBnpptOz/XqZ11PrZ849QRqMu
         S3efVDivXFpc4a7rBy6VyFFpqJxilg6PszJBExppeqCRV/5irfqPqE+8HW9HKKapmH+D
         /WfA7R8i6PkJodSeJARkuagsXAaqRMaMnfTe+H6N/Nd3KfF5JqMy05iS5aMV9z43kaMF
         kkLw==
X-Gm-Message-State: AOJu0YyuOSDE5F36SL/LxQApZYhimtMj0UNu/BuXrqR1acbV5DEVkUpJ
	4l6SPVEPGAMVXDovtMziUdhxiDA43ntovRBHBfi2RtF0qPJC2+TnCGEeNnnj36qB+35mNeG3m4T
	xAzQT
X-Gm-Gg: ASbGncsfHJMnPDFJCcqthkW/ZyHOETlCNrlWyVGDHbTAYNh8JUQU/DoIAaMk0z0xT/X
	Wq3+Uyf1PwOxdh8oPuCk+EG3LdhaPqiNL+ZbZfsgscmkIfVwYDRJbZqdPNI31KP1D+VvdkiH/KR
	lkj/IUQP2c78ohWAag0PNdnxw96Z9fVYNMNI2G/+52nNHzKfHUzgCNL3KIpcAz5lKGfCDNIt74K
	WiWpuMy1xC9oECm/7oVWpTVU/hq8x7ZGbMHF0+1btSSkn5q4sLACU1OFOhM4/ZbVIr832iaBbNS
	0eUP4jmItRKr+4H9FIdGUmuKiI0QHtSXGkX0pD23CwoCY4tCrc0oZxEvRQw0MaC7KyaTSN64wqi
	kCcMVqrsvSghoe7bpRmpWtWzAaM6b4L7+1UDV0trMIpDTxdBqpY9kEc7KO+gYzXucbx/Rdc/zwB
	G7vpVZDoOll1MV
X-Google-Smtp-Source: AGHT+IFN4iTIBo30oLfm+kbDp+8JydZv/uQk//1GsGWJANqlq/9N2i7aRjIcldpzbkQUYNyUKWonPw==
X-Received: by 2002:a05:6a20:4306:b0:342:44f3:d1bc with SMTP id adf61e73a8af0-3614ed922b6mr47880550637.35.1764688196056;
        Tue, 02 Dec 2025 07:09:56 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] go: fix CVE-2025-61723
Date: Tue,  2 Dec 2025 07:09:31 -0800
Message-ID: <cfafebef95330e531ab7bb590e5fb566dd5a3dce.1764688054.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227167

From: Archana Polampalli <archana.polampalli@windriver.com>

The processing time for parsing some invalid inputs scales non-linearly with
respect to the size of the input. This affects programs which parse untrusted PEM inputs.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2025-61723.patch           | 221 ++++++++++++++++++
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61723.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 61fee12cf9..b621fb189c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -71,6 +71,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2024-24783.patch \
            file://CVE-2025-58187.patch \
            file://CVE-2025-58189.patch \
+           file://CVE-2025-61723.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-61723.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-61723.patch
new file mode 100644
index 0000000000..8c838a6d8a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-61723.patch
@@ -0,0 +1,221 @@
+From 74d4d836b91318a8764b94bc2b4b66ff599eb5f2 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 30 Sep 2025 11:16:56 -0700
+Subject: [PATCH] encoding/pem: make Decode complexity linear Because Decode
+ scanned the input first for the first BEGIN line, and then the first END
+ line, the complexity of Decode is quadratic. If the input contained a large
+ number of BEGINs and then a single END right at the end of the input, we
+ would find the first BEGIN, and then scan the entire input for the END, and
+ fail to parse the block, so move onto the next BEGIN, scan the entire input
+ for the END, etc.
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
+ src/encoding/pem/pem.go      | 67 +++++++++++++++++++-----------------
+ src/encoding/pem/pem_test.go | 13 +++----
+ 2 files changed, 43 insertions(+), 37 deletions(-)
+
+diff --git a/src/encoding/pem/pem.go b/src/encoding/pem/pem.go
+index 1bee1c1..01bed75 100644
+--- a/src/encoding/pem/pem.go
++++ b/src/encoding/pem/pem.go
+@@ -35,7 +35,7 @@ type Block struct {
+ // line bytes. The remainder of the byte array (also not including the new line
+ // bytes) is also returned and this will always be smaller than the original
+ // argument.
+-func getLine(data []byte) (line, rest []byte) {
++func getLine(data []byte) (line, rest []byte, consumed int) {
+ 	i := bytes.IndexByte(data, '\n')
+ 	var j int
+ 	if i < 0 {
+@@ -47,7 +47,7 @@ func getLine(data []byte) (line, rest []byte) {
+ 			i--
+ 		}
+ 	}
+-	return bytes.TrimRight(data[0:i], " \t"), data[j:]
++	return bytes.TrimRight(data[0:i], " \t"), data[j:], j
+ }
+ 
+ // removeSpacesAndTabs returns a copy of its input with all spaces and tabs
+@@ -88,19 +88,29 @@ func Decode(data []byte) (p *Block, rest []byte) {
+ 	// the byte array, we'll accept the start string without it.
+ 	rest = data
+ 	for {
+-		if bytes.HasPrefix(rest, pemStart[1:]) {
+-			rest = rest[len(pemStart)-1:]
+-		} else if i := bytes.Index(rest, pemStart); i >= 0 {
+-			rest = rest[i+len(pemStart) : len(rest)]
+-		} else {
++		// Find the first END line, and then find the last BEGIN line before
++		// the end line. This lets us skip any repeated BEGIN lines that don't
++		// have a matching END.
++		endIndex := bytes.Index(rest, pemEnd)
++		if endIndex < 0 {
+ 			return nil, data
+ 		}
+-
++		endTrailerIndex := endIndex + len(pemEnd)
++		beginIndex := bytes.LastIndex(rest[:endIndex], pemStart[1:])
++		if beginIndex < 0 || beginIndex > 0 && rest[beginIndex-1] != '\n' {
++			return nil, data
++		}
++		rest = rest[beginIndex+len(pemStart)-1:]
++		endIndex -= beginIndex + len(pemStart) - 1
++		endTrailerIndex -= beginIndex + len(pemStart) - 1
+ 		var typeLine []byte
+-		typeLine, rest = getLine(rest)
++		var consumed int
++		typeLine, rest, consumed = getLine(rest)
+ 		if !bytes.HasSuffix(typeLine, pemEndOfLine) {
+ 			continue
+ 		}
++		endIndex -= consumed
++		endTrailerIndex -= consumed
+ 		typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+ 
+ 		p = &Block{
+@@ -114,7 +124,7 @@ func Decode(data []byte) (p *Block, rest []byte) {
+ 			if len(rest) == 0 {
+ 				return nil, data
+ 			}
+-			line, next := getLine(rest)
++			line, next, consumed := getLine(rest)
+ 
+ 			i := bytes.IndexByte(line, ':')
+ 			if i == -1 {
+@@ -127,21 +137,13 @@ func Decode(data []byte) (p *Block, rest []byte) {
+ 			val = bytes.TrimSpace(val)
+ 			p.Headers[string(key)] = string(val)
+ 			rest = next
++			endIndex -= consumed
++			endTrailerIndex -= consumed
+ 		}
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
+ 			continue
+ 		}
+ 
+@@ -161,21 +163,24 @@ func Decode(data []byte) (p *Block, rest []byte) {
+ 		}
+ 
+ 		// The line must end with only whitespace.
+-		if s, _ := getLine(restOfEndLine); len(s) != 0 {
++		if s, _, _ := getLine(restOfEndLine); len(s) != 0 {
+ 			continue
+ 		}
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
+ 		}
+-		p.Bytes = p.Bytes[:n]
+ 
+ 		// the -1 is because we might have only matched pemEnd without the
+ 		// leading newline if the PEM block was empty.
+-		_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		_, rest, _ = getLine(rest[endIndex+len(pemEnd)-1:])
+ 		return p, rest
+ 	}
+ }
+diff --git a/src/encoding/pem/pem_test.go b/src/encoding/pem/pem_test.go
+index c94b5ca..a326f9b 100644
+--- a/src/encoding/pem/pem_test.go
++++ b/src/encoding/pem/pem_test.go
+@@ -34,7 +34,7 @@ var getLineTests = []GetLineTest{
+ 
+ func TestGetLine(t *testing.T) {
+ 	for i, test := range getLineTests {
+-		x, y := getLine([]byte(test.in))
++		x, y, _ := getLine([]byte(test.in))
+ 		if string(x) != test.out1 || string(y) != test.out2 {
+ 			t.Errorf("#%d got:%+v,%+v want:%s,%s", i, x, y, test.out1, test.out2)
+ 		}
+@@ -46,6 +46,7 @@ func TestDecode(t *testing.T) {
+ 	if !reflect.DeepEqual(result, certificate) {
+ 		t.Errorf("#0 got:%#v want:%#v", result, certificate)
+ 	}
++
+ 	result, remainder = Decode(remainder)
+ 	if !reflect.DeepEqual(result, privateKey) {
+ 		t.Errorf("#1 got:%#v want:%#v", result, privateKey)
+@@ -68,7 +69,7 @@ func TestDecode(t *testing.T) {
+ 	}
+ 
+ 	result, remainder = Decode(remainder)
+-	if result == nil || result.Type != "HEADERS" || len(result.Headers) != 1 {
++	if result == nil || result.Type != "VALID HEADERS" || len(result.Headers) != 1 {
+ 		t.Errorf("#5 expected single header block but got :%v", result)
+ 	}
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
+ 	Headers: map[string]string{},
+-- 
+2.40.0
+
-- 
2.43.0


