Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F962CCA480
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:32 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.27525.1656606207758032110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=N9Ihc6Tb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id h192so18991500pgc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uNRtTEzYSP7UHrjspShU6jKKywnxxQ4n7c1xSpOKXS8=;
        b=N9Ihc6TbJUPxkv2igzxTtOu4huHYR+K+e1oSYbjfrznmz8azMaG81sZ2OqwvBR7Ige
         AR5ion512Y4RK7kkPWdkjieFmfHwf6VvnwS/fbgikzcGI58R5bwl2nZSH2DDCboRfmoi
         x3F9KQ4Hynf05Q99oOLS3j0CS/PnVQcGl072BEAw532SMG9MV7gYJmSaA3RI9SkO3tFY
         8uoLDe0KD0zLSjwxAKLfG2CyPX1oIEuu58WC7fAjIIP+JPCx5BVE/ZSpQDf/nJExa1ic
         p06rAap/y+crBKKo3tQ7bPTdy4OseaA1hrY1fvtIgh/0Y4sHe8Riw6jfrgS9foalCBSh
         /a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uNRtTEzYSP7UHrjspShU6jKKywnxxQ4n7c1xSpOKXS8=;
        b=1UJ0llcYvbF3rll6Fe+sAeaBDdkK0DKKGUCa9v0d+ralkdw0nOgwTNJqurH976GYCZ
         ILS1AWFqAyfECRW3s1bW9PitvPMGno48f+ol0Lyv3GARWJvoQxOvBUblJew2i39RuiEU
         2hne+BrZPPLLcH6u7ewKdWjvD/quEi9KDG9qyRe6doTWfxdM5nLgJgRX0h1AqCitT/cA
         ROgFoXxD+BHMnIA9W2mVIBezmohAzW6TA8TDtaiiNupeJitqJIzK5RGNjHg3pLQIKL7e
         iEhC9DYjSh3eHOPMtkKHqA50JIzG/0hw0xmWrX3IAzrMkrp4la/Id+X5a/AASkBt+mUO
         5q2g==
X-Gm-Message-State: AJIora9J3uvl8rD4KTIFzCWbzuk8/0roYne4AsNxpmOX67Xpu/XytZXG
	CjlpfegZuW5URZ5MOT3WtthVGivY2Nfdf+Qz
X-Google-Smtp-Source: 
 AGRyM1vZfx0WD+PuFWgpdOBmVYsGtHvxqNlBxoIUa31DfQBLbeM2kemaiRHvf5pb3j9Fvzfy7lVE3g==
X-Received: by 2002:a63:1710:0:b0:40d:dd27:789b with SMTP id
 x16-20020a631710000000b0040ddd27789bmr8260789pgl.386.1656606206467;
        Thu, 30 Jun 2022 09:23:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] golang: CVE-2022-24675 encoding/pem: fix
 stack overflow in Decode
Date: Thu, 30 Jun 2022 06:23:01 -1000
Message-Id: 
 <6625e24a6143765ce2e4e08d25e3fe021bc2cdf6.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167417

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://go-review.googlesource.com/c/go
MR: 117551
Type: Security Fix
Disposition: Backport from https://go-review.googlesource.com/c/go/+/399816/
ChangeID: 347f22f93e8eaecb3d39f8d6c0fe5a70c5cf7b7c
Description:
        CVE-2022-24675 golang: encoding/pem: fix stack overflow in Decode.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-24675.patch           | 271 ++++++++++++++++++
 2 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 4827c6adfa..773d252bd1 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -23,6 +23,7 @@ SRC_URI += "\
     file://CVE-2022-23806.patch \
     file://CVE-2022-23772.patch \
     file://CVE-2021-44717.patch \
+    file://CVE-2022-24675.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch
new file mode 100644
index 0000000000..4bc012be21
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch
@@ -0,0 +1,271 @@
+From 1eb931d60a24501a9668e5cb4647593e19115507 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 17 Jun 2022 12:22:53 +0530
+Subject: [PATCH] CVE-2022-24675
+
+Upstream-Status: Backport [https://go-review.googlesource.com/c/go/+/399816/]
+CVE: CVE-2022-24675
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/encoding/pem/pem.go      | 174 +++++++++++++++--------------------
+ src/encoding/pem/pem_test.go |  28 +++++-
+ 2 files changed, 101 insertions(+), 101 deletions(-)
+
+diff --git a/src/encoding/pem/pem.go b/src/encoding/pem/pem.go
+index a7272da..1bee1c1 100644
+--- a/src/encoding/pem/pem.go
++++ b/src/encoding/pem/pem.go
+@@ -87,123 +87,97 @@ func Decode(data []byte) (p *Block, rest []byte) {
+ 	// pemStart begins with a newline. However, at the very beginning of
+ 	// the byte array, we'll accept the start string without it.
+ 	rest = data
+-	if bytes.HasPrefix(data, pemStart[1:]) {
+-		rest = rest[len(pemStart)-1 : len(data)]
+-	} else if i := bytes.Index(data, pemStart); i >= 0 {
+-		rest = rest[i+len(pemStart) : len(data)]
+-	} else {
+-		return nil, data
+-	}
+-
+-	typeLine, rest := getLine(rest)
+-	if !bytes.HasSuffix(typeLine, pemEndOfLine) {
+-		return decodeError(data, rest)
+-	}
+-	typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+-
+-	p = &Block{
+-		Headers: make(map[string]string),
+-		Type:    string(typeLine),
+-	}
+-
+ 	for {
+-		// This loop terminates because getLine's second result is
+-		// always smaller than its argument.
+-		if len(rest) == 0 {
++		if bytes.HasPrefix(rest, pemStart[1:]) {
++			rest = rest[len(pemStart)-1:]
++		} else if i := bytes.Index(rest, pemStart); i >= 0 {
++			rest = rest[i+len(pemStart) : len(rest)]
++		} else {
+ 			return nil, data
+ 		}
+-		line, next := getLine(rest)
+ 
+-		i := bytes.IndexByte(line, ':')
+-		if i == -1 {
+-			break
++		var typeLine []byte
++		typeLine, rest = getLine(rest)
++		if !bytes.HasSuffix(typeLine, pemEndOfLine) {
++			continue
+ 		}
++		typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+ 
+-		// TODO(agl): need to cope with values that spread across lines.
+-		key, val := line[:i], line[i+1:]
+-		key = bytes.TrimSpace(key)
+-		val = bytes.TrimSpace(val)
+-		p.Headers[string(key)] = string(val)
+-		rest = next
+-	}
++		p = &Block{
++			Headers: make(map[string]string),
++			Type:    string(typeLine),
++		}
+ 
+-	var endIndex, endTrailerIndex int
++		for {
++			// This loop terminates because getLine's second result is
++			// always smaller than its argument.
++			if len(rest) == 0 {
++				return nil, data
++			}
++			line, next := getLine(rest)
+ 
+-	// If there were no headers, the END line might occur
+-	// immediately, without a leading newline.
+-	if len(p.Headers) == 0 && bytes.HasPrefix(rest, pemEnd[1:]) {
+-		endIndex = 0
+-		endTrailerIndex = len(pemEnd) - 1
+-	} else {
+-		endIndex = bytes.Index(rest, pemEnd)
+-		endTrailerIndex = endIndex + len(pemEnd)
+-	}
++			i := bytes.IndexByte(line, ':')
++			if i == -1 {
++				break
++			}
+ 
+-	if endIndex < 0 {
+-		return decodeError(data, rest)
+-	}
++			// TODO(agl): need to cope with values that spread across lines.
++			key, val := line[:i], line[i+1:]
++			key = bytes.TrimSpace(key)
++			val = bytes.TrimSpace(val)
++			p.Headers[string(key)] = string(val)
++			rest = next
++		}
+ 
+-	// After the "-----" of the ending line, there should be the same type
+-	// and then a final five dashes.
+-	endTrailer := rest[endTrailerIndex:]
+-	endTrailerLen := len(typeLine) + len(pemEndOfLine)
+-	if len(endTrailer) < endTrailerLen {
+-		return decodeError(data, rest)
+-	}
++		var endIndex, endTrailerIndex int
+ 
+-	restOfEndLine := endTrailer[endTrailerLen:]
+-	endTrailer = endTrailer[:endTrailerLen]
+-	if !bytes.HasPrefix(endTrailer, typeLine) ||
+-		!bytes.HasSuffix(endTrailer, pemEndOfLine) {
+-		return decodeError(data, rest)
+-	}
++		// If there were no headers, the END line might occur
++		// immediately, without a leading newline.
++		if len(p.Headers) == 0 && bytes.HasPrefix(rest, pemEnd[1:]) {
++			endIndex = 0
++			endTrailerIndex = len(pemEnd) - 1
++		} else {
++			endIndex = bytes.Index(rest, pemEnd)
++			endTrailerIndex = endIndex + len(pemEnd)
++		}
+ 
+-	// The line must end with only whitespace.
+-	if s, _ := getLine(restOfEndLine); len(s) != 0 {
+-		return decodeError(data, rest)
+-	}
++		if endIndex < 0 {
++			continue
++		}
+ 
+-	base64Data := removeSpacesAndTabs(rest[:endIndex])
+-	p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
+-	n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
+-	if err != nil {
+-		return decodeError(data, rest)
+-	}
+-	p.Bytes = p.Bytes[:n]
++		// After the "-----" of the ending line, there should be the same type
++		// and then a final five dashes.
++		endTrailer := rest[endTrailerIndex:]
++		endTrailerLen := len(typeLine) + len(pemEndOfLine)
++		if len(endTrailer) < endTrailerLen {
++			continue
++		}
++
++		restOfEndLine := endTrailer[endTrailerLen:]
++		endTrailer = endTrailer[:endTrailerLen]
++		if !bytes.HasPrefix(endTrailer, typeLine) ||
++			!bytes.HasSuffix(endTrailer, pemEndOfLine) {
++			continue
++		}
+ 
+-	// the -1 is because we might have only matched pemEnd without the
+-	// leading newline if the PEM block was empty.
+-	_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		// The line must end with only whitespace.
++		if s, _ := getLine(restOfEndLine); len(s) != 0 {
++			continue
++		}
+ 
+-	return
+-}
++		base64Data := removeSpacesAndTabs(rest[:endIndex])
++		p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
++		n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
++		if err != nil {
++			continue
++		}
++		p.Bytes = p.Bytes[:n]
+ 
+-func decodeError(data, rest []byte) (*Block, []byte) {
+-	// If we get here then we have rejected a likely looking, but
+-	// ultimately invalid PEM block. We need to start over from a new
+-	// position. We have consumed the preamble line and will have consumed
+-	// any lines which could be header lines. However, a valid preamble
+-	// line is not a valid header line, therefore we cannot have consumed
+-	// the preamble line for the any subsequent block. Thus, we will always
+-	// find any valid block, no matter what bytes precede it.
+-	//
+-	// For example, if the input is
+-	//
+-	//    -----BEGIN MALFORMED BLOCK-----
+-	//    junk that may look like header lines
+-	//   or data lines, but no END line
+-	//
+-	//    -----BEGIN ACTUAL BLOCK-----
+-	//    realdata
+-	//    -----END ACTUAL BLOCK-----
+-	//
+-	// we've failed to parse using the first BEGIN line
+-	// and now will try again, using the second BEGIN line.
+-	p, rest := Decode(rest)
+-	if p == nil {
+-		rest = data
++		// the -1 is because we might have only matched pemEnd without the
++		// leading newline if the PEM block was empty.
++		_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		return p, rest
+ 	}
+-	return p, rest
+ }
+ 
+ const pemLineLength = 64
+diff --git a/src/encoding/pem/pem_test.go b/src/encoding/pem/pem_test.go
+index 8515b46..4485581 100644
+--- a/src/encoding/pem/pem_test.go
++++ b/src/encoding/pem/pem_test.go
+@@ -107,6 +107,12 @@ const pemMissingEndingSpace = `
+ dGVzdA==
+ -----ENDBAR-----`
+ 
++const pemMissingEndLine = `
++-----BEGIN FOO-----
++Header: 1`
++
++var pemRepeatingBegin = strings.Repeat("-----BEGIN \n", 10)
++
+ var badPEMTests = []struct {
+ 	name  string
+ 	input string
+@@ -131,14 +137,34 @@ var badPEMTests = []struct {
+ 		"missing ending space",
+ 		pemMissingEndingSpace,
+ 	},
++	{
++		"repeating begin",
++		pemRepeatingBegin,
++	},
++	{
++		"missing end line",
++		pemMissingEndLine,
++	},
+ }
+ 
+ func TestBadDecode(t *testing.T) {
+ 	for _, test := range badPEMTests {
+-		result, _ := Decode([]byte(test.input))
++		result, rest := Decode([]byte(test.input))
+ 		if result != nil {
+ 			t.Errorf("unexpected success while parsing %q", test.name)
+ 		}
++		if string(rest) != test.input {
++			t.Errorf("unexpected rest: %q; want = %q", rest, test.input)
++		}
++	}
++}
++
++func TestCVE202224675(t *testing.T) {
++	// Prior to CVE-2022-24675, this input would cause a stack overflow.
++	input := []byte(strings.Repeat("-----BEGIN \n", 10000000))
++	result, rest := Decode(input)
++	if result != nil || !reflect.DeepEqual(rest, input) {
++		t.Errorf("Encode of %#v decoded as %#v", input, rest)
+ 	}
+ }
+ 
+-- 
+2.25.1
+
-- 
2.25.1


